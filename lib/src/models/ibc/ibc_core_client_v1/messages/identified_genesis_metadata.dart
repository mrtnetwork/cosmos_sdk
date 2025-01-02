import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/genesis_metadata.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// IdentifiedGenesisMetadata has the client metadata with the corresponding client id.
class IbcClientIdentifiedGenesisMetadata extends CosmosMessage {
  final String? clientId;
  final List<IbcClientGenesisMetadata> clientMetadata;
  IbcClientIdentifiedGenesisMetadata(
      {this.clientId, required List<IbcClientGenesisMetadata> clientMetadata})
      : clientMetadata = clientMetadata.immutable;
  factory IbcClientIdentifiedGenesisMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientIdentifiedGenesisMetadata(
      clientId: decode.getField(1),
      clientMetadata: decode
          .getFields(2)
          .map((e) => IbcClientGenesisMetadata.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "client_metadata": clientMetadata.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.identifiedGenesisMetadata;

  @override
  List get values => [clientId, clientMetadata];
}
