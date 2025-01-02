import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/messages/grant.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryGrantsResponse is the response type for the Query/Authorizations RPC method.
class AuthzQueryGrantsResponse extends CosmosMessage {
  /// authorizations is a list of grants granted for grantee by granter.
  final List<AuthzGrant> grants;

  /// pagination defines an pagination for the response.
  final PageResponse? pagination;
  AuthzQueryGrantsResponse({required List<AuthzGrant> grants, this.pagination})
      : grants = grants.immutable;
  factory AuthzQueryGrantsResponse.fromRpc(Map<String, dynamic> json) {
    return AuthzQueryGrantsResponse(
        grants: (json["grants"] as List?)
                ?.map((e) => AuthzGrant.fromRpc(e))
                .toList() ??
            [],
        pagination: json["pagination"] == null
            ? null
            : PageResponse.fromRpc(json["pagination"]));
  }
  factory AuthzQueryGrantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGrantsResponse(
        grants:
            decode.getFields(1).map((e) => AuthzGrant.deserialize(e)).toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "grants": grants.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzQueryGrantsResponse;

  @override
  List get values => [grants, pagination];
}
