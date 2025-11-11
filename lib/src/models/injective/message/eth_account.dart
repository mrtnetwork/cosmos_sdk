import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/injective/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class InjectiveTypesV1beta1EthAccount extends CosmosBaseAccount {
  @override
  final BaseAccount baseAccount;
  final String codeHash;
  const InjectiveTypesV1beta1EthAccount(
      {required this.baseAccount, required this.codeHash});
  factory InjectiveTypesV1beta1EthAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InjectiveTypesV1beta1EthAccount(
        baseAccount: BaseAccount.deserialize(decode.getField(1)),
        codeHash: CosmosUtils.toBase64(decode.getField(2)));
  }
  factory InjectiveTypesV1beta1EthAccount.fromJson(Map<String, dynamic> json) {
    return InjectiveTypesV1beta1EthAccount(
        baseAccount: BaseAccount.fromJson(json["base_account"]),
        codeHash: json["code_hash"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"base_account": baseAccount.toJson(), "code_hash": codeHash};
  }

  @override
  TypeUrl get typeUrl => InjectiveTypes.ethAccount;

  @override
  List get values => [baseAccount, codeHash];
}
