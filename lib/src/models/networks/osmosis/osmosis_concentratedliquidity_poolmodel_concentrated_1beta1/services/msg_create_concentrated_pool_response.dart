import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPoolResponse
    extends CosmosMessage {
  final BigInt? poolId;

  const OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPoolResponse({
    this.poolId,
  });
  factory OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPoolResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPoolResponse(
      poolId: decode.getField(1),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
          .msgCreateConcentratedPoolResponse;

  @override
  List get values => [poolId];
}
