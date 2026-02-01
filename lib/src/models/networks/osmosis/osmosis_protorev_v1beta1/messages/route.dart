import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'trade.dart';

/// Route is a hot route for a given pair of tokens
class OsmosisProtorevRoute extends CosmosMessage {
  /// The pool IDs that are travered in the directed cyclic graph (traversed left
  /// -> right)
  final List<OsmosisProtorevTrade> trades;

  /// The step size that will be used to find the optimal swap amount in the
  /// binary search
  final String? stepSize;

  OsmosisProtorevRoute({
    required List<OsmosisProtorevTrade> trades,
    this.stepSize,
  }) : trades = trades.immutable;

  factory OsmosisProtorevRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevRoute(
      trades:
          decode
              .getFields<List<int>>(1)
              .map((e) => OsmosisProtorevTrade.deserialize(e))
              .toList(),
      stepSize: decode.getField(2),
    );
  }
  factory OsmosisProtorevRoute.fromJson(Map<String, dynamic> json) {
    return OsmosisProtorevRoute(
      trades:
          (json["trades"] as List?)
              ?.map((e) => OsmosisProtorevTrade.fromJson(e))
              .toList() ??
          <OsmosisProtorevTrade>[],
      stepSize: json["step_size"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "trades": trades.map((e) => e.toJson()).toList(),
      "step_size": stepSize,
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.route;

  @override
  List get values => [trades, stepSize];
}
