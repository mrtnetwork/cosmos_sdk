import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCosmosAccountResponse is the response type for the Query/CosmosAccount RPC method.
class EvmosEthermintEVMV1QueryCosmosAccountResponse extends CosmosMessage {
  // cosmos_address is the cosmos address of the account.
  final String cosmosAddress;
  // sequence is the account's sequence number.
  final BigInt sequence;
  // account_number is the account number
  final BigInt accountNumber;
  const EvmosEthermintEVMV1QueryCosmosAccountResponse(
      {required this.cosmosAddress,
      required this.sequence,
      required this.accountNumber});
  factory EvmosEthermintEVMV1QueryCosmosAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryCosmosAccountResponse(
        accountNumber: BigintUtils.parse(json["account_number"]),
        cosmosAddress: json["cosmos_address"],
        sequence: BigintUtils.parse(json["sequence"]));
  }

  factory EvmosEthermintEVMV1QueryCosmosAccountResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryCosmosAccountResponse(
        cosmosAddress: decode.getField(1),
        sequence: decode.getField(2),
        accountNumber: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "cosmos_address": cosmosAddress,
      "sequence": sequence,
      "account_number": accountNumber
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.cosmosAccountResponse;

  @override
  List get values => [cosmosAddress, sequence, accountNumber];
}
