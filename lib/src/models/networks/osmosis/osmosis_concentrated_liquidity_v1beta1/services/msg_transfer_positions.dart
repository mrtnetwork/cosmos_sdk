import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityMsgTransferPositionsResponse
    extends CosmosMessage with ServiceMessage<EmptyServiceRequestResponse> {
  final List<BigInt>? positionIds;
  final String? sender;
  final String? newOwner;

  OsmosisConcentratedLiquidityMsgTransferPositionsResponse(
      {List<BigInt>? positionIds, this.sender, this.newOwner})
      : positionIds = positionIds?.emptyAsNull?.immutable;
  factory OsmosisConcentratedLiquidityMsgTransferPositionsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgTransferPositionsResponse(
        positionIds: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        sender: decode.getField(2),
        newOwner: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "position_ids": positionIds?.map((e) => e.toString()).toList(),
      "new_owner": newOwner
    };
  }

  @override
  List get values => [positionIds, sender, newOwner];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgTransferPositions;

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisConcentratedLiquidityV1beta1Types.msgTransferPositionsResponse);
  }

  @override
  TypeUrl get service =>
      OsmosisConcentratedLiquidityV1beta1Types.transferPositions;

  @override
  List<String?> get signers => [sender];
}
