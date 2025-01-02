import 'package:cosmos_sdk/src/models/ethermint/evm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse defines the response type for querying x/evm parameters.
class EVMV1QueryParamsResponse extends CosmosMessage {
  // params define the evm module parameters.
  final EVMV1Params params;
  const EVMV1QueryParamsResponse(this.params);
  factory EVMV1QueryParamsResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryParamsResponse(EVMV1Params.fromRpc(json["params"]));
  }
  factory EVMV1QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryParamsResponse(
        EVMV1Params.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.paramsResponse;

  @override
  List get values => [params];
}
