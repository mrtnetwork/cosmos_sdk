import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_accum_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Record corresponds to an individual position value belonging to the global accumulator.
class OsmosisAccumRecord extends CosmosMessage {
  /// num_shares is the number of shares belonging to the position associated
  /// with this record.
  final String numShares;

  /// accum_value_per_share is the subset of coins per shar of the global
  /// accumulator value that allows to infer how much a position is entitled to
  /// per share that it owns.
  ///
  /// In the default case with no intervals, this value equals to the global
  /// accumulator value at the time of the position creation, the last update or
  /// reward claim.
  ///
  /// In the interval case such as concentrated liquidity, this value equals to
  /// the global growth of rewards inside the interval during one of: the time of
  /// the position creation, the last update or reward claim. Note, that
  // immediately prior to claiming or updating rewards, this value must be
  /// updated to "the growth inside at the time of last update + the growth
  /// outside at the time of the current block". This is so that the claiming
  /// logic can subtract this updated value from the global accumulator value to
  /// get the growth inside the interval from the time of last update up until
  /// the current block time.
  final List<DecCoin> accumValuePerShare;

  /// unclaimed_rewards_total is the total amount of unclaimed rewards that the
  /// position is entitled to. This value is updated whenever shares are added or
  /// removed from an existing position. We also expose API for manually updating
  /// this value for some custom use cases such as merging pre-existing positions
  /// into a single one.s
  final List<DecCoin> unclaimedRewardsTotal;
  OsmosisAccumRecord({
    required this.numShares,
    required List<DecCoin> accumValuePerShare,
    required List<DecCoin> unclaimedRewardsTotal,
  }) : accumValuePerShare = accumValuePerShare.immutable,
       unclaimedRewardsTotal = unclaimedRewardsTotal.immutable;
  factory OsmosisAccumRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisAccumRecord(
      numShares: decode.getField(1),
      accumValuePerShare:
          decode
              .getFields<List<int>>(2)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
      unclaimedRewardsTotal:
          decode
              .getFields<List<int>>(3)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisAccumRecord.fromJson(Map<String, dynamic> json) {
    return OsmosisAccumRecord(
      numShares: json["num_shares"],
      accumValuePerShare:
          (json["accum_value_per_share"] as List?)
              ?.map((e) => DecCoin.deserialize(e))
              .toList() ??
          <DecCoin>[],
      unclaimedRewardsTotal:
          (json["unclaimed_rewards_total"] as List?)
              ?.map((e) => DecCoin.deserialize(e))
              .toList() ??
          <DecCoin>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "num_shares": numShares,
      "accum_value_per_share":
          accumValuePerShare.map((e) => e.toJson()).toList(),
      "unclaimed_rewards_total":
          unclaimedRewardsTotal.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisAccumV1beta1Types.record;

  @override
  List get values => [numShares, accumValuePerShare, unclaimedRewardsTotal];
}
