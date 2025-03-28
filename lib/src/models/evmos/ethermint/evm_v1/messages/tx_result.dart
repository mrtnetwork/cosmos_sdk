import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'transaction_log.dart';

/// TxResult stores results of Tx execution.
class EvmosEthermintEVMV1TxResult extends CosmosMessage {
  // contract_address contains the ethereum address of the created contract (if
  // any). If the state transition is an evm.Call, the contract address will be
  // empty.
  final String contractAddress;
  // bloom represents the bloom filter bytes
  final List<int> bloom;
  // tx_logs contains the transaction hash and the proto-compatible ethereum
  // logs.
  final EvmosEthermintEVMV1TransactionLogs txLogs;
  // ret defines the bytes from the execution.
  final List<int> ret;
  // reverted flag is set to true when the call has been reverted
  final bool reverted;
  // gas_used notes the amount of gas consumed while execution
  final BigInt gasUsed;
  EvmosEthermintEVMV1TxResult(
      {required this.contractAddress,
      required List<int> bloom,
      required this.txLogs,
      required List<int> ret,
      required this.reverted,
      required this.gasUsed})
      : bloom = bloom.asImmutableBytes,
        ret = ret.asImmutableBytes;
  factory EvmosEthermintEVMV1TxResult.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1TxResult(
        contractAddress: decode.getField(1),
        bloom: decode.getField(2),
        txLogs:
            EvmosEthermintEVMV1TransactionLogs.deserialize(decode.getField(3)),
        ret: decode.getField(4),
        reverted: decode.getField(5),
        gasUsed: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract_address": contractAddress,
      "bloom": bloom,
      "tx_logs": txLogs.toJson(),
      "ret": BytesUtils.toHexString(ret),
      "reverted": reverted,
      "gas_used": gasUsed.toString()
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.txResult;

  @override
  List get values => [contractAddress, bloom, txLogs, ret, reverted, gasUsed];
}
