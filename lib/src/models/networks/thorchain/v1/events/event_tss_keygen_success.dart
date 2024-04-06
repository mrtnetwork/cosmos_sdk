import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainEventTssKeygenSuccess extends CosmosMessage {
  final String? pubKey;
  final List<String>? members;
  final BigInt? height;
  ThorchainEventTssKeygenSuccess(
      {this.pubKey, List<String>? members, this.height})
      : members = members?.nullOnEmpy;
  factory ThorchainEventTssKeygenSuccess.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventTssKeygenSuccess(
        pubKey: decode.getField(1),
        members: decode.getFields<String>(2),
        height: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pub_key": pubKey,
      "members": members,
      "height": height?.toString(),
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventTssKeygenSuccess.typeUrl;

  @override
  List get values => [pubKey, members, height];
}
