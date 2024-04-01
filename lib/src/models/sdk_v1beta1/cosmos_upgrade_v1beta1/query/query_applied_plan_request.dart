import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/query/query_applied_plan_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCurrentPlanRequest is the request type for the Query/AppliedPlan RPC method.
class QueryAppliedPlanRequest extends CosmosMessage
    with QueryMessage<QueryAppliedPlanResponse> {
  /// name is the name of the applied plan to query for.
  final String? name;
  const QueryAppliedPlanRequest({this.name});
  factory QueryAppliedPlanRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAppliedPlanRequest(name: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => UpgradeV1beta1Types.appliedPlan.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"name": name};
  }

  @override
  String get typeUrl => UpgradeV1beta1Types.queryAppliedPlanRequest.typeUrl;

  @override
  List get values => [name];
  @override
  QueryAppliedPlanResponse onResponse(List<int> bytes) {
    return QueryAppliedPlanResponse.deserialize(bytes);
  }
}
