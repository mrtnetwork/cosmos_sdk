import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/consensus_state_with_height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ClientConsensusStates defines all the stored consensus states for a given client.
class IbcClientClientConsensusStates extends CosmosMessage {
  /// client identifier
  final String? clientId;

  /// consensus states and their heights associated with the client
  final List<ConsensusStateWithHeight> consensusStates;
  IbcClientClientConsensusStates(
      {required List<ConsensusStateWithHeight> consensusStates, this.clientId})
      : consensusStates = consensusStates.immutable;
  factory IbcClientClientConsensusStates.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientClientConsensusStates(
        clientId: decode.getField(1),
        consensusStates: decode
            .getFields<List<int>>(2)
            .map((e) => ConsensusStateWithHeight.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "consensus_states": consensusStates.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibClientClientConsensusStates.typeUrl;

  @override
  List get values => [clientId, consensusStates];
}
