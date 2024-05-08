import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool
    extends CosmosMessage
    with
        ServiceMessage<
            OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool> {
  final String? sender;
  final String? denom0;
  final String? denom1;
  final BigInt? tickSpacing;
  final String? spreadFactor;

  const OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool(
      {this.sender,
      this.denom0,
      this.denom1,
      this.tickSpacing,
      this.spreadFactor});
  factory OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool(
        sender: decode.getField(1),
        denom0: decode.getField(2),
        denom1: decode.getField(3),
        tickSpacing: decode.getField(4),
        spreadFactor: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool
      onResponse(List<int> bytes) {
    return OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool
        .deserialize(bytes);
  }

  @override
  String get service =>
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
          .createConcentratedPool.typeUrl;

  @override
  List<String?> get signers => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "denom0": denom0,
      "denom1": denom1,
      "tick_spacing": tickSpacing?.toString(),
      "spread_factor": spreadFactor
    };
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
          .msgCreateConcentratedPool.typeUrl;

  @override
  List get values => [sender, denom0, denom1, tickSpacing, spreadFactor];
}
