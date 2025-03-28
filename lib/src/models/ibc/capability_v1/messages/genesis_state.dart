import 'package:cosmos_sdk/src/models/ibc/capability_v1/messages/genesis_owners.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the capability module's genesis state.
class CapabilityGenesisState extends CosmosMessage {
  /// index is the capability global index.
  final BigInt? index;

  /// owners represents a map from index to owners of the capability index
  /// index key is string to allow amino marshalling.
  final List<GenesisOwners> owners;
  const CapabilityGenesisState({this.index, required this.owners});
  factory CapabilityGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CapabilityGenesisState(
        index: decode.getField(1),
        owners: decode
            .getFields<List<int>>(2)
            .map((e) => GenesisOwners.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "index": index?.toString(),
      "owners": owners.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.capabilityGenesisState;

  @override
  List get values => [index, owners];
}
