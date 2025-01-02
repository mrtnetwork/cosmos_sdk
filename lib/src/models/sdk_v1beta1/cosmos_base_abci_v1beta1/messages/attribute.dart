import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Attribute defines an attribute wrapper where the key and value are strings instead of raw bytes.
class Attribute extends CosmosMessage {
  final String? key;
  final String? value;
  const Attribute({this.key, this.value});
  factory Attribute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Attribute(key: decode.getField(1), value: decode.getField(2));
  }
  factory Attribute.fromRpc(Map<String, dynamic> json) {
    return Attribute(key: json["key"], value: json["value"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"key": key, "value": value};
  }

  @override
  TypeUrl get typeUrl => BaseAbciV1beta1.attribute;

  @override
  List get values => [key, value];
}
