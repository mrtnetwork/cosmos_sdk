import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSetMimir extends CosmosMessage {
  final String? key;
  final String? value;
  const ThorchainEventSetMimir({this.key, this.value});
  factory ThorchainEventSetMimir.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSetMimir(
        key: decode.getField(1), value: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"key": key, "value": value};
  }

  @override
  String get typeUrl => ThorchainV1Types.eventSetMimir.typeUrl;

  @override
  List get values => [key, value];
}
