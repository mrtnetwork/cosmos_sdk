import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientStatusResponse is the response type for the Query/ClientStatus RPC method. It returns the current status of the IBC client.
class QueryClientStatusResponse extends CosmosMessage {
  final String? status;
  const QueryClientStatusResponse({this.status});
  factory QueryClientStatusResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClientStatusResponse(status: decode.getField(1));
  }
  factory QueryClientStatusResponse.fromRpc(Map<String, dynamic> json) {
    return QueryClientStatusResponse(status: json["status"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"status": status};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryClientStatusResponse;

  @override
  List get values => [status];
}
