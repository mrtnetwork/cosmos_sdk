import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id_flag.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ExtendedCommitSig retains all the same fields as CommitSig but adds vote extension-related fields.
/// We use two signatures to ensure backwards compatibility.
/// That is the digest of the original signature is still the same in prior versions
class ExtendedCommitSig extends CosmosMessage {
  final BlockIDFlag? blockIDFlag;
  final List<int>? validatorBytes;
  final ProtobufTimestamp timestamp;
  final List<int>? signature;

  /// Vote extension data
  final List<int>? extension;

  /// Vote extension signature
  final List<int>? extensionSignature;

  ExtendedCommitSig(
      {this.blockIDFlag,
      List<int>? validatorBytes,
      required this.timestamp,
      List<int>? signature,
      List<int>? extension,
      List<int>? extensionSignature})
      : validatorBytes =
            BytesUtils.tryToBytes(validatorBytes, unmodifiable: true),
        signature = BytesUtils.tryToBytes(signature, unmodifiable: true),
        extension = BytesUtils.tryToBytes(extension, unmodifiable: true),
        extensionSignature = BytesUtils.tryToBytes(extensionSignature);
  factory ExtendedCommitSig.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ExtendedCommitSig(
        blockIDFlag: decode
            .getResult(1)
            ?.to<BlockIDFlag, int>((e) => BlockIDFlag.fromValue(e)),
        validatorBytes: decode.getField(2),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(3)),
        signature: decode.getField(4),
        extension: decode.getField(5),
        extensionSignature: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_id_flag": blockIDFlag?.value,
      "validator_address": BytesUtils.tryToHexString(validatorBytes),
      "timestamp": timestamp.toJson(),
      "signature": BytesUtils.tryToHexString(signature),
      "extension": BytesUtils.tryToHexString(extension),
      "extension_signature": BytesUtils.tryToHexString(extensionSignature)
    };
  }

  @override
  String get typeUrl => TendermintTypes.extendedCommitSig.typeUrl;

  @override
  List get values => [1, 2, 3, 4, 5, 6];
}
