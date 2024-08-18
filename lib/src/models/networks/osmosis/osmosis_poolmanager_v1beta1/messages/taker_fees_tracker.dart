import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisPoolManagerTakerFeesTracker extends CosmosMessage {
  final List<Coin> takerFeesToStakers;
  final List<Coin> takerFeesToCommunityPool;
  final BigInt? heightAccountingStartsFrom;
  OsmosisPoolManagerTakerFeesTracker(
      {required List<Coin> takerFeesToStakers,
      required List<Coin> takerFeesToCommunityPool,
      this.heightAccountingStartsFrom})
      : takerFeesToStakers = takerFeesToStakers.immutable,
        takerFeesToCommunityPool = takerFeesToCommunityPool.immutable;
  factory OsmosisPoolManagerTakerFeesTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTakerFeesTracker(
        takerFeesToStakers:
            decode.getFields(1).map((e) => Coin.deserialize(e)).toList(),
        takerFeesToCommunityPool:
            decode.getFields(2).map((e) => Coin.deserialize(e)).toList(),
        heightAccountingStartsFrom: decode.getField(3));
  }
  factory OsmosisPoolManagerTakerFeesTracker.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTakerFeesTracker(
        takerFeesToStakers: (json["taker_fees_to_stakers"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            <Coin>[],
        takerFeesToCommunityPool:
            (json["taker_fees_to_community_pool"] as List?)
                    ?.map((e) => Coin.fromRpc(e))
                    .toList() ??
                <Coin>[],
        heightAccountingStartsFrom:
            BigintUtils.tryParse(json["height_accounting_starts_from"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "taker_fees_to_stakers":
          takerFeesToStakers.map((e) => e.toJson()).toList(),
      "taker_fees_to_community_pool":
          takerFeesToCommunityPool.map((e) => e.toJson()).toList(),
      "height_accounting_starts_from": heightAccountingStartsFrom?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.takerFeesTracker.typeUrl;

  @override
  List get values => [
        takerFeesToStakers,
        takerFeesToCommunityPool,
        heightAccountingStartsFrom
      ];
}
