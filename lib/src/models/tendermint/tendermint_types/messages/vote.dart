import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'block_id.dart';
import 'sign_msg_type.dart';

/// Vote represents a prevote or precommit vote from validators for consensus.
class Vote extends CosmosMessage {
  final SignedMsgType? type;
  final BigInt? height;
  final int? round;
  final BlockID blockId;
  final ProtobufTimestamp timestamp;
  final List<int>? validatorAddress;
  final int? validatorIndex;

  /// Vote signature by the validator if they participated in consensus for the
  /// associated block.
  final List<int>? signature;

  /// Vote extension provided by the application. Only valid for precommit
  /// messages.
  final List<int>? extension;

  /// Vote extension signature by the validator if they participated in
  /// consensus for the associated block.
  /// Only valid for precommit messages
  final List<int>? extensionSignature;

  Vote({
    this.type,
    this.height,
    this.round,
    required this.blockId,
    required this.timestamp,
    List<int>? validatorAddress,
    this.validatorIndex,
    List<int>? signature,
    List<int>? extension,
    List<int>? extensionSignature,
  }) : validatorAddress = BytesUtils.tryToBytes(
         validatorAddress,
         unmodifiable: true,
       ),
       signature = BytesUtils.tryToBytes(signature, unmodifiable: true),
       extension = BytesUtils.tryToBytes(extension, unmodifiable: true),
       extensionSignature = BytesUtils.tryToBytes(
         extensionSignature,
         unmodifiable: true,
       );
  factory Vote.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Vote(
      type: decode
          .getResult(1)
          ?.to<SignedMsgType, int>((e) => SignedMsgType.fromValue(e)),
      height: decode.getField(2),
      round: decode.getField(3),
      blockId: BlockID.deserialize(decode.getField(4)),
      timestamp: ProtobufTimestamp.deserialize(decode.getField(5)),
      validatorAddress: decode.getField(6),
      validatorIndex: decode.getField(7),
      signature: decode.getField(8),
      extension: decode.getField(9),
      extensionSignature: decode.getField(10),
    );
  }

  /// Converts the vote to a JSON-serializable map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type?.value,
      'height': height?.toString(),
      'round': round,
      'blockId': blockId.toJson(),
      'timestamp': timestamp.toJson(),
      'validatorAddress': BytesUtils.tryToHexString(validatorAddress),
      'validatorIndex': validatorIndex,
      'signature': BytesUtils.tryToHexString(signature),
      'extension': BytesUtils.tryToHexString(extension),
      'extensionSignature': BytesUtils.tryToHexString(extensionSignature),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  TypeUrl get typeUrl => TendermintTypes.vote;

  @override
  List get values => [
    type,
    height,
    round,
    blockId,
    timestamp,
    validatorAddress,
    validatorIndex,
    signature,
    extension,
    extensionSignature,
  ];
}
