import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/trace_config.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/service/msg_ethereum_tx.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_trace_block_response.dart';

class EvmosEthermintEVMV1QueryTraceBlockRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryTraceBlockResponse> {
  /// txs is an array of messages in the block
  final List<EvmosEthermintEVMV1MsgEthereumTx> txs;

  /// trace_config holds extra parameters to trace functions.
  final EvmosEthermintEVMV1TraceConfig traceConfig;

  /// block_number of the traced block
  final BigInt blockNumber;

  /// block_hash (hex) of the traced block
  final String blockHash;

  /// block_time of the traced block
  final ProtobufTimestamp blockTime;

  /// proposer_address is the address of the requested block
  final List<int> proposerAddress;

  /// chain_id is the eip155 chain id parsed from the requested block header
  final BigInt chainId;
  EvmosEthermintEVMV1QueryTraceBlockRequest(
      {required List<EvmosEthermintEVMV1MsgEthereumTx> txs,
      required this.traceConfig,
      required this.blockNumber,
      required this.blockHash,
      required this.blockTime,
      required List<int> proposerAddress,
      required this.chainId})
      : txs = txs.immutable,
        proposerAddress = proposerAddress.asImmutableBytes;
  factory EvmosEthermintEVMV1QueryTraceBlockRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryTraceBlockRequest(
        txs: decode
            .getFields<List<int>>(1)
            .map((e) => EvmosEthermintEVMV1MsgEthereumTx.deserialize(e))
            .toList(),
        traceConfig:
            EvmosEthermintEVMV1TraceConfig.deserialize(decode.getField(3)),
        blockNumber: decode.getField(5),
        blockHash: decode.getField(6),
        blockTime: ProtobufTimestamp.deserialize(decode.getField(7)),
        proposerAddress: decode.getField(8),
        chainId: decode.getField(9));
  }

  @override
  List<int> get fieldIds => [1, 3, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "txs": txs.map((e) => e.toJson()).toList(),
      "trace_config": traceConfig.toJson(),
      "block_number": blockNumber.toString(),
      "block_hash": blockHash,
      "block_time": blockTime.toJson(),
      "proposer_address": BytesUtils.toHexString(proposerAddress),
      "chain_id": chainId.toString()
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.traceBlockRequest;

  @override
  List get values => [
        txs,
        traceConfig,
        blockNumber,
        blockHash,
        blockTime,
        proposerAddress,
        chainId
      ];

  @override
  EvmosEthermintEVMV1QueryTraceBlockResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryTraceBlockResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters =>
      throw DartCosmosSdkPluginException(
          "Unsuported method. use grpc method instead rpc.");

  @override
  EvmosEthermintEVMV1QueryTraceBlockResponse onJsonResponse(
      Map<String, dynamic> json) {
    throw DartCosmosSdkPluginException(
        "Unsuported method. use grpc method instead rpc.");
  }
}
