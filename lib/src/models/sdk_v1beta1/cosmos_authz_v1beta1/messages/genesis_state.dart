import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/messages/generic_authorization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the authz module's genesis state.
class AuthzGenesisState extends CosmosMessage {
  final List<AuthzGenericAuthorization> authorization;
  AuthzGenesisState({required List<AuthzGenericAuthorization> authorization})
      : authorization = authorization.immutable;
  factory AuthzGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzGenesisState(
        authorization: decode
            .getFields<List<int>>(1)
            .map((e) => AuthzGenericAuthorization.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authorization": authorization.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzGenesisState;

  @override
  List get values => [authorization];
}
