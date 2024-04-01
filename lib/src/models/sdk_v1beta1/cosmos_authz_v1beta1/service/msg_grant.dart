import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/messages/grant.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgGrant is a request type for Grant method. It declares authorization to the grantee on
/// behalf of the granter with the provided expiration time.
class AuthzMsgGrant extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final BaseAddress? granter;
  final BaseAddress? grantee;
  final AuthzGrant grant;
  const AuthzMsgGrant({this.granter, this.grantee, required this.grant});
  factory AuthzMsgGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzMsgGrant(
      granter:
          decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
      grantee:
          decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
      grant: AuthzGrant.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => AuthzV1beta1Types.authzQueryGrant.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter?.address,
      "grantee": grantee?.address,
      "grant": grant.toJson()
    };
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzMsgGrant.typeUrl;

  @override
  List get values => [granter?.address, grantee?.address, grant];

  @override
  List<String?> get signers => [granter?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        AuthzV1beta1Types.authzMsgGrantResponse.typeUrl);
  }
}
