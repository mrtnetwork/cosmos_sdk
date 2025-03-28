import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/types_v1/types_v1.dart';
import 'package:cosmos_sdk/src/models/injective/message/eth_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/module_account.dart';
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
      default:
        throw const DartCosmosSdkPluginException("Unsupported account type");
    }
    if (acc is! T) {
      throw DartCosmosSdkPluginException("Invalid account type",
          details: {"account": acc, "Excepted": "$T"});
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

      default:
        throw DartCosmosSdkPluginException("Unsupported account type",
            details: {"type": type});
    }
    if (acc is! T) {
      throw DartCosmosSdkPluginException("Invalid account type",
          details: {"account": acc, "Excepted": "$T"});
    }
    return acc;
  }

  abstract final BaseAccount baseAccount;
}
