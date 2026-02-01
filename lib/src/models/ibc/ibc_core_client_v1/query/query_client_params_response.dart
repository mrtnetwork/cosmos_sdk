import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientParamsResponse is the response type for the Query/ClientParams RPC method.
class QueryClientParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final IbcClientParams? params;
  const QueryClientParamsResponse({this.params});
  factory QueryClientParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientParamsResponse(
      params:
          json["params"] == null
              ? null
              : IbcClientParams.fromJson(json["params"]),
    );
  }
  factory QueryClientParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClientParamsResponse(
      params: decode
          .getResult(1)
          ?.to<IbcClientParams, List<int>>(
            (e) => IbcClientParams.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryClientParamsResponse;

  @override
  List get values => [params];
}
