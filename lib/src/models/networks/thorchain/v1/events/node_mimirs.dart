import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainNodeMimirs extends CosmosMessage {
  final List<ThorchainNodeMimir> mimirs;
  ThorchainNodeMimirs(List<ThorchainNodeMimir> mimirs)
      : mimirs = mimirs.immutable;
  factory ThorchainNodeMimirs.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNodeMimirs(decode
        .getFields(1)
        .map((e) => ThorchainNodeMimir.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"mimirs": mimirs.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => ThorchainV1Types.nodeMimirs.typeUrl;

  @override
  List get values => [mimirs];
}
