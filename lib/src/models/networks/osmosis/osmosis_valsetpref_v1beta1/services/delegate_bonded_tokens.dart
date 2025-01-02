import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgDelegateBondedTokens breaks bonded lockup (by ID) of osmo, of length <= 2 weeks and takes all
/// that osmo and delegates according to delegator's current validator set preference.
class OsmosisValSetprefMsgDelegateBondedTokens extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// delegator is the user who is trying to force unbond osmo and delegate
  final String? delegator;

  /// lockup id of osmo in the pool
  final BigInt? lockId;

  OsmosisValSetprefMsgDelegateBondedTokens({this.delegator, this.lockId});
  factory OsmosisValSetprefMsgDelegateBondedTokens.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefMsgDelegateBondedTokens(
        delegator: decode.getField(1), lockId: decode.getField(2));
  }
  factory OsmosisValSetprefMsgDelegateBondedTokens.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisValSetprefMsgDelegateBondedTokens(
        delegator: json["delegator"],
        lockId: BigintUtils.tryParse(json["lockID"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator": delegator, "lockID": lockId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisValSetprefV1beta1Types.msgDelegateBondedTokens;

  @override
  List get values => [delegator, lockId];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisValSetprefV1beta1Types.msgDelegateBondedTokensResponse);
  }

  @override
  TypeUrl get service => OsmosisValSetprefV1beta1Types.delegateBondedTokens;

  @override
  List<String?> get signers => [delegator];
}
