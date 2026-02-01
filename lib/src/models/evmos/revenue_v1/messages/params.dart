import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class EvmosRevenueV1Params extends CosmosMessage {
  /// enable_revenue defines a parameter to enable the revenue module
  final bool? enableRevenue;

  /// developer_shares defines the proportion of the transaction fees to be
  /// distributed to the registered contract owner
  final String? developerShares;

  /// addr_derivation_cost_create defines the cost of address derivation for
  /// verifying the contract deployer at fee registration
  final BigInt? addrDerivationCostCreate;

  EvmosRevenueV1Params({
    this.enableRevenue,
    this.developerShares,
    this.addrDerivationCostCreate,
  });
  factory EvmosRevenueV1Params.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosRevenueV1Params(
      enableRevenue: decode.getField(1),
      developerShares: decode.getField(2),
      addrDerivationCostCreate: decode.getField(3),
    );
  }
  factory EvmosRevenueV1Params.fromJson(Map<String, dynamic> json) {
    return EvmosRevenueV1Params(
      enableRevenue: json.as("enable_revenue"),
      developerShares: json.as("developer_shares"),
      addrDerivationCostCreate: json.asBigInt("addr_derivation_cost_create"),
    );
  }
  @override
  List get values => [enableRevenue, developerShares, addrDerivationCostCreate];

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.revenueParams;
  @override
  Map<String, dynamic> toJson() {
    return {
      "enable_revenue": enableRevenue,
      "developer_shares": developerShares,
      "addr_derivation_cost_create": addrDerivationCostCreate,
    };
  }
}
