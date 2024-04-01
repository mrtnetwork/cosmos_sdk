import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/query/query_allowances_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowancesRequest is the request type for the Query/Allowances RPC method.
class QueryAllowancesRequest extends CosmosMessage
    with QueryMessage<QueryAllowancesResponse> {
  final BaseAddress? grantee;

  /// pagination defines an pagination for the request.
  final PageRequest? pagination;
  const QueryAllowancesRequest({this.grantee, this.pagination});
  factory QueryAllowancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowancesRequest(
        grantee:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => FeegrantV1beta1Types.allowances.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"grantee": grantee?.address, "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl => FeegrantV1beta1Types.queryAllowancesRequest.typeUrl;

  @override
  List get values => [grantee, pagination];

  @override
  QueryAllowancesResponse onResponse(List<int> bytes) {
    return QueryAllowancesResponse.deserialize(bytes);
  }
}
