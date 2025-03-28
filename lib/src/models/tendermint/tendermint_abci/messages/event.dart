import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'event_attribute.dart';

/// Event allows application developers to attach additional information to ResponseFinalizeBlock
/// and ResponseCheckTx. Later, transactions may be queried using these events.
class Event extends CosmosMessage {
  final String type;
  final List<EventAttribute> attributes;
  const Event({required this.type, required this.attributes});
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        type: json["type"],
        attributes: (json["attributes"] as List?)
                ?.map((e) => EventAttribute.fromJson(e))
                .toList() ??
            []);
  }

  factory Event.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Event(
        type: decode.getField(1),
        attributes: decode
            .getFields<List<int>>(2)
            .map((e) => EventAttribute.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "attributes": attributes.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.event;

  @override
  List get values => [type, attributes];
}
