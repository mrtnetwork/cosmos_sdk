import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisGammMsgExitSwapShareAmountInResponse extends CosmosMessage {
  final BigInt tokenOutAmount;
  const OsmosisGammMsgExitSwapShareAmountInResponse(this.tokenOutAmount);
  factory OsmosisGammMsgExitSwapShareAmountInResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammMsgExitSwapShareAmountInResponse(
        BigInt.parse(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_out_amount": tokenOutAmount.toString()};
  }

  @override
  String get typeUrl =>
      OsmosisGammV1beta1Types.msgExitSwapShareAmountInResponse.typeUrl;

  @override
  List get values => [tokenOutAmount.toString()];
}
