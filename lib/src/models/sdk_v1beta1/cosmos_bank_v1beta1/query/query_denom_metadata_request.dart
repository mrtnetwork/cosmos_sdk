import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_denom_metadata_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomMetadataRequest is the request type for the Query/DenomMetadata RPC method.
class QueryDenomMetadataRequest extends CosmosMessage
    with QueryMessage<QueryDenomMetadataResponse> {
  /// denom is the coin denom to query the metadata for.
  final String denom;
  const QueryDenomMetadataRequest({required this.denom});
  factory QueryDenomMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomMetadataRequest(denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.denomMetadataRequest;

  @override
  List get values => [denom];

  @override
  QueryDenomMetadataResponse onResponse(List<int> bytes) {
    return QueryDenomMetadataResponse.deserialize(bytes);
  }

  @override
  QueryDenomMetadataResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryDenomMetadataResponse.fromJson(json);
  }
}
