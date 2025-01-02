import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GrantAuthorization extends a grant with both the addresses of the grantee and granter.
/// It is used in genesis.proto and query.proto
class AuthzGrantAuthorization extends CosmosMessage {
  final CosmosBaseAddress? granter;
  final CosmosBaseAddress? grantee;
  final AnyMessage? authorization;
  final ProtobufTimestamp? expiration;
  const AuthzGrantAuthorization(
      {this.granter, this.grantee, this.authorization, this.expiration});
  factory AuthzGrantAuthorization.fromRpc(Map<String, dynamic> json) {
    return AuthzGrantAuthorization(
        grantee:
            json["grantee"] == null ? null : CosmosBaseAddress(json["grantee"]),
        granter:
            json["granter"] == null ? null : CosmosBaseAddress(json["granter"]),
        authorization: json["authorization"] == null
            ? null
            : AnyMessage.fromRpc(json["authorization"]),
        expiration: json["expiration"] == null
            ? null
            : ProtobufTimestamp.fromString(json["expiration"]));
  }
  factory AuthzGrantAuthorization.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzGrantAuthorization(
        granter: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        grantee: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        authorization: decode
            .getResult(3)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
        expiration: decode.getResult(4)?.to<ProtobufTimestamp, List<int>>(
            (e) => ProtobufTimestamp.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter?.address,
      "grantee": grantee?.address,
      "authorization": authorization?.toJson(),
      "expiration": expiration?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzGrantAuthorization;

  @override
  List get values =>
      [granter?.address, grantee?.address, authorization, expiration];
}
