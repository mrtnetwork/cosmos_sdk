import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

enum AuctionType implements ProtoEnumVariant {
  /// Default value - should not be used
  auctionTypeUnspecified(0, 'AUCTION_TYPE_UNSPECIFIED'),

  /// First-Come First-Served auction
  auctionTypeFcfs(1, 'AUCTION_TYPE_FCFS');

  const AuctionType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static AuctionType fromValue(int? value) {
    return AuctionType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "AuctionType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static AuctionType from(Object? value) {
    return AuctionType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "AuctionType", value: value),
    );
  }
}

class Auction extends CosmosProtoMessage {
  /// Auction type
  final AuctionType? type;

  /// A unique auction name
  final String? name;

  /// Token denom being sold in the auction
  final String? sellingDenom;

  /// Token denom used to place bids
  final String? paymentDenom;

  /// Whether auction is active
  final bool? enabled;

  /// Minimum price multiplier (e.g. 0.95 for 5% discount off the oracle price)
  /// bids_floor_price = oracle_price * min_price_multiplier
  final String? minPriceMultiplier;

  /// Minimum payment token bid amount
  final String? minBidAmount;

  /// Address to send the auction proceeds to
  final String? beneficiary;

  /// Total amount of payment token received
  final String? totalPaymentTokenReceived;

  /// Total amount of selling token sold
  final String? totalSellingTokenSold;

  const Auction({
    this.type,
    this.name,
    this.sellingDenom,
    this.paymentDenom,
    this.enabled,
    this.minPriceMultiplier,
    this.minBidAmount,
    this.beneficiary,
    this.totalPaymentTokenReceived,
    this.totalSellingTokenSold,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    type,
    name,
    sellingDenom,
    paymentDenom,
    enabled,
    minPriceMultiplier,
    minBidAmount,
    beneficiary,
    totalPaymentTokenReceived,
    totalSellingTokenSold,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type?.protoName,
      'name': name,
      'selling_denom': sellingDenom,
      'payment_denom': paymentDenom,
      'enabled': enabled,
      'min_price_multiplier': minPriceMultiplier,
      'min_bid_amount': minBidAmount,
      'beneficiary': beneficiary,
      'total_payment_token_received': totalPaymentTokenReceived,
      'total_selling_token_sold': totalSellingTokenSold,
    };
  }

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
      type: json.valueTo<AuctionType?, Object?>(
        key: 'type',
        parse: (v) => AuctionType.from(v),
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      sellingDenom: json.valueAsString<String?>(
        'selling_denom',
        acceptCamelCase: true,
      ),
      paymentDenom: json.valueAsString<String?>(
        'payment_denom',
        acceptCamelCase: true,
      ),
      enabled: json.valueAsBool<bool?>('enabled', acceptCamelCase: true),
      minPriceMultiplier: json.valueAsString<String?>(
        'min_price_multiplier',
        acceptCamelCase: true,
      ),
      minBidAmount: json.valueAsString<String?>(
        'min_bid_amount',
        acceptCamelCase: true,
      ),
      beneficiary: json.valueAsString<String?>(
        'beneficiary',
        acceptCamelCase: true,
      ),
      totalPaymentTokenReceived: json.valueAsString<String?>(
        'total_payment_token_received',
        acceptCamelCase: true,
      ),
      totalSellingTokenSold: json.valueAsString<String?>(
        'total_selling_token_sold',
        acceptCamelCase: true,
      ),
    );
  }

  factory Auction.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Auction(
      type: decode.getEnum<AuctionType?>(1, AuctionType.values),
      name: decode.getString<String?>(2),
      sellingDenom: decode.getString<String?>(3),
      paymentDenom: decode.getString<String?>(4),
      enabled: decode.getBool<bool?>(5),
      minPriceMultiplier: decode.getString<String?>(6),
      minBidAmount: decode.getString<String?>(7),
      beneficiary: decode.getString<String?>(8),
      totalPaymentTokenReceived: decode.getString<String?>(9),
      totalSellingTokenSold: decode.getString<String?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionAuction;
}
