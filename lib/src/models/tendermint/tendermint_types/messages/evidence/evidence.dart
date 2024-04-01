import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/evidence/duplicate_vote_evidence.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/evidence/evidence_base.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/evidence/light_client_attack_evidence.dart';

class Evidence extends CosmosMessage {
  final BaseEvidence? evidence;
  const Evidence._(this.evidence);
  factory Evidence.duplicateVoteEvidence(
      {DuplicateVoteEvidence? duplicateVoteEvidence}) {
    return Evidence._(duplicateVoteEvidence);
  }
  factory Evidence.lightClientAttackEvidence(
      {LightClientAttackEvidence? lightClientAttackEvidence}) {
    return Evidence._(lightClientAttackEvidence);
  }
  factory Evidence.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    if (decode.hasTag(1)) {
      return Evidence.duplicateVoteEvidence(
          duplicateVoteEvidence:
              DuplicateVoteEvidence.deserialize(decode.getField(1)));
    } else if (decode.hasTag(2)) {
      return Evidence.lightClientAttackEvidence(
          lightClientAttackEvidence:
              LightClientAttackEvidence.deserialize(decode.getField(2)));
    }
    return Evidence._(null);
  }

  @override
  List<int> get fieldIds => [evidence?.id ?? 1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "duplicate_vote_evidence": evidence?.id == 1 ? evidence?.toJson() : null,
      "light_client_attack_evidence":
          evidence?.id == 2 ? evidence?.toJson() : null,
    };
  }

  @override
  String get typeUrl => TendermintTypes.evidence.typeUrl;

  @override
  List get values => [evidence];
}
