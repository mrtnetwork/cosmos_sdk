import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_account_response.dart';

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class EVMV1QueryAccountRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryAccountResponse> {
  // address is the ethereum hex address to query the account for.
  final String address;
  const EVMV1QueryAccountRequest(this.address);
  factory EVMV1QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryAccountRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.accountRequest;

  @override
  List get values => [address];

  @override
  EVMV1QueryAccountResponse onResponse(List<int> bytes) {
    return EVMV1QueryAccountResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryAccountResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryAccountResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [address];
}
