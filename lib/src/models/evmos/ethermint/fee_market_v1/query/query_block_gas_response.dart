import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBlockGasResponse returns block gas used for a given height.
class EvmosEthermintFeeMarketV1QueryBlockGasResponse extends CosmosMessage {
  // gas is the returned block gas
  final BigInt gas;

  const EvmosEthermintFeeMarketV1QueryBlockGasResponse(this.gas);
  factory EvmosEthermintFeeMarketV1QueryBlockGasResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1QueryBlockGasResponse(decode.getField(1));
  }
  factory EvmosEthermintFeeMarketV1QueryBlockGasResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintFeeMarketV1QueryBlockGasResponse(
        BigintUtils.parse(json["gas"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"gas": gas.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.blockGasResponse;

  @override
  List get values => [gas];
}
