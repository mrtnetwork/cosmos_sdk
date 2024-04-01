import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_denom_metadata_by_query_string_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomMetadataByQueryStringRequest is the request type for the Query/DenomMetadata RPC method.
/// Identical with QueryDenomMetadataRequest but receives denom as query string..
class QueryDenomMetadataByQueryStringRequest extends CosmosMessage
    with QueryMessage<QueryDenomMetadataByQueryStringResponse> {
  /// denom is the coin denom to query the metadata for.
  final String denom;
  const QueryDenomMetadataByQueryStringRequest({required this.denom});
  factory QueryDenomMetadataByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomMetadataByQueryStringRequest(denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => BankV1beta1Types.denomMetadataByQueryString.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  String get typeUrl =>
      BankV1beta1Types.denomMetadataByQueryStringRequest.typeUrl;

  @override
  List get values => [denom];

  @override
  QueryDenomMetadataByQueryStringResponse onResponse(List<int> bytes) {
    return QueryDenomMetadataByQueryStringResponse.deserialize(bytes);
  }
}
