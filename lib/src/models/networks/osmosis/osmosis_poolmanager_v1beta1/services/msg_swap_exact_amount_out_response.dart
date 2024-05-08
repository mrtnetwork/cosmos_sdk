import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerMsgSwapExactAmountOutResponse extends CosmosMessage {
  final BigInt tokenInAmount;

  OsmosisPoolManagerMsgSwapExactAmountOutResponse(this.tokenInAmount);
  factory OsmosisPoolManagerMsgSwapExactAmountOutResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSwapExactAmountOutResponse(
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
      OsmosisPoolManagerV1beta1Types.msgSwapExactAmountOutResponse.typeUrl;

  @override
  List get values => [tokenInAmount.toString()];
}
