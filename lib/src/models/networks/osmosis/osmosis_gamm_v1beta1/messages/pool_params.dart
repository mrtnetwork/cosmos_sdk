import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/smooth_weight_change_params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PoolParams defined the parameters that will be managed by the pool governance in the future.
/// This params are not managed by the chain governance. Instead they will be managed by the token
/// holders of the pool. The pool's token holders are specified in future_pool_governor.
class OsmosisGammPoolParams extends CosmosMessage {
  final String swapFee;
  final String exitFee;
  final OsmosisGammSmoothWeightChangeParams? smoothWeightChangeParams;

  OsmosisGammPoolParams(
      {required this.swapFee,
      required this.exitFee,
      this.smoothWeightChangeParams});
  factory OsmosisGammPoolParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolParams(
        swapFee: decode.getField(1),
        exitFee: decode.getField(2),
        smoothWeightChangeParams: decode
            .getResult(3)
            ?.to<OsmosisGammSmoothWeightChangeParams, List<int>>(
                (e) => OsmosisGammSmoothWeightChangeParams.deserialize(e)));
  }
  factory OsmosisGammPoolParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammPoolParams(
        swapFee: json["swap_fee"],
        exitFee: json["exit_fee"],
        smoothWeightChangeParams: json["smooth_weight_change_params"] == null
            ? null
            : OsmosisGammSmoothWeightChangeParams.fromRpc(
                json["smooth_weight_change_params"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "swap_fee": swapFee,
      "exit_fee": exitFee,
      "smooth_weight_change_params": smoothWeightChangeParams?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.poolParams;

  @override
  List get values => [swapFee, exitFee, smoothWeightChangeParams];
}
