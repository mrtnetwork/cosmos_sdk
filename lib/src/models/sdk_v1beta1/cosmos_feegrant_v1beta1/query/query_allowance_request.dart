import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/query/query_allowance_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAllowanceRequest is the request type for the Query/Allowance RPC method.
class QueryAllowanceRequest extends CosmosMessage
    with QueryMessage<QueryAllowanceResponse> {
  /// granter is the address of the user granting an allowance of their funds.
  final CosmosBaseAddress? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds
  final CosmosBaseAddress? grantee;
  const QueryAllowanceRequest({this.granter, this.grantee});
  factory QueryAllowanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllowanceRequest(
        granter: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        grantee: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"granter": granter?.address, "grantee": grantee?.address};
  }

  @override
  String get typeUrl => FeegrantV1beta1Types.queryAllowanceRequest.typeUrl;

  @override
  List get values => [granter?.address, grantee?.address];

  @override
  String get queryPath => FeegrantV1beta1Types.allowance.typeUrl;

  @override
  QueryAllowanceResponse onResponse(List<int> bytes) {
    return QueryAllowanceResponse.deserialize(bytes);
  }
}
