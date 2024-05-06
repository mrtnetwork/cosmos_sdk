import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/hash_op.dart';
import 'package:cosmos_sdk/src/models/ics23/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// InnerSpec contains all store-specific structure info to determine if two proofs from a given store are neighbors.
/// This enables:
/// isLeftMost(spec: InnerSpec, op: InnerOp) isRightMost(spec: InnerSpec, op: InnerOp) isLeftNeighbor(spec: InnerSpec, left: InnerOp, right: InnerOp)
class Ics23InnerSpec extends CosmosMessage {
  /// Child order is the ordering of the children node, must count from 0
  /// iavl tree is 0, 1 (left then right)
  /// merk is 0, 2, 1 (left, right, here)
  final List<int>? childOrder;
  final int? childSize;
  final int? minPrefixLength;
  final int? maxPrefixLength;

  /// empty child is the prehash image that
  /// is used when one child is nil (eg. 20 bytes of 0)
  final List<int>? emptyChild;

  /// hash is the algorithm that must be used for each InnerOp
  final Ics23HashOp? hash;
  Ics23InnerSpec(
      {List<int>? childOrder,
      this.childSize,
      this.minPrefixLength,
      this.maxPrefixLength,
      List<int>? emptyChild,
      this.hash})
      : childOrder = childOrder?.nullOnEmpy,
        emptyChild = BytesUtils.tryToBytes(emptyChild, unmodifiable: true);
  factory Ics23InnerSpec.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Ics23InnerSpec(
        childOrder: decode.getField(1),
        childSize: decode.getField(2),
        minPrefixLength: decode.getField(3),
        maxPrefixLength: decode.getField(4),
        emptyChild: decode.getField(5),
        hash: decode
            .getResult(6)
            ?.to<Ics23HashOp, int>((e) => Ics23HashOp.fromValue(e)));
  }

  @override
  List<int> get fieldIds => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    return {
      "child_order": childOrder,
      "child_size": childSize,
      "min_prefix_length": minPrefixLength,
      "max_prefix_length": maxPrefixLength,
      "empty_child": BytesUtils.tryToHexString(emptyChild),
      "hash": hash?.value
    };
  }

  @override
  String get typeUrl => Ics23Types.innerSpec.typeUrl;

  @override
  List get values => [
        childOrder?.map((e) => BigInt.from(e)).toList(),
        childSize,
        minPrefixLength,
        maxPrefixLength,
        emptyChild,
        hash?.value
      ];
}
