import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'batch_entry_base.dart';
import 'compressed_existence_proof.dart';

class Ics23CompressedNonExistenceProof extends Ics23CompressedBatchEntryBase {
  final List<int>? key;
  final Ics23CompressedExistenceProof? left;
  final Ics23CompressedExistenceProof? right;
  Ics23CompressedNonExistenceProof({List<int>? key, this.left, this.right})
      : key = BytesUtils.tryToBytes(key, unmodifiable: true);
  factory Ics23CompressedNonExistenceProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23CompressedNonExistenceProof(
      key: decode.getField(1),
      left: decode.getResult(2)?.to<Ics23CompressedExistenceProof, List<int>>(
          (e) => Ics23CompressedExistenceProof.deserialize(e)),
      right: decode.getResult(3)?.to<Ics23CompressedExistenceProof, List<int>>(
          (e) => Ics23CompressedExistenceProof.deserialize(e)),
    );
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
  TypeUrl get typeUrl => Ics23Types.compressedNonExistenceProof;

  @override
  List get values => [key, left, right];

  @override
  int get id => 2;
}
