import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_denom_owners_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomOwnersRequest defines the request type for the DenomOwners RPC query,
/// which queries for a paginated set of all account holders of a particular denomination.
class QueryDenomOwnersRequest extends CosmosMessage
    with QueryMessage<QueryDenomOwnersResponse> {
  /// denom defines the coin denomination to query all account holders for.
  final String denom;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryDenomOwnersRequest({required this.denom, this.pagination});
  factory QueryDenomOwnersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomOwnersRequest(
      denom: decode.getField(1),
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.denomOwnersRequest;

  @override
  List get values => [denom, pagination];

  @override
  QueryDenomOwnersResponse onResponse(List<int> bytes) {
    return QueryDenomOwnersResponse.deserialize(bytes);
  }

  @override
  QueryDenomOwnersResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryDenomOwnersResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [denom];

  @override
  Map<String, String?> get queryParameters => {
    ...pagination?.queryParameters ?? {},
  };
}
