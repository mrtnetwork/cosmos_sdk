import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Capability defines an implementation of an object capability. The index provided to a Capability must be globally unique.
class Capability extends CosmosMessage {
  final BigInt? index;
  const Capability({this.index});

  factory Capability.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Capability(index: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"index": index?.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.capability;

  @override
  List get values => [index];
}
