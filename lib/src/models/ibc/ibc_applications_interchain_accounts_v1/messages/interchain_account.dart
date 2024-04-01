import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/base_account.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// An InterchainAccount is defined as a BaseAccount & the address of the account owner on the controller chain
class InterchainAccount extends CosmosMessage {
  final BaseAccount? baseAccount;
  final String? accountOwner;
  const InterchainAccount({this.baseAccount, this.accountOwner});
  factory InterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccount(
      baseAccount: decode
          .getResult(1)
          ?.to<BaseAccount, List<int>>((e) => BaseAccount.deserialize(e)),
      accountOwner: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "base_account": baseAccount?.toJson(),
      "account_owner": accountOwner
    };
  }

  @override
  String get typeUrl => IbcTypes.interchainAccount.typeUrl;

  @override
  List get values => [baseAccount, accountOwner];
}
