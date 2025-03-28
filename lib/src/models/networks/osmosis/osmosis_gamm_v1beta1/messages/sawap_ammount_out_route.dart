import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammSwapAmountOutRoute extends CosmosMessage {
  final BigInt? poolId;
  final String? tokenInDenom;
  const OsmosisGammSwapAmountOutRoute(
      {required this.poolId, required this.tokenInDenom});
  factory OsmosisGammSwapAmountOutRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammSwapAmountOutRoute(
        poolId: decode.getField(1), tokenInDenom: decode.getField(2));
  }
  factory OsmosisGammSwapAmountOutRoute.fromJson(Map<String, dynamic> json) {
    return OsmosisGammSwapAmountOutRoute(
      poolId: BigintUtils.tryParse(json["pool_id"]),
      tokenInDenom: json["token_in_denom"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString(), "token_in_denom": tokenInDenom};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.swapAmountOutRoute;

  @override
  List get values => [poolId, tokenInDenom];
}
