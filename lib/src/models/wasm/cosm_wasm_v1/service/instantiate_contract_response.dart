import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgInstantiateContractResponse return instantiation result data
class CosmWasmV1MsgInstantiateContractResponse extends CosmosMessage {
  /// Address is the bech32 address of the new contract instance.
  final String? address;

  /// Data contains bytes to returned from the contract
  final List<int>? data;
  CosmWasmV1MsgInstantiateContractResponse({
    required this.address,
    required List<int>? data,
  }) : data = data?.asImmutableBytes;
  factory CosmWasmV1MsgInstantiateContractResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgInstantiateContractResponse(
      address: decode.getField(1),
      data: decode.getField(2),
    );
  }
  factory CosmWasmV1MsgInstantiateContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1MsgInstantiateContractResponse(
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
  TypeUrl get typeUrl => CosmWasmV1Types.msgInstantiateContractResponse;

  @override
  List get values => [address, data];
}
