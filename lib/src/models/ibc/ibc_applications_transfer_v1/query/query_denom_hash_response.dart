import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomHashResponse is the response type for the Query/DenomHash RPC method.
class QueryDenomHashResponse extends CosmosMessage {
  /// hash (in hex format) of the denomination trace information.
  final String? hash;
  const QueryDenomHashResponse({this.hash});
  factory QueryDenomHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomHashResponse(hash: decode.getField(1));
  }
  factory QueryDenomHashResponse.fromRpc(Map<String, dynamic> json) {
    return QueryDenomHashResponse(hash: json["hash"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryDenomHashResponse;

  @override
  List get values => [hash];
}
