import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse
    extends CosmosMessage {
  final BigInt? poolId;
  OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse(this.poolId);
  factory OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse(
        decode.getField(1));
  }
  factory OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse(
        BigintUtils.tryParse(json["pool_id"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  List get values => [poolId];

  @override
  TypeUrl get typeUrl =>
      OsmosisGammPoolmodelsBalancerV1beta1Types.msgCreateBalancerPoolResponse;
}
