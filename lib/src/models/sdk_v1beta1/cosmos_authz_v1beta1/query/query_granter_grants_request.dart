import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/query/query_granter_grants_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGranterGrantsRequest is the request type for the Query/GranterGrants RPC method.
class AuthzQueryGranterGrantsRequest extends CosmosMessage
    with QueryMessage<AuthzQueryGranterGrantsResponse> {
  final CosmosBaseAddress granter;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const AuthzQueryGranterGrantsRequest({
    required this.granter,
    this.pagination,
  });
  factory AuthzQueryGranterGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGranterGrantsRequest(
      granter: CosmosBaseAddress(decode.getField(1)),
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter.address, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzQueryGranterGrantsRequest;

  @override
  List get values => [granter.address, pagination];

  @override
  AuthzQueryGranterGrantsResponse onResponse(List<int> bytes) {
    return AuthzQueryGranterGrantsResponse.deserialize(bytes);
  }

  @override
  AuthzQueryGranterGrantsResponse onJsonResponse(Map<String, dynamic> json) {
    return AuthzQueryGranterGrantsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [granter.address];
}
