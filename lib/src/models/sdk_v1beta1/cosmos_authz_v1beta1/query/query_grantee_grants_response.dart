import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/messages/grant_authorization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryGranteeGrantsResponse is the response type for the Query/GranteeGrants RPC method.
class AuthzQueryGranteeGrantsResponse extends CosmosMessage {
  /// grants is a list of grants granted to the grantee.
  final List<AuthzGrantAuthorization> grants;

  /// pagination defines an pagination for the response.
  final PageResponse? pagination;
  AuthzQueryGranteeGrantsResponse(
      {required List<AuthzGrantAuthorization> grants, this.pagination})
      : grants = grants.immutable;
  factory AuthzQueryGranteeGrantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGranteeGrantsResponse(
        grants: decode
            .getFields<List<int>>(1)
            .map((e) => AuthzGrantAuthorization.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory AuthzQueryGranteeGrantsResponse.fromRPC(Map<String, dynamic> json) {
    return AuthzQueryGranteeGrantsResponse(
      grants: (json["grants"] as List?)
              ?.map((e) => AuthzGrantAuthorization.fromJson(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromJson(json["pagination"]),
    );
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
  TypeUrl get typeUrl => AuthzV1beta1Types.authzQueryGranteeGrantsResponse;

  @override
  List get values => [grants, pagination];
}
