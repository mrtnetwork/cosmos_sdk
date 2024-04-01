import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class P2pMessage extends CosmosMessage {
  abstract final int id;
  const P2pMessage();
}
