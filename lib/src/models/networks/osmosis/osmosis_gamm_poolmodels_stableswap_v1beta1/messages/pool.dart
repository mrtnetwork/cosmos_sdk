import 'package:blockchain_utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Pool is the stableswap Pool struct
class OsmosisGammPoolmodelsStableSwapPool extends CosmosMessage {
  final String? address;
  final BigInt? id;
  final OsmosisGammPoolmodelsStableSwapPool poolParams;

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

  OsmosisGammPoolmodelsStableSwapPool(
      {this.address,
      this.id,
      required this.poolParams,
      this.futurePoolGovernor,
      required this.totalShares,
      required List<Coin> poolLiquidity,
      required List<BigInt> scalingFactor,
      this.scalingFactorController})
      : poolLiquidity = poolLiquidity.mutable,
        scalingFactor = scalingFactor.mutable;
  factory OsmosisGammPoolmodelsStableSwapPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapPool(
        address: decode.getField(1),
        id: decode.getField(2),
        poolParams:
            OsmosisGammPoolmodelsStableSwapPool.deserialize(decode.getField(3)),
        futurePoolGovernor: decode.getField(4),
        totalShares: Coin.deserialize(decode.getField(5)),
        poolLiquidity:
            decode.getFields(6).map((e) => Coin.deserialize(e)).toList(),
        scalingFactor: decode.getFields<BigInt>(7),
        scalingFactorController: decode.getField(8));
  }
  factory OsmosisGammPoolmodelsStableSwapPool.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammPoolmodelsStableSwapPool(
      address: json["address"],
      id: BigintUtils.tryParse(json["id"]),
      poolParams:
          OsmosisGammPoolmodelsStableSwapPool.fromRpc(json["pool_params"]),
      futurePoolGovernor: json["future_pool_governor"],
      totalShares: Coin.fromRpc(json["total_shares"]),
      poolLiquidity: (json["pool_liquidity"] as List?)
              ?.map((e) => Coin.deserialize(e))
              .toList() ??
          <Coin>[],
      scalingFactor: (json["scaling_factor"] as List?)
              ?.map((e) => BigintUtils.parse(e))
              .toList() ??
          <BigInt>[],
      scalingFactorController: json["scaling_factor_controller"],
    );
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
      "scaling_factor_controller": scalingFactorController
    };
  }

  @override
  String get typeUrl =>
      OsmosisGammPoolmodelsStableswaPV1beta1Types.pool.typeUrl;

  @override
  List get values => [
        address,
        id,
        poolParams,
        futurePoolGovernor,
        totalShares,
        poolLiquidity,
        scalingFactor,
        scalingFactorController
      ];
}
