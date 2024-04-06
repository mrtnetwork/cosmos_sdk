import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'string_event.dart';

/// ABCIMessageLog defines a structure containing an indexed tx ABCI message log.
class ABCIMessageLog extends CosmosMessage {
  final int? msgIndex;
  final String? log;
  // Events contains a slice of Event objects that were emitted during some
  // execution.
  final List<StringEvent> events;
  ABCIMessageLog({this.msgIndex, this.log, required List<StringEvent> events})
      : events = events.mutable;

  factory ABCIMessageLog.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ABCIMessageLog(
        msgIndex: decode.getField(1),
        log: decode.getField(2),
        events: decode
            .getFields<List<int>>(3)
            .map((e) => StringEvent.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"msg_index": msgIndex, "log": log, "events": events};
  }

  @override
  String get typeUrl => BaseAbciV1beta1.aBCIMessageLog.typeUrl;

  @override
  List get values => [msgIndex, log, events];
}
