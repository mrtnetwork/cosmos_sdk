import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammMsgJoinSwapExternAmountInResponse extends CosmosMessage {
  final BigInt shareOutAmount;
  OsmosisGammMsgJoinSwapExternAmountInResponse(this.shareOutAmount);
  factory OsmosisGammMsgJoinSwapExternAmountInResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgJoinSwapExternAmountInResponse(
      BigInt.parse(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"share_out_amount": shareOutAmount.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisGammV1beta1Types.msgJoinSwapExternAmountInResponse;

  @override
  List get values => [shareOutAmount.toString()];
}
