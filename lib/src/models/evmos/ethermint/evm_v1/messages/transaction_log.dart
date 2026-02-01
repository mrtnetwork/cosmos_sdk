import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/log.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TransactionLogs define the logs generated from a transaction execution
/// with a given hash. It it used for import/export data as transactions are not
/// persisted on blockchain state after an upgrade.
class EvmosEthermintEVMV1TransactionLogs extends CosmosMessage {
  /// hash of the transaction
  final String hash;

  /// logs is an array of Logs for the given transaction hash
  final List<EvmosEthermintEVMV1Log> logs;
  EvmosEthermintEVMV1TransactionLogs({
    required this.hash,
    required List<EvmosEthermintEVMV1Log> logs,
  }) : logs = logs.immutable;
  factory EvmosEthermintEVMV1TransactionLogs.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1TransactionLogs(
      hash: decode.getField(1),
      logs:
          decode
              .getFields<List<int>>(2)
              .map((e) => EvmosEthermintEVMV1Log.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash, "logs": logs.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.transactionLogs;

  @override
  List get values => [hash, logs];
}
