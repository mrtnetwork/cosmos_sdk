import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/pool_asset.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/pool_params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisGammPool extends CosmosMessage {
  final String? address;
  final BigInt? id;
  final OsmosisGammPoolParams poolParams;

  /// This string specifies who will govern the pool in the future.
  /// Valid forms of this are:
  /// {token name},{duration}
  /// {duration}
  /// where {token name} if specified is the token which determines the
  /// governor, and if not specified is the LP token for this pool.duration is
  /// a time specified as 0w,1w,2w, etc. which specifies how long the token
  /// would need to be locked up to count in governance. 0w means no lockup.
  final String? futurePoolGovernor;

  /// sum of all LP tokens sent out
  final Coin totalShares;

  /// These are assumed to be sorted by denomiation.
  /// They contain the pool asset and the information about the weight
  final List<OsmosisGammPoolAsset> poolAssets;

  /// sum of all non-normalized pool weights
  final String totalWeight;

  OsmosisGammPool(
      {this.address,
      this.id,
      required this.poolParams,
      this.futurePoolGovernor,
      required this.totalShares,
      required List<OsmosisGammPoolAsset> poolAssets,
      required this.totalWeight})
      : poolAssets = poolAssets.mutable;
  factory OsmosisGammPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPool(
        address: decode.getField(1),
        id: decode.getField(2),
        poolParams: OsmosisGammPoolParams.deserialize(decode.getField(3)),
        futurePoolGovernor: decode.getField(4),
        totalShares: Coin.deserialize(decode.getField(5)),
        poolAssets: decode
            .getFields<List<int>>(6)
            .map((e) => OsmosisGammPoolAsset.deserialize(e))
            .toList(),
        totalWeight: decode.getField(7));
  }
  factory OsmosisGammPool.fromAny(Any any) {
    if (any.typeUrl != OsmosisGammV1beta1Types.pool.typeUrl) {
      throw MessageException("Invalid type url.", details: {
        "excepted": OsmosisGammV1beta1Types.pool.typeUrl,
        "type_url": any.typeUrl
      });
    }
    return OsmosisGammPool.deserialize(any.value);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "id": id?.toString(),
      "pool_params": poolParams.toJson(),
      "future_pool_governor": futurePoolGovernor,
      "total_shares": totalShares.toJson(),
      "pool_assets": poolAssets.map((e) => e.toJson()).toList(),
      "total_weight": totalWeight
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.pool.typeUrl;

  @override
  List get values => [
        address,
        id,
        poolParams,
        futurePoolGovernor,
        totalShares,
        poolAssets,
        totalWeight
      ];
}
