import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// NFT defines the NFT.
class NFT extends CosmosMessage {
  /// Class ID associated with the NFT, similar to the contract address of ERC721.
  final String? classId;

  /// Unique identifier of the NFT.
  final String? id;

  /// URI for the NFT metadata stored off-chain.
  final String? uri;

  /// Hash of the document pointed by URI.
  final String? uriHash;

  /// App-specific data of the NFT. Optional.
  final Any? data;

  const NFT({
    this.classId,
    this.id,
    this.uri,
    this.uriHash,
    this.data,
  });

  factory NFT.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return NFT(
        classId: decode.getField(1),
        id: decode.getField(2),
        uri: decode.getField(3),
        uriHash: decode.getField(4),
        data: decode
            .getResult(10)
            ?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'id': id,
      'uri': uri,
      'uri_hash': uriHash,
      'data': data?.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 10];

  @override
  String get typeUrl => NFTV1beta1Types.nFT.typeUrl;

  @override
  List get values => [classId, id, uri, uriHash, data];
}
