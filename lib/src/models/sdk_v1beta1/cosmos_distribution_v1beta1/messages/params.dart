import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params defines the set of params for the distribution module.
class DistributionParams extends CosmosMessage {
  final String communityTax;

  /// Deprecated: The base_proposer_reward field is deprecated and is no longer used
  /// in the x/distribution module's reward mechanism.
  final String? baseProposerReward;

  /// Deprecated: The bonus_proposer_reward field is deprecated and is no longer used
  /// in the x/distribution module's reward mechanism.
  final String? bonusProposerReward;
  final bool? withdrawAddrEnabled;
  const DistributionParams(
      {required this.communityTax,
      this.baseProposerReward,
      this.bonusProposerReward,
      this.withdrawAddrEnabled});
  factory DistributionParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionParams(
        communityTax: decode.getField(1),
        baseProposerReward: decode.getField(2),
        bonusProposerReward: decode.getField(3),
        withdrawAddrEnabled: decode.getField(4));
  }
  factory DistributionParams.fromJson(Map<String, dynamic> json) {
    return DistributionParams(
        communityTax: json["community_tax"],
        baseProposerReward: json["base_proposer_reward"],
        bonusProposerReward: json["bonus_proposer_reward"],
        withdrawAddrEnabled: json["withdraw_addr_enabled"]);
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "community_tax": communityTax,
      "base_proposer_reward": baseProposerReward,
      "bonus_proposer_reward": bonusProposerReward,
      "withdraw_addr_enabled": withdrawAddrEnabled
    };
  }

  @override
  TypeUrl get typeUrl => DistributionV1beta1Types.distributionParams;

  @override
  List get values => [
        communityTax,
        baseProposerReward,
        bonusProposerReward,
        withdrawAddrEnabled
      ];
}
