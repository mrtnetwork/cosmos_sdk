import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisValSetprefMsgWithdrawDelegationRewards extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to claim staking rewards.
  final String? delegator;

  OsmosisValSetprefMsgWithdrawDelegationRewards({this.delegator});
  factory OsmosisValSetprefMsgWithdrawDelegationRewards.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefMsgWithdrawDelegationRewards(
        delegator: decode.getField(1));
  }
  factory OsmosisValSetprefMsgWithdrawDelegationRewards.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisValSetprefMsgWithdrawDelegationRewards(
        delegator: json["delegator"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator};
  }

  @override
  String get typeUrl =>
      OsmosisValSetprefV1beta1Types.msgWithdrawDelegationRewards.typeUrl;

  @override
  List get values => [delegator];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(OsmosisValSetprefV1beta1Types
        .msgWithdrawDelegationRewardsResponse.typeUrl);
  }

  @override
  String get service =>
      OsmosisValSetprefV1beta1Types.withdrawDelegationRewards.typeUrl;

  @override
  List<String?> get signers => [delegator];
}
