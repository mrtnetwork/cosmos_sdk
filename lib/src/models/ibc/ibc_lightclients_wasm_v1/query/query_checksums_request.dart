import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/query/query_checksums_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryChecksumsRequest is the request type for the Query/Checksums RPC method.
class IbcLightClientsWasmQueryChecksumsRequest extends CosmosMessage
    with QueryMessage<IbcLightClientsWasmQueryChecksumsResponse> {
  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const IbcLightClientsWasmQueryChecksumsRequest({this.pagination});
  factory IbcLightClientsWasmQueryChecksumsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsWasmQueryChecksumsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      IbcTypes.ibcLightClientsWasmQueryChecksumsRequest.typeUrl;

  @override
  List get values => [pagination];

  @override
  String get queryPath => IbcTypes.ibcLightClientsWasmChecksums.typeUrl;

  @override
  IbcLightClientsWasmQueryChecksumsResponse onResponse(List<int> bytes) {
    return IbcLightClientsWasmQueryChecksumsResponse.deserialize(bytes);
  }
}
