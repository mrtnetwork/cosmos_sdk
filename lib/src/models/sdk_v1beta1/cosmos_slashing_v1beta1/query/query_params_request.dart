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
  String get typeUrl => SlashingV1beta1Types.slashingQueryParamsRequest.typeUrl;

  @override
  List get values => [];

  @override
  String get queryPath => SlashingV1beta1Types.querySlashingParams.typeUrl;

  @override
  SlashingQueryParamsResponse onResponse(List<int> bytes) {
    return SlashingQueryParamsResponse.deserialize(bytes);
  }
}
