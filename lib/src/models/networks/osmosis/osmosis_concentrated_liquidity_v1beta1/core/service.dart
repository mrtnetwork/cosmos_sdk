import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/services/msg_add_to_position.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/services/msg_collect_incentives.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/services/msg_collect_spread_rewards.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/services/msg_create_position.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/services/msg_transfer_positions.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/services/msg_withdraw_position.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisConcentratedLiquidityV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisConcentratedLiquidityV1Beta1();
  static T? fromJson<T extends OsmosisConcentratedLiquidityV1Beta1>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisConcentratedLiquidityV1beta1Types.findService(typeUrl);
    final OsmosisConcentratedLiquidityV1Beta1? service =
        switch (type) {
              OsmosisConcentratedLiquidityV1beta1Types.msgAddToPosition =>
                OsmosisConcentratedLiquidityMsgAddToPosition.fromJson(json),
              OsmosisConcentratedLiquidityV1beta1Types.msgCollectIncentives =>
                OsmosisConcentratedLiquidityMsgCollectIncentives.fromJson(json),
              OsmosisConcentratedLiquidityV1beta1Types
                  .msgCollectSpreadRewards =>
                OsmosisConcentratedLiquidityMsgCollectSpreadRewards.fromJson(
                  json,
                ),
              OsmosisConcentratedLiquidityV1beta1Types.msgCreatePosition =>
                OsmosisConcentratedLiquidityMsgCreatePosition.fromJson(json),
              OsmosisConcentratedLiquidityV1beta1Types.msgTransferPositions =>
                OsmosisConcentratedLiquidityMsgTransferPositionsResponse.fromJson(
                  json,
                ),
              OsmosisConcentratedLiquidityV1beta1Types.msgWithdrawPosition =>
                OsmosisConcentratedLiquidityMsgWithdrawPosition.fromJson(json),
              _ => null,
            }
            as OsmosisConcentratedLiquidityV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid ConcentratedLiquidityV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisConcentratedLiquidityV1Beta1>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisConcentratedLiquidityV1beta1Types.findService(typeUrl);
    final OsmosisConcentratedLiquidityV1Beta1? service =
        switch (type) {
              OsmosisConcentratedLiquidityV1beta1Types.msgAddToPosition =>
                OsmosisConcentratedLiquidityMsgAddToPosition.deserialize(bytes),
              OsmosisConcentratedLiquidityV1beta1Types.msgCollectIncentives =>
                OsmosisConcentratedLiquidityMsgCollectIncentives.deserialize(
                  bytes,
                ),
              OsmosisConcentratedLiquidityV1beta1Types
                  .msgCollectSpreadRewards =>
                OsmosisConcentratedLiquidityMsgCollectSpreadRewards.deserialize(
                  bytes,
                ),
              OsmosisConcentratedLiquidityV1beta1Types.msgCreatePosition =>
                OsmosisConcentratedLiquidityMsgCreatePosition.deserialize(
                  bytes,
                ),
              OsmosisConcentratedLiquidityV1beta1Types.msgTransferPositions =>
                OsmosisConcentratedLiquidityMsgTransferPositionsResponse.deserialize(
                  bytes,
                ),
              OsmosisConcentratedLiquidityV1beta1Types.msgWithdrawPosition =>
                OsmosisConcentratedLiquidityMsgWithdrawPosition.deserialize(
                  bytes,
                ),
              _ => null,
            }
            as OsmosisConcentratedLiquidityV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid ConcentratedLiquidityV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
