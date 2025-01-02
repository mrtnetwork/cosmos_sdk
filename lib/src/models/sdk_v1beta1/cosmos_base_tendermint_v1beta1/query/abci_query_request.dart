import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/query/abci_query_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ABCIQueryRequest defines the request structure for the ABCIQuery gRPC query.
class ABCIQueryRequest extends CosmosMessage
    with QueryMessage<ABCIQueryResponse> {
  final List<int>? data;
  final String? path;
  final BigInt? height;
  final bool? prove;
  ABCIQueryRequest({List<int>? data, this.path, this.height, this.prove})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "data": BytesUtils.tryToHexString(data),
      "path": path,
      "height": height?.toString(),
      "prove": prove
    };
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.abciQueryRequest;

  @override
  List get values => [data, path, height, prove];

  @override
  ABCIQueryResponse onResponse(List<int> bytes) {
    return ABCIQueryResponse.deserialize(bytes);
  }

  @override
  ABCIQueryResponse onJsonResponse(Map<String, dynamic> json) {
    return ABCIQueryResponse.fromJson(json);
  }
}
