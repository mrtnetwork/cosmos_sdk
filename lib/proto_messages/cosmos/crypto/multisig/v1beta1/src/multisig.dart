import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MultiSignature wraps the signatures from a multisig.LegacyAminoPubKey.
/// See cosmos.tx.v1beta1.ModeInfo.Multi for how to specify which signers
/// signed and with which modes.
class MultiSignature extends CosmosProtoMessage {
  final List<BuBytes> signatures;

  MultiSignature({List<List<int>> signatures = const []})
    : signatures = signatures.map((e) => e.asImmutableBytes).toImutableList;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signatures];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'signatures': signatures.map((e) => config.encodeBinary(e)).toList(),
    };
  }

  factory MultiSignature.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MultiSignature(
      signatures:
          (json.valueEnsureAsList<dynamic>(
            'signatures',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
    );
  }

  factory MultiSignature.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MultiSignature(signatures: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoMultisigV1beta1MultiSignature;
}

/// CompactBitArray is an implementation of a space efficient bit array.
/// This is used to ensure that the encoded data takes up a minimal amount of
/// space after proto encoding.
/// This is not thread safe, and is not intended for concurrent usage.
class CompactBitArray extends CosmosProtoMessage {
  final int? extraBitsStored;

  final BuBytes? elems;

  CompactBitArray({this.extraBitsStored, List<int>? elems})
    : elems = elems?.asImmutableBytes;

  /// Builds a bit array for [count] signers with [signedIndices] set.
  ///
  /// Cosmos numbers bits MSB-first: bit `i` is
  /// `elems[i ~/ 8] & (1 << (7 - i % 8))`. So signers 0 and 1 of a 2-of-3
  /// multisig give `elems: [0xC0]` with `extraBitsStored: 3`.
  factory CompactBitArray.fromIndices(int count, List<int> signedIndices) {
    if (count <= 0) {
      throw BuError(DefaultErrorType.invalidArgument, 'Invalid count.');
    }
    final elems = List<int>.filled((count + 7) ~/ 8, 0);
    for (final i in signedIndices) {
      if (i < 0 || i >= count) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          'Invalid signedIndices.',
        );
      }
      elems[i ~/ 8] |= (1 << (7 - (i % 8)));
    }
    return CompactBitArray(extraBitsStored: count, elems: elems);
  }

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [extraBitsStored, elems];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'extra_bits_stored': extraBitsStored,
      'elems': config.encodeBinary(elems),
    };
  }

  factory CompactBitArray.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CompactBitArray(
      extraBitsStored: json.valueAsInt<int?>(
        'extra_bits_stored',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      elems: config.decodeBinary<List<int>?>(
        json.valueAs('elems', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory CompactBitArray.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CompactBitArray(
      extraBitsStored: decode.getInt<int?>(1),
      elems: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoMultisigV1beta1CompactBitArray;
}
