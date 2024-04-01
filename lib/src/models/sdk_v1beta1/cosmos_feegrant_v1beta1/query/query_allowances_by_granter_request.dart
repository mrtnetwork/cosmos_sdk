import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/query/query_allowances_by_granter_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowancesByGranterRequest is the request type for the Query/AllowancesByGranter RPC method.
/// Since: cosmos-sdk 0.46
class QueryAllowancesByGranterRequest extends CosmosMessage
    with QueryMessage<QueryAllowancesByGranterResponse> {
  final BaseAddress? granter;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const QueryAllowancesByGranterRequest({this.granter, this.pagination});
  factory QueryAllowancesByGranterRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowancesByGranterRequest(
        granter:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => FeegrantV1beta1Types.allowancesByGranter.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter?.address, "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      FeegrantV1beta1Types.queryAllowancesByGranterRequest.typeUrl;

  @override
  List get values => [granter?.address, pagination];

  @override
  QueryAllowancesByGranterResponse onResponse(List<int> bytes) {
    return QueryAllowancesByGranterResponse.deserialize(bytes);
  }
}
