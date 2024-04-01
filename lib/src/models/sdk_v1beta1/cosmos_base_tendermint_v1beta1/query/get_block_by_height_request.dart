import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'get_block_by_height_response.dart';

/// GetBlockByHeightRequest is the request type for the Query/GetBlockByHeight RPC method.
class GetBlockByHeightRequest extends CosmosMessage
    with QueryMessage<GetBlockByHeightResponse> {
  final BigInt? height;
  const GetBlockByHeightRequest({this.height});
  factory GetBlockByHeightRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetBlockByHeightRequest(height: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => BaseTendermintV1beta1Types.getBlockByHeight.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"height": height?.toString()};
  }

  @override
  String get typeUrl =>
      BaseTendermintV1beta1Types.getBlockByHeightRequest.typeUrl;

  @override
  List get values => [height];

  @override
  GetBlockByHeightResponse onResponse(List<int> bytes) {
    return GetBlockByHeightResponse.deserialize(bytes);
  }
}
