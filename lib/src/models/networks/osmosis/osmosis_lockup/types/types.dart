import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisLockupTypes extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisLockupTypes._(this.typeUrl, {this.rpc});

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

  static const OsmosisLockupTypes moduleBalanceRequest =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleBalanceRequest");
  static const OsmosisLockupTypes moduleBalanceResponse =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleBalanceResponse");
  static const OsmosisLockupTypes moduleLockedAmountRequest =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleLockedAmountRequest");
  static const OsmosisLockupTypes moduleLockedAmountResponse =
      OsmosisLockupTypes._("/osmosis.lockup.ModuleLockedAmountResponse");

  static const OsmosisLockupTypes accountUnlockableCoinsRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockableCoinsRequest");
  static const OsmosisLockupTypes accountUnlockableCoinsResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockableCoinsResponse");

  static const OsmosisLockupTypes accountUnlockingCoinsRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockingCoinsRequest");
  static const OsmosisLockupTypes accountUnlockingCoinsResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockingCoinsResponse");
  static const OsmosisLockupTypes accountLockedCoinsRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedCoinsRequest");
  static const OsmosisLockupTypes accountLockedCoinsResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedCoinsResponse");
  static const OsmosisLockupTypes accountLockedPastTimeRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedPastTimeRequest");
  static const OsmosisLockupTypes accountLockedPastTimeResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedPastTimeResponse");
  static const OsmosisLockupTypes accountLockedPastTimeNotUnlockingOnlyRequest =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedPastTimeNotUnlockingOnlyRequest");
  static const OsmosisLockupTypes
      accountLockedPastTimeNotUnlockingOnlyResponse = OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedPastTimeNotUnlockingOnlyResponse");
  static const OsmosisLockupTypes accountUnlockedBeforeTimeRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockedBeforeTimeRequest");
  static const OsmosisLockupTypes accountUnlockedBeforeTimeResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountUnlockedBeforeTimeResponse");
  static const OsmosisLockupTypes accountLockedPastTimeDenomRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedPastTimeDenomRequest");
  static const OsmosisLockupTypes accountLockedPastTimeDenomResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedPastTimeDenomResponse");

  static const OsmosisLockupTypes lockedDenomRequest =
      OsmosisLockupTypes._("/osmosis.lockup.LockedDenomRequest");
  static const OsmosisLockupTypes lockedDenomResponse =
      OsmosisLockupTypes._("/osmosis.lockup.LockedDenomResponse");

  static const OsmosisLockupTypes lockedRequest =
      OsmosisLockupTypes._("/osmosis.lockup.LockedRequest");
  static const OsmosisLockupTypes lockedResponse =
      OsmosisLockupTypes._("/osmosis.lockup.LockedResponse");
  static const OsmosisLockupTypes syntheticLockupsByLockupIDRequest =
      OsmosisLockupTypes._("/osmosis.lockup.SyntheticLockupsByLockupIDRequest");
  static const OsmosisLockupTypes syntheticLockupsByLockupIDResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.SyntheticLockupsByLockupIDResponse");
  static const OsmosisLockupTypes accountLockedLongerDurationRequest =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationRequest");
  static const OsmosisLockupTypes accountLockedLongerDurationResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationResponse");
  static const OsmosisLockupTypes accountLockedDurationRequest =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedDurationRequest");
  static const OsmosisLockupTypes accountLockedDurationResponse =
      OsmosisLockupTypes._("/osmosis.lockup.AccountLockedDurationResponse");
  static const OsmosisLockupTypes
      accountLockedLongerDurationNotUnlockingOnlyRequest = OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationNotUnlockingOnlyRequest");
  static const OsmosisLockupTypes
      accountLockedLongerDurationNotUnlockingOnlyResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationNotUnlockingOnlyResponse");
  static const OsmosisLockupTypes accountLockedLongerDurationDenomResponse =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationDenomResponse");
  static const OsmosisLockupTypes accountLockedLongerDurationDenomRequest =
      OsmosisLockupTypes._(
          "/osmosis.lockup.AccountLockedLongerDurationDenomRequest");

  ///
  static const OsmosisLockupTypes accountLockedLongerDurationDenom =
      OsmosisLockupTypes._(
          "/osmosis.lockup.Query/AccountLockedLongerDurationDenom",
          rpc:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration_denom/:owner");

  static const OsmosisLockupTypes accountLockedLongerDurationNotUnlockingOnly =
      OsmosisLockupTypes._(
          "/osmosis.lockup.Query/AccountLockedLongerDurationNotUnlockingOnly",
          rpc:
              "/osmosis/lockup/v1beta1/account_locked_longer_duration_not_unlocking_only/:owner");
  static const OsmosisLockupTypes accountLockedDuration = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/AccountLockedDuration",
      rpc: "/osmosis/lockup/v1beta1/account_locked_duration/:owner");
  static const OsmosisLockupTypes syntheticLockupsByLockupID =
      OsmosisLockupTypes._("/osmosis.lockup.Query/SyntheticLockupsByLockupID",
          rpc: "/osmosis/lockup/v1beta1/synthetic_lockups_by_lock_id/:lock_id");
  static const OsmosisLockupTypes lockedByID = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/LockedByID",
      rpc: "/osmosis/lockup/v1beta1/locked_by_id/:lock_id");
  static const OsmosisLockupTypes lockedDenom = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/LockedDenomRequest",
      rpc: "/osmosis/lockup/v1beta1/locked_denom");
  static const OsmosisLockupTypes accountLockedPastTimeDenom =
      OsmosisLockupTypes._("/osmosis.lockup.Query/AccountLockedPastTimeDenom",
          rpc: "/osmosis/lockup/v1beta1/account_locked_pasttime_denom/:owner");
  static const OsmosisLockupTypes moduleBalance = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/ModuleBalance",
      rpc: "/osmosis/lockup/v1beta1/module_balance");
  static const OsmosisLockupTypes moduleLockedAmount = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/ModuleLockedAmount",
      rpc: "/osmosis/lockup/v1beta1/module_locked_amount");
  static const OsmosisLockupTypes accountUnlockableCoins = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/AccountUnlockableCoins",
      rpc: "/osmosis/lockup/v1beta1/account_unlockable_coins/:owner");
  static const OsmosisLockupTypes accountUnlockingCoins = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/AccountUnlockingCoins",
      rpc: "/osmosis/lockup/v1beta1/account_unlocking_coins/:owner");
  static const OsmosisLockupTypes accountLockedCoins = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/AccountLockedCoins",
      rpc: "/osmosis/lockup/v1beta1/account_locked_coins/:owner");
  static const OsmosisLockupTypes accountLockedPastTime = OsmosisLockupTypes._(
      "/osmosis.lockup.Query/AccountLockedPastTime",
      rpc: "/osmosis/lockup/v1beta1/account_locked_pasttime/:owner");
  static const OsmosisLockupTypes accountLockedPastTimeNotUnlockingOnly =
      OsmosisLockupTypes._(
          "/osmosis.lockup.Query/AccountLockedPastTimeNotUnlockingOnly",
          rpc:
              "/osmosis/lockup/v1beta1/account_locked_pasttime_not_unlocking_only/:owner");
  static const OsmosisLockupTypes accountUnlockedBeforeTime =
      OsmosisLockupTypes._("/osmosis.lockup.Query/AccountUnlockedBeforeTime",
          rpc: "/osmosis/lockup/v1beta1/account_unlocked_before_time/:owner");
  static const OsmosisLockupTypes accountLockedLongerDuration =
      OsmosisLockupTypes._("/osmosis.lockup.Query/AccountLockedLongerDuration",
          rpc: "/osmosis/lockup/v1beta1/account_locked_longer_duration/:owner");

  /// service
  static const OsmosisLockupTypes lockTokens =
      OsmosisLockupTypes._("/osmosis.lockup.Msg/LockTokens");
  static const OsmosisLockupTypes beginUnlockingAll =
      OsmosisLockupTypes._("/osmosis.lockup.Msg/BeginUnlockingAll");
  static const OsmosisLockupTypes beginUnlocking =
      OsmosisLockupTypes._("/osmosis.lockup.Msg/BeginUnlocking");
  static const OsmosisLockupTypes extendLockup =
      OsmosisLockupTypes._("/osmosis.lockup.Msg/ExtendLockup");
}
