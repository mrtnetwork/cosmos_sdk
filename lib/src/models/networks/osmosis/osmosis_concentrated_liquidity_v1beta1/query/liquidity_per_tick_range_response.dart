import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/liquidity_depth_with_range.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse
    extends CosmosMessage {
  final List<OsmosisConcentratedLiquidityLiquidityDepthWithRange> liquidity;
  final BigInt? bucketIndex;
  OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse({
    required List<OsmosisConcentratedLiquidityLiquidityDepthWithRange>
    liquidity,
    this.bucketIndex,
  }) : liquidity = liquidity.immutable;
  factory OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse(
      liquidity:
          decode
              .getFields<List<int>>(1)
              .map(
                (e) =>
                    OsmosisConcentratedLiquidityLiquidityDepthWithRange.deserialize(
                      e,
                    ),
              )
              .toList(),
      bucketIndex: decode.getField(2),
    );
  }
  factory OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse(
      liquidity:
          (json["liquidity"] as List?)
              ?.map(
                (e) =>
                    OsmosisConcentratedLiquidityLiquidityDepthWithRange.deserialize(
                      e,
                    ),
              )
              .toList() ??
          <OsmosisConcentratedLiquidityLiquidityDepthWithRange>[],
      bucketIndex: BigintUtils.tryParse(json["bucket_index"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "liquidity": liquidity.map((e) => e.toJson()).toList(),
      "bucket_index": bucketIndex?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.liquidityPerTickRangeResponse;

  @override
  List get values => [liquidity, bucketIndex];
}
