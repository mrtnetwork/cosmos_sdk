import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAppliedPlanResponse is the response type for the Query/AppliedPlan RPC method.
class QueryAppliedPlanResponse extends CosmosMessage {
  /// height is the block height at which the plan was applied.
  final BigInt? height;
  const QueryAppliedPlanResponse({this.height});
  factory QueryAppliedPlanResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAppliedPlanResponse(height: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height?.toString()};
  }

  @override
  String get typeUrl => UpgradeV1beta1Types.queryAppliedPlanResponse.typeUrl;

  @override
  List get values => [height];
}
