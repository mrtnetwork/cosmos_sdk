import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
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
  String get typeUrl => TendermintTypes.packetPong.typeUrl;

  @override
  List get values => [];

  @override
  int get id => 2;
}
