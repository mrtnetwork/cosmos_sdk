import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'msg_exec_response.dart';

/// Exec attempts to execute the provided messages using authorizations granted to the grantee.
/// Each message should have only one signer corresponding to the granter of the authorization.
class AuthzExec extends CosmosMessage
    with ServiceMessage<AuthzMsgExecResponse> {
  final BaseAddress? grantee;

  /// Execute Msg.
  /// The x/authz will try to find a grant matching (msg.signers[0], grantee, MsgTypeURL(msg))
  /// triple and validate it.
  final List<Any> msgs;
  AuthzExec({this.grantee, required List<Any> msgs}) : msgs = msgs.mutable;
  factory AuthzExec.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzExec(
        grantee:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        msgs: decode.getFields(2).map((e) => Any.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get service => AuthzV1beta1Types.authzExec.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "grantee": grantee?.address,
      "msgs": msgs.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzMsgExec.typeUrl;

  @override
  List get values => [grantee, msgs];

  @override
  List<String?> get signers => [grantee?.address];

  @override
  AuthzMsgExecResponse onResponse(List<int> bytes) {
    return AuthzMsgExecResponse.deserialize(bytes);
  }
}
