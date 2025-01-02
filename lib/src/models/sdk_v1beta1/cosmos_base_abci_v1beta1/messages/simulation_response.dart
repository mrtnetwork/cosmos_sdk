import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/gas_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/result.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SimulationResponse defines the response generated when a transaction is successfully simulated.
class SimulationResponse extends CosmosMessage {
  final GasInfo gasInfo;
  final Result result;
  const SimulationResponse({required this.gasInfo, required this.result});
  factory SimulationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SimulationResponse(
        gasInfo: GasInfo.deserialize(decode.getField(1)),
        result: Result.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"gas_info": gasInfo.toJson(), "result": result.toJson()};
  }

  @override
  TypeUrl get typeUrl => BaseAbciV1beta1.simulationResponse;

  @override
  List get values => [gasInfo, result];
}
