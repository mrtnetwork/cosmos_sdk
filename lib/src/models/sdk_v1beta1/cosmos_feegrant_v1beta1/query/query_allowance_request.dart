import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/query/query_allowance_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowanceRequest is the request type for the Query/Allowance RPC method.
class QueryAllowanceRequest extends CosmosMessage
    with QueryMessage<QueryAllowanceResponse> {
  /// granter is the address of the user granting an allowance of their funds.
  final CosmosBaseAddress granter;

  /// grantee is the address of the user being granted an allowance of another user's funds
  final CosmosBaseAddress grantee;
  factory QueryAllowanceRequest.fromRpc(Map<String, dynamic> json) {
    return QueryAllowanceRequest(
      granter: CosmosBaseAddress(json["granter"]),
      grantee: CosmosBaseAddress(json["grantee"]),
    );
  }
  const QueryAllowanceRequest({required this.granter, required this.grantee});
  factory QueryAllowanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowanceRequest(
        granter: CosmosBaseAddress(decode.getField(1)),
        grantee: CosmosBaseAddress(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter.address, "grantee": grantee.address};
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.queryAllowanceRequest;

  @override
  List get values => [granter.address, grantee.address];

  @override
  QueryAllowanceResponse onResponse(List<int> bytes) {
    return QueryAllowanceResponse.deserialize(bytes);
  }

  @override
  QueryAllowanceResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAllowanceResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [granter.address, grantee.address];
}
