import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainTssVoter extends CosmosMessage {
  final String? id;
  final String? poolPubKey;
  final List<String>? pubKeys;
  final BigInt? blockHeight;
  final List<String>? chains;
  final List<String>? signers;
  final BigInt? majorityConsensusBlockHeight;
  ThorchainTssVoter({
    this.id,
    this.poolPubKey,
    List<String>? pubKeys,
    this.blockHeight,
    List<String>? chains,
    List<String>? signers,
    this.majorityConsensusBlockHeight,
  })  : pubKeys = pubKeys?.nullOnEmpy,
        chains = chains?.nullOnEmpy,
        signers = signers?.nullOnEmpy;
  factory ThorchainTssVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTssVoter(
        id: decode.getField(1),
        poolPubKey: decode.getField(2),
        pubKeys: decode.getFields<String>(3),
        blockHeight: decode.getField(4),
        chains: decode.getFields<String>(5),
        signers: decode.getFields<String>(6),
        majorityConsensusBlockHeight: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "pool_pub_key": poolPubKey,
      "pub_keys": pubKeys,
      "block_height": blockHeight?.toString(),
      "chains": chains,
      "signers": signers,
      "majority_consensus_block_height":
          majorityConsensusBlockHeight?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.tssVoter.typeUrl;

  @override
  List get values => [
        id,
        poolPubKey,
        pubKeys,
        blockHeight,
        chains,
        signers,
        majorityConsensusBlockHeight
      ];
}
