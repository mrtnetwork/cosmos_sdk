import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateRevenue defines a message that updates the withdrawer address for a
/// registered Revenue
class EvmosRevenueV1MsgUpdateRevenue
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// contract_address in hex format
  final String? contractAddress;

  /// deployerAddress is the bech32 address of message sender. It must be the same as the origin EOA
  /// sending the transaction which deploys the contract
  final String? deployerAddress;

  /// withdrawerAddress is the bech32 address of account receiving the transaction fees
  final String? withdrawerAddress;

  const EvmosRevenueV1MsgUpdateRevenue(
      {this.contractAddress, this.deployerAddress, this.withdrawerAddress});

  factory EvmosRevenueV1MsgUpdateRevenue.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosRevenueV1MsgUpdateRevenue(
        contractAddress: decode.getField(1),
        deployerAddress: decode.getField(2),
        withdrawerAddress: decode.getField(3));
  }
  factory EvmosRevenueV1MsgUpdateRevenue.fromJson(Map<String, dynamic> json) {
    return EvmosRevenueV1MsgUpdateRevenue(
        contractAddress: json.as("contract_address"),
        deployerAddress: json.as("deployer_address"),
        withdrawerAddress: json.as("withdrawer_address"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract_address": contractAddress,
      "deployer_address": deployerAddress,
      "withdrawer_address": withdrawerAddress,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgUpdateRevenue;

  @override
  List get values => [contractAddress, deployerAddress, withdrawerAddress];
  @override
  List<String?> get signers => [deployerAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgUpdateRevenueResponse);
  }
}
