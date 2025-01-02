import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCosmosAccountResponse is the response type for the Query/CosmosAccount RPC method.
class EVMV1QueryCosmosAccountResponse extends CosmosMessage {
  // cosmos_address is the cosmos address of the account.
  final String cosmosAddress;
  // sequence is the account's sequence number.
  final BigInt sequence;
  // account_number is the account number
  final BigInt accountNumber;
  const EVMV1QueryCosmosAccountResponse(
      {required this.cosmosAddress,
      required this.sequence,
      required this.accountNumber});
  factory EVMV1QueryCosmosAccountResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryCosmosAccountResponse(
        accountNumber: BigintUtils.parse(json["account_number"]),
        cosmosAddress: json["cosmos_address"],
        sequence: BigintUtils.parse(json["sequence"]));
  }

  factory EVMV1QueryCosmosAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryCosmosAccountResponse(
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
  TypeUrl get typeUrl => EvmV1Types.cosmosAccountResponse;

  @override
  List get values => [cosmosAddress, sequence, accountNumber];
}
