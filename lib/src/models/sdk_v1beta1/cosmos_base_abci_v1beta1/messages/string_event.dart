import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'attribute.dart';

/// StringEvent defines en Event object wrapper where all the attributes contain key/value pairs that are strings instead of raw bytes.

class StringEvent extends CosmosMessage {
  final String? type;
  final List<Attribute> attributes;
  StringEvent({this.type, required List<Attribute> attributes})
      : attributes = attributes.immutable;
  factory StringEvent.fromJson(Map<String, dynamic> json) {
    return StringEvent(
      type: json["type"],
      attributes: json
              .asListOfMap("attributes", throwOnNull: false)
              ?.map((e) => Attribute.fromJson(e))
              .toList() ??
          [],
    );
  }

  factory StringEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StringEvent(
      type: decode.getField(1),
      attributes: decode
          .getFields<List<int>>(2)
          .map((e) => Attribute.deserialize(e))
          .toList(),
    );
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
  TypeUrl get typeUrl => BaseAbciV1beta1.stringEvent;

  @override
  List get values => [type, attributes];
}
