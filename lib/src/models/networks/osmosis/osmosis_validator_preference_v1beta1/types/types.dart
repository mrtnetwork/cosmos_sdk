import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisValidatorPreferenceV1beta1Types extends TypeUrl {
  const OsmosisValidatorPreferenceV1beta1Types._(super.typeUrl,
      {super.query, super.rpc});

  static const OsmosisValidatorPreferenceV1beta1Types validatorPreference =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.ValidatorPreference");

  static const OsmosisValidatorPreferenceV1beta1Types validatorSetPreferences =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.ValidatorSetPreferences");

  static const OsmosisValidatorPreferenceV1beta1Types
      msgSetValidatorSetPreference = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgSetValidatorSetPreference");
  static const OsmosisValidatorPreferenceV1beta1Types
      msgSetValidatorSetPreferenceResponse =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgSetValidatorSetPreferenceResponse");

  static const OsmosisValidatorPreferenceV1beta1Types
      msgDelegateToValidatorSet = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.Msg.DelegateToValidatorSet");
  static const OsmosisValidatorPreferenceV1beta1Types
      msgDelegateToValidatorSetResponse =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgDelegateToValidatorSetResponse");

  static const OsmosisValidatorPreferenceV1beta1Types
      msgUndelegateFromValidatorSet = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgUndelegateFromValidatorSet");
  static const OsmosisValidatorPreferenceV1beta1Types
      msgUndelegateFromValidatorSetResponse =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgUndelegateFromValidatorSetResponse");

  static const OsmosisValidatorPreferenceV1beta1Types
      msgWithdrawDelegationRewards = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgWithdrawDelegationRewards");
  static const OsmosisValidatorPreferenceV1beta1Types
      msgWithdrawDelegationRewardsResponse =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.MsgWithdrawDelegationRewardsResponse");

  static const OsmosisValidatorPreferenceV1beta1Types
      queryUserValidatorPreferences = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.QueryUserValidatorPreferences",
          query:
              "/osmosis.validatorpreference.v1beta1.Query/UserValidatorPreferences",
          rpc: "/osmosis/validator-preference/v1beta1/:user");
  static const OsmosisValidatorPreferenceV1beta1Types
      queryUserValidatorPreferenceResponse =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.QueryUserValidatorPreferenceResponse");

  /// services

  static const OsmosisValidatorPreferenceV1beta1Types
      withdrawDelegationRewards = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.Msg/WithdrawDelegationRewards");
  static const OsmosisValidatorPreferenceV1beta1Types
      undelegateFromValidatorSet = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.Msg/UndelegateFromValidatorSet");
  static const OsmosisValidatorPreferenceV1beta1Types delegateToValidatorSet =
      OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.Msg/DelegateToValidatorSet");
  static const OsmosisValidatorPreferenceV1beta1Types
      setValidatorSetPreference = OsmosisValidatorPreferenceV1beta1Types._(
          "/osmosis.validatorpreference.v1beta1.Msg/SetValidatorSetPreference");
}
