import 'package:cosmos_sdk/src/models/ics23/messages/proof/batch_entry.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'base_proof.dart';

/// BatchProof is a group of multiple proof types than can be compressed
class Ics23BatchProof extends Ics23ProofBase {
  final List<Ics23BatchEntry>? entries;
  Ics23BatchProof({List<Ics23BatchEntry>? entries})
      : entries = entries?.nullOnEmpy;
  factory Ics23BatchProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23BatchProof(
        entries: decode
            .getFileds<List<int>>(1)
            .map((e) => Ics23BatchEntry.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"entries": entries?.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => Ics23Types.batchProof.typeUrl;

  @override
  List get values => [entries];

  @override
  int get commitmentId => 3;
}
