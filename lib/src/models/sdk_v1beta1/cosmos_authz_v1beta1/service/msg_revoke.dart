import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgRevoke revokes any authorization with the provided sdk.Msg type on the
/// granter's account with that has been granted to the grantee.
class AuthzMsgRevoke extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final BaseAddress? granter;
  final BaseAddress? grantee;
  final String? msgTypeUrl;
  const AuthzMsgRevoke({this.granter, this.grantee, this.msgTypeUrl});
  factory AuthzMsgRevoke.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzMsgRevoke(
        granter:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        grantee:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        msgTypeUrl: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => AuthzV1beta1Types.authzRevoke.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter?.address,
      "grantee": grantee?.address,
      "msg_type_url": msgTypeUrl
    };
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzMsgRevoke.typeUrl;

  @override
  List get values => [granter?.address, grantee?.address, msgTypeUrl];

  @override
  List<String?> get signers => [granter?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        AuthzV1beta1Types.authzMsgRevokeResponse.typeUrl);
  }
}
