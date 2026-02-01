import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAccountResponse is the response type for the Query/Account RPC method.
class EvmosEthermintEVMV1QueryAccountResponse extends CosmosMessage {
  // balance is the balance of the EVM denomination.
  final String balance;
  // code_hash is the hex-formatted code bytes from the EOA.
  final String codeHash;
  // nonce is the account's sequence number.
  final BigInt nonce;
  const EvmosEthermintEVMV1QueryAccountResponse({
    required this.balance,
    required this.codeHash,
    required this.nonce,
  });

  factory EvmosEthermintEVMV1QueryAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryAccountResponse(
      balance: json["balance"],
      codeHash: json["code_hash"],
      nonce: BigintUtils.parse(json["nonce"]),
    );
  }
  factory EvmosEthermintEVMV1QueryAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryAccountResponse(
      balance: decode.getField(1),
      codeHash: decode.getField(2),
      nonce: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"balance": balance, "code_hash": codeHash, "nonce": nonce};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.accountResponse;

  @override
  List get values => [balance, codeHash, nonce];
}
