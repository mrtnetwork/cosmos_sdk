import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'packet_message.dart';

class Packet extends CosmosMessage {
  final PacketMessage message;
  const Packet(this.message);

  @override
  List<int> get fieldIds => [message.id];

  @override
  Map<String, dynamic> toJson() {
    return {"message": message};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.packet;

  @override
  List get values => [message];
}
