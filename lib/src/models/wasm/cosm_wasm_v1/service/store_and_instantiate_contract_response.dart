import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgStoreAndInstantiateContractResponse defines the response structure for executing a MsgStoreAndInstantiateContract message.
class CosmWasmV1MsgStoreAndInstantiateContractResponse extends CosmosMessage {
  /// Address is the bech32 address of the new contract instance.
  final String? address;

  /// Data contains bytes to returned from the contract
  final List<int>? data;
  CosmWasmV1MsgStoreAndInstantiateContractResponse({
    required this.address,
    required List<int>? data,
  }) : data = data?.asImmutableBytes;
  factory CosmWasmV1MsgStoreAndInstantiateContractResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgStoreAndInstantiateContractResponse(
      address: decode.getField(1),
      data: decode.getField(2),
    );
  }
  factory CosmWasmV1MsgStoreAndInstantiateContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1MsgStoreAndInstantiateContractResponse(
      data: json.asBytes("data"),
      address: json.as("address"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"data": CosmosUtils.tryToBase64(data), "address": address};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.msgStoreAndInstantiateContractResponse;

  @override
  List get values => [address, data];
}
