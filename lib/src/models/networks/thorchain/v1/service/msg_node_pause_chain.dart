import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgNodePauseChain extends CosmosMessage {
  final BigInt? value;
  final List<int>? signer;
  ThorchainMsgNodePauseChain({this.value, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgNodePauseChain.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgNodePauseChain(
        value: decode.getField(1), signer: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "value": value?.toString(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgNodePauseChain.typeUrl;

  @override
  List get values => [value, signer];
}
