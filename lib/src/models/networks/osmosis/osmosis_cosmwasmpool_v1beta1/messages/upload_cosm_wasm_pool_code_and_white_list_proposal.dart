import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// UploadCosmWasmPoolCodeAndWhiteListProposal is a gov Content type for uploading coswasm pool code
/// and adding it to internal whitelist. Only the code ids created by this message are eligible
/// for being x/cosmwasmpool pools.
class OsmosisCosmWasmPoolUploadCosmWasmPoolCodeAndWhiteListProposal
    extends CosmosMessage {
  final String? title;
  final String? description;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  OsmosisCosmWasmPoolUploadCosmWasmPoolCodeAndWhiteListProposal(
      {this.title, this.description, List<int>? wasmByteCode})
      : wasmByteCode = BytesUtils.tryToBytes(wasmByteCode, unmodifiable: true);
  factory OsmosisCosmWasmPoolUploadCosmWasmPoolCodeAndWhiteListProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolUploadCosmWasmPoolCodeAndWhiteListProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        wasmByteCode: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "wasm_byte_code": BytesUtils.tryToHexString(wasmByteCode)
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types
      .uploadCosmWasmPoolCodeAndWhiteListProposal;

  @override
  List get values => [title, description, wasmByteCode];
}
