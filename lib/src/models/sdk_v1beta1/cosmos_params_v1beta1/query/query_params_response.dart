import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/messages/param_change.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_params_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is response type for the Query/Params RPC method.
class ParamsQueryParamsResponse extends CosmosMessage {
  ///  param defines the queried parameter.
  final ParamChange param;
  const ParamsQueryParamsResponse(this.param);
  factory ParamsQueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return ParamsQueryParamsResponse(
        ParamChange.fromJson(json["param"] ?? json["params"]));
  }
  factory ParamsQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ParamsQueryParamsResponse(
        ParamChange.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"param": param.toJson()};
  }

  @override
  TypeUrl get typeUrl => ParamsV1beta1.paramsQueryParamsResponse;

  @override
  List get values => [param];
}
