import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/pool_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_create_stable_swap_pool_response.dart';

class OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool
    extends
        OsmosisGammPoolmodelsStableSwapV1Beta1<
          OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse
        > {
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
  }) : initialPoolLiquidity = initialPoolLiquidity.immutable,
       scalingFactors = scalingFactors?.emptyAsNull?.immutable;
  factory OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool(
      sender: decode.getField(1),
      poolParams: decode
          .getResult(2)
          ?.to<OsmosisGammPoolParams, List<int>>(
            (e) => OsmosisGammPoolParams.deserialize(e),
          ),
      initialPoolLiquidity:
          decode
              .getFields<List<int>>(3)
              .map((e) => Coin.deserialize(e))
              .toList(),
      scalingFactors:
          decode
              .getResult<ProtocolBufferDecoderResult?>(4)
              ?.to<List<BigInt>, List<int>>(
                (e) => e.map((e) => BigintUtils.parse(e)).toList(),
              ) ??
          <BigInt>[],
      futurePoolGovernor: decode.getField(5),
      scalingFactorController: decode.getField(6),
    );
  }
  factory OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool(
      sender: json.as("sender"),
      poolParams: json.maybeAs<OsmosisGammPoolParams, Map<String, dynamic>>(
        key: "pool_params",
        onValue: (e) => OsmosisGammPoolParams.fromJson(e),
      ),
      initialPoolLiquidity:
          json
              .asListOfMap("initial_pool_liquidity")
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          [],
      scalingFactors:
          json
              .as<List?>("scaling_factors")
              ?.map((e) => BigintUtils.parse(e))
              .toList(),
      futurePoolGovernor: json.as("future_pool_governor"),
      scalingFactorController: json.as("scaling_factor_controller"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse.deserialize(
      bytes,
    );
  }

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
      "scaling_factor_controller": scalingFactorController,
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisGammPoolmodelsStableSwapV1beta1Types.msgCreateStableswapPool;

  @override
  List get values => [
    sender,
    poolParams,
    initialPoolLiquidity,
    scalingFactors,
    futurePoolGovernor,
    scalingFactorController,
  ];
}
