import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisLockupTypes extends TypeUrl {
  const OsmosisLockupTypes._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/osmosis.lockup";
  static const OsmosisLockupTypes periodLock =
      OsmosisLockupTypes._("/osmosis.lockup.PeriodLock");
  static const OsmosisLockupTypes syntheticLock =
      OsmosisLockupTypes._("/osmosis.lockup.SyntheticLock");

  static const OsmosisLockupTypes queryCondition =
      OsmosisLockupTypes._("/osmosis.lockup.QueryCondition");
  static const OsmosisLockupTypes genesisState =
      OsmosisLockupTypes._("/osmosis.lockup.GenesisState");

  static const OsmosisLockupTypes msgLockTokens =
      OsmosisLockupTypes._("/osmosis.lockup.MsgLockTokens");
  static const OsmosisLockupTypes msgLockTokensResponse =
      OsmosisLockupTypes._("/osmosis.lockup.MsgLockTokensResponse");

  static const OsmosisLockupTypes msgBeginUnlockingAll =
      OsmosisLockupTypes._("/osmosis.lockup.MsgBeginUnlockingAll");
  static const OsmosisLockupTypes msgBeginUnlockingAllResponse =
      OsmosisLockupTypes._("/osmosis.lockup.MsgBeginUnlockingAllResponse");

  static const OsmosisLockupTypes msgBeginUnlocking =
      OsmosisLockupTypes._("/osmosis.lockup.MsgBeginUnlocking");
  static const OsmosisLockupTypes msgBeginUnlockingResponse =
      OsmosisLockupTypes._("/osmosis.lockup.MsgBeginUnlockingResponse");

  static const OsmosisLockupTypes msgExtendLockup =
      OsmosisLockupTypes._("/osmosis.lockup.MsgExtendLockup");
  static const OsmosisLockupTypes msgExtendLockupResponse =
      OsmosisLockupTypes._("/osmosis.lockup.MsgExtendLockupResponse");

  static const OsmosisLockupTypes moduleBalanceRequest = OsmosisLockupTypes._(
      "/osmosis.lockup.ModuleBalanceRequest",
      query: "/osmosis.lockup.Query/ModuleBalance",
      rpc: "/osmosis/lockup/v1beta1/module_balance");
  static const OsmosisLockupTypes moduleBalanceResponse =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleBalanceResponse");
  static const OsmosisLockupTypes moduleLockedAmountRequest =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleLockedAmountRequest",
          query: "/osmosis.lockup.Query/ModuleLockedAmount",
          rpc: "/osmosis/lockup/v1beta1/module_locked_amount");
  static const OsmosisLockupTypes moduleLockedAmountResponse =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleLockedAmountResponse");

  static const OsmosisLockupTypes accountUnlockableCoinsRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockableCoinsRequest",
          query: "/osmosis.lockup.Query/AccountUnlockableCoins",
          rpc: "/osmosis/lockup/v1beta1/account_unlockable_coins/:owner");
  static const OsmosisLockupTypes accountUnlockableCoinsResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockableCoinsResponse");

  static const OsmosisLockupTypes accountUnlockingCoinsRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockingCoinsRequest",
          query: "/osmosis.lockup.Query/AccountUnlockingCoins",
          rpc: "/osmosis/lockup/v1beta1/account_unlocking_coins/:owner");
  static const OsmosisLockupTypes accountUnlockingCoinsResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockingCoinsResponse");
  static const OsmosisLockupTypes accountLockedCoinsRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedCoinsRequest",
          query: "/osmosis.lockup.Query/AccountLockedCoins",
          rpc: "/osmosis/lockup/v1beta1/account_locked_coins/:owner");
  static const OsmosisLockupTypes accountLockedCoinsResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedCoinsResponse");
  static const OsmosisLockupTypes accountLockedPastTimeRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedPastTimeRequest",
          query: "/osmosis.lockup.Query/AccountLockedPastTime",
          rpc: "/osmosis/lockup/v1beta1/account_locked_pasttime/:owner");
  static const OsmosisLockupTypes accountLockedPastTimeResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedPastTimeResponse");
  static const OsmosisLockupTypes accountLockedPastTimeNotUnlockingOnlyRequest =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedPastTimeNotUnlockingOnlyRequest",
          query: "/osmosis.lockup.Query/AccountLockedPastTimeNotUnlockingOnly",
          rpc:
              "/osmosis/lockup/v1beta1/account_locked_pasttime_not_unlocking_only/:owner");
  static const OsmosisLockupTypes
      accountLockedPastTimeNotUnlockingOnlyResponse = OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedPastTimeNotUnlockingOnlyResponse");
  static const OsmosisLockupTypes accountUnlockedBeforeTimeRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockedBeforeTimeRequest",
          query: "/osmosis.lockup.Query/AccountUnlockedBeforeTime",
          rpc: "/osmosis/lockup/v1beta1/account_unlocked_before_time/:owner");
  static const OsmosisLockupTypes accountUnlockedBeforeTimeResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockedBeforeTimeResponse");
  static const OsmosisLockupTypes accountLockedPastTimeDenomRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedPastTimeDenomRequest",
          query: "/osmosis.lockup.Query/AccountLockedPastTimeDenom",
          rpc: "/osmosis/lockup/v1beta1/account_locked_pasttime_denom/:owner");
  static const OsmosisLockupTypes accountLockedPastTimeDenomResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedPastTimeDenomResponse");

  static const OsmosisLockupTypes lockedDenomRequest = OsmosisLockupTypes._(
      "/osmosis.lockup.LockedDenomRequest",
      query: "/osmosis.lockup.Query/LockedDenomRequest",
      rpc: "/osmosis/lockup/v1beta1/locked_denom");
  static const OsmosisLockupTypes lockedDenomResponse =
      OsmosisLockupTypes._("/osmosis.lockup.LockedDenomResponse");

  static const OsmosisLockupTypes lockedRequest = OsmosisLockupTypes._(
      "/osmosis.lockup.LockedRequest",
      query: "/osmosis.lockup.Query/LockedByID",
      rpc: "/osmosis/lockup/v1beta1/locked_by_id/:lock_id");
  static const OsmosisLockupTypes lockedResponse =
      OsmosisLockupTypes._("/osmosis.lockup.LockedResponse");
  static const OsmosisLockupTypes syntheticLockupsByLockupIDRequest =
      OsmosisLockupTypes._("/osmosis.lockup.SyntheticLockupsByLockupIDRequest",
          query: "/osmosis.lockup.Query/SyntheticLockupsByLockupID",
          rpc: "/osmosis/lockup/v1beta1/synthetic_lockups_by_lock_id/:lock_id");
  static const OsmosisLockupTypes syntheticLockupsByLockupIDResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.SyntheticLockupsByLockupIDResponse");
  static const OsmosisLockupTypes accountLockedLongerDurationRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedLongerDurationRequest",
          query: "/osmosis.lockup.Query/AccountLockedLongerDuration",
          rpc: "/osmosis/lockup/v1beta1/account_locked_longer_duration/:owner");
  static const OsmosisLockupTypes accountLockedLongerDurationResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationResponse");
  static const OsmosisLockupTypes accountLockedDurationRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedDurationRequest",
          query: "/osmosis.lockup.Query/AccountLockedDuration",
          rpc: "/osmosis/lockup/v1beta1/account_locked_duration/:owner");
  static const OsmosisLockupTypes accountLockedDurationResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedDurationResponse");
  static const OsmosisLockupTypes
      accountLockedLongerDurationNotUnlockingOnlyRequest = OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationNotUnlockingOnlyRequest",
          query:
              "/osmosis.lockup.Query/AccountLockedLongerDurationNotUnlockingOnly",
          rpc:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration_not_unlocking_only/:owner");
  static const OsmosisLockupTypes
      accountLockedLongerDurationNotUnlockingOnlyResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationNotUnlockingOnlyResponse");
  static const OsmosisLockupTypes accountLockedLongerDurationDenomResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationDenomResponse");
  static const OsmosisLockupTypes accountLockedLongerDurationDenomRequest =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationDenomRequest",
          query: "/osmosis.lockup.Query/AccountLockedLongerDurationDenom",
          rpc:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration_denom/:owner");

  static const List<TypeUrl> services = [
    msgBeginUnlockingAll,
    msgBeginUnlocking,
    msgExtendLockup,
    msgLockTokens
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
