import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet
    extends CosmosMessage with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to delegate.
  final String? delegator;

  /// the amount the user wants to undelegate
  /// For ex: Undelegate 50 osmo with validator-set {ValA -> 0.5, ValB -> 0.5}
  /// Our undelegate logic would first check the current delegation balance.
  /// If the user has 90 osmo delegated to ValA and 10 osmo delegated to ValB,
  /// the rebalanced validator set would be {ValA -> 0.9, ValB -> 0.1}
  /// So now the 45 osmo would be undelegated from ValA and 5 osmo would be
  /// undelegated from ValB.
  final Coin coin;

  OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet(
      {this.delegator, required this.coin});
  factory OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet(
      delegator: decode.getField(1),
      coin: Coin.deserialize(decode.getField(2)),
    );
  }
  factory OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisValSetprefMsgUndelegateFromRebalancedValidatorSet(
        delegator: json["delegator"], coin: Coin.fromRpc(json["coin"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator, "coin": coin.toJson()};
  }

  @override
  String get typeUrl => OsmosisValSetprefV1beta1Types
      .msgUndelegateFromRebalancedValidatorSet.typeUrl;

  @override
  List get values => [delegator, coin];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(OsmosisValSetprefV1beta1Types
        .msgUndelegateFromRebalancedValidatorSetResponse.typeUrl);
  }

  @override
  String get service => OsmosisValSetprefV1beta1Types
      .undelegateFromRebalancedValidatorSet.typeUrl;

  @override
  List<String?> get signers => [delegator];
}
