import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConcentratedPoolInfo contains meta data pertaining to a concentrated pool type.
class OsmosisProtorevConcentratedPoolInfo extends CosmosMessage {
  /// The weight of a concentrated pool
  final BigInt? weight;

  /// The maximum number of ticks we can move when rebalancing
  final BigInt? maxTicksCrossed;

  const OsmosisProtorevConcentratedPoolInfo(
      {this.weight, this.maxTicksCrossed});

  factory OsmosisProtorevConcentratedPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevConcentratedPoolInfo(
        weight: decode.getField(1), maxTicksCrossed: decode.getField(2));
  }
  factory OsmosisProtorevConcentratedPoolInfo.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevConcentratedPoolInfo(
        weight: BigintUtils.tryParse(json["weight"]),
        maxTicksCrossed: BigintUtils.tryParse(json["max_ticks_crossed"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "weight": weight?.toString(),
      "max_ticks_crossed": maxTicksCrossed?.toString()
    };
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.concentratedPoolInfo.typeUrl;

  @override
  List get values => [weight, maxTicksCrossed];
}
