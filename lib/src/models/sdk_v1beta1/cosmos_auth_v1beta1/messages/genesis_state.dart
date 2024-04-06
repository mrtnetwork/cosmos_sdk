import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/auth_params.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the auth module's genesis state.
class AuthGenesisState extends CosmosMessage {
  /// params defines all the parameters of the module.
  final AuthParams params;

  /// accounts are the accounts present at genesis.
  final List<Any> accounts;

  const AuthGenesisState({required this.params, required this.accounts});
  factory AuthGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthGenesisState(
        params: AuthParams.deserialize(decode.getField(1)),
        accounts: decode.getFields(2).map((e) => Any.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "accounts": accounts.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => AuthV1beta1Types.authGenesisState.typeUrl;

  @override
  List get values => [params, accounts];
}
