import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryVerifyMembershipResponse is the response type for the Query/VerifyMembership RPC method
class QueryVerifyMembershipResponse extends CosmosMessage {
  /// boolean indicating success or failure of proof verification.
  final bool? success;
  QueryVerifyMembershipResponse({this.success});
  factory QueryVerifyMembershipResponse.fromRpc(Map<String, dynamic> json) {
    return QueryVerifyMembershipResponse(success: json["success"]);
  }
  factory QueryVerifyMembershipResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryVerifyMembershipResponse(success: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"success": success};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryVerifyMembershipResponse;

  @override
  List get values => [success];
}
