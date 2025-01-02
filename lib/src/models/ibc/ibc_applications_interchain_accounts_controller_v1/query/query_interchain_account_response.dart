import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryInterchainAccountResponse the response type for the Query/InterchainAccount RPC method.
class QueryInterchainAccountResponse extends CosmosMessage {
  final String? address;
  const QueryInterchainAccountResponse({this.address});
  factory QueryInterchainAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryInterchainAccountResponse(address: decode.getField(1));
  }
  factory QueryInterchainAccountResponse.fromRpc(Map<String, dynamic> json) {
    return QueryInterchainAccountResponse(address: json["address"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryInterchainAccountResponse;

  @override
  List get values => [address];
}
