import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof/batch_entry_base.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/inner_op.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/leaf_op.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ExistenceProof takes a key and a value and a set of steps to perform on it.
/// The result of peforming all these steps will provide a "root hash",
/// which can be compared to the value in a header.
/// Since it is computationally infeasible to produce a hash collission for
/// any of the used cryptographic hash functions, if someone can provide a
/// series of operations to transform a given key and value into a root hash
/// that matches some trusted root, these key and values must be in the referenced merkle tree.
/// The only possible issue is maliablity in LeafOp, such as providing extra
/// prefix data, which should be controlled by a spec. Eg. with lengthOp as NONE, prefix = FOO, key = BAR, value = CHOICE and prefix = F, key = OOBAR, value = CHOICE would produce the same value.
/// With LengthOp this is tricker but not impossible. Which is why the "leafPrefixEqual"
/// field in the ProofSpec is valuable to prevent this mutability. And why all trees
/// should length-prefix the data before hashing it.
class Ics23ExistenceProof extends Ics23BatchEntryBase {
  final List<int>? key;
  final List<int>? value;
  final Ics23LeafOp? leaf;
  final List<Ics23InnerOp>? path;
  Ics23ExistenceProof(
      {List<int>? key, List<int>? value, this.leaf, List<Ics23InnerOp>? path})
      : path = path?.nullOnEmpy,
        key = BytesUtils.tryToBytes(key, unmodifiable: true),
        value = BytesUtils.tryToBytes(value, unmodifiable: true);
  factory Ics23ExistenceProof.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23ExistenceProof(
        key: decode.getField(1),
        value: decode.getField(2),
        leaf: decode
            .getResult(3)
            ?.to<Ics23LeafOp, List<int>>((e) => Ics23LeafOp.deserialize(e)),
        path: decode
            .getFields(4)
            .map((e) => Ics23InnerOp.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": BytesUtils.tryToHexString(key),
      "value": BytesUtils.tryToHexString(value),
      "leaf": leaf?.toJson(),
      "path": path?.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => Ics23Types.existenceProof.typeUrl;

  @override
  List get values => [key, value, leaf, path];

  @override
  int get id => 1;

  @override
  int get commitmentId => 1;
}
