import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainSolvencyVoter extends CosmosMessage {
  final String? id;
  final String? chain;
  final String? pubKey;
  final List<Coin> coins;
  final BigInt? height;
  final BigInt? consensusBlockHeight;
  final List<String>? signers;
  ThorchainSolvencyVoter(
      {this.id,
      this.chain,
      this.pubKey,
      required List<Coin> coins,
      this.height,
      this.consensusBlockHeight,
      List<String>? signers})
      : coins = coins.immutable,
        signers = signers?.nullOnEmpy;
  factory ThorchainSolvencyVoter.deserialized(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainSolvencyVoter(
        id: decode.getField(1),
        chain: decode.getField(2),
        pubKey: decode.getField(3),
        coins: decode
            .getFields<List<int>>(4)
            .map((e) => Coin.deserialize(e))
            .toList(),
        height: decode.getField(5),
        consensusBlockHeight: decode.getField(6),
        signers: decode.getFields(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "chain": chain,
      "pub_key": pubKey,
      "coins": coins.map((e) => e.toJson()).toList(),
      "height": height?.toString(),
      "consensus_block_height": consensusBlockHeight?.toString(),
      "signers": signers
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.solvencyVoter.typeUrl;

  @override
  List get values =>
      [id, chain, pubKey, coins, height, consensusBlockHeight, signers];
}
