import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/messages/auth_params.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
/// Since: cosmos-sdk 0.47
class AuthMsgUpdateParams
    extends AuthV1Beta1Service<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress authority;

  /// params defines the x/auth parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final AuthParams params;

  const AuthMsgUpdateParams({required this.authority, required this.params});
  factory AuthMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthMsgUpdateParams(
        authority: CosmosBaseAddress(decode.getField(1)),
        params: AuthParams.deserialize(decode.getField(2)));
  }
  factory AuthMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return AuthMsgUpdateParams(
        authority: CosmosBaseAddress(json.as("authority")),
        params: AuthParams.fromJson(json.asMap("params")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority.address,
      "params": params.toJson(),
    };
  }

  @override
  List get values => [authority, params];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.msgUpdateAuthParams;

  @override
  List<String?> get signers => [authority.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        AuthV1beta1Types.msgUpdateParamsResponse);
  }
}
