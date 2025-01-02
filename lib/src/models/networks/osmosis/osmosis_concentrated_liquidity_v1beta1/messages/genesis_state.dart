import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity/messages/params.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'pool_data.dart';
import 'position_data.dart';

/// GenesisState defines the concentrated liquidity module's genesis state.
class OsmosisConcentratedLiquidityGenesisState extends CosmosMessage {
  /// params are all the parameters of the module
  final OsmosisConcentratedLiquidityParams params;

  /// pool data containining serialized pool struct and ticks.
  final List<OsmosisConcentratedLiquidityPoolData> poolData;
  final List<OsmosisConcentratedLiquidityPositionData> positionData;

  /// tick's index.
  final BigInt? nextPositionId;
  final BigInt? nextIncentiveRecordId;

  OsmosisConcentratedLiquidityGenesisState(
      {required this.params,
      required this.poolData,
      required this.positionData,
      this.nextPositionId,
      this.nextIncentiveRecordId});
  factory OsmosisConcentratedLiquidityGenesisState.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityGenesisState(
        params:
            OsmosisConcentratedLiquidityParams.deserialize(decode.getField(1)),
        poolData: decode
            .getFields(2)
            .map((e) => OsmosisConcentratedLiquidityPoolData.deserialize(e))
            .toList(),
        positionData: decode
            .getFields(3)
            .map((e) => OsmosisConcentratedLiquidityPositionData.deserialize(e))
            .toList(),
        nextPositionId: decode.getField(4),
        nextIncentiveRecordId: decode.getField(5));
  }
  factory OsmosisConcentratedLiquidityGenesisState.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityGenesisState(
        params: OsmosisConcentratedLiquidityParams.fromRpc(json["params"]),
        poolData: (json["pool_data"] as List?)
                ?.map((e) => OsmosisConcentratedLiquidityPoolData.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityPoolData>[],
        positionData: (json["position_data"] as List?)
                ?.map(
                    (e) => OsmosisConcentratedLiquidityPositionData.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityPositionData>[],
        nextPositionId: BigintUtils.tryParse(json["next_position_id"]),
        nextIncentiveRecordId:
            BigintUtils.tryParse(json["next_incentive_record_id"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "pool_data": poolData.map((e) => e.toJson()).toList(),
      "position_data": positionData.map((e) => e.toJson()).toList(),
      "next_position_id": nextPositionId?.toString(),
      "next_incentive_record_id": nextIncentiveRecordId?.toString()
    };
  }

  @override
  List get values =>
      [params, poolData, positionData, nextPositionId, nextIncentiveRecordId];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.genesisState;
}
