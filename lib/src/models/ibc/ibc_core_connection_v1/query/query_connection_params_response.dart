import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionParamsResponse is the response type for the Query/ConnectionParams RPC method.
class IbcConnectionQueryConnectionParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final IbcConnectionParams? params;
  const IbcConnectionQueryConnectionParamsResponse({this.params});
  factory IbcConnectionQueryConnectionParamsResponse.fromRpc(
      Map<String, dynamic> json) {
    return IbcConnectionQueryConnectionParamsResponse(
        params: json["params"] == null
            ? null
            : IbcConnectionParams.fromRpc(json["params"]));
  }
  factory IbcConnectionQueryConnectionParamsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionParamsResponse(
        params: decode.getResult(1)?.to<IbcConnectionParams, List<int>>(
            (e) => IbcConnectionParams.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionQueryConnectionParamsResponse;

  @override
  List get values => [params];
}
