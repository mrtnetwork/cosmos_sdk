import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class Params extends CosmosProtoMessage {
  /// auction_period_duration defines the auction period duration
  final BigInt? auctionPeriod;

  /// min_next_bid_increment_rate defines the minimum increment rate for new bids
  final String? minNextBidIncrementRate;

  /// inj_basket_max_cap defines the maximum cap for INJ contained in an auction
  /// basket
  final String? injBasketMaxCap;

  /// bidders_whitelist defines the list of addresses that are allowed to bid
  /// if empty, any address can bid; if populated, only whitelisted addresses can
  /// bid
  final List<String> biddersWhitelist;

  const Params({
    this.auctionPeriod,
    this.minNextBidIncrementRate,
    this.injBasketMaxCap,
    this.biddersWhitelist = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "auction/Params")],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    auctionPeriod,
    minNextBidIncrementRate,
    injBasketMaxCap,
    biddersWhitelist,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'auction_period': auctionPeriod?.toString(),
      'min_next_bid_increment_rate': minNextBidIncrementRate,
      'inj_basket_max_cap': injBasketMaxCap,
      'bidders_whitelist': biddersWhitelist.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      auctionPeriod: json.valueAsBigInt<BigInt?>(
        'auction_period',
        acceptCamelCase: true,
      ),
      minNextBidIncrementRate: json.valueAsString<String?>(
        'min_next_bid_increment_rate',
        acceptCamelCase: true,
      ),
      injBasketMaxCap: json.valueAsString<String?>(
        'inj_basket_max_cap',
        acceptCamelCase: true,
      ),
      biddersWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'bidders_whitelist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      auctionPeriod: decode.getBigInt<BigInt?>(1),
      minNextBidIncrementRate: decode.getString<String?>(2),
      injBasketMaxCap: decode.getString<String?>(3),
      biddersWhitelist: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1Params;
}

class Bid extends CosmosProtoMessage {
  final String? bidder;

  final cosmos_base_v1beta1_coin.Coin? amount;

  const Bid({this.bidder, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bidder, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'bidder': bidder, 'amount': amount?.toJson()};
  }

  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(
      bidder: json.valueAsString<String?>('bidder', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Bid.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Bid(
      bidder: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1Bid;
}

class LastAuctionResult extends CosmosProtoMessage {
  /// winner describes the address of the winner
  final String? winner;

  /// amount describes the amount the winner get from the auction
  final cosmos_base_v1beta1_coin.Coin? amount;

  /// round defines the round number of auction
  final BigInt? round;

  const LastAuctionResult({this.winner, this.amount, this.round});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [winner, amount, round];

  @override
  Map<String, dynamic> toJson() {
    return {
      'winner': winner,
      'amount': amount?.toJson(),
      'round': round?.toString(),
    };
  }

  factory LastAuctionResult.fromJson(Map<String, dynamic> json) {
    return LastAuctionResult(
      winner: json.valueAsString<String?>('winner', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      round: json.valueAsBigInt<BigInt?>('round', acceptCamelCase: true),
    );
  }

  factory LastAuctionResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LastAuctionResult(
      winner: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      round: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1LastAuctionResult;
}
