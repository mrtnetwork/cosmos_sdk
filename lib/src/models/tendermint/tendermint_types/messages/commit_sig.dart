import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id_flag.dart';

/// CommitSig is a part of the Vote included in a Commit.
class CommitSig extends CosmosMessage {
  final BlockIDFlag? blockIDFlag;
  final List<int>? validatorAddress;
  final ProtobufTimestamp timestamp;
  final List<int>? signature;
  CommitSig(
      {this.blockIDFlag,
      List<int>? validatorAddress,
      required this.timestamp,
      List<int>? signature})
      : validatorAddress =
            BytesUtils.tryToBytes(validatorAddress, unmodifiable: true),
        signature = BytesUtils.tryToBytes(signature, unmodifiable: true);
  factory CommitSig.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CommitSig(
        blockIDFlag: decode
            .getResult(1)
            ?.to<BlockIDFlag, int>((e) => BlockIDFlag.fromValue(e)),
        validatorAddress: decode.getField(2),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(3)),
        signature: decode.getField(4));
  }
  factory CommitSig.fromJson(Map<String, dynamic> json) {
    return CommitSig(
        blockIDFlag: BlockIDFlag.fromName(json["block_id_flag"]),
        validatorAddress: StringUtils.tryEncode(json["validator_address"],
            type: StringEncoding.base64),
        timestamp: ProtobufTimestamp.fromString(json["timestamp"]),
        signature: StringUtils.tryEncode(json["signature"],
            type: StringEncoding.base64));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_id_flag": blockIDFlag?.value,
      "validator_address": BytesUtils.tryToHexString(validatorAddress),
      "timestamp": timestamp.toJson(),
      "signature": BytesUtils.tryToHexString(signature)
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.commitSig;

  @override
  List get values => [blockIDFlag, validatorAddress, timestamp, signature];
}
