import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammSwapAmountInRoute extends CosmosMessage {
  final BigInt? poolId;
  final String? tokenOutDenom;
  const OsmosisGammSwapAmountInRoute(
      {required this.poolId, required this.tokenOutDenom});
  factory OsmosisGammSwapAmountInRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammSwapAmountInRoute(
        poolId: decode.getField(1), tokenOutDenom: decode.getField(2));
  }

  factory OsmosisGammSwapAmountInRoute.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammSwapAmountInRoute(
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
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.swapAmountInRoute;

  @override
  List get values => [poolId, tokenOutDenom];
}
