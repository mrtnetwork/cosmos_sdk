import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerSwapAmountInRoute extends CosmosMessage {
  final BigInt? poolId;
  final String? tokenOutDenom;

  const OsmosisPoolManagerSwapAmountInRoute({this.poolId, this.tokenOutDenom});
  factory OsmosisPoolManagerSwapAmountInRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerSwapAmountInRoute(
        poolId: decode.getField(1), tokenOutDenom: decode.getField(2));
  }
  factory OsmosisPoolManagerSwapAmountInRoute.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerSwapAmountInRoute(
        poolId: BigintUtils.tryParse(json["pool_id"]),
        tokenOutDenom: json["token_out_denom"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString(), "token_out_denom": tokenOutDenom};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.swapAmountInRoute;

  @override
  List get values => [poolId, tokenOutDenom];
}
