import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/metadata.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/send_enabled.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'balance.dart';
import 'params.dart';

/// GenesisState defines the bank module's genesis state.
class BankGenesisState extends CosmosMessage {
  /// params defines all the parameters of the module.
  final BankParams params;

  /// balances is an array containing the balances of all the accounts.
  final List<Balance> balances;

  /// supply represents the total supply. If it is left empty, then supply will be calculated based on the provided
  /// balances. Otherwise, it will be used to validate that the sum of the balances equals this amount.
  final List<Coin> supply;

  /// denom_metadata defines the metadata of the different coins.
  final List<Metadata> denomMetadata;

  /// send_enabled defines the denoms where send is enabled or disabled.
  ///
  /// Since: cosmos-sdk 0.47
  final List<SendEnabled> sendEnabled;

  const BankGenesisState({
    required this.params,
    required this.balances,
    required this.supply,
    required this.denomMetadata,
    required this.sendEnabled,
  });
  factory BankGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BankGenesisState(
      params: BankParams.deserialize(decode.getField(1)),
      balances: decode
          .getFileds<List<int>>(2)
          .map((e) => Balance.deserialize(e))
          .toList(),
      supply: decode
          .getFileds<List<int>>(3)
          .map((e) => Coin.deserialize(e))
          .toList(),
      denomMetadata: decode
          .getFileds<List<int>>(4)
          .map((e) => Metadata.deserialize(e))
          .toList(),
      sendEnabled: decode
          .getFileds<List<int>>(5)
          .map((e) => SendEnabled.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "balances": balances.map((e) => e.toJson()).toList(),
      "supply": supply.map((e) => e.toJson()).toList(),
      "denom_metadata": denomMetadata.map((e) => e.toJson()).toList(),
      "send_enabled": sendEnabled.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [params, balances, supply, denomMetadata, sendEnabled];

  @override
  @override
  String get typeUrl => BankV1beta1Types.genesisState.typeUrl;
}
