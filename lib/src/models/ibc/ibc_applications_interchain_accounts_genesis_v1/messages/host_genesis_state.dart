import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'active_channel.dart';
import 'registered_interchain_account.dart';

/// HostGenesisState defines the interchain accounts host genesis state
class HostGenesisState extends CosmosMessage {
  final List<ActiveChannel> activeChannels;
  final List<RegisteredInterchainAccount> interchainAccounts;
  final String? port;
  final InterchainAccountsControllerParams params;
  HostGenesisState(
      {required List<ActiveChannel> activeChannels,
      required List<RegisteredInterchainAccount> interchainAccounts,
      this.port,
      required this.params})
      : activeChannels = activeChannels.immutable,
        interchainAccounts = interchainAccounts.immutable;
  factory HostGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return HostGenesisState(
        activeChannels: decode
            .getFields(1)
            .map((e) => ActiveChannel.deserialize(e))
            .toList(),
        interchainAccounts: decode
            .getFields(2)
            .map((e) => RegisteredInterchainAccount.deserialize(e))
            .toList(),
        port: decode.getField(3),
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
      "port": port,
      "params": params.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.hostGenesisState.typeUrl;

  @override
  List get values => [activeChannels, interchainAccounts, port, params];
}
