import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/client_consensus_states.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/identified_client_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/identified_genesis_metadata.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the ibc client submodule's genesis state.
class IbcClientGenesisState extends CosmosMessage {
  /// client states with their corresponding identifiers
  final List<IbcClientIdentifiedClientState> clients;

  /// consensus states from each client
  final List<IbcClientClientConsensusStates> clientsConsensus;

  /// metadata from each client
  final List<IbcClientIdentifiedGenesisMetadata> clientsMetadata;
  final IbcClientParams params;

  /// Deprecated: create_localhost has been deprecated.
  /// The localhost client is automatically created at genesis.
  final bool? createLocalhost;

  /// the sequence for the next generated client identifier
  final BigInt? nextClientSequence;
  IbcClientGenesisState(
      {required List<IbcClientIdentifiedClientState> clients,
      required List<IbcClientClientConsensusStates> clientsConsensus,
      required List<IbcClientIdentifiedGenesisMetadata> clientsMetadata,
      required this.params,
      this.createLocalhost,
      this.nextClientSequence})
      : clients = clients.immutable,
        clientsConsensus = clientsConsensus.immutable,
        clientsMetadata = clientsMetadata.immutable;
  factory IbcClientGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientGenesisState(
        clients: decode
            .getFields<List<int>>(1)
            .map((e) => IbcClientIdentifiedClientState.deserialize(e))
            .toList(),
        clientsConsensus: decode
            .getFields<List<int>>(2)
            .map((e) => IbcClientClientConsensusStates.deserialize(e))
            .toList(),
        clientsMetadata: decode
            .getFields<List<int>>(3)
            .map((e) => IbcClientIdentifiedGenesisMetadata.deserialize(e))
            .toList(),
        params: IbcClientParams.deserialize(decode.getField(4)),
        createLocalhost: decode.getField(5),
        nextClientSequence: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "clients": clients.map((e) => e.toJson()).toList(),
      "clients_consensus": clientsConsensus.map((e) => e.toJson()).toList(),
      "clients_metadata": clientsMetadata.map((e) => e.toJson()).toList(),
      "params": params.toJson(),
      "create_localhost": createLocalhost,
      "next_client_sequence": nextClientSequence?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibClientGenesisState;

  @override
  List get values => [
        clients,
        clientsConsensus,
        clientsMetadata,
        params,
        createLocalhost,
        nextClientSequence
      ];
}
