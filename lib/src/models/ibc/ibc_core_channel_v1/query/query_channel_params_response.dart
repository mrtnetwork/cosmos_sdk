import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryChannelParamsResponse is the response type for the Query/ChannelParams RPC method.
class QueryChannelParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final IbcChannelParams? params;
  const QueryChannelParamsResponse({this.params});
  factory QueryChannelParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelParamsResponse(
        params: decode.getResult(1)?.to<IbcChannelParams, List<int>>(
            (e) => IbcChannelParams.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.queryChannelParamsResponse.typeUrl;

  @override
  List get values => [params];
}
