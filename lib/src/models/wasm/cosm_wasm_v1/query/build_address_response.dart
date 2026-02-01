import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryBuildAddressResponse is the response type for the Query/BuildAddress RPC
/// method.
class CosmWasmV1QueryBuildAddressResponse extends CosmosMessage {
  /// Address is the contract address
  final String? address;
  CosmWasmV1QueryBuildAddressResponse({required this.address});
  factory CosmWasmV1QueryBuildAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryBuildAddressResponse(address: decode.getField(1));
  }
  factory CosmWasmV1QueryBuildAddressResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryBuildAddressResponse(address: json.as("address"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryBuildAddressResponse;

  @override
  List get values => [address];
}
