import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/light_block.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/tendermint_validator.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'evidence_base.dart';

/// LightClientAttackEvidence contains evidence of a set of validators attempting to mislead a light client.
class LightClientAttackEvidence extends BaseEvidence {
  final LightBlock? conflictingBlock;
  final BigInt? commonHeight;
  final List<TendermintValidator> byzantineValidators;
  final BigInt? totalVotingPower;
  final ProtobufTimestamp timestamp;
  LightClientAttackEvidence(
      {this.conflictingBlock,
      this.commonHeight,
      required List<TendermintValidator> byzantineValidators,
      this.totalVotingPower,
      required this.timestamp})
      : byzantineValidators = byzantineValidators.mutable;
  factory LightClientAttackEvidence.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return LightClientAttackEvidence(
        conflictingBlock: decode
            .getResult(1)
            ?.to<LightBlock, List<int>>((e) => LightBlock.deserialize(e)),
        commonHeight: decode.getField(2),
        byzantineValidators: decode
            .getFileds<List<int>>(3)
            .map((e) => TendermintValidator.deserialize(e))
            .toList(),
        totalVotingPower: decode.getField(4),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(5)));
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "conflicting_block": conflictingBlock?.toJson(),
      "common_height": commonHeight?.toString(),
      "byzantine_validators":
          byzantineValidators.map((e) => e.toJson()).toList(),
      "total_voting_power": totalVotingPower?.toString(),
      "timestamp": timestamp.toJson()
    };
  }

  @override
  String get typeUrl => TendermintTypes.lightClientAttackEvidence.typeUrl;

  @override
  List get values => [
        conflictingBlock,
        commonHeight,
        byzantineValidators,
        totalVotingPower,
        timestamp
      ];

  @override
  int get id => 2;
}
