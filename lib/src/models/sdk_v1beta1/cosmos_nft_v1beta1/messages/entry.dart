import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'nft.dart';

/// Entry Defines all nft owned by a person
class Entry extends CosmosMessage {
  /// Owner address of the NFTs.
  final String? owner;

  /// Group of NFTs belonging to the same owner.
  final List<NFT> nfts;

  /// Constructs a new instance of [Entry].
  Entry({this.owner, required List<NFT> nfts}) : nfts = nfts.mutable;

  factory Entry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Entry(
        owner: decode.getField(1),
        nfts: decode
            .getFields<List<int>>(2)
            .map((e) => NFT.deserialize(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'nfts': nfts.map((nft) => nft.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get typeUrl => NFTV1beta1Types.entry.typeUrl;

  @override
  List get values => [owner, nfts];
}
