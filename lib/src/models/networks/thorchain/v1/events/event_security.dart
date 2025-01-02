import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSecurity extends CosmosMessage {
  final String? msg;
  final ThorchainTx tx;
  const ThorchainEventSecurity({this.msg, required this.tx});
  factory ThorchainEventSecurity.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSecurity(
        tx: ThorchainTx.deserialize(decode.getField(2)),
        msg: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"msg": msg, "tx": tx.toJson()};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventSecurity;

  @override
  List get values => [msg, tx];
}
