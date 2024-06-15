import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/sign_msg_type.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class Proposal extends CosmosMessage {
  final SignedMsgType? type;
  final BigInt? height;
  final int? round;
  final int? poolRound;
  final BlockID blockID;
  final ProtobufTimestamp timestamp;
  final List<int>? signature;
  Proposal(
      {this.type,
      this.height,
      this.round,
      this.poolRound,
      required this.blockID,
      required this.timestamp,
      List<int>? signature})
      : signature = BytesUtils.tryToBytes(signature, unmodifiable: true);
  factory Proposal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Proposal(
        type: decode
            .getResult(1)
            ?.to<SignedMsgType, int>((e) => SignedMsgType.fromValue(e)),
        height: decode.getField(2),
        round: decode.getField(3),
        poolRound: decode.getField(4),
        blockID: BlockID.deserialize(decode.getField(5)),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(6)),
        signature: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type?.value,
      "height": height?.toString(),
      "round": round,
      "pol_round": poolRound,
      "block_id": blockID.toJson(),
      "timestamp": timestamp.toJson(),
      "signature": BytesUtils.tryToHexString(signature)
    };
  }

  @override
  String get typeUrl => TendermintTypes.proposal.typeUrl;

  @override
  List get values =>
      [type?.value, height, round, poolRound, blockID, timestamp, signature];
}
