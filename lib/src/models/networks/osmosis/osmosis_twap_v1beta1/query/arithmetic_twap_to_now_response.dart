import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapArithmeticTwapToNowResponse extends CosmosMessage {
  final String arithmeticTwap;

  OsmosisTwapArithmeticTwapToNowResponse(this.arithmeticTwap);
  factory OsmosisTwapArithmeticTwapToNowResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapArithmeticTwapToNowResponse(decode.getField(1));
  }
  factory OsmosisTwapArithmeticTwapToNowResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTwapArithmeticTwapToNowResponse(json["arithmetic_twap"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"arithmetic_twap": arithmeticTwap};
  }

  @override
  TypeUrl get typeUrl => OsmosisTwapV1beta1Types.arithmeticTwapToNowResponse;

  @override
  List get values => [arithmeticTwap];
}
