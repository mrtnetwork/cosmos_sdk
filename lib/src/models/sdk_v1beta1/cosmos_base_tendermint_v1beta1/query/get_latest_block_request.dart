import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/query/get_latest_block_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetLatestBlockRequest is the request type for the Query/GetLatestBlock RPC method.
class GetLatestBlockRequest extends CosmosMessage
    with QueryMessage<GetLatestBlockResponse> {
  const GetLatestBlockRequest();
  @override
  List<int> get fieldIds => [];

  @override
  String get queryPath => BaseTendermintV1beta1Types.getLatestBlock.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      BaseTendermintV1beta1Types.getLatestBlockRequest.typeUrl;

  @override
  List get values => [];

  @override
  GetLatestBlockResponse onResponse(List<int> bytes) {
    return GetLatestBlockResponse.deserialize(bytes);
  }
}
