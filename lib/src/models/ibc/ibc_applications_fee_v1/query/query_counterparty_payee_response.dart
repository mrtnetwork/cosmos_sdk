import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCounterpartyPayeeResponse defines the response type for the CounterpartyPayee rpc
class QueryCounterpartyPayeeResponse extends CosmosMessage {
  /// the counterparty payee address used to compensate forward relaying
  final String? counterpartyPayee;
  const QueryCounterpartyPayeeResponse({this.counterpartyPayee});
  factory QueryCounterpartyPayeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryCounterpartyPayeeResponse(
        counterpartyPayee: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"counterparty_payee": counterpartyPayee};
  }

  @override
  String get typeUrl => IbcTypes.queryCounterpartyPayeeResponse.typeUrl;

  @override
  List get values => [counterpartyPayee];
}
