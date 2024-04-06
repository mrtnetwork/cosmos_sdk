import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/metadata.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomsMetadataResponse is the response type for the Query/DenomsMetadata RPC method.
class QueryDenomsMetadataResponse extends CosmosMessage {
  /// metadata provides the client information for all the registered tokens.
  final List<Metadata> metadatas;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  const QueryDenomsMetadataResponse({required this.metadatas, this.pagination});
  factory QueryDenomsMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomsMetadataResponse(
        metadatas: decode
            .getFields<List<int>>(1)
            .map((e) => Metadata.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "metadatas": metadatas.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => BankV1beta1Types.denomsMetadataResponse.typeUrl;

  @override
  List get values => [metadatas, pagination];
}
