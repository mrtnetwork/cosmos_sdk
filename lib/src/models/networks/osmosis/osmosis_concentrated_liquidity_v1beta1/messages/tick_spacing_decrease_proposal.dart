import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'pool_id_to_tick_spacing_record.dart';

/// TickSpacingDecreaseProposal is a gov Content type for proposing a tick spacing decrease for a pool.
/// The proposal will fail if one of the pools do not exist, or if the new tick spacing is not less than the current tick spacing.
class OsmosisConcentratedLiquidityTickSpacingDecreaseProposal
    extends CosmosMessage {
  final String? title;
  final String? description;
  final List<OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord>
      poolIdToTickSpacingRecords;

  OsmosisConcentratedLiquidityTickSpacingDecreaseProposal({
    this.title,
    this.description,
    required List<OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord>
        poolIdToTickSpacingRecords,
  }) : poolIdToTickSpacingRecords = poolIdToTickSpacingRecords.mutable;
  factory OsmosisConcentratedLiquidityTickSpacingDecreaseProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityTickSpacingDecreaseProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        poolIdToTickSpacingRecords: decode
            .getFields(3)
            .map((e) => OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord
                .deserialize(e))
            .toList());
  }
  factory OsmosisConcentratedLiquidityTickSpacingDecreaseProposal.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityTickSpacingDecreaseProposal(
        title: json["title"],
        description: json["description"],
        poolIdToTickSpacingRecords:
            (json["pool_id_to_tick_spacing_records"] as List?)
                    ?.map((e) =>
                        OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord
                            .fromRpc(e))
                    .toList() ??
                <OsmosisConcentratedLiquidityPoolIdToTickSpacingRecord>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "pool_id_to_tick_spacing_records":
          poolIdToTickSpacingRecords.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [title, description, poolIdToTickSpacingRecords];

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .tickSpacingDecreaseProposal.typeUrl;
}
