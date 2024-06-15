import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/hash_op.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/length_op.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// LeafOp represents the raw key-value data we wish to prove, and must be flexible to represent the internal transformation from the original key-value pairs into the basis hash, for many existing merkle trees.
/// key and value are passed in. So that the signature of this operation is: leafOp(key, value) -> output
/// To process this, first prehash the keys and values if needed (ANY means no hash in this case): hkey = prehashKey(key) hvalue = prehashValue(value)
/// Then combine the bytes, and hash it output = hash(prefix || length(hkey) || hkey || length(hvalue) || hvalue)
class Ics23LeafOp extends CosmosMessage {
  final Ics23HashOp? hash;
  final Ics23HashOp? prehashKey;
  final Ics23HashOp? prehashValue;
  final Ics23LengthOp? length;

  /// prefix is a fixed bytes that may optionally be included at the beginning to differentiate
  /// a leaf node from an inner node.
  final List<int>? prefix;
  Ics23LeafOp(
      {this.hash,
      this.prehashKey,
      this.prehashValue,
      this.length,
      List<int>? prefix})
      : prefix = BytesUtils.tryToBytes(prefix, unmodifiable: true);
  factory Ics23LeafOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23LeafOp(
        hash: decode
            .getResult(1)
            ?.to<Ics23HashOp, int>((e) => Ics23HashOp.fromValue(e)),
        prehashKey: decode
            .getResult(2)
            ?.to<Ics23HashOp, int>((e) => Ics23HashOp.fromValue(e)),
        prehashValue: decode
            .getResult(3)
            ?.to<Ics23HashOp, int>((e) => Ics23HashOp.fromValue(e)),
        length: decode
            .getResult(4)
            ?.to<Ics23LengthOp, int>((e) => Ics23LengthOp.fromValue(e)),
        prefix: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "hash": hash?.value,
      "prehash_key": prehashKey?.value,
      "prehash_value": prehashValue?.value,
      "length": length?.value,
      "prefix": BytesUtils.tryToHexString(prefix)
    };
  }

  @override
  String get typeUrl => Ics23Types.leafOp.typeUrl;

  @override
  List get values => [
        hash?.value,
        prehashKey?.value,
        prehashValue?.value,
        length?.value,
        prefix
      ];
}
