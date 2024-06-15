import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class Proof extends CosmosMessage {
  final BigInt? total;
  final BigInt? index;
  final List<int>? leafHash;
  final List<List<int>>? aunts;
  Proof({this.total, this.index, List<int>? leafHash, List<List<int>>? aunts})
      : leafHash = BytesUtils.tryToBytes(leafHash, unmodifiable: true),
        aunts = aunts == null
            ? null
            : List<List<int>>.unmodifiable(
                aunts.map((e) => BytesUtils.tryToBytes(e)));

  factory Proof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Proof(
        total: decode.getField(1),
        index: decode.getField(2),
        leafHash: decode.getField(3),
        aunts: decode.getFields<List<int>>(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "total": total?.toString(),
      "index": index?.toString(),
      "leaf_hash": BytesUtils.tryToHexString(leafHash),
      "aunts": aunts?.map((e) => BytesUtils.toHexString(e))
    };
  }

  @override
  String get typeUrl => TendermintTypes.proof.typeUrl;

  @override
  List get values => [total, index, leafHash, aunts];
}
