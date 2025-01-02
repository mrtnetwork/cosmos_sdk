import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_cosmos_account_response.dart';

/// QueryCosmosAccountRequest is the request type for the Query/CosmosAccount RPC method.
class EVMV1QueryCosmosAccountRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryCosmosAccountResponse> {
  // address is the ethereum hex address to query the account for.
  final String address;
  const EVMV1QueryCosmosAccountRequest(this.address);
  factory EVMV1QueryCosmosAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryCosmosAccountRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.cosmosAccountRequest;

  @override
  List get values => [address];

  @override
  EVMV1QueryCosmosAccountResponse onResponse(List<int> bytes) {
    return EVMV1QueryCosmosAccountResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryCosmosAccountResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryCosmosAccountResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [address];
}
