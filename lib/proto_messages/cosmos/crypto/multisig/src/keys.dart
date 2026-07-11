import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// LegacyAminoPubKey specifies a public key type
/// which nests multiple public keys and a threshold,
/// it uses legacy amino address rules.
class LegacyAminoPubKey extends CosmosProtoMessage {
  /// The Amino encoding of a LegacyAminoPubkey is the legacy amino
  /// encoding of the `PubKeyMultisigThreshold` struct defined below:
  /// https://github.com/tendermint/tendermint/blob/v0.33.9/crypto/multisig/threshold_pubkey.go
  ///
  /// There are 2 differences with what a "normal" Amino encoding
  /// would output:
  /// 1. The `threshold` field is always a string (whereas Amino would
  /// by default marshal uint32 as a number).
  /// 2. The `public_keys` field is renamed to `pubkeys`, which is also
  /// reflected in the `amino.field_name` annotation.
  final int? threshold;

  final List<google_protobuf_any.Any> publicKeys;

  const LegacyAminoPubKey({this.threshold, this.publicKeys = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "tendermint/PubKeyMultisigThreshold",
        ),
        ProtoOptionString(
          name: "amino.message_encoding",
          value: "threshold_string",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionString(name: "amino.field_name", value: "pubkeys"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [threshold, publicKeys];

  @override
  Map<String, dynamic> toJson() {
    return {
      'threshold': threshold,
      'public_keys': publicKeys.map((e) => e.toJson()).toList(),
    };
  }

  factory LegacyAminoPubKey.fromJson(Map<String, dynamic> json) {
    return LegacyAminoPubKey(
      threshold: json.valueAsInt<int?>('threshold', acceptCamelCase: true),
      publicKeys:
          (json.valueEnsureAsList<dynamic>(
                'public_keys',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory LegacyAminoPubKey.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LegacyAminoPubKey(
      threshold: decode.getInt<int?>(1),
      publicKeys:
          decode
              .getListOfBytes(2)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoMultisigLegacyAminoPubKey;
}
