import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_balance_response.dart';

/// QueryBalanceRequest is the request type for the Query/Balance RPC method.
class EVMV1QueryBalanceRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryBalanceResponse> {
  // address is the ethereum hex address to query the account for.
  final String address;
  const EVMV1QueryBalanceRequest(this.address);
  factory EVMV1QueryBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryBalanceRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.balanceRequest;

  @override
  List get values => [address];

  @override
  EVMV1QueryBalanceResponse onResponse(List<int> bytes) {
    return EVMV1QueryBalanceResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryBalanceResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryBalanceResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [address];
}
