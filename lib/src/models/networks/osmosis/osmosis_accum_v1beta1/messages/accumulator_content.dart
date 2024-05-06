import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_accum_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// AccumulatorContent is the state-entry for the global accumulator.
/// It contains the name of the global accumulator and the total value of shares belonging to it from all positions.
class OsmosisAccumAccumulatorContent extends CosmosMessage {
  final List<DecCoin> accumValue;
  final String totalShares;
  OsmosisAccumAccumulatorContent(
      {required List<DecCoin> accumValue, required this.totalShares})
      : accumValue = accumValue.mutable;
  factory OsmosisAccumAccumulatorContent.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisAccumAccumulatorContent(
      accumValue:
          decode.getFields(1).map((e) => DecCoin.deserialize(e)).toList(),
      totalShares: decode.getField(2),
    );
  }
  factory OsmosisAccumAccumulatorContent.fromRpc(Map<String, dynamic> json) {
    return OsmosisAccumAccumulatorContent(
      accumValue: (json["accum_value"] as List?)
              ?.map((e) => DecCoin.fromRpc(e))
              .toList() ??
          <DecCoin>[],
      totalShares: json["total_shares"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "accum_value": accumValue.map((e) => e.toJson()).toList(),
      "total_shares": totalShares,
    };
  }

  @override
  String get typeUrl => OsmosisAccumV1beta1Types.accumulatorContent.typeUrl;

  @override
  List get values => [accumValue, totalShares];
}
