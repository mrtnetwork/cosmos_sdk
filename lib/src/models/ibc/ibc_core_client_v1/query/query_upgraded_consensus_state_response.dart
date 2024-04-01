import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryUpgradedConsensusStateResponse is the response type for the Query/UpgradedConsensusState RPC method.
class QueryUpgradedConsensusStateResponse extends CosmosMessage {
  /// Consensus state associated with the request identifier
  final Any? upgradedConsensusState;
  const QueryUpgradedConsensusStateResponse({this.upgradedConsensusState});
  factory QueryUpgradedConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUpgradedConsensusStateResponse(
        upgradedConsensusState:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"upgraded_consensus_state": upgradedConsensusState?.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.queryUpgradedConsensusStateResponse.typeUrl;

  @override
  List get values => [upgradedConsensusState];
}
