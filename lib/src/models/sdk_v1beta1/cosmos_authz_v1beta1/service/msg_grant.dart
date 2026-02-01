import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/messages/grant.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgGrant is a request type for Grant method. It declares authorization to the grantee on
/// behalf of the granter with the provided expiration time.
class AuthzMsgGrant extends AuthzV1Beta1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress granter;
  final CosmosBaseAddress grantee;
  final AuthzGrant? grant;
  const AuthzMsgGrant({
    required this.granter,
    required this.grantee,
    required this.grant,
  });
  factory AuthzMsgGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzMsgGrant(
      granter: CosmosBaseAddress(decode.getField(1)),
      grantee: CosmosBaseAddress(decode.getField(2)),
      grant: decode
          .getResult(3)
          ?.to<AuthzGrant, List<int>>((e) => AuthzGrant.deserialize(e)),
    );
  }
  factory AuthzMsgGrant.fromJson(Map<String, dynamic> json) {
    return AuthzMsgGrant(
      granter: CosmosBaseAddress(json.as("granter")),
      grantee: CosmosBaseAddress(json.as("grantee")),
      grant: json.maybeAs<AuthzGrant, Map<String, dynamic>>(
        key: "grant",
        onValue: (e) => AuthzGrant.fromJson(e),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "granter": granter.address,
      "grantee": grantee.address,
      "grant": grant?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzMsgGrant;

  @override
  List get values => [granter.address, grantee.address, grant];

  @override
  List<String?> get signers => [granter.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(AuthzV1beta1Types.authzMsgGrantResponse);
  }
}
