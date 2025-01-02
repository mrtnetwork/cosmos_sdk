import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'packet_message.dart';

class PacketPong extends PacketMessage {
  ///  This message has no fields.
  const PacketPong();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.packetPong;

  @override
  List get values => [];

  @override
  int get id => 2;
}
