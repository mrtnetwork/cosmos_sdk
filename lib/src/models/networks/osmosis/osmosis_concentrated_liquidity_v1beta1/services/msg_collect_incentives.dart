import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'msg_collect_spread_rewards_response.dart';

class OsmosisConcentratedLiquidityMsgCollectIncentives extends CosmosMessage
    with
        ServiceMessage<
            OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse> {
  final List<BigInt>? positionIds;
  final String? sender;

  OsmosisConcentratedLiquidityMsgCollectIncentives(
      {List<BigInt>? positionIds, this.sender})
      : positionIds = positionIds?.emptyAsNull?.immutable;
  factory OsmosisConcentratedLiquidityMsgCollectIncentives.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgCollectIncentives(
      positionIds: decode
              .getResult<ProtocolBufferDecoderResult?>(1)
              ?.to<List<BigInt>, List<int>>(
                  (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
          <BigInt>[],
      sender: decode.getField(2),
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
  List get values => [
        positionIds,
        sender,
      ];

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgCollectIncentives.typeUrl;

  @override
  OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse
        .deserialize(bytes);
  }

  @override
  String get service =>
      OsmosisConcentratedLiquidityV1beta1Types.collectIncentives.typeUrl;

  @override
  List<String?> get signers => [sender];
}
