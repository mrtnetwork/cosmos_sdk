import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammMsgJoinSwapShareAmountOutResponse extends CosmosMessage {
  final BigInt tokenInAmount;
  const OsmosisGammMsgJoinSwapShareAmountOutResponse(this.tokenInAmount);
  factory OsmosisGammMsgJoinSwapShareAmountOutResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgJoinSwapShareAmountOutResponse(
        BigInt.parse(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_in_amount": tokenInAmount.toString()};
  }

  @override
  String get typeUrl =>
      OsmosisGammV1beta1Types.msgJoinSwapShareAmountOutResponse.typeUrl;

  @override
  List get values => [tokenInAmount];
}
