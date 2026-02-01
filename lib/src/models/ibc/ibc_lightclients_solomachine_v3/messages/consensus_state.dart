import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConsensusState defines a solo machine consensus state.
/// The sequence of a consensus state is contained in the "height" key used in storing the consensus state.
class IbcSoloMachineV3ConsensusState extends CosmosMessage {
  /// public key of the solo machine
  final Any? publicKey;

  /// diversifier allows the same public key to be re-used across different solo
  /// machine clients (potentially on different chains) without being considered
  /// misbehaviour.
  final String? diversifier;
  final BigInt? timestamp;
  IbcSoloMachineV3ConsensusState({
    this.publicKey,
    this.diversifier,
    this.timestamp,
  });
  factory IbcSoloMachineV3ConsensusState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV3ConsensusState(
      publicKey: decode
          .getResult(1)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      diversifier: decode.getField(2),
      timestamp: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "public_key": publicKey?.toJson(),
      "diversifier": diversifier,
      "timestamp": timestamp?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV3ConsensusState;

  @override
  List get values => [publicKey, diversifier, timestamp];
}
