import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenericAuthorization gives the grantee unrestricted permissions to execute the provided method on behalf of the granter's account.
class AuthzGenericAuthorization extends CosmosMessage {
  /// Msg, identified by it's type URL, to grant unrestricted permissions to execute
  final String? msg;
  const AuthzGenericAuthorization({this.msg});
  factory AuthzGenericAuthorization.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzGenericAuthorization(msg: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"msg": msg};
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzGenericAuthorization.typeUrl;

  @override
  List get values => [msg];
}
