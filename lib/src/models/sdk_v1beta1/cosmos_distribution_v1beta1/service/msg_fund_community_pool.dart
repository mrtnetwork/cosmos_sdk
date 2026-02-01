import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgWithdrawValidatorCommissionResponse defines the Msg/WithdrawValidatorCommission response type.
class DistributionMsgFundCommunityPool
    extends DistributionV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  /// Since: cosmos-sdk 0.46
  final List<Coin>? amount;
  final String? depositor;
  DistributionMsgFundCommunityPool({
    required List<Coin>? amount,
    this.depositor,
  }) : amount = amount?.immutable;
  factory DistributionMsgFundCommunityPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgFundCommunityPool(
      amount:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
      depositor: decode.getField(2),
    );
  }
  factory DistributionMsgFundCommunityPool.fromJson(Map<String, dynamic> json) {
    return DistributionMsgFundCommunityPool(
      amount: json.asListOfMap("amount")?.map((e) => Coin.fromJson(e)).toList(),
      depositor: json.as("depositor"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount?.map((e) => e.toJson()).toList(),
      "depositor": depositor,
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionMsgFundCommunityPool;

  @override
  List get values => [amount];
  @override
  List<String?> get signers => [depositor];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      DistributionV1beta1Types.distributionMsgFundCommunityPoolResponse,
    );
  }
}
