import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/metadata.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QueryDenomMetadataResponse is the response type for the Query/DenomMetadata RPC method.
class QueryDenomMetadataResponse extends CosmosMessage {
  final Metadata metadata;
  const QueryDenomMetadataResponse(this.metadata);
  factory QueryDenomMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomMetadataResponse(Metadata.deserialize(decode.getField(1)));
  }
  factory QueryDenomMetadataResponse.fromRpc(Map<String, dynamic> json) {
    return QueryDenomMetadataResponse(Metadata.fromRpc(json["metadata"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"metadata": metadata.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.denomMetadataResponse;

  @override
  List get values => [metadata];
}
