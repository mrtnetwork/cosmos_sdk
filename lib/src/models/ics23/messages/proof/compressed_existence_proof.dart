import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/leaf_op.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'batch_entry_base.dart';

class Ics23CompressedExistenceProof extends Ics23CompressedBatchEntryBase {
  final List<int>? key;
  final List<int>? value;
  final Ics23LeafOp? leaf;

  /// these are indexes into the lookup_inners table in CompressedBatchProof
  final List<int>? path;
  Ics23CompressedExistenceProof(
      {List<int>? key, List<int>? value, this.leaf, List<int>? path})
      : key = BytesUtils.tryToBytes(key, unmodifiable: true),
        value = BytesUtils.tryToBytes(value, unmodifiable: true),
        path = path?.nullOnEmpy;
  factory Ics23CompressedExistenceProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23CompressedExistenceProof(
        key: decode.getField(1),
        value: decode.getField(2),
        leaf: decode
            .getResult(3)
            ?.to<Ics23LeafOp, List<int>>((e) => Ics23LeafOp.deserialize(e)),
        path: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": BytesUtils.tryToHexString(key),
      "value": BytesUtils.tryToHexString(value),
      "leaf": leaf?.toJson(),
      "path": path
    };
  }

  @override
  String get typeUrl => Ics23Types.compressedExistenceProof.typeUrl;

  @override
  List get values => [key, value, leaf, path];

  @override
  int get id => 1;
}
