import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class AuthV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const AuthV1Beta1Service();

  static T? fromJson<T extends AuthV1Beta1Service>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = AuthV1beta1Types.findService(typeUrl);
    final AuthV1Beta1Service? service = switch (type) {
      AuthV1beta1Types.msgUpdateAuthParams =>
        AuthMsgUpdateParams.fromJson(json),
      _ => null
    };
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid AuthV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends AuthV1Beta1Service>(
      {required String typeUrl, required List<int> bytes}) {
    final type = AuthV1beta1Types.findService(typeUrl);
    final AuthV1Beta1Service? service = switch (type) {
      AuthV1beta1Types.msgUpdateAuthParams =>
        AuthMsgUpdateParams.deserialize(bytes),
      _ => null
    };
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid AuthV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
