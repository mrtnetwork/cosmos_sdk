import 'package:cosmos_sdk/src/models/ics23/messages/proof/batch_entry_base.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/existence_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/non_existence_proof.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class Ics23BatchEntry extends CosmosMessage {
  final Ics23BatchEntryBase? proof;
  const Ics23BatchEntry({this.proof});
  factory Ics23BatchEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    if (decode.hasTag(1)) {
      return Ics23BatchEntry(
          proof: Ics23ExistenceProof.deserialize(decode.getField(1)));
    } else if (decode.hasTag(2)) {
      return Ics23BatchEntry(
          proof: Ics23NonExistenceProof.deserialize(decode.getField(1)));
    }
    throw const Ics23BatchEntry();
  }

  @override
  List<int> get fieldIds => [proof?.id ?? 0];

  @override
  Map<String, dynamic> toJson() {
    return {"proof": proof?.toJson()};
  }

  @override
  String get typeUrl => Ics23Types.batchEntry.typeUrl;

  @override
  List get values => [proof];
}
