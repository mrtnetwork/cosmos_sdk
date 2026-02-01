import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradedClientStateResponse is the response type for the Query/UpgradedClientState RPC method.
class QueryUpgradedClientStateResponse extends CosmosMessage {
  /// client state associated with the request identifier
  final AnyMessage? upgradedClientState;
  const QueryUpgradedClientStateResponse({this.upgradedClientState});
  factory QueryUpgradedClientStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradedClientStateResponse(
      upgradedClientState:
          json["upgraded_client_state"] == null
              ? null
              : AnyMessage.fromJson(json["upgraded_client_state"]),
    );
  }
  factory QueryUpgradedClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradedClientStateResponse(
      upgradedClientState: decode
          .getResult(1)
          ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"upgraded_client_state": upgradedClientState?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradedClientStateResponse;

  @override
  List get values => [upgradedClientState];
}
