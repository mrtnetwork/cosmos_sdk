import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/commit_sig.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Commit contains the evidence that a block was committed by a set of validators.
class Commit extends CosmosMessage {
  final BigInt? height;
  final int? round;
  final BlockID blockID;
  final List<CommitSig> signatures;
  Commit(
      {this.height,
      this.round,
      required this.blockID,
      required List<CommitSig> signatures})
      : signatures = signatures.immutable;
  factory Commit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Commit(
        blockID: BlockID.deserialize(decode.getField(3)),
        height: decode.getField(1),
        round: decode.getField(2),
        signatures: decode
            .getFields<List<int>>(4)
            .map((e) => CommitSig.deserialize(e))
            .toList());
  }
  factory Commit.fromRpc(Map<String, dynamic> json) {
    return Commit(
        blockID: BlockID.fromRpc(json["block_id"]),
        signatures: (json["signatures"] as List)
            .map((e) => CommitSig.fromRpc(e))
            .toList(),
        height: BigInt.tryParse(json["height"] ?? ""),
        round: json["round"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height?.toString(),
      "round": round,
      "block_id": blockID.toJson(),
      "signatures": signatures.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => TendermintTypes.commit.typeUrl;

  @override
  List get values => [height, round, blockID, signatures];
}
