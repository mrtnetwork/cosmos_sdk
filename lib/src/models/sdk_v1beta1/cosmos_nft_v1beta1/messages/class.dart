import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Class defines the class of the nft type.
class NFTClass extends CosmosMessage {
  /// id defines the unique identifier of the NFT classification, similar to the contract address of ERC721
  final String? id;

  /// name defines the human-readable name of the NFT classification. Optional
  final String? name;

  /// symbol is an abbreviated name for nft classification. Optional
  final String? symbol;

  /// description is a brief description of nft classification. Optional
  final String? description;

  /// uri for the class metadata stored off chain. It can define schema for Class and NFT `Data` attributes. Optional
  final String? uri;

  /// uri_hash is a hash of the document pointed by uri. Optional
  final String? uriHash;

  /// data is the app specific metadata of the NFT class. Optional
  final AnyMessage? data;

  factory NFTClass.fromJson(Map<String, dynamic> json) {
    return NFTClass(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      symbol: json["symbol"],
      uriHash: json["uri_hash"],
      uri: json["uri"],
      data: json["data"] == null ? null : AnyMessage.fromJson(json["data"]),
    );
  }

  const NFTClass({
    this.id,
    this.name,
    this.symbol,
    this.description,
    this.uri,
    this.uriHash,
    this.data,
  });
  factory NFTClass.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return NFTClass(
      id: decode.getField(1),
      name: decode.getField(2),
      symbol: decode.getField(3),
      description: decode.getField(4),
      uri: decode.getField(5),
      uriHash: decode.getField(6),
      data: decode
          .getResult(7)
          ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'description': description,
      'uri': uri,
      'uri_hash': uriHash,
      'data': data?.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.nFTClass;

  @override
  List get values => [id, name, symbol, description, uri, uriHash, data];
}
