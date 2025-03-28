import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse
    extends CosmosMessage {
  final BigInt? poolId;
  const OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse(
      this.poolId);

  factory OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPoolResponse(
        decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammPoolmodelsStableSwapV1beta1Types
      .msgCreateStableswapPoolResponse;

  @override
  List get values => [poolId];
}
