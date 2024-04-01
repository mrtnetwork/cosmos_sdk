import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ProtocolVersion extends CosmosMessage {
  final BigInt? p2p;
  final BigInt? block;
  final BigInt? app;
  const ProtocolVersion({this.p2p, this.block, this.app});
  factory ProtocolVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ProtocolVersion(
        p2p: decode.getField(1),
        block: decode.getField(2),
        app: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "p2p": p2p?.toString(),
      "block": block?.toString(),
      "app": app?.toString()
    };
  }

  @override
  String get typeUrl => TendermintTypes.protocolVersion.typeUrl;

  @override
  List get values => [p2p, block, app];
}
