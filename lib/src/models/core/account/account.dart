import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/module_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class CosmosBaseAccount extends CosmosMessage {
  const CosmosBaseAccount();
  static T fromAny<T extends CosmosBaseAccount>(Any account) {
    final CosmosBaseAccount acc;
    final type = AuthV1beta1Types.fromValue(account.typeUrl);
    switch (type) {
      case AuthV1beta1Types.baseAccount:
        acc = BaseAccount.deserialize(account.value);
        break;
      case AuthV1beta1Types.moduleAccount:
        acc = ModuleAccount.deserialize(account.value);
        break;
      default:
        throw const MessageException("Unsupported account type");
    }
    if (acc is! T) {
      throw MessageException("Invalid account type",
          details: {"account": acc, "Excepted": "$T"});
    }
    return acc;
  }

  static T fromRpc<T extends CosmosBaseAccount>(Map<String, dynamic> json) {
    final CosmosBaseAccount acc;
    final type = AuthV1beta1Types.fromValue(json["@type"]);
    switch (type) {
      case AuthV1beta1Types.baseAccount:
        acc = BaseAccount.fromRpc(json);
        break;
      case AuthV1beta1Types.moduleAccount:
        acc = ModuleAccount.fromRpc(json);
        break;
      default:
        throw MessageException("Unsupported account type",
            details: {"type": type});
    }
    if (acc is! T) {
      throw MessageException("Invalid account type",
          details: {"account": acc, "Excepted": "$T"});
    }
    return acc;
  }

  abstract final BaseAccount baseAccount;
}
