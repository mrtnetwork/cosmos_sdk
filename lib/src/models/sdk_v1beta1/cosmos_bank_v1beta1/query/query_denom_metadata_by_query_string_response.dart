import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/metadata.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomMetadataByQueryStringResponse is the response type for the Query/DenomMetadata
/// RPC method. Identical with QueryDenomMetadataResponse but receives denom as query string in request.
class QueryDenomMetadataByQueryStringResponse extends CosmosMessage {
  final Metadata metadata;
  const QueryDenomMetadataByQueryStringResponse(this.metadata);
  factory QueryDenomMetadataByQueryStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomMetadataByQueryStringResponse(
        Metadata.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"metadata": metadata.toJson()};
  }

  @override
  String get typeUrl =>
      BankV1beta1Types.denomMetadataByQueryStringResponse.typeUrl;

  @override
  List get values => [metadata];
}
