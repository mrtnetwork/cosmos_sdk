import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventTxLog defines the event for an Ethereum transaction log
class EVMV1EventTxLog extends CosmosMessage {
  /// tx_logs is an array of transaction logs
  final List<String> txLogs;
  const EVMV1EventTxLog(this.txLogs);
  factory EVMV1EventTxLog.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1EventTxLog(decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_logs": txLogs};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.eventTxLog;

  @override
  List get values => [txLogs];
}
