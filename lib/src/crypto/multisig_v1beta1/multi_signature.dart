import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:blockchain_utils/utils/utils.dart';

class MultiSignature extends CosmosProtocolBuffer {
  MultiSignature(List<List<int>> signatures)
    : signatures = List<List<int>>.unmodifiable(
        signatures
            .map((e) => BytesUtils.toBytes(e, unmodifiable: true))
            .toList(),
      );
  final List<List<int>> signatures;

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signatures": signatures.map((e) => BytesUtils.toHexString(e)).toList(),
    };
  }

  @override
  List get values => [signatures];
}
