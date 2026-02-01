import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/query/estimate_gas_response.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EthCallRequest defines EthCall request
class EvmosEthermintEVMV1EstimateGas extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1EstimateGasResponse> {
  // args uses the same json format as the json rpc api.
  final List<int> args;
  // gas_cap defines the default gas cap to be used
  final BigInt gasCap;
  // proposer_address of the requested block in hex format
  final List<int> proposerAddress;
  final BigInt chainId;
  EvmosEthermintEVMV1EstimateGas({
    required List<int> args,
    required this.gasCap,
    required List<int> proposerAddress,
    required this.chainId,
  }) : args = args.asImmutableBytes,
       proposerAddress = args.asImmutableBytes;
  factory EvmosEthermintEVMV1EstimateGas.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1EstimateGas(
      args: decode.getField(1),
      gasCap: decode.getField(2),
      proposerAddress: decode.getField(3),
      chainId: decode.getField(4),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "args": BytesUtils.toHexString(args),
      "gas_cap": gasCap.toString(),
      "proposer_address": BytesUtils.toHexString(proposerAddress),
      "chain_id": chainId.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.estimateGasRequest;

  @override
  List get values => [args, gasCap, proposerAddress, chainId];

  @override
  EvmosEthermintEVMV1EstimateGasResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1EstimateGasResponse.fromJson(json);
  }

  @override
  EvmosEthermintEVMV1EstimateGasResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1EstimateGasResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {
    "args": BytesUtils.toHexString(args),
    "gas_cap": gasCap.toString(),
    "proposer_address": BytesUtils.toHexString(proposerAddress),
    "chain_id": chainId.toString(),
  };
}
