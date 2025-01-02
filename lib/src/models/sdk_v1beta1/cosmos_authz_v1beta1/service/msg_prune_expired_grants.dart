import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgPruneExpiredGrants prunes the expired grants.
///
/// Since x/authz v1.0.0
class AuthzMsgPruneExpiredGrants extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? pruner;
  const AuthzMsgPruneExpiredGrants({this.pruner});
  factory AuthzMsgPruneExpiredGrants.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzMsgPruneExpiredGrants(
        pruner: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get service => AuthzV1beta1Types.authzPruneExpiredGrants;

  @override
  Map<String, dynamic> toJson() {
    return {"pruner": pruner?.address};
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzMsgPruneExpiredGrants;

  @override
  List get values => [pruner];

  @override
  List<String?> get signers => [pruner?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        AuthzV1beta1Types.authzMsgPruneExpiredGrantsResponse);
  }
}
