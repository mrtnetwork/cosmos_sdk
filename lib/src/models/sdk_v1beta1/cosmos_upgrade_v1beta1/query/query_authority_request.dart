import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/query/query_authority_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAuthorityRequest is the request type for Query/Authority
/// Since: cosmos-sdk 0.46
class QueryAuthorityRequest extends CosmosMessage
    with QueryMessage<QueryAuthorityResponse> {
  ///  This message has no fields.
  const QueryAuthorityRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.queryAuthorityRequest;

  @override
  List get values => [];

  @override
  QueryAuthorityResponse onResponse(List<int> bytes) {
    return QueryAuthorityResponse.deserialize(bytes);
  }

  @override
  QueryAuthorityResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAuthorityResponse.fromJson(json);
  }
}
