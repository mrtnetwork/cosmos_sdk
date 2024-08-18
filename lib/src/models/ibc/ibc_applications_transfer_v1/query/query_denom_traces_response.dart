import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/denom_trace.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryConnectionsResponse is the response type for the Query/DenomTraces RPC method.
class QueryDenomTracesResponse extends CosmosMessage {
  /// denom_traces returns all denominations trace information.
  final List<DenomTrace> denomTraces;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  QueryDenomTracesResponse(
      {required List<DenomTrace> denomTraces, this.pagination})
      : denomTraces = denomTraces.immutable;
  factory QueryDenomTracesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomTracesResponse(
        denomTraces:
            decode.getFields(1).map((e) => DenomTrace.deserialize(e)).toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom_traces": denomTraces.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryDenomTracesResponse.typeUrl;

  @override
  List get values => [denomTraces, pagination];
}
