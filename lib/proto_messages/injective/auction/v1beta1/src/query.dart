import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/auction/v1beta1/src/auction.dart"
    as injective_auction_v1beta1_auction;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/auction/v1beta1/src/genesis.dart"
    as injective_auction_v1beta1_genesis;
import "package:cosmos_sdk/proto_messages/injective/common/vouchers/v1/src/vouchers.dart"
    as injective_common_vouchers_v1_vouchers;

/// QueryAuctionParamsRequest is the request type for the Query/AuctionParams RPC
/// method.
class QueryAuctionParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAuctionParamsResponse> {
  const QueryAuctionParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/auction/v1beta1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryAuctionParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAuctionParamsRequest();
  }

  factory QueryAuctionParamsRequest.deserialize(List<int> bytes) {
    return QueryAuctionParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveAuctionV1beta1QueryAuctionParamsRequest;
  @override
  QueryAuctionParamsResponse onQueryResponse(List<int> bytes) {
    return QueryAuctionParamsResponse.deserialize(bytes);
  }

  @override
  QueryAuctionParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAuctionParamsResponse.fromJson(json);
  }
}

/// QueryAuctionParamsRequest is the response type for the Query/AuctionParams
/// RPC method.
class QueryAuctionParamsResponse extends CosmosProtoMessage {
  final injective_auction_v1beta1_auction.Params? params;

  const QueryAuctionParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryAuctionParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAuctionParamsResponse(
      params: json.valueTo<
        injective_auction_v1beta1_auction.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_auction_v1beta1_auction.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAuctionParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionParamsResponse(
      params: decode.messageTo<injective_auction_v1beta1_auction.Params?>(
        1,
        (b) => injective_auction_v1beta1_auction.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveAuctionV1beta1QueryAuctionParamsResponse;
}

/// QueryCurrentAuctionBasketRequest is the request type for the
/// Query/CurrentAuctionBasket RPC method.
class QueryCurrentAuctionBasketRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCurrentAuctionBasketResponse> {
  const QueryCurrentAuctionBasketRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/auction/v1beta1/basket",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryCurrentAuctionBasketRequest.fromJson(Map<String, dynamic> json) {
    return QueryCurrentAuctionBasketRequest();
  }

  factory QueryCurrentAuctionBasketRequest.deserialize(List<int> bytes) {
    return QueryCurrentAuctionBasketRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveAuctionV1beta1QueryCurrentAuctionBasketRequest;
  @override
  QueryCurrentAuctionBasketResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentAuctionBasketResponse.deserialize(bytes);
  }

  @override
  QueryCurrentAuctionBasketResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCurrentAuctionBasketResponse.fromJson(json);
  }
}

/// QueryCurrentAuctionBasketResponse is the response type for the
/// Query/CurrentAuctionBasket RPC method.
class QueryCurrentAuctionBasketResponse extends CosmosProtoMessage {
  /// amount describes the amount put on auction
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  /// auctionRound describes current auction round
  final BigInt? auctionRound;

  /// auctionClosingTime describes auction close time for the round
  final BigInt? auctionClosingTime;

  /// highestBidder describes highest bidder on current round
  final String? highestBidder;

  /// highestBidAmount describes highest bid amount on current round
  final String? highestBidAmount;

  const QueryCurrentAuctionBasketResponse({
    this.amount = const [],
    this.auctionRound,
    this.auctionClosingTime,
    this.highestBidder,
    this.highestBidAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    amount,
    auctionRound,
    auctionClosingTime,
    highestBidder,
    highestBidAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'amount': amount.map((e) => e.toJson()).toList(),
      'auctionRound': auctionRound?.toString(),
      'auctionClosingTime': auctionClosingTime?.toString(),
      'highestBidder': highestBidder,
      'highestBidAmount': highestBidAmount,
    };
  }

  factory QueryCurrentAuctionBasketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryCurrentAuctionBasketResponse(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      auctionRound: json.valueAsBigInt<BigInt?>(
        'auctionRound',
        acceptCamelCase: true,
      ),
      auctionClosingTime: json.valueAsBigInt<BigInt?>(
        'auctionClosingTime',
        acceptCamelCase: true,
      ),
      highestBidder: json.valueAsString<String?>(
        'highestBidder',
        acceptCamelCase: true,
      ),
      highestBidAmount: json.valueAsString<String?>(
        'highestBidAmount',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCurrentAuctionBasketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentAuctionBasketResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      auctionRound: decode.getBigInt<BigInt?>(2),
      auctionClosingTime: decode.getBigInt<BigInt?>(3),
      highestBidder: decode.getString<String?>(4),
      highestBidAmount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveAuctionV1beta1QueryCurrentAuctionBasketResponse;
}

/// QueryModuleStateRequest is the request type for the Query/AuctionModuleState
/// RPC method.
class QueryModuleStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleStateResponse> {
  const QueryModuleStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/auction/v1beta1/module_state",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryModuleStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the
/// Query/AuctionModuleState RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  final injective_auction_v1beta1_genesis.GenesisState? state;

  const QueryModuleStateResponse({this.state});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryModuleStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse(
      state: json.valueTo<
        injective_auction_v1beta1_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse:
            (v) => injective_auction_v1beta1_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode.messageTo<injective_auction_v1beta1_genesis.GenesisState?>(
        1,
        (b) => injective_auction_v1beta1_genesis.GenesisState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1QueryModuleStateResponse;
}

class QueryLastAuctionResultRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastAuctionResultResponse> {
  const QueryLastAuctionResultRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/auction/v1beta1/last_auction_result",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryLastAuctionResultRequest.fromJson(Map<String, dynamic> json) {
    return QueryLastAuctionResultRequest();
  }

  factory QueryLastAuctionResultRequest.deserialize(List<int> bytes) {
    return QueryLastAuctionResultRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveAuctionV1beta1QueryLastAuctionResultRequest;
  @override
  QueryLastAuctionResultResponse onQueryResponse(List<int> bytes) {
    return QueryLastAuctionResultResponse.deserialize(bytes);
  }

  @override
  QueryLastAuctionResultResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastAuctionResultResponse.fromJson(json);
  }
}

class QueryLastAuctionResultResponse extends CosmosProtoMessage {
  final injective_auction_v1beta1_auction.LastAuctionResult? lastAuctionResult;

  const QueryLastAuctionResultResponse({this.lastAuctionResult});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lastAuctionResult];

  @override
  Map<String, dynamic> toJson() {
    return {'last_auction_result': lastAuctionResult?.toJson()};
  }

  factory QueryLastAuctionResultResponse.fromJson(Map<String, dynamic> json) {
    return QueryLastAuctionResultResponse(
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
    );
  }

  factory QueryLastAuctionResultResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastAuctionResultResponse(
      lastAuctionResult: decode
          .messageTo<injective_auction_v1beta1_auction.LastAuctionResult?>(
            1,
            (b) => injective_auction_v1beta1_auction
                .LastAuctionResult.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveAuctionV1beta1QueryLastAuctionResultResponse;
}

class QueryVouchersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVouchersResponse> {
  /// denom filter; empty string returns all vouchers
  final String? denom;

  const QueryVouchersRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/auction/v1beta1/vouchers",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryVouchersRequest.fromJson(Map<String, dynamic> json) {
    return QueryVouchersRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryVouchersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVouchersRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1QueryVouchersRequest;
  @override
  QueryVouchersResponse onQueryResponse(List<int> bytes) {
    return QueryVouchersResponse.deserialize(bytes);
  }

  @override
  QueryVouchersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVouchersResponse.fromJson(json);
  }
}

class QueryVouchersResponse extends CosmosProtoMessage {
  /// List of outstanding vouchers matching the request filter.
  final List<injective_common_vouchers_v1_vouchers.AddressVoucher> vouchers;

  const QueryVouchersResponse({this.vouchers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [vouchers];

  @override
  Map<String, dynamic> toJson() {
    return {'vouchers': vouchers.map((e) => e.toJson()).toList()};
  }

  factory QueryVouchersResponse.fromJson(Map<String, dynamic> json) {
    return QueryVouchersResponse(
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

  factory QueryVouchersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVouchersResponse(
      vouchers:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_common_vouchers_v1_vouchers
                    .AddressVoucher.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1QueryVouchersResponse;
}

class QueryVoucherRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVoucherResponse> {
  /// Required. The token denom to look up.
  final String? denom;

  /// Required. The bech32 address of the voucher holder.
  final String? address;

  const QueryVoucherRequest({this.denom, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/auction/v1beta1/voucher",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, address];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'address': address};
  }

  factory QueryVoucherRequest.fromJson(Map<String, dynamic> json) {
    return QueryVoucherRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryVoucherRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoucherRequest(
      denom: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1QueryVoucherRequest;
  @override
  QueryVoucherResponse onQueryResponse(List<int> bytes) {
    return QueryVoucherResponse.deserialize(bytes);
  }

  @override
  QueryVoucherResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVoucherResponse.fromJson(json);
  }
}

class QueryVoucherResponse extends CosmosProtoMessage {
  /// The outstanding voucher coin for the requested denom and address.
  final cosmos_base_v1beta1_coin.Coin? voucher;

  const QueryVoucherResponse({this.voucher});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [voucher];

  @override
  Map<String, dynamic> toJson() {
    return {'voucher': voucher?.toJson()};
  }

  factory QueryVoucherResponse.fromJson(Map<String, dynamic> json) {
    return QueryVoucherResponse(
      voucher: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'voucher',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryVoucherResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoucherResponse(
      voucher: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1QueryVoucherResponse;
}
