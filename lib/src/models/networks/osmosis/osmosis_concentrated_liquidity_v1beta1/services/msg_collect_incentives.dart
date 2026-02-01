import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_collect_spread_rewards_response.dart';

class OsmosisConcentratedLiquidityMsgCollectIncentives
    extends
        OsmosisConcentratedLiquidityV1Beta1<
          OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse
        > {
  final List<BigInt>? positionIds;
  final String? sender;

  OsmosisConcentratedLiquidityMsgCollectIncentives({
    List<BigInt>? positionIds,
    this.sender,
  }) : positionIds = positionIds?.emptyAsNull?.immutable;
  factory OsmosisConcentratedLiquidityMsgCollectIncentives.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgCollectIncentives(
      positionIds: decode.getFields<BigInt>(1),
      sender: decode.getField(2),
    );
  }
  factory OsmosisConcentratedLiquidityMsgCollectIncentives.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityMsgCollectIncentives(
      positionIds:
          json
              .as<List?>("position_ids")
              ?.map((e) => BigintUtils.parse(e))
              .toList(),
      sender: json.as("sender"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_ids": positionIds?.map((e) => e.toString()).toList(),
      "sender": sender,
    };
  }

  @override
  List get values => [positionIds, sender];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgCollectIncentives;

  @override
  OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse.deserialize(
      bytes,
    );
  }

  @override
  List<String?> get signers => [sender];
}
