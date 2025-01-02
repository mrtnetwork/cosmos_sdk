import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// UserPosition represents user account in a sale
class OsmosisStreamSwapUserPosition extends CosmosMessage {
  final String shares;

  /// total number of currently staked tokens
  final String staked;

  /// last token/share ratio
  final String outPerShare;

  /// amount of token_in spent
  final String spent;

  /// Amount of accumulated, not withdrawn, purchased tokens (token_out)
  final String purchased;
  const OsmosisStreamSwapUserPosition({
    required this.shares,
    required this.staked,
    required this.outPerShare,
    required this.spent,
    required this.purchased,
  });

  factory OsmosisStreamSwapUserPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapUserPosition(
        shares: decode.getField(1),
        staked: decode.getField(2),
        outPerShare: decode.getField(3),
        spent: decode.getField(4),
        purchased: decode.getField(5));
  }
  factory OsmosisStreamSwapUserPosition.fromRpc(Map<String, dynamic> json) {
    return OsmosisStreamSwapUserPosition(
        shares: json["shares"],
        staked: json["staked"],
        outPerShare: json["out_per_share"],
        spent: json["spent"],
        purchased: json["purchased"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "shares": shares,
      "staked": staked,
      "out_per_share": outPerShare,
      "spent": spent,
      "purchased": purchased
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.userPosition;

  @override
  List get values => [shares, staked, outPerShare, spent, purchased];
}
