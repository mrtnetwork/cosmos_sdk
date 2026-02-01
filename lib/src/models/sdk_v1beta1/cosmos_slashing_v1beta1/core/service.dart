import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/cosmos_slashing_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class SlashingV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const SlashingV1Beta1Service();

  static T? fromJson<T extends SlashingV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = SlashingV1beta1Types.findService(typeUrl);
    final SlashingV1Beta1Service? service =
        switch (type) {
              SlashingV1beta1Types.slashingMsgUnjail =>
                SlashingMsgUnjail.fromJson(json),
              SlashingV1beta1Types.slashingMsgUpdateParams =>
                SlashingMsgUpdateParams.fromJson(json),
              _ => null,
            }
            as SlashingV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid SlashingV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends SlashingV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = SlashingV1beta1Types.findService(typeUrl);

    final SlashingV1Beta1Service? service =
        switch (type) {
              SlashingV1beta1Types.slashingMsgUnjail =>
                SlashingMsgUnjail.deserialize(bytes),
              SlashingV1beta1Types.slashingMsgUpdateParams =>
                SlashingMsgUpdateParams.deserialize(bytes),
              _ => null,
            }
            as SlashingV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid SlashingV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
