import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/query/query_allowances_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowancesRequest is the request type for the Query/Allowances RPC method.
class QueryAllowancesRequest extends CosmosMessage
    with QueryMessage<QueryAllowancesResponse> {
  final CosmosBaseAddress grantee;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const QueryAllowancesRequest({required this.grantee, this.pagination});
  factory QueryAllowancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowancesRequest(
        grantee: CosmosBaseAddress(decode.getField(1)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"grantee": grantee.address, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.queryAllowancesRequest;

  @override
  List get values => [grantee, pagination];

  @override
  QueryAllowancesResponse onResponse(List<int> bytes) {
    return QueryAllowancesResponse.deserialize(bytes);
  }

  @override
  QueryAllowancesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAllowancesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [grantee.address];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
