import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConsensusStateData returns the SignBytes data for consensus state verification.
class IbcSoloMachineV2ConsensusStateData extends CosmosMessage {
  final List<int>? path;
  final Any? consensusState;
  IbcSoloMachineV2ConsensusStateData({List<int>? path, this.consensusState})
    : path = BytesUtils.tryToBytes(path, unmodifiable: true);
  factory IbcSoloMachineV2ConsensusStateData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcSoloMachineV2ConsensusStateData(
      path: decode.getField(1),
      consensusState: decode
          .getResult(2)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "path": BytesUtils.tryToHexString(path),
      "consensus_state": consensusState?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.soloMachineV2ConsensusStateData;

  @override
  List get values => [path, consensusState];
}
