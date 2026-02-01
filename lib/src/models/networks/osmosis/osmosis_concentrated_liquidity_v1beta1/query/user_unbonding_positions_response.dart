import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/position_with_period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityUserUnbondingPositionsResponse
    extends CosmosMessage {
  final List<OsmosisConcentratedLiquidityPositionWithPeriodLock> positions;

  OsmosisConcentratedLiquidityUserUnbondingPositionsResponse({
    required List<OsmosisConcentratedLiquidityPositionWithPeriodLock> positions,
  }) : positions = positions.immutable;
  factory OsmosisConcentratedLiquidityUserUnbondingPositionsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityUserUnbondingPositionsResponse(
      positions:
          decode
              .getFields<List<int>>(1)
              .map(
                (e) =>
                    OsmosisConcentratedLiquidityPositionWithPeriodLock.deserialize(
                      e,
                    ),
              )
              .toList(),
    );
  }
  factory OsmosisConcentratedLiquidityUserUnbondingPositionsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityUserUnbondingPositionsResponse(
      positions:
          (json["positions"] as List?)
              ?.map(
                (e) =>
                    OsmosisConcentratedLiquidityPositionWithPeriodLock.fromJson(
                      e,
                    ),
              )
              .toList() ??
          <OsmosisConcentratedLiquidityPositionWithPeriodLock>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"positions": positions.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.userUnbondingPositionsResponse;

  @override
  List get values => [positions];
}
