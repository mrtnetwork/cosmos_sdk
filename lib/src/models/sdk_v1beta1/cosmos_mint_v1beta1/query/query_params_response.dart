import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryMintParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final MintParams params;
  const QueryMintParamsResponse(this.params);
  factory QueryMintParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryMintParamsResponse(MintParams.deserialize(decode.getField(1)));
  }
  factory QueryMintParamsResponse.fromRpc(Map<String, dynamic> json) {
    return QueryMintParamsResponse(MintParams.fromRpc(json["params"]));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => MintV1beta1Types.queryMintParamsResponse;

  @override
  List get values => [params];
}
