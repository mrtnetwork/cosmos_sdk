import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_balance_response.dart';

/// QueryBalanceRequest is the request type for the Query/Balance RPC method.
class EvmosEthermintEVMV1QueryBalanceRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryBalanceResponse> {
  // address is the ethereum hex address to query the account for.
  final String address;
  const EvmosEthermintEVMV1QueryBalanceRequest(this.address);
  factory EvmosEthermintEVMV1QueryBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryBalanceRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.balanceRequest;

  @override
  List get values => [address];

  @override
  EvmosEthermintEVMV1QueryBalanceResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryBalanceResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryBalanceResponse onJsonResponse(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryBalanceResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];
}
