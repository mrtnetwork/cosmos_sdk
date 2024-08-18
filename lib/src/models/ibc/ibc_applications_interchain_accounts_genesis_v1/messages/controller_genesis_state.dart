import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_genesis_v1/messages/active_channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_genesis_v1/messages/registered_interchain_account.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ControllerGenesisState defines the interchain accounts controller genesis state
class ControllerGenesisState extends CosmosMessage {
  final List<ActiveChannel> activeChannels;
  final List<RegisteredInterchainAccount> interchainAccounts;
  final List<String>? ports;
  final InterchainAccountsControllerParams params;
  ControllerGenesisState(
      {required List<ActiveChannel> activeChannels,
      required List<RegisteredInterchainAccount> interchainAccounts,
      List<String>? ports,
      required this.params})
      : activeChannels = activeChannels.immutable,
        interchainAccounts = interchainAccounts.immutable,
        ports = ports?.nullOnEmpy;
  factory ControllerGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ControllerGenesisState(
        activeChannels: decode
            .getFields(1)
            .map((e) => ActiveChannel.deserialize(e))
            .toList(),
        interchainAccounts: decode
            .getFields(2)
            .map((e) => RegisteredInterchainAccount.deserialize(e))
            .toList(),
        ports: decode.getFields(3),
        params:
            InterchainAccountsControllerParams.deserialize(decode.getField(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "active_channels": activeChannels.map((e) => e.toJson()).toList(),
      "interchain_accounts": interchainAccounts.map((e) => e.toJson()).toList(),
      "ports": ports,
      "params": params.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.controllerGenesisState.typeUrl;

  @override
  List get values => [activeChannels, interchainAccounts, ports, params];
}
