import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgMimir extends CosmosMessage {
  final String? key;
  final BigInt? value;
  final List<int>? signer;
  ThorchainMsgMimir({this.key, this.value, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer);
  factory ThorchainMsgMimir.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgMimir(
        key: decode.getField(1),
        value: decode.getField(2),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": key,
      "value": value?.toString(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgMimir;

  @override
  List get values => [key, value, signer];
}
