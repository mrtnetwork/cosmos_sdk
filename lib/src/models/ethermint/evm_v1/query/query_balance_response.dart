import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBalanceResponse is the response type for the Query/Balance RPC method.
class EVMV1QueryBalanceResponse extends CosmosMessage {
  // balance is the balance of the EVM denomination.
  final String balance;
  const EVMV1QueryBalanceResponse(this.balance);
  factory EVMV1QueryBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryBalanceResponse(decode.getField(1));
  }
  factory EVMV1QueryBalanceResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryBalanceResponse(json["balance"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"balance": balance};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.balanceResponse;

  @override
  List get values => [balance];
}
