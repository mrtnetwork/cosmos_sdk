import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammMsgExitSwapExternAmountOutResponse extends CosmosMessage {
  final BigInt shareInAmount;
  const OsmosisGammMsgExitSwapExternAmountOutResponse(this.shareInAmount);
  factory OsmosisGammMsgExitSwapExternAmountOutResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgExitSwapExternAmountOutResponse(
      BigInt.parse(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"share_in_amount": shareInAmount.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisGammV1beta1Types.msgExitSwapExternAmountOutResponse;

  @override
  List get values => [shareInAmount.toString()];
}
