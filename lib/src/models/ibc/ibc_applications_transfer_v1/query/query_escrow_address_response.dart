import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryEscrowAddressResponse is the response type of the EscrowAddress RPC method.
class QueryEscrowAddressResponse extends CosmosMessage {
  /// the escrow account address
  final String? escrowAddress;
  const QueryEscrowAddressResponse({this.escrowAddress});
  factory QueryEscrowAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryEscrowAddressResponse(escrowAddress: decode.getField(1));
  }
  factory QueryEscrowAddressResponse.fromRpc(Map<String, dynamic> json) {
    return QueryEscrowAddressResponse(escrowAddress: json["escrow_address"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"escrow_address": escrowAddress};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryEscrowAddressResponse;

  @override
  List get values => [escrowAddress];
}
