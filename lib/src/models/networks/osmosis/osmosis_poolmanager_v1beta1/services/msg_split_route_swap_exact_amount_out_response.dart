import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse
    extends CosmosMessage {
  final BigInt tokenInAmount;

  OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse(this.tokenInAmount);
  factory OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSplitRouteSwapExactAmountOutResponse(
        BigInt.parse(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"token_in_amount": tokenInAmount.toString()};
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types
      .msgSplitRouteSwapExactAmountOutResponse.typeUrl;

  @override
  List get values => [tokenInAmount.toString()];
}
