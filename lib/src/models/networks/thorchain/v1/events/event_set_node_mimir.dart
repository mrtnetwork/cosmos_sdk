import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSetNodeMimir extends CosmosMessage {
  final String? key;
  final String? value;
  final String? address;
  const ThorchainEventSetNodeMimir({this.key, this.value, this.address});
  factory ThorchainEventSetNodeMimir.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSetNodeMimir(
        key: decode.getField(1),
        value: decode.getField(2),
        address: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"key": key, "value": value, "address": address};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventSetNodeMimir;

  @override
  List get values => [key, value, address];
}
