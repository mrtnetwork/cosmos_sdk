import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisConcentratedLiquidityMsgTransferPositionsResponse
    extends OsmosisConcentratedLiquidityV1Beta1<EmptyServiceRequestResponse> {
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
  factory OsmosisConcentratedLiquidityMsgTransferPositionsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityMsgTransferPositionsResponse(
        positionIds: json
            .as<List?>("position_ids")
            ?.map((e) => BigintUtils.parse(e))
            .toList(),
        sender: json.as("sender"),
        newOwner: json.as("new_owner"));
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
  List<String?> get signers => [sender];
}
