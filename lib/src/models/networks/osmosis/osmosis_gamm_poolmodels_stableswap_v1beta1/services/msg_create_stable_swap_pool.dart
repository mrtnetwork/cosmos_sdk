import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/pool_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'msg_create_stable_swap_pool_response.dart';

class OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool
    extends CosmosMessage
    with
        ServiceMessage<
            OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse> {
  final String? sender;
  final OsmosisGammPoolParams? poolParams;
  final List<Coin> initialPoolLiquidity;
  final List<BigInt>? scalingFactors;
  final String? futurePoolGovernor;
  final String? scalingFactorController;

  OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool({
    this.sender,
    this.poolParams,
    required List<Coin> initialPoolLiquidity,
    List<BigInt>? scalingFactors,
    this.futurePoolGovernor,
    this.scalingFactorController,
  })  : initialPoolLiquidity = initialPoolLiquidity.mutable,
        scalingFactors = scalingFactors?.nullOnEmpy;
  factory OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool(
        sender: decode.getField(1),
        poolParams: decode.getResult(2)?.to<OsmosisGammPoolParams, List<int>>(
            (e) => OsmosisGammPoolParams.deserialize(e)),
        initialPoolLiquidity:
            decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
        scalingFactors: decode.getFields<BigInt>(4),
        futurePoolGovernor: decode.getField(5),
        scalingFactorController: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse onResponse(
      List<int> bytes) {
    return OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse
        .deserialize(bytes);
  }

  @override
  String get service =>
      OsmosisGammPoolmodelsStableswaPV1beta1Types.createStableswapPool.typeUrl;

  @override
  List<String?> get signers => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_params": poolParams?.toJson(),
      "initial_pool_liquidity":
          initialPoolLiquidity.map((e) => e.toJson()).toList(),
      "scaling_factors": scalingFactors?.map((e) => e.toString()).toList(),
      "future_pool_governor": futurePoolGovernor,
      "scaling_factor_controller": scalingFactorController
    };
  }

  @override
  String get typeUrl => OsmosisGammPoolmodelsStableswaPV1beta1Types
      .msgCreateStableswapPool.typeUrl;

  @override
  List get values => [
        sender,
        poolParams,
        initialPoolLiquidity,
        scalingFactors,
        futurePoolGovernor,
        scalingFactorController
      ];
}
