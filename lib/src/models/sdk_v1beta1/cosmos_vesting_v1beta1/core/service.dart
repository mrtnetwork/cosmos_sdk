import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/service/create_periodic_vesting_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/service/create_permanent_locked_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/service/create_vesting_account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class VestingV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const VestingV1Beta1Service();

  static T? fromJson<T extends VestingV1Beta1Service>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = VestingV1beta1Types.findService(typeUrl);
    final VestingV1Beta1Service? service = switch (type) {
      VestingV1beta1Types.msgCreatePeriodicVestingAccount =>
        MsgCreatePeriodicVestingAccount.fromJson(json),
      VestingV1beta1Types.msgCreatePermanentLockedAccount =>
        MsgCreatePermanentLockedAccount.fromJson(json),
      VestingV1beta1Types.msgCreateVestingAccount =>
        MsgCreateVestingAccount.fromJson(json),
      _ => null
    } as VestingV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid VestingV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends VestingV1Beta1Service>(
      {required String typeUrl, required List<int> bytes}) {
    final type = VestingV1beta1Types.findService(typeUrl);
    final VestingV1Beta1Service? service = switch (type) {
      VestingV1beta1Types.msgCreatePeriodicVestingAccount =>
        MsgCreatePeriodicVestingAccount.deserialize(bytes),
      VestingV1beta1Types.msgCreatePermanentLockedAccount =>
        MsgCreatePermanentLockedAccount.deserialize(bytes),
      VestingV1beta1Types.msgCreateVestingAccount =>
        MsgCreateVestingAccount.deserialize(bytes),
      _ => null
    } as VestingV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid VestingV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
