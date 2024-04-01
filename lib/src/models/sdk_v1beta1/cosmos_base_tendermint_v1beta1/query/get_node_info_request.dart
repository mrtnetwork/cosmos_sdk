import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/query/get_node_info_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class GetNodeInfoRequest extends CosmosMessage
    with QueryMessage<GetNodeInfoResponse> {
  const GetNodeInfoRequest();
  @override
  List<int> get fieldIds => [];

  @override
  String get queryPath => BaseTendermintV1beta1Types.getNodeInfo.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => BaseTendermintV1beta1Types.getNodeInfoRequest.typeUrl;

  @override
  List get values => [];

  @override
  GetNodeInfoResponse onResponse(List<int> bytes) {
    return GetNodeInfoResponse.deserialize(bytes);
  }
}
