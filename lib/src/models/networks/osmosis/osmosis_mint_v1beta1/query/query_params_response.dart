import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class OsmosisMintQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module
  final OsmosisMintParams params;
  const OsmosisMintQueryParamsResponse(this.params);
  factory OsmosisMintQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintQueryParamsResponse(
        OsmosisMintParams.deserialize(decode.getField(1)));
  }
  factory OsmosisMintQueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisMintQueryParamsResponse(
        OsmosisMintParams.fromJson(json["params"]));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisMintV1beta1Types.queryParamsResponse;

  @override
  List get values => [params];
}
