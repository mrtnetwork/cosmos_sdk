import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerMsgSwapExactAmountInResponse extends CosmosMessage {
  final BigInt tokenOutAmount;

  OsmosisPoolManagerMsgSwapExactAmountInResponse(this.tokenOutAmount);
  factory OsmosisPoolManagerMsgSwapExactAmountInResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSwapExactAmountInResponse(
        BigInt.parse(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_out_amount": tokenOutAmount.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.msgSwapExactAmountInResponse;

  @override
  List get values => [tokenOutAmount.toString()];
}
