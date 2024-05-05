import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

class Any extends CosmosProtocolBuffer {
  const Any({required this.value, required this.typeUrl});
  factory Any.deserialize(List<int> bytes) {
    final decde = CosmosProtocolBuffer.decode(bytes);
    return Any(
        value: decde.getField<List<int>?>(2) ?? <int>[],
        typeUrl: decde.getField(1));
  }
  factory Any.fromRpc(Map<String, dynamic> json) {
    return Any(
        value: StringUtils.encode(json["value"], StringEncoding.base64),
        typeUrl: json["type_url"]);
  }
  final List<int> value;
  final String typeUrl;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  List get values => [typeUrl, value];

  @override
  Map<String, dynamic> toJson() {
    return {"value": BytesUtils.toHexString(value), "type_url": typeUrl};
  }
}
