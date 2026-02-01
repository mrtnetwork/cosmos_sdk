import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgSetNodeKeys extends CosmosMessage {
  final ThorchainPubKeySet pubKeySetSet;
  final String? validatorConsPubKey;
  final List<int>? signer;
  ThorchainMsgSetNodeKeys({
    required this.pubKeySetSet,
    this.validatorConsPubKey,
    List<int>? signer,
  }) : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgSetNodeKeys.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSetNodeKeys(
      pubKeySetSet: ThorchainPubKeySet.deserialize(decode.getField(1)),
      validatorConsPubKey: decode.getField(2),
      signer: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pub_key_set_set": pubKeySetSet.toJson(),
      "validator_cons_pub_key": validatorConsPubKey,
      "signer": BytesUtils.tryToHexString(signer),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgSetNodeKeys;

  @override
  List get values => [pubKeySetSet, validatorConsPubKey, signer];
}
