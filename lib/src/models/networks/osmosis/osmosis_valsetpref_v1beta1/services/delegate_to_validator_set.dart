import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DelegateToValidatorSet gets the owner, coins and delegates to a validator-set.
class OsmosisValSetprefMsgDelegateToValidatorSet
    extends OsmosisValSetprefV1Beta1<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to delegate.
  final String? delegator;

  /// list of {valAddr, weight} to delegate to
  final Coin coin;

  OsmosisValSetprefMsgDelegateToValidatorSet(
      {this.delegator, required this.coin});
  factory OsmosisValSetprefMsgDelegateToValidatorSet.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefMsgDelegateToValidatorSet(
      delegator: decode.getField(1),
      coin: Coin.deserialize(decode.getField(2)),
    );
  }
  factory OsmosisValSetprefMsgDelegateToValidatorSet.fromJson(
      Map<String, dynamic> json) {
    return OsmosisValSetprefMsgDelegateToValidatorSet(
        delegator: json["delegator"], coin: Coin.fromJson(json["coin"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator, "coin": coin.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValSetprefV1beta1Types.msgDelegateToValidatorSet;

  @override
  List get values => [delegator, coin];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisValSetprefV1beta1Types.msgDelegateToValidatorSetResponse);
  }

  @override
  List<String?> get signers => [delegator];
}
