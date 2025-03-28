import 'package:cosmos_sdk/src/models/ibc/capability_v1/messages/owner.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// CapabilityOwners defines a set of owners of a single Capability. The set of owners must be unique.
class CapabilityOwners extends CosmosMessage {
  final List<Owner> owners;
  CapabilityOwners(List<Owner> owners) : owners = owners.immutable;
  factory CapabilityOwners.deserialize(List<int> bytes) {
    final deocde = CosmosProtocolBuffer.decode(bytes);
    return CapabilityOwners(deocde
        .getFields<List<int>>(1)
        .map((e) => Owner.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"owners": owners.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.capabilityOwners;

  @override
  List get values => [owners];
}
