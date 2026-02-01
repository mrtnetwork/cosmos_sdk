import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse defines the response type for querying x/evm parameters.
class EvmosEthermintEVMV1QueryParamsResponse extends CosmosMessage {
  // params define the evm module parameters.
  final EvmosEthermintEVMV1Params params;
  const EvmosEthermintEVMV1QueryParamsResponse(this.params);
  factory EvmosEthermintEVMV1QueryParamsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryParamsResponse(
      EvmosEthermintEVMV1Params.fromJson(json["params"]),
    );
  }
  factory EvmosEthermintEVMV1QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryParamsResponse(
      EvmosEthermintEVMV1Params.deserialize(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.paramsResponse;

  @override
  List get values => [params];
}
