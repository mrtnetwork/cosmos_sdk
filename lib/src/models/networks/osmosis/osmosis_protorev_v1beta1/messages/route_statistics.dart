import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// RouteStatistics contains the number of trades the module has executed
/// after a swap on a given route and the profits from the trades
class OsmosisProtorevRouteStatistics extends CosmosMessage {
  /// profits is the total profit from all trades on this route)
  final List<Coin> profits;

  /// number_of_trades is the number of trades the module has executed using this
  /// route
  final BigInt numberOfTrades;

  /// route is the route that was used (pool ids along the arbitrage route)
  final List<BigInt>? route;

  OsmosisProtorevRouteStatistics(
      {required List<Coin> profits,
      required this.numberOfTrades,
      List<BigInt>? route})
      : route = route?.emptyAsNull?.immutable,
        profits = profits.immutable;

  factory OsmosisProtorevRouteStatistics.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevRouteStatistics(
        profits: decode.getFields(1).map((e) => Coin.deserialize(e)).toList(),
        numberOfTrades: decode.getField(2),
        route: decode
                .getResult<ProtocolBufferDecoderResult?>(3)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }
  factory OsmosisProtorevRouteStatistics.fromRpc(Map<String, dynamic> json) {
    return OsmosisProtorevRouteStatistics(
        profits:
            (json["profits"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
                <Coin>[],
        numberOfTrades: BigintUtils.parse(json["number_of_trades"]),
        route: (json["route"] as List?)
            ?.map((e) => BigintUtils.parse(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "profits": profits.map((e) => e.toJson()).toList(),
      "number_of_trades": numberOfTrades.toString(),
      "route": route?.map((e) => e.toString()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.routeStatistics;

  @override
  List get values => [profits, numberOfTrades, route];
}
