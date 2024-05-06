import 'package:cosmos_sdk/src/models/ics23/messages/proof/batch_entry_base.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'compressed_existence_proof.dart';
import 'compressed_non_existence_proof.dart';

class Ics23CompressedBatchEntry extends CosmosMessage {
  final Ics23CompressedBatchEntryBase? proof;
  const Ics23CompressedBatchEntry({this.proof});
  factory Ics23CompressedBatchEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    if (decode.hasTag(1)) {
      return Ics23CompressedBatchEntry(
          proof: Ics23CompressedExistenceProof.deserialize(decode.getField(1)));
    } else if (decode.hasTag(2)) {
      return Ics23CompressedBatchEntry(
          proof:
              Ics23CompressedNonExistenceProof.deserialize(decode.getField(1)));
    }
    throw const Ics23CompressedBatchEntry();
  }

  @override
  List<int> get fieldIds => [proof?.id ?? 0];

  @override
  Map<String, dynamic> toJson() {
    return {"proof": proof?.toJson()};
  }

  @override
  String get typeUrl => Ics23Types.compressedBatchEntry.typeUrl;

  @override
  List get values => [proof];
}
