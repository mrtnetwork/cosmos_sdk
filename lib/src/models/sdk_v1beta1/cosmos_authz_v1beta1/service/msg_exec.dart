import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_exec_response.dart';

/// Exec attempts to execute the provided messages using authorizations granted to the grantee.
/// Each message should have only one signer corresponding to the granter of the authorization.
class AuthzExec extends AuthzV1Beta1Service<AuthzMsgExecResponse> {
  final CosmosBaseAddress? grantee;

  /// Execute Msg.
  /// The x/authz will try to find a grant matching (msg.signers, grantee, MsgTypeURL(msg))
  /// triple and validate it.
  final List<Any> msgs;
  AuthzExec({this.grantee, required List<Any> msgs}) : msgs = msgs.immutable;
  factory AuthzExec.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzExec(
      grantee: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      msgs:
          decode
              .getFields<List<int>>(2)
              .map((e) => Any.deserialize(e))
              .toList(),
    );
  }
  factory AuthzExec.fromJson(Map<String, dynamic> json) {
    return AuthzExec(
      grantee: json.maybeAs<CosmosBaseAddress, String>(
        key: "grantee",
        onValue: (e) => CosmosBaseAddress(e),
      ),
      msgs:
          json
              .asListOfMap("msgs", throwOnNull: false)!
              .map((e) => Any.fromJson(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "grantee": grantee?.address,
      "msgs": msgs.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => AuthzV1beta1Types.authzMsgExec;

  @override
  List get values => [grantee, msgs];

  @override
  List<String?> get signers => [grantee?.address];

  @override
  AuthzMsgExecResponse onResponse(List<int> bytes) {
    return AuthzMsgExecResponse.deserialize(bytes);
  }
}
