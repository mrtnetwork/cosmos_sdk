import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryChecksumsResponse is the response type for the Query/Checksums RPC method.
class IbcLightClientsWasmQueryChecksumsResponse extends CosmosMessage {
  /// checksums is a list of the hex encoded checksums of all wasm codes stored.
  final List<String>? checksums;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  IbcLightClientsWasmQueryChecksumsResponse(
      {List<String>? checksums, this.pagination})
      : checksums = checksums?.emptyAsNull?.immutable;
  factory IbcLightClientsWasmQueryChecksumsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmQueryChecksumsResponse(
        checksums: decode.getFields(1),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"checksums": checksums, "pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl =>
      IbcTypes.ibcLightClientsWasmQueryChecksumsResponse.typeUrl;

  @override
  List get values => [checksums, pagination];
}
