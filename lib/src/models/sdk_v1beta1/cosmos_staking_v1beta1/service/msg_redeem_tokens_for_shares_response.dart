import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRedeemTokensForSharesResponse defines the MsgRedeemTokensForShares response type.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgRedeemTokensForSharesResponse extends CosmosMessage {
  final Coin amount;
  const MsgRedeemTokensForSharesResponse(this.amount);
  factory MsgRedeemTokensForSharesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRedeemTokensForSharesResponse(
        Coin.deserialize(decode.getField(1)));
  }
  factory MsgRedeemTokensForSharesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRedeemTokensForSharesResponse(
        Coin.fromJson(json.asMap("amount")));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount.toJson()};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgRedeemTokensForSharesResponse;

  @override
  List get values => [amount];
}
