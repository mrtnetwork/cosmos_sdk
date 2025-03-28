import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_node_v1beta1/query/config_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_node_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConfigRequest defines the request structure for the Config gRPC query.
class NodeConfigRequest extends CosmosMessage
    with QueryMessage<NodeConfigResponse> {
  ///  This message has no fields.
  const NodeConfigRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => BaseNodeV1beta1Types.nodeConfigRequest;

  @override
  List get values => [];

  @override
  NodeConfigResponse onResponse(List<int> bytes) {
    return NodeConfigResponse.deserialize(bytes);
  }

  @override
  NodeConfigResponse onJsonResponse(Map<String, dynamic> json) {
    return NodeConfigResponse.fromJson(json);
  }
}
