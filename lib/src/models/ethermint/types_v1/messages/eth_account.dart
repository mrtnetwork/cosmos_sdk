import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/ethermint/types_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EthAccount implements the authtypes.AccountI interface and embeds an
/// authtypes.BaseAccount type. It is compatible with the auth AccountKeeper.
class EthermintTypesV1EthAccount extends CosmosBaseAccount {
  // base_account is an authtypes.BaseAccount
  @override
  final BaseAccount baseAccount;
  // code_hash is the hash calculated from the code contents
  final String codeHash;
  const EthermintTypesV1EthAccount(
      {required this.baseAccount, required this.codeHash});
  factory EthermintTypesV1EthAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EthermintTypesV1EthAccount(
        baseAccount: BaseAccount.deserialize(decode.getField(1)),
        codeHash: decode.getField(2));
  }
  factory EthermintTypesV1EthAccount.fromRpc(Map<String, dynamic> json) {
    return EthermintTypesV1EthAccount(
        baseAccount: BaseAccount.fromRpc(json["base_account"]),
        codeHash: json["code_hash"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"base_account": baseAccount.toJson(), "code_hash": codeHash};
  }

  @override
  TypeUrl get typeUrl => EthermintTypesV1Types.ethAccount;

  @override
  List get values => [baseAccount, codeHash];
}
