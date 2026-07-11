import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// FeeToken is a struct that specifies a coin denom, and pool ID pair.
/// This marks the token as eligible for use as a tx fee asset in Osmosis.
/// Its price in osmo is derived through looking at the provided pool ID.
/// The pool ID must have osmo as one of its assets.
class FeeToken extends CosmosProtoMessage {
  final String? denom;

  final BigInt? poolID;

  const FeeToken({this.denom, this.poolID});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, poolID];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'poolID': poolID?.toString()};
  }

  factory FeeToken.fromJson(Map<String, dynamic> json) {
    return FeeToken(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      poolID: json.valueAsBigInt<BigInt?>('poolID', acceptCamelCase: true),
    );
  }

  factory FeeToken.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeeToken(
      denom: decode.getString<String?>(1),
      poolID: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1FeeToken;
}
