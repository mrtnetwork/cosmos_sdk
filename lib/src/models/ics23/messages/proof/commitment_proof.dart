import 'package:cosmos_sdk/src/models/ics23/messages/proof/base_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/batch_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/compressed_batch_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/existence_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/non_existence_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// CommitmentProof is either an ExistenceProof or a NonExistenceProof, or a Batch of such messages
class Ics23CommitmentProof extends CosmosMessage {
  final Ics23ProofBase? proof;
  const Ics23CommitmentProof({this.proof});
  factory Ics23CommitmentProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    Ics23ProofBase? proof;
    if (decode.hasTag(1)) {
      proof = Ics23ExistenceProof.deserialize(decode.getField(1));
    } else if (decode.hasTag(2)) {
      proof = Ics23NonExistenceProof.deserialize(decode.getField(2));
    } else if (decode.hasTag(3)) {
      proof = Ics23BatchProof.deserialize(decode.getField(3));
    } else if (decode.hasTag(4)) {
      proof = Ics23CompressedBatchProof.deserialize(decode.getField(4));
    }
    return Ics23CommitmentProof(proof: proof);
  }

  @override
  List<int> get fieldIds => [proof?.commitmentId ?? 0];

  @override
  Map<String, dynamic> toJson() {
    return {"proof": proof?.toJson()};
  }

  @override
  String get typeUrl => Ics23Types.commitmentProof.typeUrl;

  @override
  List get values => [proof];
}
