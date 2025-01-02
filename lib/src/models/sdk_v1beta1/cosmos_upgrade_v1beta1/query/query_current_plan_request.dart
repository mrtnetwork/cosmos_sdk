import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/query/query_current_plan_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCurrentPlanRequest is the request type for the Query/CurrentPlan RPC method.
class QueryCurrentPlanRequest extends CosmosMessage
    with QueryMessage<QueryCurrentPlanResponse> {
  ///  This message has no fields.
  const QueryCurrentPlanRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.queryCurrentPlanRequest;

  @override
  List get values => [];

  @override
  QueryCurrentPlanResponse onResponse(List<int> bytes) {
    return QueryCurrentPlanResponse.deserialize(bytes);
  }

  @override
  QueryCurrentPlanResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryCurrentPlanResponse.fromRpc(json);
  }
}
