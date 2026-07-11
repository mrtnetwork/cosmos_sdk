import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/auction/v1beta1/src/auction.dart"
    as injective_auction_v1beta1_auction;
import "package:cosmos_sdk/proto_messages/injective/common/vouchers/v1/src/vouchers.dart"
    as injective_common_vouchers_v1_vouchers;

/// GenesisState defines the auction module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines all the parameters of related to auction.
  final injective_auction_v1beta1_auction.Params? params;

  /// current auction round
  final BigInt? auctionRound;

  /// current highest bid
  final injective_auction_v1beta1_auction.Bid? highestBid;

  /// auction ending timestamp
  final BigInt? auctionEndingTimestamp;

  /// last auction result
  final injective_auction_v1beta1_auction.LastAuctionResult? lastAuctionResult;

  /// outstanding vouchers (failed basket deliveries)
  final List<injective_common_vouchers_v1_vouchers.AddressVoucher> vouchers;

  const GenesisState({
    this.params,
    this.auctionRound,
    this.highestBid,
    this.auctionEndingTimestamp,
    this.lastAuctionResult,
    this.vouchers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    params,
    auctionRound,
    highestBid,
    auctionEndingTimestamp,
    lastAuctionResult,
    vouchers,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'auction_round': auctionRound?.toString(),
      'highest_bid': highestBid?.toJson(),
      'auction_ending_timestamp': auctionEndingTimestamp?.toString(),
      'last_auction_result': lastAuctionResult?.toJson(),
      'vouchers': vouchers.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json.valueTo<
        injective_auction_v1beta1_auction.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_auction_v1beta1_auction.Params.fromJson(v),
        acceptCamelCase: true,
      ),
      auctionRound: json.valueAsBigInt<BigInt?>(
        'auction_round',
        acceptCamelCase: true,
      ),
      highestBid: json.valueTo<
        injective_auction_v1beta1_auction.Bid?,
        Map<String, dynamic>
      >(
        key: 'highest_bid',
        parse: (v) => injective_auction_v1beta1_auction.Bid.fromJson(v),
        acceptCamelCase: true,
      ),
      auctionEndingTimestamp: json.valueAsBigInt<BigInt?>(
        'auction_ending_timestamp',
        acceptCamelCase: true,
      ),
      lastAuctionResult: json.valueTo<
        injective_auction_v1beta1_auction.LastAuctionResult?,
        Map<String, dynamic>
      >(
        key: 'last_auction_result',
        parse:
            (v) =>
                injective_auction_v1beta1_auction.LastAuctionResult.fromJson(v),
        acceptCamelCase: true,
      ),
      vouchers:
          (json.valueEnsureAsList<dynamic>('vouchers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_common_vouchers_v1_vouchers.AddressVoucher,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_common_vouchers_v1_vouchers
                          .AddressVoucher.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_auction_v1beta1_auction.Params?>(
        1,
        (b) => injective_auction_v1beta1_auction.Params.deserialize(b),
      ),
      auctionRound: decode.getBigInt<BigInt?>(2),
      highestBid: decode.messageTo<injective_auction_v1beta1_auction.Bid?>(
        3,
        (b) => injective_auction_v1beta1_auction.Bid.deserialize(b),
      ),
      auctionEndingTimestamp: decode.getBigInt<BigInt?>(4),
      lastAuctionResult: decode
          .messageTo<injective_auction_v1beta1_auction.LastAuctionResult?>(
            5,
            (b) => injective_auction_v1beta1_auction
                .LastAuctionResult.deserialize(b),
          ),
      vouchers:
          decode
              .getListOfBytes(6)
              .map(
                (b) => injective_common_vouchers_v1_vouchers
                    .AddressVoucher.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1GenesisState;
}
