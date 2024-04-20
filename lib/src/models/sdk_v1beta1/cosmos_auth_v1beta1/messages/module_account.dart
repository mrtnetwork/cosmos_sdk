import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ModuleAccount defines an account for modules that holds coins on a pool.
class ModuleAccount extends CosmosBaseAccount {
  @override
  final BaseAccount baseAccount;
  final String name;
  final List<String> permissions;

  const ModuleAccount(
      {required this.baseAccount,
      required this.name,
      required this.permissions});
  factory ModuleAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ModuleAccount(
        baseAccount: BaseAccount.deserialize(decode.getField(1)),
        name: decode.getField(2),
        permissions: decode.getFields<String>(3));
  }
  factory ModuleAccount.fromRpc(Map<String, dynamic> json) {
    return ModuleAccount(
        baseAccount: BaseAccount.fromRpc(json["base_account"]),
        name: json["name"],
        permissions: (json["permissions"] as List).cast());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "base_account": baseAccount.toJson(),
      "name": name,
      "permissions": permissions
    };
  }

  @override
  List get values => [baseAccount, name, permissions];

  @override
  String get typeUrl => AuthV1beta1Types.moduleAccount.typeUrl;
}
