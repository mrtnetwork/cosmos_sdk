import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/hash_op.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// InnerOp represents a merkle-proof step that is not a leaf. It represents concatenating two children and hashing them to provide the next result.
/// The result of the previous step is passed in, so the signature of this op is: innerOp(child) -> output
/// The result of applying InnerOp should be: output = op.hash(op.prefix || child || op.suffix)
/// where the || operator is concatenation of binary data, and child is the result of hashing all the tree below this step.
/// Any special data, like prepending child with the length, or prepending the entire operation with some value to differentiate from leaf nodes, should be included in prefix and suffix. If either of prefix or suffix is empty, we just treat it as an empty string
class Ics23InnerOp extends CosmosMessage {
  final Ics23HashOp? hash;
  final List<int>? prefix;
  final List<int>? suffix;
  Ics23InnerOp({this.hash, List<int>? prefix, List<int>? suffix})
    : prefix = BytesUtils.tryToBytes(prefix, unmodifiable: true),
      suffix = BytesUtils.tryToBytes(suffix, unmodifiable: true);
  factory Ics23InnerOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23InnerOp(
      hash: decode
          .getResult(1)
          ?.to<Ics23HashOp, int>((e) => Ics23HashOp.fromValue(e)),
      prefix: decode.getField(2),
      suffix: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "hash": hash?.value,
      "prefix": BytesUtils.tryToHexString(prefix),
      "suffix": BytesUtils.tryToHexString(suffix),
    };
  }

  @override
  TypeUrl get typeUrl => Ics23Types.innerOp;

  @override
  List get values => [hash?.value, prefix, suffix];
}
