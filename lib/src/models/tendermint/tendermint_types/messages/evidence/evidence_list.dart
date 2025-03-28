import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/evidence/evidence.dart';
import 'package:blockchain_utils/helper/helper.dart';

class EvidenceList extends CosmosMessage {
  final List<Evidence> evidence;
  EvidenceList({required List<Evidence> evidence})
      : evidence = evidence.immutable;
  factory EvidenceList.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvidenceList(
        evidence: decode
            .getFields<List<int>>(1)
            .map((e) => Evidence.deserialize(e))
            .toList());
  }
  factory EvidenceList.fromJson(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvidenceList(
        evidence: decode
            .getFields<List<int>>(1)
            .map((e) => Evidence.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"evidence": evidence.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.evidenceList;

  @override
  List get values => [evidence];
}
