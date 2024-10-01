import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/messages/grant_authorization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryGranterGrantsResponse is the response type for the Query/GranterGrants RPC method.
class AuthzQueryGranterGrantsResponse extends CosmosMessage {
  /// grants is a list of grants granted by the granter.
  final List<AuthzGrantAuthorization> grants;

  /// pagination defines an pagination for the response.
  final PageResponse? pagination;
  AuthzQueryGranterGrantsResponse(
      {required List<AuthzGrantAuthorization> grants, this.pagination})
      : grants = grants.immutable;
  factory AuthzQueryGranterGrantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGranterGrantsResponse(
        grants: decode
            .getFields(1)
            .map((e) => AuthzGrantAuthorization.deserialize(e))
            .toList(),
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
  String get typeUrl =>
      AuthzV1beta1Types.authzQueryGranterGrantsResponse.typeUrl;

  @override
  List get values => [grants, pagination];
}
