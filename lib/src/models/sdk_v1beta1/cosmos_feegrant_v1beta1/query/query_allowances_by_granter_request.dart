import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/query/query_allowances_by_granter_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowancesByGranterRequest is the request type for the Query/AllowancesByGranter RPC method.
/// Since: cosmos-sdk 0.46
class QueryAllowancesByGranterRequest extends CosmosMessage
    with QueryMessage<QueryAllowancesByGranterResponse> {
  final CosmosBaseAddress granter;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  factory QueryAllowancesByGranterRequest.fromRpc(Map<String, dynamic> json) {
    return QueryAllowancesByGranterRequest(
        granter: CosmosBaseAddress(json["granter"]));
  }
  const QueryAllowancesByGranterRequest(
      {required this.granter, this.pagination});
  factory QueryAllowancesByGranterRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowancesByGranterRequest(
        granter: CosmosBaseAddress(decode.getField(1)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter.address, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.queryAllowancesByGranterRequest;

  @override
  List get values => [granter.address, pagination];

  @override
  QueryAllowancesByGranterResponse onResponse(List<int> bytes) {
    return QueryAllowancesByGranterResponse.deserialize(bytes);
  }

  @override
  QueryAllowancesByGranterResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAllowancesByGranterResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [granter.address];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
