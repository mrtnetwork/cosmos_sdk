class VestingV1beta1Types {
  final String typeUrl;
  const VestingV1beta1Types._(this.typeUrl);
  static const VestingV1beta1Types baseVestingAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.BaseVestingAccount");
  static const VestingV1beta1Types continuousVestingAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.ContinuousVestingAccount");
  static const VestingV1beta1Types delayedVestingAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.DelayedVestingAccount");
  static const VestingV1beta1Types period =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.Period");
  static const VestingV1beta1Types periodicVestingAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.PeriodicVestingAccount");
  static const VestingV1beta1Types permanentLockedAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.PermanentLockedAccount");
  static const VestingV1beta1Types msgCreateVestingAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.MsgCreateVestingAccount");
  static const VestingV1beta1Types msgCreateVestingAccountResponse =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.MsgCreateVestingAccountResponse");
  static const VestingV1beta1Types msgCreatePermanentLockedAccount =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.MsgCreatePermanentLockedAccount");
  static const VestingV1beta1Types msgCreatePermanentLockedAccountResponse =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.MsgCreatePermanentLockedAccountResponse");
  static const VestingV1beta1Types msgCreatePeriodicVestingAccount =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.MsgCreatePeriodicVestingAccount");
  static const VestingV1beta1Types msgCreatePeriodicVestingAccountResponse =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.MsgCreatePeriodicVestingAccountResponse");

  static const VestingV1beta1Types createVestingAccount =
      VestingV1beta1Types._("/cosmos.vesting.v1beta1.Msg/CreateVestingAccount");
  static const VestingV1beta1Types createPermanentLockedAccount =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.Msg/CreatePermanentLockedAccount");
  static const VestingV1beta1Types createPeriodicVestingAccount =
      VestingV1beta1Types._(
          "/cosmos.vesting.v1beta1.Msg/CreatePeriodicVestingAccount");
}
