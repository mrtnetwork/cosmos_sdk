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
  String get typeUrl => BaseNodeV1beta1Types.nodeConfigRequest.typeUrl;

  @override
  List get values => [];

  @override
  String get queryPath => BaseNodeV1beta1Types.nodeConfig.typeUrl;

  @override
  NodeConfigResponse onResponse(List<int> bytes) {
    return NodeConfigResponse.deserialize(bytes);
  }
}
