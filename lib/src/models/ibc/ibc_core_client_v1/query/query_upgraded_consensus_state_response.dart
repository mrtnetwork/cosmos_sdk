import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradedConsensusStateResponse is the response type for the Query/UpgradedConsensusState RPC method.
class QueryUpgradedConsensusStateResponse extends CosmosMessage {
  /// Consensus state associated with the request identifier
  final AnyMessage? upgradedConsensusState;
  const QueryUpgradedConsensusStateResponse({this.upgradedConsensusState});
  factory QueryUpgradedConsensusStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState:
          json["upgraded_consensus_state"] == null
              ? null
              : AnyMessage.fromJson(json["upgraded_consensus_state"]),
    );
  }
  factory QueryUpgradedConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState: decode
          .getResult(1)
          ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"upgraded_consensus_state": upgradedConsensusState?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUpgradedConsensusStateResponse;

  @override
  List get values => [upgradedConsensusState];
}
