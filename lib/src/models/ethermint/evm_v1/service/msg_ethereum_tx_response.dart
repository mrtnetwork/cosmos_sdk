import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/messages/log.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgEthereumTxResponse defines the Msg/EthereumTx response type.
class MsgEthereumTxResponse extends CosmosMessage {
// hash of the ethereum transaction in hex format. This hash differs from the
  // Tendermint sha256 hash of the transaction bytes. See
  // https://github.com/tendermint/tendermint/issues/6539 for reference
  final String hash;
  // logs contains the transaction hash and the proto-compatible ethereum
  // logs.
  final List<EVMV1Log> logs;
  // ret is the returned data from evm function (result or data supplied with revert
  // opcode)
  final List<int>? ret;
  // vm_error is the error returned by vm execution
  final String? vmError;
  // gas_used specifies how much gas was consumed by the transaction
  final BigInt gasUsed;
  const MsgEthereumTxResponse(
      {required this.hash,
      required this.logs,
      required this.ret,
      required this.vmError,
      required this.gasUsed});
  factory MsgEthereumTxResponse.fromRpc(Map<String, dynamic> json) {
    return MsgEthereumTxResponse(
        hash: json["hash"],
        logs:
            (json["logs"] as List?)?.map((e) => EVMV1Log.fromRpc(e)).toList() ??
                [],
        ret: CosmosUtils.tryToBytes(json["ret"]),
        vmError: json["vm_error"],
        gasUsed: BigintUtils.parse(json["gas_used"]));
  }
  factory MsgEthereumTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgEthereumTxResponse(
        hash: decode.getField(1),
        logs: decode
            .getFields<List<int>>(2)
            .map((e) => EVMV1Log.deserialize(e))
            .toList(),
        ret: decode.getField(3),
        vmError: decode.getField(4),
        gasUsed: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "hash": hash,
      "logs": logs.map((e) => e.toJson()).toList(),
      "ret": BytesUtils.tryToHexString(ret),
      "vm_error": vmError,
      "gas_used": gasUsed
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.msgEthereumTxResponse;

  @override
  List get values => [hash, logs, ret, vmError, gasUsed];
}
