import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_genesis_v1/messages/controller_genesis_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_genesis_v1/messages/host_genesis_state.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the interchain accounts genesis state
class InterchainAccountsGenesisGenesisState extends CosmosMessage {
  final ControllerGenesisState controllerGenesisState;
  final HostGenesisState hostGenesisState;
  const InterchainAccountsGenesisGenesisState({
    required this.controllerGenesisState,
    required this.hostGenesisState,
  });

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "controller_genesis_state": controllerGenesisState.toJson(),
      "host_genesis_state": hostGenesisState.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccountsGenesisGenesisState;

  @override
  List get values => [controllerGenesisState, hostGenesisState];
}
