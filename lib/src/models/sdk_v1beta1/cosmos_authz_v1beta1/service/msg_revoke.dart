import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRevoke revokes any authorization with the provided sdk.Msg type on the
/// granter's account with that has been granted to the grantee.
class AuthzMsgRevoke extends AuthzV1Beta1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress granter;
  final CosmosBaseAddress grantee;
  final String? msgTypeUrl;
  const AuthzMsgRevoke({
    required this.granter,
    required this.grantee,
    this.msgTypeUrl,
  });
  factory AuthzMsgRevoke.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzMsgRevoke(
      granter: decode
          .getResult(1)!
          .to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      grantee: decode
          .getResult(2)!
          .to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      msgTypeUrl: decode.getField(3),
    );
  }
  factory AuthzMsgRevoke.fromJson(Map<String, dynamic> json) {
    return AuthzMsgRevoke(
      granter: CosmosBaseAddress(json.as("granter")),
      grantee: CosmosBaseAddress(json.as("grantee")),
      msgTypeUrl: json.as("msg_type_url"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter.address,
      "grantee": grantee.address,
      "msg_type_url": msgTypeUrl,
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzMsgRevoke;

  @override
  List get values => [granter.address, grantee.address, msgTypeUrl];

  @override
  List<String?> get signers => [granter.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      AuthzV1beta1Types.authzMsgRevokeResponse,
    );
  }
}
