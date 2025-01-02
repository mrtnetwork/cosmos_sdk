import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainMsgTssPool extends CosmosMessage {
  final String? id;
  final String? poolPubKey;
  final ThorchainKeygenType? keygenType;
  final List<String>? pubKeys;
  final BigInt? height;
  final ThorchainBlame blame;
  final List<String>? chains;
  final List<int>? signer;
  final BigInt? keygenTime;
  final List<int>? keysharesBackup;
  ThorchainMsgTssPool(
      {this.id,
      this.poolPubKey,
      this.keygenType,
      List<String>? pubKeys,
      this.height,
      required this.blame,
      List<String>? chains,
      List<int>? signer,
      this.keygenTime,
      List<int>? keysharesBackup})
      : pubKeys = pubKeys?.immutable,
        chains = chains?.immutable,
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true),
        keysharesBackup =
            BytesUtils.tryToBytes(keysharesBackup, unmodifiable: true);
  factory ThorchainMsgTssPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgTssPool(
        id: decode.getField(1),
        poolPubKey: decode.getField(2),
        keygenType: decode.getResult(3)?.to<ThorchainKeygenType, int>(
            (e) => ThorchainKeygenType.fromValue(e)),
        pubKeys: decode.getFields(4),
        height: decode.getField(5),
        blame: ThorchainBlame.deserialize(decode.getField(6)),
        chains: decode.getField(7),
        signer: decode.getField(8),
        keygenTime: decode.getField(9),
        keysharesBackup: decode.getField(10));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "pool_pub_key": poolPubKey,
      "keygen_type": keygenType?.value,
      "pub_keys": pubKeys,
      "height": height?.toString(),
      "blame": blame.toJson(),
      "chains": chains,
      "signer": BytesUtils.tryToHexString(signer),
      "keygen_time": keygenTime?.toString(),
      "keyshares_backup": BytesUtils.tryToHexString(keysharesBackup)
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgTssPool;

  @override
  List get values => [
        id,
        poolPubKey,
        keygenType?.value,
        pubKeys,
        height,
        blame,
        chains,
        signer,
        keygenTime,
        keysharesBackup
      ];
}
