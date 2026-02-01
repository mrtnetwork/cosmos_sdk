import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/query/get_block_with_txs_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetBlockWithTxsRequest is the request type for the Service.GetBlockWithTxs RPC method.
///
/// Since: cosmos-sdk 0.45.2
class GetBlockWithTxsRequest extends CosmosMessage
    with QueryMessage<GetBlockWithTxsResponse> {
  /// height is the height of the block to query.
  final BigInt? height;

  /// pagination defines a pagination for the request.
  final PageRequest? pagination;
  const GetBlockWithTxsRequest({required this.height, this.pagination});
  factory GetBlockWithTxsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetBlockWithTxsRequest(
      height: decode.getField(1),
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height.toString(), "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.getBlockWithTxsRequest;

  @override
  List get values => [height, pagination];
  @override
  GetBlockWithTxsResponse onResponse(List<int> bytes) {
    return GetBlockWithTxsResponse.deserialize(bytes);
  }

  @override
  GetBlockWithTxsResponse onJsonResponse(Map<String, dynamic> json) {
    return GetBlockWithTxsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [height.toString()];
  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
