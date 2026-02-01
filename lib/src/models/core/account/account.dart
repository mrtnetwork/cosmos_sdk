import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/types_v1/types_v1.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_v1/ibc_applications_interchain_accounts_v1.dart';
import 'package:cosmos_sdk/src/models/injective/message/eth_account.dart';
import 'package:cosmos_sdk/src/models/networks/c4echain/cfevesting/messages/continuous_vesting_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/module_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/cosmos_vesting_v1beta1.dart';
import 'package:cosmos_sdk/src/models/stride/message/priod_vesting_account.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class CosmosBaseAccount extends CosmosMessage {
  const CosmosBaseAccount();
  static T fromAny<T extends CosmosBaseAccount>(Any account) {
    final CosmosBaseAccount acc;
    switch (account.typeUrl) {
      case "/cosmos.auth.v1beta1.BaseAccount":
        acc = BaseAccount.deserialize(account.value);
        break;
      case "/cosmos.auth.v1beta1.ModuleAccount":
        acc = ModuleAccount.deserialize(account.value);
        break;
      case "/ethermint.types.v1.EthAccount":
        acc = EvmosEthermintTypesV1EthAccount.deserialize(account.value);
        break;
      case "/stride.vesting.StridePeriodicVestingAccount":
        acc = StridePeriodicVestingAccount.deserialize(account.value);
        break;
      case "/injective.types.v1beta1.EthAccount":
        acc = InjectiveTypesV1beta1EthAccount.deserialize(account.value);
        break;
      case "/cosmos.vesting.v1beta1.PeriodicVestingAccount":
      case "/vesting.v1beta1.PeriodicVestingAccount":
        acc = PeriodicVestingAccount.deserialize(account.value);
        break;
      case "/cosmos.vesting.v1beta1.ContinuousVestingAccount":
      case "/vesting.v1beta1.ContinuousVestingAccount":
        acc = ContinuousVestingAccount.deserialize(account.value);
        break;
      case "/cosmos.vesting.v1beta1.DelayedVestingAccount":
      case "/vesting.v1beta1.DelayedVestingAccount":
        acc = DelayedVestingAccount.deserialize(account.value);
        break;
      case "/cosmos.vesting.v1beta1.PermanentLockedAccount":
      case "/vesting.v1beta1.PermanentLockedAccount":
        acc = PermanentLockedAccount.deserialize(account.value);
        break;
      case "/chain4energy.c4echain.cfevesting.PeriodicContinuousVestingAccount":
        acc = C4eChiainContinuousVestingAccount.deserialize(account.value);
        break;
      case "/ibc.applications.interchain_accounts.v1.InterchainAccount":
        acc = InterchainAccount.deserialize(account.value);
        break;
      default:
        throw DartCosmosSdkPluginException(
          "Unsupported account type ${account.typeUrl}",
        );
    }
    if (acc is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid account type",
        details: {"account": acc, "Excepted": "$T"},
      );
    }
    return acc;
  }

  static T fromJson<T extends CosmosBaseAccount>(Map<String, dynamic> json) {
    final CosmosBaseAccount acc;
    final type = json["@type"];
    switch (type) {
      case "/cosmos.auth.v1beta1.BaseAccount":
        acc = BaseAccount.fromJson(json);
        break;
      case "/cosmos.auth.v1beta1.ModuleAccount":
        acc = ModuleAccount.fromJson(json);
        break;
      case "/ethermint.types.v1.EthAccount":
        acc = EvmosEthermintTypesV1EthAccount.fromJson(json);
        break;
      case "/stride.vesting.StridePeriodicVestingAccount":
        acc = StridePeriodicVestingAccount.fromJson(json);
        break;
      case "/injective.types.v1beta1.EthAccount":
        acc = InjectiveTypesV1beta1EthAccount.fromJson(json);
        break;
      case "/cosmos.vesting.v1beta1.PeriodicVestingAccount":
      case "/vesting.v1beta1.PeriodicVestingAccount":
        acc = PeriodicVestingAccount.fromJson(json);
        break;
      case "/cosmos.vesting.v1beta1.ContinuousVestingAccount":
      case "/vesting.v1beta1.ContinuousVestingAccount":
        acc = ContinuousVestingAccount.fromJson(json);
        break;
      case "/vesting.v1beta1.DelayedVestingAccount":
      case "/cosmos.vesting.v1beta1.DelayedVestingAccount":
        acc = DelayedVestingAccount.fromJson(json);
        break;
      case "/vesting.v1beta1.PermanentLockedAccount":
      case "/cosmos.vesting.v1beta1.PermanentLockedAccount":
        acc = PermanentLockedAccount.fromJson(json);
        break;
      case "/chain4energy.c4echain.cfevesting.PeriodicContinuousVestingAccount":
        acc = C4eChiainContinuousVestingAccount.fromJson(json);
        break;
      case "/ibc.applications.interchain_accounts.v1.InterchainAccount":
        acc = InterchainAccount.fromJson(json);
        break;
      default:
        throw DartCosmosSdkPluginException(
          "Unsupported account type",
          details: {"type": type},
        );
    }
    if (acc is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid account type",
        details: {"account": acc, "Excepted": "$T"},
      );
    }
    return acc;
  }

  abstract final BaseAccount baseAccount;
}
