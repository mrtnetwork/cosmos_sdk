import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/messages/distribution_proportions.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/messages/weighted_address.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Params holds parameters for the x/mint module.
class OsmosisMintParams extends CosmosMessage {
  /// mint_denom is the denom of the coin to mint.
  final String? mintDenom;

  /// genesis_epoch_provisions epoch provisions from the first epoch.
  final String genesisEpochProvisions;

  /// epoch_identifier mint epoch identifier e.g. (day, week).
  final String? epochIdentifier;

  /// reduction_period_in_epochs the number of epochs it takes
  /// to reduce the rewards.s
  final BigInt? reductionPeriodInEpochs;

  /// reduction_factor is the reduction multiplier to execute
  /// at the end of each period set by reduction_period_in_epochs.
  final String reductionFactor;

  /// distribution_proportions defines the distribution proportions of the minted
  /// denom. In other words, defines which stakeholders will receive the minted
  /// denoms and how much.
  final OsmosisMintDistributionProportions distributionProportions;

  /// weighted_developer_rewards_receivers is the address to receive developer
  /// rewards with weights assignedt to each address. The final amount that each
  /// address receives is: epoch_provisions *
  /// distribution_proportions.developer_rewards * Address's Weight.
  final List<OsmosisMintWeightedAddress> weightedDeveloperRewardsReceivers;

  /// minting_rewards_distribution_start_epoch start epoch to distribute minting
  /// rewards
  final BigInt? mintingRewardsDistributionStartEpoch;

  OsmosisMintParams(
      {this.mintDenom,
      required this.genesisEpochProvisions,
      this.epochIdentifier,
      this.reductionPeriodInEpochs,
      required this.reductionFactor,
      required this.distributionProportions,
      required List<OsmosisMintWeightedAddress>
          weightedDeveloperRewardsReceivers,
      this.mintingRewardsDistributionStartEpoch})
      : weightedDeveloperRewardsReceivers =
            weightedDeveloperRewardsReceivers.mutable;
  factory OsmosisMintParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintParams(
        mintDenom: decode.getField(1),
        genesisEpochProvisions: decode.getField(2),
        epochIdentifier: decode.getField(3),
        reductionPeriodInEpochs: decode.getField(4),
        reductionFactor: decode.getField(5),
        distributionProportions:
            OsmosisMintDistributionProportions.deserialize(decode.getField(6)),
        weightedDeveloperRewardsReceivers: decode
            .getFields(7)
            .map((e) => OsmosisMintWeightedAddress.deserialize(e))
            .toList(),
        mintingRewardsDistributionStartEpoch: decode.getField(8));
  }

  factory OsmosisMintParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisMintParams(
        mintDenom: json["mint_denom"],
        genesisEpochProvisions: json["genesis_epoch_provisions"],
        epochIdentifier: json["epoch_identifier"],
        reductionPeriodInEpochs:
            BigintUtils.tryParse(json["reduction_period_in_epochs"]),
        reductionFactor: json["reduction_factor"],
        distributionProportions: OsmosisMintDistributionProportions.fromRpc(
            json["distribution_proportions"]),
        weightedDeveloperRewardsReceivers:
            (json["weighted_developer_rewards_receivers"] as List?)
                    ?.map((e) => OsmosisMintWeightedAddress.fromRpc(e))
                    .toList() ??
                <OsmosisMintWeightedAddress>[],
        mintingRewardsDistributionStartEpoch: BigintUtils.tryParse(
            json["minting_rewards_distribution_start_epoch"]));
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "mint_denom": mintDenom,
      "genesis_epoch_provisions": genesisEpochProvisions,
      "epoch_identifier": epochIdentifier,
      "reduction_period_in_epochs": reductionPeriodInEpochs?.toString(),
      "reduction_factor": reductionFactor,
      "distribution_proportions": distributionProportions.toJson(),
      "weighted_developer_rewards_receivers":
          weightedDeveloperRewardsReceivers.map((e) => e.toJson()).toList(),
      "minting_rewards_distribution_start_epoch":
          mintingRewardsDistributionStartEpoch?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisMintV1beta1Types.params.typeUrl;

  @override
  List get values => [
        mintDenom,
        genesisEpochProvisions,
        epochIdentifier,
        reductionPeriodInEpochs,
        reductionFactor,
        distributionProportions,
        weightedDeveloperRewardsReceivers,
        mintingRewardsDistributionStartEpoch
      ];
}
