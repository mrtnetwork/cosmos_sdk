import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_p2p/messages/message/p2p_message.dart';

class Message extends CosmosMessage {
  final P2pMessage message;
  const Message(this.message);

  @override
  List<int> get fieldIds => [message.id];

  @override
  Map<String, dynamic> toJson() {
    return {"message": message.toJson()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.message;

  @override
  List get values => [message];
}
