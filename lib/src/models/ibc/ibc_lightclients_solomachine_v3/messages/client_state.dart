import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'consensus_state.dart';

/// ClientState defines a solo machine client that tracks the current consensus state and if the client is frozen.
class IbcSoloMachineV3ClientState extends CosmosMessage {
  /// latest sequence of the client state
  final BigInt? sequence;

  /// frozen sequence of the solo machine
  final bool? isFrozen;
  final IbcSoloMachineV3ConsensusState? consensusState;

  const IbcSoloMachineV3ClientState(
      {this.sequence, this.isFrozen, this.consensusState});
  factory IbcSoloMachineV3ClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV3ClientState(
        sequence: decode.getField(1),
        isFrozen: decode.getField(2),
        consensusState: decode
            .getResult(3)
            ?.to<IbcSoloMachineV3ConsensusState, List<int>>(
                (e) => IbcSoloMachineV3ConsensusState.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "is_frozen": isFrozen,
      "consensus_state": consensusState?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV3ClientState;

  @override
  List get values => [sequence, isFrozen, consensusState];
}
