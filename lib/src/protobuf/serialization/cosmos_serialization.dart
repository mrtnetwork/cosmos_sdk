import 'package:cosmos_sdk/src/protobuf/message/any.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/codec/encoder.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:blockchain_utils/exception/exception.dart';

/// Abstract class providing a common implementation for encoding cosmos messages using minimal protobuf encoding.
abstract class CosmosProtocolBuffer {
  const CosmosProtocolBuffer();

  /// List of dynamic values to be encoded.
  abstract final List<dynamic> values;

  /// List of field IDs corresponding to the values.
  abstract final List<int> fieldIds;

  /// Converts the data to a JSON representation.
  Map<String, dynamic> toJson();

  /// Converts the protocol buffer data to a byte buffer.
  List<int> toBuffer() {
    if (values.length != fieldIds.length) {
      throw MessageException(
          "The values and field IDs must have the same length.",
          details: {
            "values": values,
            "fieldIds": fieldIds,
            "class": runtimeType.toString(),
          });
    }
    final bytes = DynamicByteTracker();
    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      final tagNumber = fieldIds[i];
      List<int> encode;
      if (value == null) continue;
      encode = ProtocolBufferEncoder.encode(tagNumber, value);
      bytes.add(encode);
    }
    return bytes.toBytes();
  }

  /// Gets the hexadecimal representation of the protocol buffer data.
  String get toHex => BytesUtils.toHexString(
        toBuffer(),
      );

  static List<ProtocolBufferDecoderResult> decode(List<int> bytes) {
    return ProtocolBufferDecoder.decode(bytes);
  }

  @override
  String toString() {
    return "$runtimeType${toJson()}";
  }
}

abstract class CosmosMessage extends CosmosProtocolBuffer {
  const CosmosMessage();
  abstract final String typeUrl;

  Any toAny() => Any(value: toBuffer(), typeUrl: typeUrl);
}

mixin QueryMessage<Response> on CosmosMessage {
  abstract final String queryPath;
  Response onResponse(List<int> bytes);
}
mixin RPCMessage<Response> on CosmosMessage {
  abstract final String rpcPath;
  Response onJsonResponse(Map<String, dynamic> json);
  abstract final Map<String, String?> queryParameters;
}
mixin ServiceMessage<Response> on CosmosMessage {
  abstract final String service;
  abstract final List<String?> signers;
  Response onResponse(List<int> bytes);
}
