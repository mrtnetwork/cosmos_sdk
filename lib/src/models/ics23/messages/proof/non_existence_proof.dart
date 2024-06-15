import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'batch_entry_base.dart';
import 'existence_proof.dart';

/// NonExistenceProof takes a proof of two neighbors, one left of the desired key,
/// one right of the desired key. If both proofs are valid AND they are neighbors,
/// then there is no valid proof for the given key.
class Ics23NonExistenceProof extends Ics23BatchEntryBase {
  final List<int>? key;
  final Ics23ExistenceProof? left;
  final Ics23ExistenceProof? right;
  Ics23NonExistenceProof({List<int>? key, this.left, this.right})
      : key = BytesUtils.tryToBytes(key, unmodifiable: true);
  factory Ics23NonExistenceProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23NonExistenceProof(
        key: decode.getField(1),
        left: decode.getResult(2)?.to<Ics23ExistenceProof, List<int>>(
            (e) => Ics23ExistenceProof.deserialize(e)),
        right: decode.getResult(3)?.to<Ics23ExistenceProof, List<int>>(
            (e) => Ics23ExistenceProof.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": BytesUtils.tryToHexString(key),
      "left": left?.toJson(),
      "right": right?.toJson()
    };
  }

  @override
  String get typeUrl => Ics23Types.nonExistenceProof.typeUrl;

  @override
  List get values => [key, left, right];

  @override
  int get id => 2;

  @override
  int get commitmentId => 2;
}
