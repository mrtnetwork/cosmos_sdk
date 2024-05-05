import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import '../../../../sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

/// SuperfluidDelegationRecord is a struct used to indicate superfluid delegations of
/// an account in the state machine in a user friendly form.
class OsmosisSuperfluidSuperfluidDelegationRecord extends CosmosMessage {
  final String? delegatorAddress;
  final String? validatorAddress;
  final Coin delegationAmount;
  final Coin? equivalentStakedAmount;
  const OsmosisSuperfluidSuperfluidDelegationRecord(
      {this.delegatorAddress,
      this.validatorAddress,
      required this.delegationAmount,
      this.equivalentStakedAmount});
  factory OsmosisSuperfluidSuperfluidDelegationRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationRecord(
        delegatorAddress: decode.getField(1),
        validatorAddress: decode.getField(2),
        delegationAmount: Coin.deserialize(decode.getField(3)),
        equivalentStakedAmount: decode
            .getResult(4)
            ?.to<Coin, List<int>>((e) => Coin.deserialize(e)));
  }
  factory OsmosisSuperfluidSuperfluidDelegationRecord.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidDelegationRecord(
        delegatorAddress: json["delegator_address"],
        validatorAddress: json["validator_address"],
        delegationAmount: Coin.fromRpc(json["delegation_amount"]),
        equivalentStakedAmount: json["equivalent_staked_amount"] == null
            ? null
            : Coin.fromRpc(json["equivalent_staked_amount"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress,
      "validator_address": validatorAddress,
      "delegation_amount": delegationAmount.toJson(),
      "equivalent_staked_amount": equivalentStakedAmount?.toJson()
    };
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.superfluidDelegationRecord.typeUrl;

  @override
  List get values => [
        delegatorAddress,
        validatorAddress,
        delegationAmount,
        equivalentStakedAmount
      ];
}
