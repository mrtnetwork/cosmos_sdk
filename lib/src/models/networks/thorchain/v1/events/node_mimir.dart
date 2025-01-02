import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNodeMimir extends CosmosMessage {
  final String? key;
  final BigInt? value;
  final List<int>? signer;
  ThorchainNodeMimir({this.key, this.value, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainNodeMimir.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNodeMimir(
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
  TypeUrl get typeUrl => ThorchainV1Types.nodeMimir;

  @override
  List get values => [key, value, signer];
}
