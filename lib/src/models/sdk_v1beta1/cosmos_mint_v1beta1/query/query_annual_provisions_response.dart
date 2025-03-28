import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryAnnualProvisionsResponse is the response type for the Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsResponse extends CosmosMessage {
  final List<int> annualProvisions;
  QueryAnnualProvisionsResponse({required List<int> annualProvisions})
      : annualProvisions =
            BytesUtils.toBytes(annualProvisions, unmodifiable: true);
  factory QueryAnnualProvisionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAnnualProvisionsResponse(
        annualProvisions: CosmosUtils.toBytes(json["annual_provisions"]));
  }
  factory QueryAnnualProvisionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAnnualProvisionsResponse(annualProvisions: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"annual_provisions": BytesUtils.toHexString(annualProvisions)};
  }

  @override
  TypeUrl get typeUrl => MintV1beta1Types.queryAnnualProvisionsResponse;

  @override
  List get values => [annualProvisions];
}
