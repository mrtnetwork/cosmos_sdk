import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/query/query_granter_grants_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGranterGrantsRequest is the request type for the Query/GranterGrants RPC method.
class AuthzQueryGranterGrantsRequest extends CosmosMessage
    with QueryMessage<AuthzQueryGranterGrantsResponse> {
  final CosmosBaseAddress? granter;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const AuthzQueryGranterGrantsRequest({this.granter, this.pagination});
  factory AuthzQueryGranterGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzQueryGranterGrantsRequest(
        granter: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => AuthzV1beta1Types.authzGranterGrants.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter?.address, "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      AuthzV1beta1Types.authzQueryGranterGrantsRequest.typeUrl;

  @override
  List get values => [granter?.address, pagination];

  @override
  AuthzQueryGranterGrantsResponse onResponse(List<int> bytes) {
    return AuthzQueryGranterGrantsResponse.deserialize(bytes);
  }
}
