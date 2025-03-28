import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_node_v1beta1/query/status_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_node_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// StateRequest defines the request structure for the status of a node.
class NodeStatusRequest extends CosmosMessage
    with QueryMessage<NodeStatusResponse> {
  ///  This message has no fields.
  const NodeStatusRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => BaseNodeV1beta1Types.nodeStatusRequest;

  @override
  List get values => [];

  @override
  NodeStatusResponse onResponse(List<int> bytes) {
    return NodeStatusResponse.deserialize(bytes);
  }

  @override
  NodeStatusResponse onJsonResponse(Map<String, dynamic> json) {
    return NodeStatusResponse.fromJson(json);
  }
}
