import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainProtoUint extends CosmosMessage {
  final BigInt? value;
  const ThorchainProtoUint({this.value});
  factory ThorchainProtoUint.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainProtoUint(value: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"value": value?.toString()};
  }

  @override
  String get typeUrl => ThorchainV1Types.protoUint.typeUrl;

  @override
  List get values => [value?.toString()];
}
