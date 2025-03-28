import 'package:cosmos_sdk/src/models/evmos/ethermint/fee_market_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse defines the response type for querying x/evm parameters.
class EvmosEthermintFeeMarketV1QueryParamsResponse extends CosmosMessage {
  // params define the evm module parameters.
  final EvmosEthermintFeeMarketV1Params params;

  const EvmosEthermintFeeMarketV1QueryParamsResponse(this.params);
  factory EvmosEthermintFeeMarketV1QueryParamsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1QueryParamsResponse(
        EvmosEthermintFeeMarketV1Params.deserialize(decode.getField(1)));
  }
  factory EvmosEthermintFeeMarketV1QueryParamsResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintFeeMarketV1QueryParamsResponse(
        EvmosEthermintFeeMarketV1Params.fromJson(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.feeMarketParamsResponse;

  @override
  List get values => [params];
}
