import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/cosmos_authz_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class AuthzV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const AuthzV1Beta1Service();

  static T? fromJson<T extends AuthzV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = AuthzV1beta1Types.findService(typeUrl);
    final AuthzV1Beta1Service? service =
        switch (type) {
              AuthzV1beta1Types.authzMsgExec => AuthzExec.fromJson(json),
              AuthzV1beta1Types.authzMsgGrant => AuthzMsgGrant.fromJson(json),
              AuthzV1beta1Types.authzMsgPruneExpiredGrants =>
                AuthzMsgPruneExpiredGrants.fromJson(json),
              AuthzV1beta1Types.authzMsgRevoke => AuthzMsgRevoke.fromJson(json),
              _ => null,
            }
            as AuthzV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid AuthzV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends AuthzV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = AuthzV1beta1Types.findService(typeUrl);
    final AuthzV1Beta1Service? service =
        switch (type) {
              AuthzV1beta1Types.authzMsgExec => AuthzExec.deserialize(bytes),
              AuthzV1beta1Types.authzMsgGrant => AuthzMsgGrant.deserialize(
                bytes,
              ),
              AuthzV1beta1Types.authzMsgPruneExpiredGrants =>
                AuthzMsgPruneExpiredGrants.deserialize(bytes),
              AuthzV1beta1Types.authzMsgRevoke => AuthzMsgRevoke.deserialize(
                bytes,
              ),
              _ => null,
            }
            as AuthzV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid AuthzV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
