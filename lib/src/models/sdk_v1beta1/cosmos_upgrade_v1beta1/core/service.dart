import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/service/msg_cancel_upgrade.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/service/msg_software_upgrade.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class UpgradeV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const UpgradeV1Beta1Service();

  static T? fromJson<T extends UpgradeV1Beta1Service>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = UpgradeV1beta1Types.findService(typeUrl);
    final UpgradeV1Beta1Service? service = switch (type) {
      UpgradeV1beta1Types.msgCancelUpgrade => MsgCancelUpgrade.fromJson(json),
      UpgradeV1beta1Types.msgSoftwareUpgrade =>
        MsgSoftwareUpgrade.fromJson(json),
      _ => null
    } as UpgradeV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid UpgradeV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends UpgradeV1Beta1Service>(
      {required String typeUrl, required List<int> bytes}) {
    final type = UpgradeV1beta1Types.findService(typeUrl);
    final UpgradeV1Beta1Service? service = switch (type) {
      UpgradeV1beta1Types.msgCancelUpgrade =>
        MsgCancelUpgrade.deserialize(bytes),
      UpgradeV1beta1Types.msgSoftwareUpgrade =>
        MsgSoftwareUpgrade.deserialize(bytes),
      _ => null
    } as UpgradeV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid UpgradeV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
