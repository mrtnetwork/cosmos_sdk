import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method
class SlashingQueryParamsResponse extends CosmosMessage {
  final SlashingParams params;
  const SlashingQueryParamsResponse(this.params);
  factory SlashingQueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return SlashingQueryParamsResponse(SlashingParams.fromJson(json["params"]));
  }
  factory SlashingQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingQueryParamsResponse(
        SlashingParams.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => SlashingV1beta1Types.slashingQueryParamsResponse;

  @override
  List get values => [params];
}
