import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/service/msg_verify_invariant.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class CrisisV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const CrisisV1Beta1Service();

  static T? fromJson<T extends CrisisV1Beta1Service>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = CrisisV1beta1.findService(typeUrl);
    final CrisisV1Beta1Service? service = switch (type) {
      CrisisV1beta1.crisisMsgUpdateParams =>
        CrisisMsgUpdateParams.fromJson(json),
      CrisisV1beta1.msgVerifyInvariant => MsgVerifyInvariant.fromJson(json),
      _ => null
    } as CrisisV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CrisisV1beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends CrisisV1Beta1Service>(
      {required String typeUrl, required List<int> bytes}) {
    final type = CrisisV1beta1.findService(typeUrl);
    final CrisisV1Beta1Service? service = switch (type) {
      CrisisV1beta1.crisisMsgUpdateParams =>
        CrisisMsgUpdateParams.deserialize(bytes),
      CrisisV1beta1.msgVerifyInvariant => MsgVerifyInvariant.deserialize(bytes),
      _ => null
    } as CrisisV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CrisisV1beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
