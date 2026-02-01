import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/cosmos_bank_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class BankV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const BankV1Beta1Service();

  static T? fromJson<T extends BankV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = BankV1beta1Types.findService(typeUrl);
    final BankV1Beta1Service? service =
        switch (type) {
              BankV1beta1Types.msgBurn => MsgBurn.fromJson(json),
              BankV1beta1Types.msgMultiSend => MsgMultiSend.fromJson(json),
              BankV1beta1Types.msgSend => MsgSend.fromJson(json),
              BankV1beta1Types.msgSetSendEnabled => MsgSetSendEnabled.fromJson(
                json,
              ),
              BankV1beta1Types.msgUpdateParams => BankMsgUpdateParams.fromJson(
                json,
              ),
              _ => null,
            }
            as BankV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid BankV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends BankV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = BankV1beta1Types.findService(typeUrl);
    final BankV1Beta1Service? service =
        switch (type) {
              BankV1beta1Types.msgBurn => MsgBurn.deserialize(bytes),
              BankV1beta1Types.msgMultiSend => MsgMultiSend.deserialize(bytes),
              BankV1beta1Types.msgSend => MsgSend.deserialize(bytes),
              BankV1beta1Types.msgSetSendEnabled =>
                MsgSetSendEnabled.deserialize(bytes),
              BankV1beta1Types.msgUpdateParams =>
                BankMsgUpdateParams.deserialize(bytes),
              _ => null,
            }
            as BankV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid BankV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
