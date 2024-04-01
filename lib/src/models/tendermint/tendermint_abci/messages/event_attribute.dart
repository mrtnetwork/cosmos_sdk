import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

/// EventAttribute is a single key-value pair, associated with an event.
class EventAttribute extends CosmosMessage {
  final String key;
  final String value;
  final bool? index;
  const EventAttribute(
      {required this.key, required this.value, required this.index});
  factory EventAttribute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EventAttribute(
        key: decode.getField(1),
        value: decode.getField(2),
        index: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"value": value, "key": key, "index": index};
  }

  @override
  String get typeUrl => TendermintTypes.eventAttribute.typeUrl;

  @override
  List get values => [key, value, index];
}
