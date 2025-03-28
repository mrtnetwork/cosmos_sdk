import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBalanceResponse is the response type for the Query/Balance RPC method.
class EvmosEthermintEVMV1QueryBalanceResponse extends CosmosMessage {
  // balance is the balance of the EVM denomination.
  final String balance;
  const EvmosEthermintEVMV1QueryBalanceResponse(this.balance);
  factory EvmosEthermintEVMV1QueryBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryBalanceResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1QueryBalanceResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryBalanceResponse(json["balance"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"balance": balance};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.balanceResponse;

  @override
  List get values => [balance];
}
