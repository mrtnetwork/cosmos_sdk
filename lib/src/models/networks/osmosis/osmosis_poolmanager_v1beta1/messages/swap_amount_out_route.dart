import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerSwapAmountOutRoute extends CosmosMessage {
  final BigInt? poolId;
  final String? tokenInDenom;

  OsmosisPoolManagerSwapAmountOutRoute(
      {required this.poolId, required this.tokenInDenom});
  factory OsmosisPoolManagerSwapAmountOutRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerSwapAmountOutRoute(
        poolId: decode.getField(1), tokenInDenom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString(), "token_in_denom": tokenInDenom};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.swapAmountOutRoute;

  @override
  List get values => [poolId, tokenInDenom];
}
