import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventVersion extends CosmosMessage {
  final String? version;
  const ThorchainEventVersion({this.version});
  factory ThorchainEventVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventVersion(version: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"version": version};
  }

  @override
  String get typeUrl => ThorchainV1Types.eventVersion.typeUrl;

  @override
  List get values => [version];
}
