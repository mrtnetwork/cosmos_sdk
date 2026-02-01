import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'delegation.dart'; // Import the Coin class if not already imported

/// DelegationResponse is equivalent to Delegation except that it contains a balance in
/// addition to shares which is more suitable for client responses.
class DelegationResponse extends CosmosMessage {
  final Delegation delegation;
  final Coin balance;

  const DelegationResponse({required this.delegation, required this.balance});
  factory DelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DelegationResponse(
      delegation: Delegation.deserialize(decode.getField(1)),
      balance: Coin.deserialize(decode.getField(2)),
    );
  }
  factory DelegationResponse.fromJson(Map<String, dynamic> json) {
    return DelegationResponse(
      delegation: Delegation.fromJson(json["delegation"]),
      balance: Coin.fromJson(json["balance"]),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'delegation': delegation.toJson(), 'balance': balance.toJson()};
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.delegationResponse;

  @override
  List get values => [delegation, balance];
}
