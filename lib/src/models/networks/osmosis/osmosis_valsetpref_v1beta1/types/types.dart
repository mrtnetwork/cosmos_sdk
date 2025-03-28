import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisValSetprefV1beta1Types extends TypeUrl {
  const OsmosisValSetprefV1beta1Types._(super.typeUrl,
      {super.query, super.rpc});
  static const String root = "/osmosis.valsetpref.v1beta1";
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
          "/osmosis.valsetpref.v1beta1.UserValidatorPreferencesRequest",
          query: "/osmosis.valsetpref.v1beta1.Query/UserValidatorPreferences",
          rpc: "/osmosis/valset-pref/v1beta1/:address");

  static const List<TypeUrl> services = [
    msgDelegateBondedTokens,
    msgDelegateToValidatorSet,
    msgWithdrawDelegationRewards,
    msgRedelegateValidatorSet,
    msgSetValidatorSetPreference,
    msgUndelegateFromRebalancedValidatorSet,
    msgUndelegateFromValidatorSet
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
