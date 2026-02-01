import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class MintV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const MintV1Beta1Service();

  static T? fromJson<T extends MintV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = MintV1beta1Types.findService(typeUrl);
    final MintV1Beta1Service? service =
        switch (type) {
              MintV1beta1Types.msgUpdateMintParams =>
                MsgUpdateMintParams.fromJson(json),
              _ => null,
            }
            as MintV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid MintV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends MintV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = MintV1beta1Types.findService(typeUrl);
    final MintV1Beta1Service? service =
        switch (type) {
              MintV1beta1Types.msgUpdateMintParams =>
                MsgUpdateMintParams.deserialize(bytes),
              _ => null,
            }
            as MintV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid MintV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
