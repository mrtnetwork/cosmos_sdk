import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// UserPositionKV is a record in genesis representing acc_address user position of a sale_id sale.
class OsmosisStreamSwapSale extends CosmosMessage {
  /// Destination for the earned token_in
  final String? treasury;
  final BigInt? id;

  /// token_out is a token denom to be bootstraped. May be referred as base
  /// currency, or a sale token.
  final String? tokenOut;

  /// token_in is a token denom used to buy sale tokens ([tokenOut]). May be
  /// referred as quote_currency or payment token.
  final String? tokenIn;

  /// total number of [tokenOut] to be sold during the continuous sale.
  final String tokenOutSupply;

  /// start time when the token emission starts.
  final ProtobufTimestamp startTime;

  /// end time when the token emission ends. Can't be bigger than start +
  /// 139years (to avoid round overflow)
  final ProtobufTimestamp endTime;

  /// Round number when the sale was last time updated.
  final BigInt? round;

  /// Last round of the Sale;
  final BigInt? endRound;

  /// amout of remaining [tokenOut] to sell
  final String outRemaining;

  /// amount of token_out sold
  final String outSold;

  /// out token per share
  final String outPerShare;

  /// total amount of currently staked coins ([tokenIn]) but not spent coins.
  final String staked;

  /// total amount of earned coins ([tokenIn])
  final String income;

  /// total amount of shares
  final String shares;

  /// Name for the sale.
  final String? name;

  /// URL with sale and project details.
  final String? url;

  const OsmosisStreamSwapSale(
      {this.treasury,
      this.id,
      this.tokenOut,
      this.tokenIn,
      required this.tokenOutSupply,
      required this.startTime,
      required this.endTime,
      this.round,
      this.endRound,
      required this.outRemaining,
      required this.outSold,
      required this.outPerShare,
      required this.staked,
      required this.income,
      required this.shares,
      this.name,
      this.url});
  factory OsmosisStreamSwapSale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapSale(
        treasury: decode.getField(1),
        id: decode.getField(2),
        tokenOut: decode.getField(3),
        tokenIn: decode.getField(4),
        tokenOutSupply: decode.getField(5),
        startTime: ProtobufTimestamp.deserialize(decode.getField(6)),
        endTime: ProtobufTimestamp.deserialize(decode.getField(7)),
        round: decode.getField(8),
        endRound: decode.getField(9),
        outRemaining: decode.getField(10),
        outSold: decode.getField(11),
        outPerShare: decode.getField(12),
        staked: decode.getField(13),
        income: decode.getField(14),
        shares: decode.getField(15),
        name: decode.getField(20),
        url: decode.getField(21));
  }
  factory OsmosisStreamSwapSale.fromRpc(Map<String, dynamic> json) {
    return OsmosisStreamSwapSale(
      treasury: json["treasury"],
      id: BigintUtils.tryParse(json["id"]),
      tokenOut: json["token_out"],
      tokenIn: json["token_in"],
      tokenOutSupply: json["token_out_supply"],
      startTime: ProtobufTimestamp.fromString(json["start_time"]),
      endTime: ProtobufTimestamp.fromString(json["end_time"]),
      round: BigintUtils.tryParse(json["round"]),
      endRound: BigintUtils.tryParse(json["end_round"]),
      name: json["name"],
      url: json["url"],
      outRemaining: json["out_remaining"],
      outSold: json["out_sold"],
      outPerShare: json["out_per_share"],
      staked: json["staked"],
      income: json["income"],
      shares: json["shares"],
    );
  }

  @override
  List<int> get fieldIds =>
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 20, 21];

  @override
  Map<String, dynamic> toJson() {
    return {
      "treasury": treasury,
      "id": id?.toString(),
      "token_out": tokenOut,
      "token_in": tokenIn,
      "token_out_supply": tokenOutSupply,
      "start_time": startTime.toJson(),
      "end_time": endTime.toJson(),
      "round": round.toString(),
      "end_round": endRound?.toString(),
      "out_remaining": outRemaining,
      "out_sold": outSold,
      "out_per_share": outPerShare,
      "staked": staked,
      "income": income,
      "shares": shares,
      "name": name,
      "url": url
    };
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.sale.typeUrl;

  @override
  List get values => [
        treasury,
        id,
        tokenOut,
        tokenIn,
        tokenOutSupply,
        startTime,
        endTime,
        round,
        endRound,
        outRemaining,
        outSold,
        outPerShare,
        staked,
        income,
        shares,
        name,
        url
      ];
}
