import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/query/query_total_escrow_for_denom_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTotalEscrowForDenomRequest is the request type for TotalEscrowForDenom RPC method.
class QueryTotalEscrowForDenomRequest extends CosmosMessage
    with QueryMessage<QueryTotalEscrowForDenomResponse> {
  final String? denom;
  const QueryTotalEscrowForDenomRequest({this.denom});
  factory QueryTotalEscrowForDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalEscrowForDenomRequest(denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.totalEscrowForDenom.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  String get typeUrl => IbcTypes.queryTotalEscrowForDenomRequest.typeUrl;

  @override
  List get values => [denom];

  @override
  QueryTotalEscrowForDenomResponse onResponse(List<int> bytes) {
    return QueryTotalEscrowForDenomResponse.deserialize(bytes);
  }
}
