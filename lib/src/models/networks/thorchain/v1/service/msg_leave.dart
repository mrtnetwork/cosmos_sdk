import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgLeave extends CosmosMessage {
  final ThorchainTx tx;
  final List<int>? nodeAddress;
  final List<int>? signer;
  ThorchainMsgLeave(
      {required this.tx, List<int>? nodeAddress, List<int>? signer})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true),
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgLeave.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgLeave(
        tx: ThorchainTx.deserialize(decode.getField(1)),
        nodeAddress: decode.getField(2),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgLeave.typeUrl;

  @override
  List get values => [tx, nodeAddress, signer];
}
