import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapArithmeticTwapResponse extends CosmosMessage {
  final String arithmeticTwap;

  OsmosisTwapArithmeticTwapResponse(this.arithmeticTwap);
  factory OsmosisTwapArithmeticTwapResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapArithmeticTwapResponse(decode.getField(1));
  }
  factory OsmosisTwapArithmeticTwapResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisTwapArithmeticTwapResponse(json["arithmetic_twap"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"arithmetic_twap": arithmeticTwap};
  }

  @override
  String get typeUrl => OsmosisTwapV1beta1Types.arithmeticTwapResponse.typeUrl;

  @override
  List get values => [arithmeticTwap];
}
