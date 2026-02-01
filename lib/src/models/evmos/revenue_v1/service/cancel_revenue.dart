import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCancelRevenue defines a message that cancels a registered Revenue
class EvmosRevenueV1MsgCancelRevenue
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// contract_address in hex format
  final String? contractAddress;

  /// deployerAddress is the bech32 address of message sender. It must be the same as the origin EOA
  /// sending the transaction which deploys the contract
  final String? deployerAddress;

  const EvmosRevenueV1MsgCancelRevenue({
    this.contractAddress,
    this.deployerAddress,
  });

  factory EvmosRevenueV1MsgCancelRevenue.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosRevenueV1MsgCancelRevenue(
      contractAddress: decode.getField(1),
      deployerAddress: decode.getField(2),
    );
  }
  factory EvmosRevenueV1MsgCancelRevenue.fromJson(Map<String, dynamic> json) {
    return EvmosRevenueV1MsgCancelRevenue(
      contractAddress: json.as("contract_address"),
      deployerAddress: json.as("deployer_address"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract_address": contractAddress,
      "deployer_address": deployerAddress,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgCancelRevenue;

  @override
  List get values => [contractAddress, deployerAddress];
  @override
  List<String?> get signers => [deployerAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.msgCancelRevenueResponse,
    );
  }
}
