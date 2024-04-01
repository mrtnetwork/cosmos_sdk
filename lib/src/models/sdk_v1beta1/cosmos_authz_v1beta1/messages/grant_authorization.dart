import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GrantAuthorization extends a grant with both the addresses of the grantee and granter.
/// It is used in genesis.proto and query.proto
class AuthzGrantAuthorization extends CosmosMessage {
  final BaseAddress? granter;
  final BaseAddress? grantee;
  final Any? authorization;
  final ProtobufTimestamp? expiration;
  const AuthzGrantAuthorization(
      {this.granter, this.grantee, this.authorization, this.expiration});
  factory AuthzGrantAuthorization.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzGrantAuthorization(
        granter:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        grantee:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        authorization:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)),
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
  String get typeUrl => AuthzV1beta1Types.authzGrantAuthorization.typeUrl;

  @override
  List get values =>
      [granter?.address, grantee?.address, authorization, expiration];
}
