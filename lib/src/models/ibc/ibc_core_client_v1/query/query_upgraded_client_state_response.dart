import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradedClientStateResponse is the response type for the Query/UpgradedClientState RPC method.
class QueryUpgradedClientStateResponse extends CosmosMessage {
  /// client state associated with the request identifier
  final Any? upgradedClientState;
  const QueryUpgradedClientStateResponse({this.upgradedClientState});
  factory QueryUpgradedClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradedClientStateResponse(
        upgradedClientState:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"upgraded_client_state": upgradedClientState?.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.queryUpgradedClientStateResponse.typeUrl;

  @override
  List get values => [upgradedClientState];
}
