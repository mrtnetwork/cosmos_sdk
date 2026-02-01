import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EthAccount implements the authtypes.AccountI interface and embeds an
/// authtypes.BaseAccount type. It is compatible with the auth AccountKeeper.
class EvmosEthermintTypesV1EthAccount extends CosmosBaseAccount {
  // base_account is an authtypes.BaseAccount
  @override
  final BaseAccount baseAccount;
  // code_hash is the hash calculated from the code contents
  final String codeHash;
  const EvmosEthermintTypesV1EthAccount({
    required this.baseAccount,
    required this.codeHash,
  });
  factory EvmosEthermintTypesV1EthAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintTypesV1EthAccount(
      baseAccount: BaseAccount.deserialize(decode.getField(1)),
      codeHash: decode.getField(2),
    );
  }
  factory EvmosEthermintTypesV1EthAccount.fromJson(Map<String, dynamic> json) {
    return EvmosEthermintTypesV1EthAccount(
      baseAccount: BaseAccount.fromJson(json["base_account"]),
      codeHash: json["code_hash"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"base_account": baseAccount.toJson(), "code_hash": codeHash};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.ethAccount;

  @override
  List get values => [baseAccount, codeHash];
}
