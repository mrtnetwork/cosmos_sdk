import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_twap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'params_response.dart';

/// Params holds parameters for the twap module.
class OsmosisTwapParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisTwapParamsResponse>,
        RPCMessage<OsmosisTwapParamsResponse> {
  OsmosisTwapParamsRequest();
  factory OsmosisTwapParamsRequest.deserialize(List<int> bytes) {
    return OsmosisTwapParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisTwapV1beta1Types.paramsRequest.typeUrl;

  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisTwapV1beta1Types.queryParams.typeUrl;

  @override
  String get rpcPath => OsmosisTwapV1beta1Types.queryParams.rpcUrl();

  @override
  OsmosisTwapParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisTwapParamsResponse.fromRpc(json);
  }

  @override
  OsmosisTwapParamsResponse onResponse(List<int> bytes) {
    return OsmosisTwapParamsResponse.deserialize(bytes);
  }
}
