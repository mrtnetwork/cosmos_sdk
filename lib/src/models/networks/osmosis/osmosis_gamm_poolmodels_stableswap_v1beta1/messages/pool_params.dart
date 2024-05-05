import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PoolParams defined the parameters that will be managed by the pool governance in the future.
/// This params are not managed by the chain governance. Instead they will be managed by the token holders of the pool.
/// The pool's token holders are specified in future_pool_governor.
class OsmosisGammPoolmodelsStableSwapPoolParams extends CosmosMessage {
  final String swapFee;
  final String exitFee;

  OsmosisGammPoolmodelsStableSwapPoolParams(
      {required this.swapFee, required this.exitFee});
  factory OsmosisGammPoolmodelsStableSwapPoolParams.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapPoolParams(
        swapFee: decode.getField(1), exitFee: decode.getField(2));
  }
  factory OsmosisGammPoolmodelsStableSwapPoolParams.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammPoolmodelsStableSwapPoolParams(
        swapFee: json["swap_fee"], exitFee: json["exit_fee"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"swap_fee": swapFee, "exit_fee": exitFee};
  }

  @override
  String get typeUrl =>
      OsmosisGammPoolmodelsStableswaPV1beta1Types.poolParams.typeUrl;

  @override
  List get values => [swapFee, exitFee];
}
