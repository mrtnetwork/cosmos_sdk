import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammMsgSwapExactAmountOutResponse extends CosmosMessage {
  final BigInt tokenInAmount;
  OsmosisGammMsgSwapExactAmountOutResponse(this.tokenInAmount);
  factory OsmosisGammMsgSwapExactAmountOutResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgSwapExactAmountOutResponse(
      BigInt.parse(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_in_amount": tokenInAmount.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.msgSwapExactAmountOutResponse;

  @override
  List get values => [tokenInAmount.toString()];
}
