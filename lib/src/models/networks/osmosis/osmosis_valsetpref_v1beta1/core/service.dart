import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/delegate_bonded_tokens.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/delegate_to_validator_set.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/msg_withdraw_delegation_rewards.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/redelegate_validator_set.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/set_validator_set_preference.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/undelegate_from_rebalanced_validator_set.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/services/undelegate_from_validator_set.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisValSetprefV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisValSetprefV1Beta1();

  static T? fromJson<T extends OsmosisValSetprefV1Beta1>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = OsmosisValSetprefV1beta1Types.findService(typeUrl);
    final OsmosisValSetprefV1Beta1? service = switch (type) {
      OsmosisValSetprefV1beta1Types.msgDelegateBondedTokens =>
        OsmosisValSetprefMsgDelegateBondedTokens.fromJson(json),
      OsmosisValSetprefV1beta1Types.msgDelegateToValidatorSet =>
        OsmosisValSetprefMsgDelegateToValidatorSet.fromJson(json),
      OsmosisValSetprefV1beta1Types.msgWithdrawDelegationRewards =>
        OsmosisValSetprefMsgWithdrawDelegationRewards.fromJson(json),
      OsmosisValSetprefV1beta1Types.msgRedelegateValidatorSet =>
        OsmosisValSetprefMsgRedelegateValidatorSet.fromJson(json),
      OsmosisValSetprefV1beta1Types.msgSetValidatorSetPreference =>
        OsmosisValSetprefMsgSetValidatorSetPreference.fromJson(json),
      OsmosisValSetprefV1beta1Types.msgUndelegateFromRebalancedValidatorSet =>
        OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet.fromJson(json),
      OsmosisValSetprefV1beta1Types.msgUndelegateFromValidatorSet =>
        OsmosisValSetprefMsgUndelegateFromValidatorSet.fromJson(json),
      _ => null
    } as OsmosisValSetprefV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid ValSetprefV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends OsmosisValSetprefV1Beta1>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OsmosisValSetprefV1beta1Types.findService(typeUrl);
    final OsmosisValSetprefV1Beta1? service = switch (type) {
      OsmosisValSetprefV1beta1Types.msgDelegateBondedTokens =>
        OsmosisValSetprefMsgDelegateBondedTokens.deserialize(bytes),
      OsmosisValSetprefV1beta1Types.msgDelegateToValidatorSet =>
        OsmosisValSetprefMsgDelegateToValidatorSet.deserialize(bytes),
      OsmosisValSetprefV1beta1Types.msgWithdrawDelegationRewards =>
        OsmosisValSetprefMsgWithdrawDelegationRewards.deserialize(bytes),
      OsmosisValSetprefV1beta1Types.msgRedelegateValidatorSet =>
        OsmosisValSetprefMsgRedelegateValidatorSet.deserialize(bytes),
      OsmosisValSetprefV1beta1Types.msgSetValidatorSetPreference =>
        OsmosisValSetprefMsgSetValidatorSetPreference.deserialize(bytes),
      OsmosisValSetprefV1beta1Types.msgUndelegateFromRebalancedValidatorSet =>
        OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet.deserialize(
            bytes),
      OsmosisValSetprefV1beta1Types.msgUndelegateFromValidatorSet =>
        OsmosisValSetprefMsgUndelegateFromValidatorSet.deserialize(bytes),
      _ => null
    } as OsmosisValSetprefV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid ValSetprefV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
