import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConsensusStateWithHeight defines a consensus state with an additional height field.
class ConsensusStateWithHeight extends CosmosMessage {
  /// consensus state height
  final IbcClientHeight height;

  /// consensus state
  final Any? consensusState;
  const ConsensusStateWithHeight({required this.height, this.consensusState});
  factory ConsensusStateWithHeight.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ConsensusStateWithHeight(
        height: IbcClientHeight.deserialize(decode.getField(1)),
        consensusState:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height.toJson(),
      "consensus_state": consensusState?.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.consensusStateWithHeight.typeUrl;

  @override
  List get values => [height, consensusState];
}
