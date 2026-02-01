import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EvidenceParams determine how we handle evidence of malfeasance.
class EvidenceParams extends CosmosMessage {
  /// Max age of evidence, in blocks.
  ///
  /// The basic formula for calculating this is: MaxAgeDuration / {average block
  /// time}.
  final BigInt? maxAgeNumBlocks;

  /// Max age of evidence, in time.
  ///
  /// It should correspond with an app's "unbonding period" or other similar
  /// mechanism for handling [Nothing-At-Stake
  /// attacks](https://github.com/ethereum/wiki/wiki/Proof-of-Stake-FAQ#what-is-the-nothing-at-stake-problem-and-how-can-it-be-fixed).
  final ProtobufDuration maxAgeDuration;

  /// This sets the maximum size of total evidence in bytes that can be committed in a single block.
  /// and should fall comfortably under the max block bytes.
  /// Default is 1048576 or 1MB
  final BigInt? maxBytes;
  EvidenceParams({
    this.maxAgeNumBlocks,
    required this.maxAgeDuration,
    this.maxBytes,
  });

  factory EvidenceParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvidenceParams(
      maxAgeNumBlocks: decode.getField(1),
      maxAgeDuration: ProtobufDuration.deserialize(decode.getField(2)),
      maxBytes: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "max_age_num_blocks": maxAgeNumBlocks?.toString(),
      "max_age_duration": maxAgeDuration.toJson(),
      "max_bytes": maxBytes?.toString,
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.evidenceParams;

  @override
  List get values => [maxAgeNumBlocks, maxAgeDuration, maxBytes];
}
