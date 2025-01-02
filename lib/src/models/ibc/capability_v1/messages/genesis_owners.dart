import 'package:cosmos_sdk/src/models/ibc/capability_v1/messages/capability_owners.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisOwners defines the capability owners with their corresponding index.
class GenesisOwners extends CosmosMessage {
  /// index is the index of the capability owner.
  final BigInt? index;

  /// index_owners are the owners at the given index.
  final CapabilityOwners indexOwners;
  const GenesisOwners({this.index, required this.indexOwners});
  factory GenesisOwners.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GenesisOwners(
      index: decode.getField(1),
      indexOwners: CapabilityOwners.deserialize(decode.getField(2)),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"index": index?.toString(), "index_owners": indexOwners.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.genesisOwners;

  @override
  List get values => [index, indexOwners];
}
