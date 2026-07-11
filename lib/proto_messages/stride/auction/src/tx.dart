import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/auction/src/auction.dart"
    as stride_auction_auction;

/// MsgPlaceBid defines the message for bidding in a token auction
class MsgPlaceBid extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPlaceBidResponse>,
        ICosmosProtoAminoMessage {
  /// Bidder's address
  final String? bidder;

  /// Token being bid on
  final String? auctionName;

  /// Amount of tokens requested in base units (utoken)
  final String? sellingTokenAmount;

  /// Amount of tokens being paid in base units (utoken)
  final String? paymentTokenAmount;

  const MsgPlaceBid({
    this.bidder,
    this.auctionName,
    this.sellingTokenAmount,
    this.paymentTokenAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "bidder"),
        ProtoOptionString(name: "amino.name", value: "auction/MsgPlaceBid"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bidder,
    auctionName,
    sellingTokenAmount,
    paymentTokenAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bidder': bidder,
      'auction_name': auctionName,
      'selling_token_amount': sellingTokenAmount,
      'payment_token_amount': paymentTokenAmount,
    };
  }

  factory MsgPlaceBid.fromJson(Map<String, dynamic> json) {
    return MsgPlaceBid(
      bidder: json.valueAsString<String?>('bidder', acceptCamelCase: true),
      auctionName: json.valueAsString<String?>(
        'auction_name',
        acceptCamelCase: true,
      ),
      sellingTokenAmount: json.valueAsString<String?>(
        'selling_token_amount',
        acceptCamelCase: true,
      ),
      paymentTokenAmount: json.valueAsString<String?>(
        'payment_token_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgPlaceBid.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPlaceBid(
      bidder: decode.getString<String?>(1),
      auctionName: decode.getString<String?>(2),
      sellingTokenAmount: decode.getString<String?>(3),
      paymentTokenAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionMsgPlaceBid;
  @override
  MsgPlaceBidResponse onServiceResponse(List<int> bytes) {
    return MsgPlaceBidResponse.deserialize(bytes);
  }

  @override
  MsgPlaceBidResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgPlaceBidResponse.fromJson(json);
  }
}

class MsgPlaceBidResponse extends CosmosProtoMessage {
  const MsgPlaceBidResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgPlaceBidResponse.fromJson(Map<String, dynamic> json) {
    return MsgPlaceBidResponse();
  }

  factory MsgPlaceBidResponse.deserialize(List<int> bytes) {
    return MsgPlaceBidResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionMsgPlaceBidResponse;
}

/// MsgCreateAuction defines the message for adding a token auction
class MsgCreateAuction extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateAuctionResponse>,
        ICosmosProtoAminoMessage {
  /// Admin's address
  final String? admin;

  /// A unique auction name
  final String? auctionName;

  /// Auction type
  final stride_auction_auction.AuctionType? auctionType;

  /// Denom on Stride of the token being auctioned off (e.g. "ibc/...")
  final String? sellingDenom;

  /// Denom on Stride of the token being used to place bids (e.g. "ustrd")
  final String? paymentDenom;

  /// Whether auction is active
  final bool? enabled;

  /// Minimum price multiplier (e.g. 0.95 for 5% discount off the oracle price)
  /// bids_floor_price = oracle_price * min_price_multiplier
  final String? minPriceMultiplier;

  /// Minimum payment token bid amount
  final String? minBidAmount;

  final String? beneficiary;

  const MsgCreateAuction({
    this.admin,
    this.auctionName,
    this.auctionType,
    this.sellingDenom,
    this.paymentDenom,
    this.enabled,
    this.minPriceMultiplier,
    this.minBidAmount,
    this.beneficiary,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "auction/MsgCreateAuction",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    auctionName,
    auctionType,
    sellingDenom,
    paymentDenom,
    enabled,
    minPriceMultiplier,
    minBidAmount,
    beneficiary,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'auction_name': auctionName,
      'auction_type': auctionType?.protoName,
      'selling_denom': sellingDenom,
      'payment_denom': paymentDenom,
      'enabled': enabled,
      'min_price_multiplier': minPriceMultiplier,
      'min_bid_amount': minBidAmount,
      'beneficiary': beneficiary,
    };
  }

  factory MsgCreateAuction.fromJson(Map<String, dynamic> json) {
    return MsgCreateAuction(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      auctionName: json.valueAsString<String?>(
        'auction_name',
        acceptCamelCase: true,
      ),
      auctionType: json.valueTo<stride_auction_auction.AuctionType?, Object?>(
        key: 'auction_type',
        parse: (v) => stride_auction_auction.AuctionType.from(v),
      ),
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
    );
  }

  factory MsgCreateAuction.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateAuction(
      admin: decode.getString<String?>(1),
      auctionName: decode.getString<String?>(2),
      auctionType: decode.getEnum<stride_auction_auction.AuctionType?>(
        3,
        stride_auction_auction.AuctionType.values,
      ),
      sellingDenom: decode.getString<String?>(4),
      paymentDenom: decode.getString<String?>(5),
      enabled: decode.getBool<bool?>(6),
      minPriceMultiplier: decode.getString<String?>(7),
      minBidAmount: decode.getString<String?>(8),
      beneficiary: decode.getString<String?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionMsgCreateAuction;
  @override
  MsgCreateAuctionResponse onServiceResponse(List<int> bytes) {
    return MsgCreateAuctionResponse.deserialize(bytes);
  }

  @override
  MsgCreateAuctionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateAuctionResponse.fromJson(json);
  }
}

class MsgCreateAuctionResponse extends CosmosProtoMessage {
  const MsgCreateAuctionResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCreateAuctionResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateAuctionResponse();
  }

  factory MsgCreateAuctionResponse.deserialize(List<int> bytes) {
    return MsgCreateAuctionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionMsgCreateAuctionResponse;
}

/// MsgUpdateAuction defines the message for adding a token auction
class MsgUpdateAuction extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateAuctionResponse>,
        ICosmosProtoAminoMessage {
  /// Admin's address
  final String? admin;

  /// A unique auction name
  final String? auctionName;

  /// Auction type
  final stride_auction_auction.AuctionType? auctionType;

  /// Whether auction is active
  final bool? enabled;

  /// Minimum price multiplier (e.g. 0.95 for 5% discount off the oracle price)
  /// bids_floor_price = oracle_price * min_price_multiplier
  final String? minPriceMultiplier;

  /// Minimum payment token bid amount
  final String? minBidAmount;

  final String? beneficiary;

  const MsgUpdateAuction({
    this.admin,
    this.auctionName,
    this.auctionType,
    this.enabled,
    this.minPriceMultiplier,
    this.minBidAmount,
    this.beneficiary,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "auction/MsgUpdateAuction",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    auctionName,
    auctionType,
    enabled,
    minPriceMultiplier,
    minBidAmount,
    beneficiary,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'auction_name': auctionName,
      'auction_type': auctionType?.protoName,
      'enabled': enabled,
      'min_price_multiplier': minPriceMultiplier,
      'min_bid_amount': minBidAmount,
      'beneficiary': beneficiary,
    };
  }

  factory MsgUpdateAuction.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAuction(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      auctionName: json.valueAsString<String?>(
        'auction_name',
        acceptCamelCase: true,
      ),
      auctionType: json.valueTo<stride_auction_auction.AuctionType?, Object?>(
        key: 'auction_type',
        parse: (v) => stride_auction_auction.AuctionType.from(v),
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
    );
  }

  factory MsgUpdateAuction.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAuction(
      admin: decode.getString<String?>(1),
      auctionName: decode.getString<String?>(2),
      auctionType: decode.getEnum<stride_auction_auction.AuctionType?>(
        3,
        stride_auction_auction.AuctionType.values,
      ),
      enabled: decode.getBool<bool?>(4),
      minPriceMultiplier: decode.getString<String?>(5),
      minBidAmount: decode.getString<String?>(6),
      beneficiary: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionMsgUpdateAuction;
  @override
  MsgUpdateAuctionResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateAuctionResponse.deserialize(bytes);
  }

  @override
  MsgUpdateAuctionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateAuctionResponse.fromJson(json);
  }
}

class MsgUpdateAuctionResponse extends CosmosProtoMessage {
  const MsgUpdateAuctionResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateAuctionResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAuctionResponse();
  }

  factory MsgUpdateAuctionResponse.deserialize(List<int> bytes) {
    return MsgUpdateAuctionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionMsgUpdateAuctionResponse;
}
