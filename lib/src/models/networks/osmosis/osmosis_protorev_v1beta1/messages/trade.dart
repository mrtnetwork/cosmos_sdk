import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Trade is a single trade in a route
class OsmosisProtorevTrade extends CosmosMessage {
  /// The pool id of the pool that is traded on
  final BigInt? pool;

  /// The denom of the token that is traded
  final String? tokenIn;

  /// The denom of the token that is received
  final String? tokenOut;
  const OsmosisProtorevTrade({this.pool, this.tokenIn, this.tokenOut});

  factory OsmosisProtorevTrade.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevTrade(
        pool: decode.getField(1),
        tokenIn: decode.getField(2),
        tokenOut: decode.getField(3));
  }
  factory OsmosisProtorevTrade.fromRpc(Map<String, dynamic> json) {
    return OsmosisProtorevTrade(
        pool: BigintUtils.tryParse(json["pool"]),
        tokenIn: json["token_in"],
        tokenOut: json["token_out"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool?.toString(),
      "token_in": tokenIn,
      "token_out": tokenOut
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.trade;

  @override
  List get values => [pool, tokenIn, tokenOut];
}
