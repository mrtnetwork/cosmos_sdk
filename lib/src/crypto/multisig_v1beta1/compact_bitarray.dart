import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:blockchain_utils/utils/utils.dart';

/// CompactBitArray is an implementation of a space efficient bit array.
/// This is used to ensure that the encoded data takes up a minimal amount of space after proto encoding.
class CompactBitArray extends CosmosProtocolBuffer {
  final int extraBitsStored;
  final List<int> elems;
  CompactBitArray({required List<int> elems, required this.extraBitsStored})
      : elems = BytesUtils.toBytes(elems, unmodifiable: true);
  factory CompactBitArray.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CompactBitArray(
        elems: decode.getField(2), extraBitsStored: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "extra_bits_stored": extraBitsStored,
      "elems": BytesUtils.toHexString(elems)
    };
  }

  @override
  List get values => [extraBitsStored, elems];
}
