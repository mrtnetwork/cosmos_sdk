import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/extended_commit_sig.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ExtendedCommit extends CosmosMessage {
  final BigInt? height;
  final int? round;
  final BlockID blockID;
  final List<ExtendedCommitSig> extendedSignatures;
  ExtendedCommit(
      {this.height,
      this.round,
      required this.blockID,
      required List<ExtendedCommitSig> extendedSignatures})
      : extendedSignatures = extendedSignatures.immutable;
  factory ExtendedCommit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ExtendedCommit(
      height: decode.getField(1),
      round: decode.getField(2),
      blockID: BlockID.deserialize(decode.getField(3)),
      extendedSignatures: decode
          .getFields<List<int>>(4)
          .map((e) => ExtendedCommitSig.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height?.toString(),
      "round": round,
      "block_id": blockID.toJson(),
      "extended_signatures": extendedSignatures.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.extendedCommit;

  @override
  List get values => [height, round, blockID, extendedSignatures];
}
