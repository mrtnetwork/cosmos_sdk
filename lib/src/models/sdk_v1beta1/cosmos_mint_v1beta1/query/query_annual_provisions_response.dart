import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAnnualProvisionsResponse is the response type for the Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsResponse extends CosmosMessage {
  final List<int> annualProvisions;
  QueryAnnualProvisionsResponse({required List<int> annualProvisions})
      : annualProvisions =
            BytesUtils.toBytes(annualProvisions, unmodifiable: true);
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
  String get typeUrl => MintV1beta1Types.queryAnnualProvisionsResponse.typeUrl;

  @override
  List get values => [annualProvisions];
}
