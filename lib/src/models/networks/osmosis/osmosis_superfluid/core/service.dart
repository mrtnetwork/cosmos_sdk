import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/add_to_concentrated_liquidity_super_fluid_position.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/create_full_range_position_and_super_fluid_delegate.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/lock_and_super_fluid_delegate.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/super_fluid_delegate.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/super_fluid_unbond_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/super_fluid_undelegate.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/super_fluid_undelegate_and_unbond_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/un_pool_white_listed_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/unbond_convert_and_stake.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/services/unlock_and_migrate_shares_to_full_range_concentrated_position.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisSuperfluid<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisSuperfluid();

  static T? fromJson<T extends OsmosisSuperfluid>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisSuperfluidTypes.findService(typeUrl);
    final OsmosisSuperfluid? service =
        switch (type) {
              OsmosisSuperfluidTypes
                  .msgAddToConcentratedLiquiditySuperfluidPosition =>
                OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition.fromJson(
                  json,
                ),
              OsmosisSuperfluidTypes
                  .msgCreateFullRangePositionAndSuperfluidDelegate =>
                OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate.fromJson(
                  json,
                ),
              OsmosisSuperfluidTypes.msgLockAndSuperfluidDelegate =>
                OsmosisSuperfluidMsgLockAndSuperfluidDelegate.fromJson(json),
              OsmosisSuperfluidTypes.msgSuperfluidDelegate =>
                OsmosisSuperfluidMsgSuperfluidDelegate.fromJson(json),
              OsmosisSuperfluidTypes.msgSuperfluidUnbondLock =>
                OsmosisSuperfluidMsgSuperfluidUnbondLock.fromJson(json),
              OsmosisSuperfluidTypes.msgSuperfluidUndelegateAndUnbondLock =>
                OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock.fromJson(
                  json,
                ),
              OsmosisSuperfluidTypes.msgSuperfluidUndelegate =>
                OsmosisSuperfluidMsgSuperfluidUndelegate.fromJson(json),
              OsmosisSuperfluidTypes.msgUnPoolWhitelistedPool =>
                OsmosisSuperfluidMsgUnPoolWhitelistedPool.fromJson(json),
              OsmosisSuperfluidTypes.msgUnbondConvertAndStake =>
                OsmosisSuperfluidMsgUnbondConvertAndStake.fromJson(json),
              OsmosisSuperfluidTypes
                  .msgUnlockAndMigrateSharesToFullRangeConcentratedPosition =>
                OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition.fromJson(
                  json,
                ),
              _ => null,
            }
            as OsmosisSuperfluid?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Superfluid Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisSuperfluid>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisSuperfluidTypes.findService(typeUrl);
    final OsmosisSuperfluid? service =
        switch (type) {
              OsmosisSuperfluidTypes
                  .msgAddToConcentratedLiquiditySuperfluidPosition =>
                OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition.deserialize(
                  bytes,
                ),
              OsmosisSuperfluidTypes
                  .msgCreateFullRangePositionAndSuperfluidDelegate =>
                OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate.deserialize(
                  bytes,
                ),
              OsmosisSuperfluidTypes.msgLockAndSuperfluidDelegate =>
                OsmosisSuperfluidMsgLockAndSuperfluidDelegate.deserialize(
                  bytes,
                ),
              OsmosisSuperfluidTypes.msgSuperfluidDelegate =>
                OsmosisSuperfluidMsgSuperfluidDelegate.deserialize(bytes),
              OsmosisSuperfluidTypes.msgSuperfluidUnbondLock =>
                OsmosisSuperfluidMsgSuperfluidUnbondLock.deserialize(bytes),
              OsmosisSuperfluidTypes.msgSuperfluidUndelegateAndUnbondLock =>
                OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock.deserialize(
                  bytes,
                ),
              OsmosisSuperfluidTypes.msgSuperfluidUndelegate =>
                OsmosisSuperfluidMsgSuperfluidUndelegate.deserialize(bytes),
              OsmosisSuperfluidTypes.msgUnPoolWhitelistedPool =>
                OsmosisSuperfluidMsgUnPoolWhitelistedPool.deserialize(bytes),
              OsmosisSuperfluidTypes.msgUnbondConvertAndStake =>
                OsmosisSuperfluidMsgUnbondConvertAndStake.deserialize(bytes),
              OsmosisSuperfluidTypes
                  .msgUnlockAndMigrateSharesToFullRangeConcentratedPosition =>
                OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition.deserialize(
                  bytes,
                ),
              _ => null,
            }
            as OsmosisSuperfluid?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Superfluid Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
