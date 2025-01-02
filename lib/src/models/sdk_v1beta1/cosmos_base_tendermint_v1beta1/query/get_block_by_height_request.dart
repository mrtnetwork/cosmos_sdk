import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'get_block_by_height_response.dart';

/// GetBlockByHeightRequest is the request type for the Query/GetBlockByHeight RPC method.
class GetBlockByHeightRequest extends CosmosMessage
    with QueryMessage<GetBlockByHeightResponse> {
  final String height;
  const GetBlockByHeightRequest({required this.height});
  factory GetBlockByHeightRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetBlockByHeightRequest(height: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height};
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.getBlockByHeightRequest;

  @override
  List get values => [height];

  @override
  GetBlockByHeightResponse onResponse(List<int> bytes) {
    return GetBlockByHeightResponse.deserialize(bytes);
  }

  @override
  GetBlockByHeightResponse onJsonResponse(Map<String, dynamic> json) {
    return GetBlockByHeightResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [height];
}
