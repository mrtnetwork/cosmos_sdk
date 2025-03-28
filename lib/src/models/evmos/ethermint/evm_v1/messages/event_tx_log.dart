import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventTxLog defines the event for an Ethereum transaction log
class EvmosEthermintEVMV1EventTxLog extends CosmosMessage {
  /// tx_logs is an array of transaction logs
  final List<String> txLogs;
  const EvmosEthermintEVMV1EventTxLog(this.txLogs);
  factory EvmosEthermintEVMV1EventTxLog.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1EventTxLog(decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_logs": txLogs};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.eventTxLog;

  @override
  List get values => [txLogs];
}
