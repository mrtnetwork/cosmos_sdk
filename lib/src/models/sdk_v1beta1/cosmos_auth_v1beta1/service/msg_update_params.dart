import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/auth_params.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
/// Since: cosmos-sdk 0.47
class AuthMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final BaseAddress authority;

  /// params defines the x/auth parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final AuthParams params;

  const AuthMsgUpdateParams({required this.authority, required this.params});
  factory AuthMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthMsgUpdateParams(
        authority: BaseAddress(decode.getField(1)),
        params: AuthParams.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority,
      "params": params.toJson(),
    };
  }

  @override
  List get values => [authority, params];

  @override
  String get typeUrl => AuthV1beta1Types.msgUpdateAuthParams.typeUrl;

  @override
  String get service => AuthV1beta1Types.updateParams.typeUrl;

  @override
  List<String?> get signers => [authority.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        AuthV1beta1Types.msgUpdateParamsResponse.typeUrl);
  }
}
