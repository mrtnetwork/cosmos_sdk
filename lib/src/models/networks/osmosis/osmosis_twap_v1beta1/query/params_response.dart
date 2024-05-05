import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapParamsResponse extends CosmosMessage {
  final OsmosisTwapParams params;

  OsmosisTwapParamsResponse(this.params);
  factory OsmosisTwapParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTwapParamsResponse(
        OsmosisTwapParams.deserialize(decode.getField(1)));
  }
  factory OsmosisTwapParamsResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisTwapParamsResponse(OsmosisTwapParams.fromRpc(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
    };
  }

  @override
  String get typeUrl => OsmosisTwapV1beta1Types.params.typeUrl;

  @override
  List get values => [params];
}
