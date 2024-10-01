import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'attribute.dart';

/// StringEvent defines en Event object wrapper where all the attributes contain key/value pairs that are strings instead of raw bytes.

class StringEvent extends CosmosMessage {
  final String? type;
  final List<Attribute> attributes;
  StringEvent({this.type, required List<Attribute> attributes})
      : attributes = attributes.immutable;
  factory StringEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StringEvent(
      type: decode.getField(1),
      attributes:
          decode.getFields(2).map((e) => Attribute.deserialize(e)).toList(),
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
  String get typeUrl => BaseAbciV1beta1.stringEvent.typeUrl;

  @override
  List get values => [type, attributes];
}
