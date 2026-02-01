import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/service/msg_grant_allowance.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/service/msg_prune_allowances.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/service/msg_revoke_allowance.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class FeeGrantV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const FeeGrantV1Beta1Service();

  static T? fromJson<T extends FeeGrantV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = FeegrantV1beta1Types.findService(typeUrl);

    final FeeGrantV1Beta1Service? service =
        switch (type) {
              FeegrantV1beta1Types.msgGrantAllowance =>
                MsgGrantAllowance.fromJson(json),
              FeegrantV1beta1Types.msgPruneAllowances =>
                MsgPruneAllowances.fromJson(json),
              FeegrantV1beta1Types.msgRevokeAllowance =>
                MsgRevokeAllowance.fromJson(json),
              _ => null,
            }
            as FeeGrantV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid FeeGrantV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends FeeGrantV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = FeegrantV1beta1Types.findService(typeUrl);

    final FeeGrantV1Beta1Service? service =
        switch (type) {
              FeegrantV1beta1Types.msgGrantAllowance =>
                MsgGrantAllowance.deserialize(bytes),
              FeegrantV1beta1Types.msgPruneAllowances =>
                MsgPruneAllowances.deserialize(bytes),
              FeegrantV1beta1Types.msgRevokeAllowance =>
                MsgRevokeAllowance.deserialize(bytes),
              _ => null,
            }
            as FeeGrantV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid FeeGrantV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
