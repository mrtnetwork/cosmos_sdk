import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class PacketMessage extends CosmosMessage {
  const PacketMessage();
  abstract final int id;
}
