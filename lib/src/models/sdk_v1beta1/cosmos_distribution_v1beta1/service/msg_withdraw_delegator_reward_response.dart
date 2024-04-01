import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// MsgWithdrawDelegatorRewardResponse defines the Msg/WithdrawDelegatorReward response type.
class DistributionMsgWithdrawDelegatorRewardResponse extends CosmosMessage {
  /// Since: cosmos-sdk 0.46
  final List<Coin> amount;
  DistributionMsgWithdrawDelegatorRewardResponse(List<Coin> amount)
      : amount = amount.mutable;
  factory DistributionMsgWithdrawDelegatorRewardResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgWithdrawDelegatorRewardResponse(decode
        .getFileds<List<int>>(1)
        .map((e) => Coin.deserialize(e))
        .toList());
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionMsgWithdrawDelegatorRewardResponse.typeUrl;

  @override
  List get values => [amount];
}
