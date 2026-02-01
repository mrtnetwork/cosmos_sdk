import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_cosmos_account_response.dart';

/// QueryCosmosAccountRequest is the request type for the Query/CosmosAccount RPC method.
class EvmosEthermintEVMV1QueryCosmosAccountRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryCosmosAccountResponse> {
  // address is the ethereum hex address to query the account for.
  final String address;
  const EvmosEthermintEVMV1QueryCosmosAccountRequest(this.address);
  factory EvmosEthermintEVMV1QueryCosmosAccountRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryCosmosAccountRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.cosmosAccountRequest;

  @override
  List get values => [address];

  @override
  EvmosEthermintEVMV1QueryCosmosAccountResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryCosmosAccountResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryCosmosAccountResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryCosmosAccountResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];
}
