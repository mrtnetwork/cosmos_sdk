import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/messages/trace_config.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/service/msg_ethereum_tx.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_trace_tx_response.dart';

/// QueryTraceTxRequest defines TraceTx request
class EVMV1QueryTraceTxRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryTraceTxResponse> {
  /// msg is the MsgEthereumTx for the requested transaction
  final MsgEthereumTx msg;

  /// trace_config holds extra parameters to trace functions.
  final EVMV1TraceConfig traceConfig;

  /// predecessors is an array of transactions included in the same block
  /// need to be replayed first to get correct context for tracing.
  final List<MsgEthereumTx> predecessors;

  /// block_number of requested transaction
  final BigInt blockNumber;

  /// block_hash (hex) of requested transaction
  final String blockHash;

  /// block_time of requested transaction
  final ProtobufTimestamp blockTime;

  /// proposer_address is the address of the requested block
  final List<int> proposerAddress;

  /// chain_id is the eip155 chain id parsed from the requested block header
  final BigInt chainId;
  EVMV1QueryTraceTxRequest(
      {required List<MsgEthereumTx> predecessors,
      required this.msg,
      required this.traceConfig,
      required this.blockNumber,
      required this.blockHash,
      required this.blockTime,
      required List<int> proposerAddress,
      required this.chainId})
      : predecessors = predecessors.immutable,
        proposerAddress = proposerAddress.asImmutableBytes;
  factory EVMV1QueryTraceTxRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryTraceTxRequest(
        msg: MsgEthereumTx.deserialize(decode.getField(1)),
        traceConfig: EVMV1TraceConfig.deserialize(decode.getField(3)),
        predecessors: decode
            .getFields<List<int>>(4)
            .map((e) => MsgEthereumTx.deserialize(e))
            .toList(),
        blockNumber: decode.getField(5),
        blockHash: decode.getField(6),
        blockTime: ProtobufTimestamp.deserialize(decode.getField(7)),
        proposerAddress: decode.getField(8),
        chainId: decode.getField(9));
  }

  @override
  List<int> get fieldIds => [1, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "msg": msg.toJson(),
      "predecessors": predecessors.map((e) => e.toJson()).toList(),
      "trace_config": traceConfig.toJson(),
      "block_number": blockNumber.toString(),
      "block_hash": blockHash,
      "block_time": blockTime.toJson(),
      "proposer_address": BytesUtils.toHexString(proposerAddress),
      "chain_id": chainId.toString()
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.traceTxRequest;

  @override
  List get values => [
        msg,
        traceConfig,
        predecessors,
        blockNumber,
        blockHash,
        blockTime,
        proposerAddress,
        chainId
      ];

  @override
  EVMV1QueryTraceTxResponse onResponse(List<int> bytes) {
    return EVMV1QueryTraceTxResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters =>
      throw DartCosmosSdkPluginException(
          "Unsuported method. use grpc method instead rpc.");

  @override
  EVMV1QueryTraceTxResponse onJsonResponse(Map<String, dynamic> json) {
    throw DartCosmosSdkPluginException(
        "Unsuported method. use grpc method instead rpc.");
  }
}
