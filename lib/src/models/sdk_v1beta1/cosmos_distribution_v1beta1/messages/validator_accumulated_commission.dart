import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ValidatorAccumulatedCommission represents accumulated commission for a
/// validator kept as a running counter, can be withdrawn at any time.
class DistributionValidatorAccumulatedCommission extends CosmosMessage {
  final List<DecCoin> commission;
  DistributionValidatorAccumulatedCommission(List<DecCoin> commission)
      : commission = commission.immutable;
  factory DistributionValidatorAccumulatedCommission.fromJson(
      Map<String, dynamic> json) {
    return DistributionValidatorAccumulatedCommission(
        (json["commission"] as List?)
                ?.map((e) => DecCoin.fromJson(e))
                .toList() ??
            []);
  }
  factory DistributionValidatorAccumulatedCommission.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorAccumulatedCommission(decode
        .getFields<List<int>>(1)
        .map((e) => DecCoin.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"commission": commission.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionValidatorAccumulatedCommission;

  @override
  List get values => [commission];
}
