import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MultiSignature wraps the signatures from a multisig.LegacyAminoPubKey.
/// See cosmos.tx.v1beta1.ModeInfo.Multi for how to specify which signers
/// signed and with which modes.
class MultiSignature extends CosmosProtoMessage {
  final List<List<int>> signatures;

  const MultiSignature({this.signatures = const []});

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
  Map<String, dynamic> toJson() {
    return {
      'signatures':
          signatures
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MultiSignature.fromJson(Map<String, dynamic> json) {
    return MultiSignature(
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
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

  final List<int>? elems;

  const CompactBitArray({this.extraBitsStored, this.elems});

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
  Map<String, dynamic> toJson() {
    return {
      'extra_bits_stored': extraBitsStored,
      'elems': switch (elems) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory CompactBitArray.fromJson(Map<String, dynamic> json) {
    return CompactBitArray(
      extraBitsStored: json.valueAsInt<int?>(
        'extra_bits_stored',
        acceptCamelCase: true,
      ),
      elems: json.valueAsBytes<List<int>?>(
        'elems',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
