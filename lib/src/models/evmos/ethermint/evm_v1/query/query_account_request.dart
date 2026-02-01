import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_account_response.dart';

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class EvmosEthermintEVMV1QueryAccountRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryAccountResponse> {
  // address is the ethereum hex address to query the account for.
  final String address;
  const EvmosEthermintEVMV1QueryAccountRequest(this.address);
  factory EvmosEthermintEVMV1QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryAccountRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.accountRequest;

  @override
  List get values => [address];

  @override
  EvmosEthermintEVMV1QueryAccountResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryAccountResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryAccountResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryAccountResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];
}
