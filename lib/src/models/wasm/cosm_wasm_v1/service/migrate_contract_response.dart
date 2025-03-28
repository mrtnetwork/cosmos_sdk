import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgMigrateContractResponse returns contract migration result data.
class CosmWasmV1MsgMigrateContractResponse extends CosmosMessage {
  /// Data contains same raw bytes returned as data from the wasm contract.
  /// (May be empty)
  final List<int>? data;
  CosmWasmV1MsgMigrateContractResponse({
    required List<int>? data,
  }) : data = data?.asImmutableBytes;
  factory CosmWasmV1MsgMigrateContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MsgMigrateContractResponse(data: decode.getField(1));
  }
  factory CosmWasmV1MsgMigrateContractResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1MsgMigrateContractResponse(data: json.asBytes("data"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": CosmosUtils.tryToBase64(data)};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.msgMigrateContractResponse;

  @override
  List get values => [data];
}
