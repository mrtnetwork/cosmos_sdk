import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisValSetprefV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisValSetprefV1beta1Types._(this.typeUrl, {this.rpc});
  static const OsmosisValSetprefV1beta1Types validatorPreference =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.ValidatorPreference");

  static const OsmosisValSetprefV1beta1Types validatorSetPreferences =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.ValidatorSetPreferences");
  static const OsmosisValSetprefV1beta1Types userValidatorPreferencesResponse =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.UserValidatorPreferencesResponse");

  static const OsmosisValSetprefV1beta1Types msgSetValidatorSetPreference =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgSetValidatorSetPreference");
  static const OsmosisValSetprefV1beta1Types
      msgSetValidatorSetPreferenceResponse = OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgSetValidatorSetPreferenceResponse");

  static const OsmosisValSetprefV1beta1Types msgDelegateToValidatorSet =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgDelegateToValidatorSet");
  static const OsmosisValSetprefV1beta1Types msgDelegateToValidatorSetResponse =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgDelegateToValidatorSetResponse");

  static const OsmosisValSetprefV1beta1Types msgUndelegateFromValidatorSet =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgUndelegateFromValidatorSet");
  static const OsmosisValSetprefV1beta1Types
      msgUndelegateFromValidatorSetResponse = OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgUndelegateFromValidatorSetResponse");

  static const OsmosisValSetprefV1beta1Types
      msgUndelegateFromRebalancedValidatorSet = OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgUndelegateFromRebalancedValidatorSet");
  static const OsmosisValSetprefV1beta1Types
      msgUndelegateFromRebalancedValidatorSetResponse =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgUndelegateFromRebalancedValidatorSetResponse");

  static const OsmosisValSetprefV1beta1Types msgRedelegateValidatorSet =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgRedelegateValidatorSet");
  static const OsmosisValSetprefV1beta1Types msgRedelegateValidatorSetResponse =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgRedelegateValidatorSetResponse");

  static const OsmosisValSetprefV1beta1Types msgWithdrawDelegationRewards =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgWithdrawDelegationRewards");
  static const OsmosisValSetprefV1beta1Types
      msgWithdrawDelegationRewardsResponse = OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgWithdrawDelegationRewardsResponse");

  static const OsmosisValSetprefV1beta1Types msgDelegateBondedTokens =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgDelegateBondedTokens");
  static const OsmosisValSetprefV1beta1Types msgDelegateBondedTokensResponse =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.MsgDelegateBondedTokensResponse");

  static const OsmosisValSetprefV1beta1Types userValidatorPreferencesRequest =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.UserValidatorPreferencesRequest");

  /// query
  static const OsmosisValSetprefV1beta1Types userValidatorPreferences =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Query/UserValidatorPreferences",
          rpc: "/osmosis/valset-pref/v1beta1/:address");

  /// services
  static const OsmosisValSetprefV1beta1Types delegateBondedTokens =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/DelegateBondedTokens");
  static const OsmosisValSetprefV1beta1Types withdrawDelegationRewards =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/WithdrawDelegationRewards");
  static const OsmosisValSetprefV1beta1Types redelegateValidatorSet =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/RedelegateValidatorSet");
  static const OsmosisValSetprefV1beta1Types
      undelegateFromRebalancedValidatorSet = OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/UndelegateFromRebalancedValidatorSet");

  static const OsmosisValSetprefV1beta1Types undelegateFromValidatorSet =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/UndelegateFromValidatorSet");
  static const OsmosisValSetprefV1beta1Types delegateToValidatorSet =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/DelegateToValidatorSet");
  static const OsmosisValSetprefV1beta1Types setValidatorSetPreference =
      OsmosisValSetprefV1beta1Types._(
          "/osmosis.valsetpref.v1beta1.Msg/SetValidatorSetPreference");
}
