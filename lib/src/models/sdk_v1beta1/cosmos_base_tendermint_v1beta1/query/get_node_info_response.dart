import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/version_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_p2p/messages/default_node_info.dart';

/// GetNodeInfoResponse is the response type for the Query/GetNodeInfo RPC method.
class GetNodeInfoResponse extends CosmosMessage {
  final DefaultNodeInfo? defaultNodeInfo;
  final VersionInfo? applicationVersion;
  const GetNodeInfoResponse({this.defaultNodeInfo, this.applicationVersion});
  factory GetNodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetNodeInfoResponse(
        defaultNodeInfo: decode.getResult(1)?.to<DefaultNodeInfo, List<int>>(
            (e) => DefaultNodeInfo.deserialize(e)),
        applicationVersion: decode
            .getResult(2)
            ?.to<VersionInfo, List<int>>((e) => VersionInfo.deserialize(e)));
  }
  factory GetNodeInfoResponse.fromRpc(Map<String, dynamic> json) {
    return GetNodeInfoResponse(
        defaultNodeInfo: (json["default_node_info"] == null
            ? null
            : DefaultNodeInfo.fromRpc(json["default_node_info"])),
        applicationVersion: (json["application_version"] == null
            ? null
            : VersionInfo.fromRpc(json["application_version"])));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "default_node_info": defaultNodeInfo?.toJson(),
      "application_version": applicationVersion?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.getNodeInfoResponse;

  @override
  List get values => [defaultNodeInfo, applicationVersion];
}
