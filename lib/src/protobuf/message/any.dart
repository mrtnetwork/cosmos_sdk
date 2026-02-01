import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class Any extends CosmosProtocolBuffer {
  const Any({required this.value, required this.typeUrl});
  factory Any.deserialize(List<int> bytes) {
    final decde = CosmosProtocolBuffer.decode(bytes);
    return Any(
      value: decde.getField<List<int>?>(2) ?? <int>[],
      typeUrl: decde.getField(1),
    );
  }
  factory Any.fromJson(Map<String, dynamic> json) {
    return Any(
      value: json.asBytes("value", throwOnNull: true)!,
      typeUrl: json.as<String?>("type_url") ?? json.as<String>("type"),
    );
  }

  final List<int> value;
  final String typeUrl;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  List get values => [typeUrl, value];

  @override
  Map<String, dynamic> toJson() {
    return {"type_url": typeUrl, "value": CosmosUtils.toBase64(value)};
  }

  Map<String, dynamic> toAminoJson() {
    return {"type": typeUrl, "value": CosmosUtils.toBase64(value)};
  }
}
