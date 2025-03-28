import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class EvmosRevenueV1MsgRegisterRevenue
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// contract_address in hex format
  final String? contractAddress;

  /// deployerAddress is the bech32 address of message sender. It must be the same as the origin EOA
  /// sending the transaction which deploys the contract
  final String? deployerAddress;

  /// withdrawerAddress is the bech32 address of account receiving the transaction fees
  final String? withdrawerAddress;

  /// nonces is an array of nonces from the address path, where the last nonce is the nonce
  /// that determines the contract's address - it can be an EOA nonce or a
  /// factory contract nonce
  final List<BigInt>? nonces;

  const EvmosRevenueV1MsgRegisterRevenue(
      {this.contractAddress,
      this.deployerAddress,
      this.withdrawerAddress,
      this.nonces});

  factory EvmosRevenueV1MsgRegisterRevenue.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosRevenueV1MsgRegisterRevenue(
        contractAddress: decode.getField(1),
        deployerAddress: decode.getField(2),
        withdrawerAddress: decode.getField(3),
        nonces: decode.getFields<BigInt>(4));
  }
  factory EvmosRevenueV1MsgRegisterRevenue.fromJson(Map<String, dynamic> json) {
    return EvmosRevenueV1MsgRegisterRevenue(
        contractAddress: json.as("contract_address"),
        deployerAddress: json.as("deployer_address"),
        withdrawerAddress: json.as("withdrawer_address"),
        nonces:
            json.as<List>("nonces").map((e) => BigintUtils.parse(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract_address": contractAddress,
      "deployer_address": deployerAddress,
      "withdrawer_address": withdrawerAddress,
      "nonces": nonces?.map((e) => e.toString()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgRegisterRevenue;

  @override
  List get values =>
      [contractAddress, deployerAddress, withdrawerAddress, nonces];
  @override
  List<String?> get signers => [deployerAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgRegisterRevenueResponse);
  }
}
