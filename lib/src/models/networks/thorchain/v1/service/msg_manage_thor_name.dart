import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgManageTHORName extends CosmosMessage {
  final String? name;
  final String? chain;
  final String? address;
  final ThorchainCoin coin;
  final BigInt? expireBlockHeight;
  final ThorchainAsset preferredAsset;
  final List<int>? owner;
  final List<int>? signer;
  ThorchainMsgManageTHORName(
      {this.name,
      this.chain,
      this.address,
      required this.coin,
      this.expireBlockHeight,
      required this.preferredAsset,
      List<int>? owner,
      List<int>? signer})
      : owner = BytesUtils.tryToBytes(owner, unmodifiable: true),
        signer = BytesUtils.tryToBytes(signer);
  factory ThorchainMsgManageTHORName.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgManageTHORName(
        name: decode.getField(1),
        chain: decode.getField(2),
        address: decode.getField(3),
        coin: ThorchainCoin.deserialize(decode.getField(4)),
        expireBlockHeight: decode.getField(5),
        preferredAsset: ThorchainAsset.deserialize(decode.getField(6)),
        owner: decode.getField(7),
        signer: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "chain": chain,
      "address": address,
      "coin": coin.toJson(),
      "expire_block_height": expireBlockHeight?.toString(),
      "preferred_asset": preferredAsset.toJson(),
      "owner": BytesUtils.tryToHexString(owner),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgManageTHORName.typeUrl;

  @override
  List get values => [
        name,
        chain,
        address,
        coin,
        expireBlockHeight,
        preferredAsset,
        owner,
        signer
      ];
}
