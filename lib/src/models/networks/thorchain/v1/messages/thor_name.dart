import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainTHORName extends CosmosMessage {
  final String? name;
  final BigInt? expireBlockHeight;
  final List<int>? owner;
  final ThorchainAsset preferredAsset;
  final List<ThorchainTHORNameAlias> aliases;
  ThorchainTHORName(
      {this.name,
      this.expireBlockHeight,
      List<int>? owner,
      required this.preferredAsset,
      required List<ThorchainTHORNameAlias> aliases})
      : aliases = aliases.immutable,
        owner = BytesUtils.tryToBytes(owner, unmodifiable: true);
  factory ThorchainTHORName.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTHORName(
      name: decode.getField(1),
      expireBlockHeight: decode.getField(2),
      owner: decode.getField(3),
      preferredAsset: ThorchainAsset.deserialize(decode.getField(4)),
      aliases: decode
          .getFields(5)
          .map((e) => ThorchainTHORNameAlias.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "expire_block_height": expireBlockHeight?.toString(),
      "owner": BytesUtils.tryToHexString(owner),
      "preferred_asset": preferredAsset.toJson(),
      "aliases": aliases.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.thorNameAlias.typeUrl;

  @override
  List get values => [name, expireBlockHeight, owner, preferredAsset, aliases];
}
