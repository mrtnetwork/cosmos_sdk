import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/canonical_part_set_header.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class CanonicalBlockID extends CosmosMessage {
  final List<int>? hash;
  final CanonicalPartSetHeader partSetHeader;
  CanonicalBlockID({List<int>? hash, required this.partSetHeader})
      : hash = BytesUtils.tryToBytes(hash, unmodifiable: true);
  factory CanonicalBlockID.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CanonicalBlockID(
        partSetHeader: CanonicalPartSetHeader.deserialize(decode.getField(2)),
        hash: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "hash": BytesUtils.tryToHexString(hash),
      "part_set_header": partSetHeader.toJson()
    };
  }

  @override
  String get typeUrl => TendermintTypes.canonicalBlockID.typeUrl;

  @override
  List get values => [hash, partSetHeader];
}
