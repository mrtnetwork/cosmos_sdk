import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class EventDataRoundState extends CosmosMessage {
  final BigInt? height;
  final int? round;
  final String? step;
  const EventDataRoundState({this.height, this.round, this.step});
  factory EventDataRoundState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EventDataRoundState(
        height: decode.getField(1),
        round: decode.getField(2),
        step: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"height": height?.toString(), "round": round, "step": step};
  }

  @override
  String get typeUrl => TendermintTypes.eventDataRoundState.typeUrl;

  @override
  List get values => [height, round, step];
}
