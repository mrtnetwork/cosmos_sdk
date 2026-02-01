import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// An InterchainAccount is defined as a BaseAccount & the address of the account owner on the controller chain
class InterchainAccount extends CosmosBaseAccount {
  final BaseAccount? account;
  final String? accountOwner;
  const InterchainAccount({this.account, this.accountOwner});
  factory InterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccount(
      account: decode
          .getResult(1)
          ?.to<BaseAccount, List<int>>((e) => BaseAccount.deserialize(e)),
      accountOwner: decode.getField(2),
    );
  }

  factory InterchainAccount.fromJson(Map<String, dynamic> json) {
    return InterchainAccount(
      account: json.valueTo<BaseAccount, Map<String, dynamic>>(
        key: "base_account",
        parse: (e) => BaseAccount.fromJson(e),
      ),
      accountOwner: json.valueAs("account_owner"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"base_account": account?.toJson(), "account_owner": accountOwner};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccount;

  @override
  List get values => [account, accountOwner];

  @override
  BaseAccount get baseAccount {
    final baseAccount = account;
    if (baseAccount == null) {
      throw DartCosmosSdkPluginException("Missing base account");
    }
    return baseAccount;
  }
}
