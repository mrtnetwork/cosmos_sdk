import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgBan extends CosmosMessage {
  final List<int>? nodeAddress;
  final List<int>? signer;
  ThorchainMsgBan({List<int>? nodeAddress, List<int>? signer})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress),
        signer = BytesUtils.tryToBytes(signer);
  factory ThorchainMsgBan.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgBan(
        nodeAddress: decode.getField(2), signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgBan.typeUrl;

  @override
  List get values => [nodeAddress, signer];
}
