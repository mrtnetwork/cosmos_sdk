import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/messages/plan.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCurrentPlanResponse is the response type for the Query/CurrentPlan RPC method.
class QueryCurrentPlanResponse extends CosmosMessage {
  /// plan is the current upgrade plan.
  final Plan? plan;
  const QueryCurrentPlanResponse({this.plan});
  factory QueryCurrentPlanResponse.fromJson(Map<String, dynamic> json) {
    return QueryCurrentPlanResponse(plan: Plan.fromJson(json["plan"]));
  }
  factory QueryCurrentPlanResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryCurrentPlanResponse(
        plan: decode
            .getResult(1)
            ?.to<Plan, List<int>>((e) => Plan.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"plan": plan?.toJson()};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.queryCurrentPlanResponse;

  @override
  List get values => [plan];
}
