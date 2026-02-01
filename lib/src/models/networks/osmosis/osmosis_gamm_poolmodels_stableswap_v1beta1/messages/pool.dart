import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/messages/pool_params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Pool is the stableswap Pool struct
class OsmosisGammPoolmodelsStableSwapPool extends CosmosMessage {
  final String? address;
  final BigInt? id;
  final OsmosisGammPoolmodelsStableSwapPoolParams poolParams;

  /// This string specifies who will govern the pool in the future.
  /// Valid forms of this are:
  /// {token name},{duration}
  /// {duration}
  /// where {token name} if specified is the token which determines the
  /// governor, and if not specified is the LP token for this pool.duration is
  /// a time specified as 0w,1w,2w, etc. which specifies how long the token
  /// would need to be locked up to count in governance. 0w means no lockup.
  final String? futurePoolGovernor;

  /// sum of all LP shares
  final Coin totalShares;

  /// assets in the pool
  final List<Coin> poolLiquidity;

  /// for calculation amognst assets with different precisions
  final List<BigInt> scalingFactor;

  /// scaling_factor_controller is the address can adjust pool scaling factors
  final String? scalingFactorController;

  OsmosisGammPoolmodelsStableSwapPool({
    this.address,
    this.id,
    required this.poolParams,
    this.futurePoolGovernor,
    required this.totalShares,
    required List<Coin> poolLiquidity,
    required List<BigInt> scalingFactor,
    this.scalingFactorController,
  }) : poolLiquidity = poolLiquidity.immutable,
       scalingFactor = scalingFactor.immutable;
  factory OsmosisGammPoolmodelsStableSwapPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapPool(
      address: decode.getField(1),
      id: decode.getField(2),
      poolParams: OsmosisGammPoolmodelsStableSwapPoolParams.deserialize(
        decode.getField(3),
      ),
      futurePoolGovernor: decode.getField(4),
      totalShares: Coin.deserialize(decode.getField(5)),
      poolLiquidity:
          decode
              .getFields<List<int>>(6)
              .map((e) => Coin.deserialize(e))
              .toList(),
      scalingFactor:
          decode
              .getResult<ProtocolBufferDecoderResult?>(7)
              ?.to<List<BigInt>, List<int>>(
                (e) => e.map((e) => BigintUtils.parse(e)).toList(),
              ) ??
          <BigInt>[],
      scalingFactorController: decode.getField(8),
    );
  }
  factory OsmosisGammPoolmodelsStableSwapPool.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammPoolmodelsStableSwapPool(
      address: json["address"],
      id: BigintUtils.tryParse(json["id"]),
      poolParams: OsmosisGammPoolmodelsStableSwapPoolParams.fromJson(
        json["pool_params"],
      ),
      futurePoolGovernor: json["future_pool_governor"],
      totalShares: Coin.fromJson(json["total_shares"]),
      poolLiquidity:
          (json["pool_liquidity"] as List?)
              ?.map((e) => Coin.deserialize(e))
              .toList() ??
          <Coin>[],
      scalingFactor:
          (json["scaling_factor"] as List?)
              ?.map((e) => BigintUtils.parse(e))
              .toList() ??
          <BigInt>[],
      scalingFactorController: json["scaling_factor_controller"],
    );
  }
  factory OsmosisGammPoolmodelsStableSwapPool.fromAny(Any any) {
    if (any.typeUrl !=
        OsmosisGammPoolmodelsStableSwapV1beta1Types.pool.typeUrl) {
      throw DartCosmosSdkPluginException(
        "Invalid type url.",
        details: {
          "excepted": OsmosisGammPoolmodelsStableSwapV1beta1Types.pool.typeUrl,
          "type_url": any.typeUrl,
        },
      );
    }
    return OsmosisGammPoolmodelsStableSwapPool.deserialize(any.value);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "id": id,
      "pool_params": poolParams.toJson(),
      "future_pool_governor": futurePoolGovernor,
      "total_shares": totalShares.toJson(),
      "pool_liquidity": poolLiquidity.map((e) => e.toJson()).toList(),
      "scaling_factor": scalingFactor.map((e) => e.toString()).toList(),
      "scaling_factor_controller": scalingFactorController,
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammPoolmodelsStableSwapV1beta1Types.pool;

  @override
  List get values => [
    address,
    id,
    poolParams,
    futurePoolGovernor,
    totalShares,
    poolLiquidity,
    scalingFactor,
    scalingFactorController,
  ];
}
