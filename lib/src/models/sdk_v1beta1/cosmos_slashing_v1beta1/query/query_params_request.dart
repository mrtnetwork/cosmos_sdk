import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method
class SlashingQueryParamsRequest extends CosmosMessage
    with QueryMessage<SlashingQueryParamsResponse> {
  ///  This message has no fields.
  const SlashingQueryParamsRequest();
  @override
  List<int> get fieldIds => [];

  @override
  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => SlashingV1beta1Types.slashingQueryParamsRequest;

  @override
  List get values => [];

  @override
  SlashingQueryParamsResponse onResponse(List<int> bytes) {
    return SlashingQueryParamsResponse.deserialize(bytes);
  }

  @override
  SlashingQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return SlashingQueryParamsResponse.fromJson(json);
  }
}
