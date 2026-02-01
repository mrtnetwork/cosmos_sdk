import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/service/send.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class NFTV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const NFTV1Beta1Service();

  static T? fromJson<T extends NFTV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = NFTV1beta1Types.findService(typeUrl);
    final NFTV1Beta1Service? service =
        switch (type) {
              NFTV1beta1Types.msgNFTSend => MsgNFTSend.fromJson(json),
              _ => null,
            }
            as NFTV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid NFTV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends NFTV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = NFTV1beta1Types.findService(typeUrl);
    final NFTV1Beta1Service? service =
        switch (type) {
              NFTV1beta1Types.msgNFTSend => MsgNFTSend.deserialize(bytes),
              _ => null,
            }
            as NFTV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid NFTV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
