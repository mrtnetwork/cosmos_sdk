import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:blockchain_utils/utils/utils.dart';

class ProtocolBufferDecoder {
  static List<ProtocolBufferDecoderResult> decode(List<int> bytes) {
    final List<ProtocolBufferDecoderResult> results = [];
    int index = 0;
    while (index < bytes.length) {
      final decodeTag = _decodeVarint(bytes.sublist(index));
      index += decodeTag.consumed;
      final int tag = decodeTag.value;
      final int fieldId = tag >> 3;
      final int wireType = tag & 0x07;
      switch (wireType) {
        case 2:
          final decodeLength = _decodeVarint(bytes.sublist(index));
          index += decodeLength.consumed;
          results.add(
            ProtocolBufferDecoderResult(
              tagNumber: fieldId,
              value: bytes.sublist(index, index + decodeLength.value),
            ),
          );
          index += decodeLength.value;
          continue;

        case 0:
          final decodeInt = _decodeInt(bytes.sublist(index));
          index += decodeInt.consumed;
          final result = ProtocolBufferDecoderResult(
            tagNumber: fieldId,
            value: decodeInt.value,
          );
          results.add(result);
          continue;
        default:
          throw UnimplementedError("protobuf wiretype not supported.");
      }
    }
    return results;
  }

  static _Result<int> _decodeVarint(List<int> data) {
    int value = 0;
    int shift = 0;
    int index = 0;
    while (true) {
      final byte = data[index++];
      value |= (byte & 0x7F) << shift;
      if ((byte & 0x80) == 0) {
        break;
      }
      shift += 7;
    }
    return _Result(value: value, consumed: index);
  }

  static BigInt decodeBigInt(List<int> data) {
    BigInt value = BigInt.zero;
    int shift = 0;
    int index = 0;
    while (true) {
      final byte = data[index++];
      value |= BigInt.from((byte & 0x7F)) << shift;
      if ((byte & 0x80) == 0) {
        break;
      }
      shift += 7;
    }
    return value;
  }

  static _Result<BigInt> _decodeBigVarint(List<int> data) {
    BigInt value = BigInt.zero;
    int shift = 0;
    int index = 0;
    while (true) {
      final byte = data[index++];
      value |= BigInt.from((byte & 0x7F)) << shift;
      if ((byte & 0x80) == 0) {
        break;
      }
      shift += 7;
    }
    return _Result(value: value, consumed: index);
  }

  static _Result _decodeInt(List<int> data) {
    final index = data.indexWhere((element) => (element & 0x80) == 0);
    if (index < 4) {
      return _decodeVarint(data);
    }
    return _decodeBigVarint(data);
  }
}

class ProtocolBufferDecoderResult<T> {
  const ProtocolBufferDecoderResult({
    required this.tagNumber,
    required this.value,
  });
  final int tagNumber;
  final T value;
  @override
  String toString() {
    return "tagNumber: $tagNumber value: $value";
  }
}

class _Result<T> {
  const _Result({required this.value, required this.consumed});
  final T value;
  final int consumed;
  @override
  String toString() {
    return "value: $value consumed: $consumed";
  }
}

extension QuickProtocolBufferResults on List<ProtocolBufferDecoderResult> {
  bool hasTag(int tag) {
    try {
      firstWhere((element) => element.tagNumber == tag);
      return true;
    } on StateError {
      return false;
    }
  }

  T getField<T>(int tag, {bool setDefault = false}) {
    try {
      final result = firstWhere((element) => element.tagNumber == tag);
      return result.get<T>();
    } on StateError {
      if (null is T) return null as T;
      if (setDefault) {
        final defaultValue = _getDefault<T>();
        if (defaultValue != null) return defaultValue as T;
      }
      throw DartCosmosSdkPluginException(
        "field id does not exist.",
        details: {"fieldIds": map((e) => e.tagNumber).join(", "), "id": tag},
      );
    }
  }

  T? _getDefault<T>() {
    if (T == bool) return false as T;
    if (T == int) return 0 as T;
    if (T == BigInt) return BigInt.zero as T;
    return null;
  }

  T getResult<T extends ProtocolBufferDecoderResult?>(int id) {
    try {
      final result = firstWhere((element) => element.tagNumber == id);
      return result as T;
    } on StateError {
      if (null is T) return null as T;
      throw DartCosmosSdkPluginException(
        "field id does not exist.",
        details: {"fieldIds": map((e) => e.tagNumber).join(", "), "id": id},
      );
    }
  }

  List<T> getFields<T>(int tag, {bool allowNull = true}) {
    final result = where((element) => element.tagNumber == tag);
    if (result.isEmpty && !allowNull) {
      throw DartCosmosSdkPluginException(
        "field id does not exist.",
        details: {"fieldIds": map((e) => e.tagNumber).join(", "), "id": tag},
      );
    }
    // if (dynamic is T) {

    // }
    if (BigInt.zero is T) {
      return result
          .map((e) => ProtocolBufferDecoder.decodeBigInt(e.value))
          .toList()
          .cast<T>();
    }
    return result.map((e) => e.get<T>()).toList();
  }
}

extension QuickProtocolBufferResult on ProtocolBufferDecoderResult {
  bool _isTypeString<T>() {
    return "" is T;
  }

  bool _isTypeBigInt<T>() {
    return BigInt.zero is T;
  }

  bool _isTypeInt<T>() {
    return 0 is T;
  }

  T _returnString<T>(String value) {
    try {
      if (_isTypeString<T>()) return value as T;
      if (_isTypeBigInt<T>()) return BigintUtils.parse(value) as T;
      if (_isTypeInt<T>()) return IntUtils.parse(value) as T;
    } catch (_) {}
    throw DartCosmosSdkPluginException(
      "Invalid type.",
      details: {"type": "$T", "Excepted": value.runtimeType.toString()},
    );
  }

  T get<T>() {
    if (value is T) return value;
    if (value is List<int>) {
      final decode = StringUtils.tryDecode(value);
      if (decode != null) return _returnString<T>(decode);
    }
    if (value is int) {
      if (BigInt.zero is T) {
        return BigInt.from(value) as T;
      } else if (false is T) {
        if (value != 0 && value != 1) {
          throw DartCosmosSdkPluginException(
            "Invalid boolean value.",
            details: {"value": value},
          );
        }
        return (value == 1 ? true : false) as T;
      }
    }
    throw DartCosmosSdkPluginException(
      "Invalid type.",
      details: {"type": "$T", "Excepted": value.runtimeType.toString()},
    );
  }

  T cast<T>() {
    if (value is T) return value;
    if (value is int) {
      if (BigInt.zero is T) {
        return BigInt.from(value) as T;
      } else if (T == bool) {
        if (value != 0 && value != 1) {
          throw DartCosmosSdkPluginException(
            "Invalid boolean value.",
            details: {"value": value},
          );
        }
        return (value == 1 ? true : false) as T;
      }
    }
    if (value is BigInt && 0 is T) {
      value as BigInt;
      if ((value as BigInt).isValidInt) return value.toInt();
    }
    if (value is List<int> && T == String) {
      return StringUtils.decode(value) as T;
    }
    throw DartCosmosSdkPluginException(
      "cannot cast value.",
      details: {
        "Type": "$T",
        "Excepted": value.runtimeType.toString(),
        "value": value,
      },
    );
  }

  E to<E, T>(E Function(T e) toe) {
    return toe(cast<T>());
  }
}
