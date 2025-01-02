import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Pool asset is an internal struct that combines the amount of the token in the pool,
/// and its balancer weight. This is an awkward packaging of data,
/// and should be revisited in a future state migration.
class OsmosisGammPoolAsset extends CosmosMessage {
  /// Coins we are talking about,
  /// the denomination must be unique amongst all PoolAssets for this pool.
  final Coin token;

  /// Weight that is not normalized. This weight must be less than 2^50
  final String weight;

  const OsmosisGammPoolAsset({required this.token, required this.weight});
  factory OsmosisGammPoolAsset.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolAsset(
        token: Coin.deserialize(decode.getField(1)),
        weight: decode.getField(2));
  }
  factory OsmosisGammPoolAsset.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammPoolAsset(
        token: Coin.fromRpc(json["token"]), weight: json["weight"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"token": token.toJson(), "weight": weight};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.poolAsset;

  @override
  List get values => [token, weight];
}
