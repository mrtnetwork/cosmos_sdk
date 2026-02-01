import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validators_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorsRequest is request type for Query/Validators RPC method.
class QueryValidatorsRequest extends CosmosMessage
    with QueryMessage<QueryValidatorsResponse> {
  /// status enables to query for validators matching a given status.
  final String status;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryValidatorsRequest({required this.status, this.pagination});

  factory QueryValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorsRequest(
      status: decode.getField(1),
      pagination: decode
          .getResult(1)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"status": status, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryValidatorsRequest;

  @override
  List get values => [status, pagination];

  @override
  QueryValidatorsResponse onResponse(List<int> bytes) {
    return QueryValidatorsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryValidatorsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    ...pagination?.queryParameters ?? {},
    "status": status,
  };
}
