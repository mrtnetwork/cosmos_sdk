import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBaseFeeResponse returns the EIP1559 base fee.
class EvmosEthermintFeeMarketV1QueryBaseFeeResponse extends CosmosMessage {
  // base_fee is the EIP1559 base fee
  final BigInt baseFee;

  const EvmosEthermintFeeMarketV1QueryBaseFeeResponse(this.baseFee);
  factory EvmosEthermintFeeMarketV1QueryBaseFeeResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1QueryBaseFeeResponse(decode.getField(1));
  }
  factory EvmosEthermintFeeMarketV1QueryBaseFeeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintFeeMarketV1QueryBaseFeeResponse(
      BigintUtils.parse(json["base_fee"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_fee": baseFee.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.baseFeeResponse;

  @override
  List get values => [baseFee.toString()];
}
