import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorAccountResponse is the response type for the Query/ValidatorAccount RPC method.
class EvmosEthermintEVMV1QueryValidatorAccountResponse extends CosmosMessage {
  // account_address is the cosmos address of the account in bech32 format.
  final String accountAddress;
  // sequence is the account's sequence number.
  final BigInt sequence;
  // account_number is the account number
  final BigInt accountNumber;
  factory EvmosEthermintEVMV1QueryValidatorAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryValidatorAccountResponse(
      accountAddress: json["account_address"],
      sequence: BigintUtils.parse(json["sequence"]),
      accountNumber: BigintUtils.parse(json["account_number"]),
    );
  }
  const EvmosEthermintEVMV1QueryValidatorAccountResponse({
    required this.accountAddress,
    required this.sequence,
    required this.accountNumber,
  });
  factory EvmosEthermintEVMV1QueryValidatorAccountResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryValidatorAccountResponse(
      accountAddress: decode.getField(1),
      sequence: decode.getField(2),
      accountNumber: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "account_address": accountAddress,
      "sequence": sequence.toString(),
      "account_number": accountNumber.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.validatorAccountResponse;

  @override
  List get values => [accountAddress, sequence, accountNumber];
}
