import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/denom_trace.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomTraceResponse is the response type for the Query/DenomTrace RPC method.
class QueryDenomTraceResponse extends CosmosMessage {
  /// denom_trace returns the requested denomination trace information.
  final DenomTrace? denomTrace;
  const QueryDenomTraceResponse({this.denomTrace});
  factory QueryDenomTraceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomTraceResponse(
      denomTrace: decode
          .getResult(1)
          ?.to<DenomTrace, List<int>>((e) => DenomTrace.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom_trace": denomTrace?.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.queryDenomTraceResponse.typeUrl;

  @override
  List get values => [denomTrace];
}
