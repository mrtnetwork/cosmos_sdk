import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_solomachine_v2/messages/consensus_state.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ClientState defines a solo machine client that tracks the current consensus state and if the client is frozen.
class IbcSoloMachineV2ClientState extends CosmosMessage {
  /// latest sequence of the client state
  final BigInt? sequence;

  /// frozen sequence of the solo machine
  final bool? isFrozen;
  final IbcSoloMachineV2ConsensusState? consensusState;

  /// when set to true, will allow governance to update a solo machine client.
  /// The client will be unfrozen if it is frozen.
  final bool? allowUpdateAfterProposal;
  const IbcSoloMachineV2ClientState(
      {this.sequence,
      this.isFrozen,
      this.consensusState,
      this.allowUpdateAfterProposal});
  factory IbcSoloMachineV2ClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2ClientState(
        sequence: decode.getField(1),
        isFrozen: decode.getField(2),
        consensusState: decode
            .getResult(3)
            ?.to<IbcSoloMachineV2ConsensusState, List<int>>(
                (e) => IbcSoloMachineV2ConsensusState.deserialize(e)),
        allowUpdateAfterProposal: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "is_frozen": isFrozen,
      "consensus_state": consensusState?.toJson(),
      "allow_update_after_proposal": allowUpdateAfterProposal
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2ClientState;

  @override
  List get values =>
      [sequence, isFrozen, consensusState, allowUpdateAfterProposal];
}
