import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConsensusStateWithHeight defines a consensus state with an additional height field.
class ConsensusStateWithHeight extends CosmosMessage {
  /// consensus state height
  final IbcClientHeight height;

  /// consensus state
  final AnyMessage? consensusState;
  factory ConsensusStateWithHeight.fromRpc(Map<String, dynamic> json) {
    return ConsensusStateWithHeight(
        height: IbcClientHeight.fromRpc(json["height"]),
        consensusState: json["consensus_state"] == null
            ? null
            : AnyMessage.fromRpc(json["consensus_state"]));
  }
  const ConsensusStateWithHeight({required this.height, this.consensusState});
  factory ConsensusStateWithHeight.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ConsensusStateWithHeight(
        height: IbcClientHeight.deserialize(decode.getField(1)),
        consensusState: decode
            .getResult(2)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)));
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
  TypeUrl get typeUrl => IbcTypes.consensusStateWithHeight;

  @override
  List get values => [height, consensusState];
}
