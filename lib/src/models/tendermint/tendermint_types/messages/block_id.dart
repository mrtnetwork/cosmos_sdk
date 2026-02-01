import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'part_set_header.dart';

class BlockID extends CosmosMessage {
  final List<int>? hash;
  final PartSetHeader partSetHeader;

  BlockID({List<int>? hash, required this.partSetHeader})
    : hash = BytesUtils.tryToBytes(hash, unmodifiable: true);
  factory BlockID.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BlockID(
      partSetHeader: PartSetHeader.deserialize(decode.getField(2)),
      hash: decode.getField(1),
    );
  }
  factory BlockID.fromJson(Map<String, dynamic> json) {
    return BlockID(
      partSetHeader: PartSetHeader.fromJson(json["part_set_header"]),
      hash: StringUtils.encode(json["hash"], type: StringEncoding.base64),
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': BytesUtils.tryToHexString(hash),
      'part_set_header': partSetHeader.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => TendermintTypes.blockID;

  @override
  List get values => [hash, partSetHeader];
}
