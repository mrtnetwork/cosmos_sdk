import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_redeem_tokens_for_shares_response.dart';

/// MsgRedeemTokensForShares tokenizes a delegation.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgRedeemTokensForShares
    extends StakingV1Beta1Service<MsgRedeemTokensForSharesResponse> {
  final String? delegatorAddress;
  final Coin? amount;

  const MsgRedeemTokensForShares({
    required this.delegatorAddress,
    required this.amount,
  });
  factory MsgRedeemTokensForShares.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRedeemTokensForShares(
        delegatorAddress: decode.getField(1),
        amount: decode.getResult(2)?.to<Coin, List<int>>(Coin.deserialize));
  }
  factory MsgRedeemTokensForShares.fromJson(Map<String, dynamic> json) {
    return MsgRedeemTokensForShares(
        delegatorAddress: json.as("delegator_address"),
        amount: json.maybeAs<Coin, Map<String, dynamic>>(
            key: "amount", onValue: Coin.fromJson));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress,
      "amount": amount?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgRedeemTokensForShares;

  @override
  List get values => [delegatorAddress, amount];

  @override
  MsgRedeemTokensForSharesResponse onResponse(List<int> bytes) {
    return MsgRedeemTokensForSharesResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [delegatorAddress];
}
