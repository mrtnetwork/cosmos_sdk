import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/gas_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/result.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';

/// SimulateResponse is the response type for the Service.SimulateRPC method.
class SimulateResponse extends CosmosMessage {
  /// gas_info is the information about gas used in the simulation.
  final GasInfo gasInfo;

  /// result is the result of the simulation.
  final Result result;
  factory SimulateResponse.fromRpc(Map<String, dynamic> json) {
    return SimulateResponse(
        gasInfo: GasInfo.fromRpc(json["gas_info"]),
        result: Result.fromRpc(json["result"]));
  }
  const SimulateResponse({required this.gasInfo, required this.result});

  factory SimulateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SimulateResponse(
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
  TypeUrl get typeUrl => TxV1beta1Types.simulateResponse;

  @override
  List get values => [gasInfo, result];
}
