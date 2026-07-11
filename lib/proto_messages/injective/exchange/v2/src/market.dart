import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;

enum MarketStatus implements ProtoEnumVariant {
  unspecified(0, 'Unspecified'),
  active(1, 'Active'),
  paused(2, 'Paused'),
  demolished(3, 'Demolished'),
  expired(4, 'Expired'),
  forcePaused(5, 'ForcePaused');

  const MarketStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static MarketStatus fromValue(int? value) {
    return MarketStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "MarketStatus", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static MarketStatus from(Object? value) {
    return MarketStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "MarketStatus", value: value),
    );
  }
}

enum ForcePausedReason implements ProtoEnumVariant {
  quoteDenomPaused(0, 'QuoteDenomPaused');

  const ForcePausedReason(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ForcePausedReason fromValue(int? value) {
    return ForcePausedReason.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ForcePausedReason",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ForcePausedReason from(Object? value) {
    return ForcePausedReason.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ForcePausedReason",
                value: value,
              ),
    );
  }
}

class ForcePausedInfo extends CosmosProtoMessage {
  final ForcePausedReason? reason;

  final String? markPriceAtPausing;

  const ForcePausedInfo({this.reason, this.markPriceAtPausing});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [reason, markPriceAtPausing];

  @override
  Map<String, dynamic> toJson() {
    return {
      'reason': reason?.protoName,
      'mark_price_at_pausing': markPriceAtPausing,
    };
  }

  factory ForcePausedInfo.fromJson(Map<String, dynamic> json) {
    return ForcePausedInfo(
      reason: json.valueTo<ForcePausedReason?, Object?>(
        key: 'reason',
        parse: (v) => ForcePausedReason.from(v),
      ),
      markPriceAtPausing: json.valueAsString<String?>(
        'mark_price_at_pausing',
        acceptCamelCase: true,
      ),
    );
  }

  factory ForcePausedInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ForcePausedInfo(
      reason: decode.getEnum<ForcePausedReason?>(1, ForcePausedReason.values),
      markPriceAtPausing: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2ForcePausedInfo;
}

class OpenNotionalCap extends CosmosProtoMessage {
  final OpenNotionalCapUncapped? uncapped;

  final OpenNotionalCapCapped? capped;

  const OpenNotionalCap({this.uncapped, this.capped});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective.exchange.v2.OpenNotionalCap",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [
            ProtoOptionString(
              name: "amino.oneof_name",
              value: "injective.exchange.v2.OpenNotionalCapUncapped",
            ),
          ],
        ),
        ProtoFieldConfig.message(
          2,
          options: [
            ProtoOptionString(
              name: "amino.oneof_name",
              value: "injective.exchange.v2.OpenNotionalCapCapped",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [uncapped, capped];

  @override
  Map<String, dynamic> toJson() {
    return {'uncapped': uncapped?.toJson(), 'capped': capped?.toJson()};
  }

  factory OpenNotionalCap.fromJson(Map<String, dynamic> json) {
    return OpenNotionalCap(
      uncapped: json.valueTo<OpenNotionalCapUncapped?, Map<String, dynamic>>(
        key: 'uncapped',
        parse: (v) => OpenNotionalCapUncapped.fromJson(v),
        acceptCamelCase: true,
      ),
      capped: json.valueTo<OpenNotionalCapCapped?, Map<String, dynamic>>(
        key: 'capped',
        parse: (v) => OpenNotionalCapCapped.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory OpenNotionalCap.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OpenNotionalCap(
      uncapped: decode.messageTo<OpenNotionalCapUncapped?>(
        1,
        (b) => OpenNotionalCapUncapped.deserialize(b),
      ),
      capped: decode.messageTo<OpenNotionalCapCapped?>(
        2,
        (b) => OpenNotionalCapCapped.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OpenNotionalCap;
}

class OpenNotionalCapUncapped extends CosmosProtoMessage {
  const OpenNotionalCapUncapped();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective.exchange.v2.OpenNotionalCapUncapped",
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

  factory OpenNotionalCapUncapped.fromJson(Map<String, dynamic> json) {
    return OpenNotionalCapUncapped();
  }

  factory OpenNotionalCapUncapped.deserialize(List<int> bytes) {
    return OpenNotionalCapUncapped();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OpenNotionalCapUncapped;
}

class OpenNotionalCapCapped extends CosmosProtoMessage {
  final String? value;

  const OpenNotionalCapCapped({this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "injective.exchange.v2.OpenNotionalCapCapped",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [value];

  @override
  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  factory OpenNotionalCapCapped.fromJson(Map<String, dynamic> json) {
    return OpenNotionalCapCapped(
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
    );
  }

  factory OpenNotionalCapCapped.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OpenNotionalCapCapped(value: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OpenNotionalCapCapped;
}

class MarketFeeMultiplier extends CosmosProtoMessage {
  final String? marketId;

  final String? feeMultiplier;

  const MarketFeeMultiplier({this.marketId, this.feeMultiplier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, feeMultiplier];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'fee_multiplier': feeMultiplier};
  }

  factory MarketFeeMultiplier.fromJson(Map<String, dynamic> json) {
    return MarketFeeMultiplier(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      feeMultiplier: json.valueAsString<String?>(
        'fee_multiplier',
        acceptCamelCase: true,
      ),
    );
  }

  factory MarketFeeMultiplier.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MarketFeeMultiplier(
      marketId: decode.getString<String?>(1),
      feeMultiplier: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MarketFeeMultiplier;
}

/// An object describing trade pair of two assets.
class SpotMarket extends CosmosProtoMessage {
  /// A name of the pair in format AAA/BBB, where AAA is base asset, BBB is quote
  /// asset.
  final String? ticker;

  /// Coin denom used for the base asset
  final String? baseDenom;

  /// Coin used for the quote asset
  final String? quoteDenom;

  /// maker_fee_rate defines the fee percentage makers pay when trading
  final String? makerFeeRate;

  /// taker_fee_rate defines the fee percentage takers pay when trading
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the percentage of the transaction fee shared
  /// with the relayer in a derivative market
  final String? relayerFeeShareRate;

  /// Unique market ID.
  final String? marketId;

  /// Status of the market
  final MarketStatus? status;

  /// min_price_tick_size defines the minimum tick size that the price required
  /// for orders in the market (in human readable format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market (in human readable format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in human readable format)
  final String? minNotional;

  /// current market admin
  final String? admin;

  /// level of admin permissions
  final int? adminPermissions;

  /// base token decimals
  final int? baseDecimals;

  /// quote token decimals
  final int? quoteDecimals;

  /// has_disabled_minimal_protocol_fee indicates whether the minimal protocol
  /// fee is disabled for the market
  final bool? hasDisabledMinimalProtocolFee;

  const SpotMarket({
    this.ticker,
    this.baseDenom,
    this.quoteDenom,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.marketId,
    this.status,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.admin,
    this.adminPermissions,
    this.baseDecimals,
    this.quoteDecimals,
    this.hasDisabledMinimalProtocolFee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.enumType(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.uint32(13),
        ProtoFieldConfig.uint32(14),
        ProtoFieldConfig.uint32(15),
        ProtoFieldConfig.bool(16),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ticker,
    baseDenom,
    quoteDenom,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    marketId,
    status,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    admin,
    adminPermissions,
    baseDecimals,
    quoteDecimals,
    hasDisabledMinimalProtocolFee,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'market_id': marketId,
      'status': status?.protoName,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin': admin,
      'admin_permissions': adminPermissions,
      'base_decimals': baseDecimals,
      'quote_decimals': quoteDecimals,
      'has_disabled_minimal_protocol_fee': hasDisabledMinimalProtocolFee,
    };
  }

  factory SpotMarket.fromJson(Map<String, dynamic> json) {
    return SpotMarket(
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      status: json.valueTo<MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => MarketStatus.from(v),
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        acceptCamelCase: true,
      ),
      baseDecimals: json.valueAsInt<int?>(
        'base_decimals',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
      hasDisabledMinimalProtocolFee: json.valueAsBool<bool?>(
        'has_disabled_minimal_protocol_fee',
        acceptCamelCase: true,
      ),
    );
  }

  factory SpotMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotMarket(
      ticker: decode.getString<String?>(1),
      baseDenom: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      makerFeeRate: decode.getString<String?>(4),
      takerFeeRate: decode.getString<String?>(5),
      relayerFeeShareRate: decode.getString<String?>(6),
      marketId: decode.getString<String?>(7),
      status: decode.getEnum<MarketStatus?>(8, MarketStatus.values),
      minPriceTickSize: decode.getString<String?>(9),
      minQuantityTickSize: decode.getString<String?>(10),
      minNotional: decode.getString<String?>(11),
      admin: decode.getString<String?>(12),
      adminPermissions: decode.getInt<int?>(13),
      baseDecimals: decode.getInt<int?>(14),
      quoteDecimals: decode.getInt<int?>(15),
      hasDisabledMinimalProtocolFee: decode.getBool<bool?>(16),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SpotMarket;
}

/// An object describing a binary options market in Injective Protocol.
class BinaryOptionsMarket extends CosmosProtoMessage {
  /// Ticker for the derivative contract.
  final String? ticker;

  /// Oracle symbol
  final String? oracleSymbol;

  /// Oracle Provider
  final String? oracleProvider;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// admin of the market
  final String? admin;

  /// Address of the quote currency denomination for the binary options contract
  final String? quoteDenom;

  /// Unique market ID.
  final String? marketId;

  /// maker_fee_rate defines the maker fee rate of a binary options market
  final String? makerFeeRate;

  /// taker_fee_rate defines the taker fee rate of a derivative market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the percentage of the transaction fee shared
  /// with the relayer in a derivative market
  final String? relayerFeeShareRate;

  /// Status of the market
  final MarketStatus? status;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market (in human readable format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market (in human readable format)
  final String? minQuantityTickSize;

  /// settlement_price defines the settlement price of the binary options market
  /// (in human readable format)
  final String? settlementPrice;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in human readable format)
  final String? minNotional;

  /// level of admin permissions
  final int? adminPermissions;

  /// quote token decimals
  final int? quoteDecimals;

  /// open_notional_cap defines the maximum open notional for the market
  final OpenNotionalCap? openNotionalCap;

  /// has_disabled_minimal_protocol_fee indicates whether the minimal protocol
  /// fee is disabled for the market
  final bool? hasDisabledMinimalProtocolFee;

  /// force_paused_info defines additional info for force paused markets, only
  /// set when status == ForcePaused
  final ForcePausedInfo? forcePausedInfo;

  const BinaryOptionsMarket({
    this.ticker,
    this.oracleSymbol,
    this.oracleProvider,
    this.oracleType,
    this.oracleScaleFactor,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.admin,
    this.quoteDenom,
    this.marketId,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.status,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.settlementPrice,
    this.minNotional,
    this.adminPermissions,
    this.quoteDecimals,
    this.openNotionalCap,
    this.hasDisabledMinimalProtocolFee,
    this.forcePausedInfo,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.uint32(5),
        ProtoFieldConfig.int64(6),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.enumType(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.uint32(19),
        ProtoFieldConfig.uint32(20),
        ProtoFieldConfig.message(21, options: const []),
        ProtoFieldConfig.bool(22),
        ProtoFieldConfig.message(23),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ticker,
    oracleSymbol,
    oracleProvider,
    oracleType,
    oracleScaleFactor,
    expirationTimestamp,
    settlementTimestamp,
    admin,
    quoteDenom,
    marketId,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    status,
    minPriceTickSize,
    minQuantityTickSize,
    settlementPrice,
    minNotional,
    adminPermissions,
    quoteDecimals,
    openNotionalCap,
    hasDisabledMinimalProtocolFee,
    forcePausedInfo,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'oracle_symbol': oracleSymbol,
      'oracle_provider': oracleProvider,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'settlement_timestamp': settlementTimestamp?.toString(),
      'admin': admin,
      'quote_denom': quoteDenom,
      'market_id': marketId,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'status': status?.protoName,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'settlement_price': settlementPrice,
      'min_notional': minNotional,
      'admin_permissions': adminPermissions,
      'quote_decimals': quoteDecimals,
      'open_notional_cap': openNotionalCap?.toJson(),
      'has_disabled_minimal_protocol_fee': hasDisabledMinimalProtocolFee,
      'force_paused_info': forcePausedInfo?.toJson(),
    };
  }

  factory BinaryOptionsMarket.fromJson(Map<String, dynamic> json) {
    return BinaryOptionsMarket(
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      oracleSymbol: json.valueAsString<String?>(
        'oracle_symbol',
        acceptCamelCase: true,
      ),
      oracleProvider: json.valueAsString<String?>(
        'oracle_provider',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        acceptCamelCase: true,
      ),
      settlementTimestamp: json.valueAsBigInt<BigInt?>(
        'settlement_timestamp',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      status: json.valueTo<MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => MarketStatus.from(v),
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
      openNotionalCap: json.valueTo<OpenNotionalCap?, Map<String, dynamic>>(
        key: 'open_notional_cap',
        parse: (v) => OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
      hasDisabledMinimalProtocolFee: json.valueAsBool<bool?>(
        'has_disabled_minimal_protocol_fee',
        acceptCamelCase: true,
      ),
      forcePausedInfo: json.valueTo<ForcePausedInfo?, Map<String, dynamic>>(
        key: 'force_paused_info',
        parse: (v) => ForcePausedInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory BinaryOptionsMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BinaryOptionsMarket(
      ticker: decode.getString<String?>(1),
      oracleSymbol: decode.getString<String?>(2),
      oracleProvider: decode.getString<String?>(3),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        4,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(5),
      expirationTimestamp: decode.getBigInt<BigInt?>(6),
      settlementTimestamp: decode.getBigInt<BigInt?>(7),
      admin: decode.getString<String?>(8),
      quoteDenom: decode.getString<String?>(9),
      marketId: decode.getString<String?>(10),
      makerFeeRate: decode.getString<String?>(11),
      takerFeeRate: decode.getString<String?>(12),
      relayerFeeShareRate: decode.getString<String?>(13),
      status: decode.getEnum<MarketStatus?>(14, MarketStatus.values),
      minPriceTickSize: decode.getString<String?>(15),
      minQuantityTickSize: decode.getString<String?>(16),
      settlementPrice: decode.getString<String?>(17),
      minNotional: decode.getString<String?>(18),
      adminPermissions: decode.getInt<int?>(19),
      quoteDecimals: decode.getInt<int?>(20),
      openNotionalCap: decode.messageTo<OpenNotionalCap?>(
        21,
        (b) => OpenNotionalCap.deserialize(b),
      ),
      hasDisabledMinimalProtocolFee: decode.getBool<bool?>(22),
      forcePausedInfo: decode.messageTo<ForcePausedInfo?>(
        23,
        (b) => ForcePausedInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2BinaryOptionsMarket;
}

/// An object describing a derivative market in the Injective Futures Protocol.
class DerivativeMarket extends CosmosProtoMessage {
  /// Ticker for the derivative contract.
  final String? ticker;

  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Address of the quote currency denomination for the derivative contract
  final String? quoteDenom;

  /// Unique market ID.
  final String? marketId;

  /// initial_margin_ratio defines the initial margin ratio of a derivative
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio of a
  /// derivative market
  final String? maintenanceMarginRatio;

  /// maker_fee_rate defines the maker fee rate of a derivative market
  final String? makerFeeRate;

  /// taker_fee_rate defines the taker fee rate of a derivative market
  final String? takerFeeRate;

  /// relayer_fee_share_rate defines the percentage of the transaction fee shared
  /// with the relayer in a derivative market
  final String? relayerFeeShareRate;

  /// true if the market is a perpetual market. false if the market is an expiry
  /// futures market
  final bool? isPerpetual;

  /// Status of the market
  final MarketStatus? status;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market (in human readable format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market (in human readable format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in human readable format)
  final String? minNotional;

  /// current market admin
  final String? admin;

  /// level of admin permissions
  final int? adminPermissions;

  /// quote token decimals
  final int? quoteDecimals;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the maximum open notional for the market
  final OpenNotionalCap? openNotionalCap;

  /// has_disabled_minimal_protocol_fee indicates whether the minimal protocol
  /// fee is disabled for the market
  final bool? hasDisabledMinimalProtocolFee;

  /// force_paused_info defines additional info for force paused markets, only
  /// set when status == ForcePaused
  final ForcePausedInfo? forcePausedInfo;

  /// cross_margin_eligible marks the market as eligible for cross-margin
  /// pool participation. Default false means markets are ineligible until
  /// explicitly enabled at launch or toggled via governance proposal.
  final bool? crossMarginEligible;

  const DerivativeMarket({
    this.ticker,
    this.oracleBase,
    this.oracleQuote,
    this.oracleType,
    this.oracleScaleFactor,
    this.quoteDenom,
    this.marketId,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.makerFeeRate,
    this.takerFeeRate,
    this.relayerFeeShareRate,
    this.isPerpetual,
    this.status,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.admin,
    this.adminPermissions,
    this.quoteDecimals,
    this.reduceMarginRatio,
    this.openNotionalCap,
    this.hasDisabledMinimalProtocolFee,
    this.forcePausedInfo,
    this.crossMarginEligible,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.uint32(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.bool(13),
        ProtoFieldConfig.enumType(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(17, options: const []),
        ProtoFieldConfig.string(18),
        ProtoFieldConfig.uint32(19),
        ProtoFieldConfig.uint32(20),
        ProtoFieldConfig.string(21, options: const []),
        ProtoFieldConfig.message(22, options: const []),
        ProtoFieldConfig.bool(23),
        ProtoFieldConfig.message(24),
        ProtoFieldConfig.bool(25),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ticker,
    oracleBase,
    oracleQuote,
    oracleType,
    oracleScaleFactor,
    quoteDenom,
    marketId,
    initialMarginRatio,
    maintenanceMarginRatio,
    makerFeeRate,
    takerFeeRate,
    relayerFeeShareRate,
    isPerpetual,
    status,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    admin,
    adminPermissions,
    quoteDecimals,
    reduceMarginRatio,
    openNotionalCap,
    hasDisabledMinimalProtocolFee,
    forcePausedInfo,
    crossMarginEligible,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'quote_denom': quoteDenom,
      'market_id': marketId,
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'relayer_fee_share_rate': relayerFeeShareRate,
      'isPerpetual': isPerpetual,
      'status': status?.protoName,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'admin': admin,
      'admin_permissions': adminPermissions,
      'quote_decimals': quoteDecimals,
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': openNotionalCap?.toJson(),
      'has_disabled_minimal_protocol_fee': hasDisabledMinimalProtocolFee,
      'force_paused_info': forcePausedInfo?.toJson(),
      'cross_margin_eligible': crossMarginEligible,
    };
  }

  factory DerivativeMarket.fromJson(Map<String, dynamic> json) {
    return DerivativeMarket(
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        acceptCamelCase: true,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        acceptCamelCase: true,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      relayerFeeShareRate: json.valueAsString<String?>(
        'relayer_fee_share_rate',
        acceptCamelCase: true,
      ),
      isPerpetual: json.valueAsBool<bool?>(
        'isPerpetual',
        acceptCamelCase: true,
      ),
      status: json.valueTo<MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => MarketStatus.from(v),
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      adminPermissions: json.valueAsInt<int?>(
        'admin_permissions',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        acceptCamelCase: true,
      ),
      openNotionalCap: json.valueTo<OpenNotionalCap?, Map<String, dynamic>>(
        key: 'open_notional_cap',
        parse: (v) => OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
      hasDisabledMinimalProtocolFee: json.valueAsBool<bool?>(
        'has_disabled_minimal_protocol_fee',
        acceptCamelCase: true,
      ),
      forcePausedInfo: json.valueTo<ForcePausedInfo?, Map<String, dynamic>>(
        key: 'force_paused_info',
        parse: (v) => ForcePausedInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      crossMarginEligible: json.valueAsBool<bool?>(
        'cross_margin_eligible',
        acceptCamelCase: true,
      ),
    );
  }

  factory DerivativeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarket(
      ticker: decode.getString<String?>(1),
      oracleBase: decode.getString<String?>(2),
      oracleQuote: decode.getString<String?>(3),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        4,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(5),
      quoteDenom: decode.getString<String?>(6),
      marketId: decode.getString<String?>(7),
      initialMarginRatio: decode.getString<String?>(8),
      maintenanceMarginRatio: decode.getString<String?>(9),
      makerFeeRate: decode.getString<String?>(10),
      takerFeeRate: decode.getString<String?>(11),
      relayerFeeShareRate: decode.getString<String?>(12),
      isPerpetual: decode.getBool<bool?>(13),
      status: decode.getEnum<MarketStatus?>(14, MarketStatus.values),
      minPriceTickSize: decode.getString<String?>(15),
      minQuantityTickSize: decode.getString<String?>(16),
      minNotional: decode.getString<String?>(17),
      admin: decode.getString<String?>(18),
      adminPermissions: decode.getInt<int?>(19),
      quoteDecimals: decode.getInt<int?>(20),
      reduceMarginRatio: decode.getString<String?>(21),
      openNotionalCap: decode.messageTo<OpenNotionalCap?>(
        22,
        (b) => OpenNotionalCap.deserialize(b),
      ),
      hasDisabledMinimalProtocolFee: decode.getBool<bool?>(23),
      forcePausedInfo: decode.messageTo<ForcePausedInfo?>(
        24,
        (b) => ForcePausedInfo.deserialize(b),
      ),
      crossMarginEligible: decode.getBool<bool?>(25),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativeMarket;
}

class DerivativeMarketSettlementInfo extends CosmosProtoMessage {
  /// market ID.
  final String? marketId;

  /// settlement_price defines the settlement price
  final String? settlementPrice;

  /// is_forced_settlement indicates whether the settlement was explicitly
  /// scheduled by admin or governance force-settlement.
  final bool? isForcedSettlement;

  const DerivativeMarketSettlementInfo({
    this.marketId,
    this.settlementPrice,
    this.isForcedSettlement,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    settlementPrice,
    isForcedSettlement,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'settlement_price': settlementPrice,
      'is_forced_settlement': isForcedSettlement,
    };
  }

  factory DerivativeMarketSettlementInfo.fromJson(Map<String, dynamic> json) {
    return DerivativeMarketSettlementInfo(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
      isForcedSettlement: json.valueAsBool<bool?>(
        'is_forced_settlement',
        acceptCamelCase: true,
      ),
    );
  }

  factory DerivativeMarketSettlementInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarketSettlementInfo(
      marketId: decode.getString<String?>(1),
      settlementPrice: decode.getString<String?>(2),
      isForcedSettlement: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2DerivativeMarketSettlementInfo;
}

class MarketVolume extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the market volume
  final VolumeRecord? volume;

  const MarketVolume({this.marketId, this.volume});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, volume];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'volume': volume?.toJson()};
  }

  factory MarketVolume.fromJson(Map<String, dynamic> json) {
    return MarketVolume(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      volume: json.valueTo<VolumeRecord?, Map<String, dynamic>>(
        key: 'volume',
        parse: (v) => VolumeRecord.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MarketVolume.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MarketVolume(
      marketId: decode.getString<String?>(1),
      volume: decode.messageTo<VolumeRecord?>(
        2,
        (b) => VolumeRecord.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MarketVolume;
}

class VolumeRecord extends CosmosProtoMessage {
  /// the market's maker volume (in human readable format)
  final String? makerVolume;

  /// the market's taker volume (in human readable format)
  final String? takerVolume;

  const VolumeRecord({this.makerVolume, this.takerVolume});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [makerVolume, takerVolume];

  @override
  Map<String, dynamic> toJson() {
    return {'maker_volume': makerVolume, 'taker_volume': takerVolume};
  }

  factory VolumeRecord.fromJson(Map<String, dynamic> json) {
    return VolumeRecord(
      makerVolume: json.valueAsString<String?>(
        'maker_volume',
        acceptCamelCase: true,
      ),
      takerVolume: json.valueAsString<String?>(
        'taker_volume',
        acceptCamelCase: true,
      ),
    );
  }

  factory VolumeRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VolumeRecord(
      makerVolume: decode.getString<String?>(1),
      takerVolume: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2VolumeRecord;
}

class ExpiryFuturesMarketInfoState extends CosmosProtoMessage {
  final String? marketId;

  final ExpiryFuturesMarketInfo? marketInfo;

  const ExpiryFuturesMarketInfoState({this.marketId, this.marketInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, marketInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'market_info': marketInfo?.toJson()};
  }

  factory ExpiryFuturesMarketInfoState.fromJson(Map<String, dynamic> json) {
    return ExpiryFuturesMarketInfoState(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      marketInfo: json.valueTo<ExpiryFuturesMarketInfo?, Map<String, dynamic>>(
        key: 'market_info',
        parse: (v) => ExpiryFuturesMarketInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ExpiryFuturesMarketInfoState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExpiryFuturesMarketInfoState(
      marketId: decode.getString<String?>(1),
      marketInfo: decode.messageTo<ExpiryFuturesMarketInfo?>(
        2,
        (b) => ExpiryFuturesMarketInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2ExpiryFuturesMarketInfoState;
}

class PerpetualMarketFundingState extends CosmosProtoMessage {
  final String? marketId;

  final PerpetualMarketFunding? funding;

  const PerpetualMarketFundingState({this.marketId, this.funding});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, funding];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId, 'funding': funding?.toJson()};
  }

  factory PerpetualMarketFundingState.fromJson(Map<String, dynamic> json) {
    return PerpetualMarketFundingState(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      funding: json.valueTo<PerpetualMarketFunding?, Map<String, dynamic>>(
        key: 'funding',
        parse: (v) => PerpetualMarketFunding.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory PerpetualMarketFundingState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketFundingState(
      marketId: decode.getString<String?>(1),
      funding: decode.messageTo<PerpetualMarketFunding?>(
        2,
        (b) => PerpetualMarketFunding.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2PerpetualMarketFundingState;
}

class ExpiryFuturesMarketInfo extends CosmosProtoMessage {
  /// market ID.
  final String? marketId;

  /// expiration_timestamp defines the expiration time for a time expiry futures
  /// market.
  final BigInt? expirationTimestamp;

  /// expiration_twap_start_timestamp defines the start time of the TWAP
  /// calculation window
  final BigInt? twapStartTimestamp;

  /// expiration_twap_start_price_cumulative defines the cumulative price for the
  /// start of the TWAP window (in human readable format)
  /// Deprecated: For correctly calculating the expiration price using TWAP, we
  /// need to keep the cumulative price at the start of TWAP calculation
  /// separately for the base asset and the quote asset. Use
  /// expiration_twap_start_base_cumulative_price and
  /// expiration_twap_start_quote_cumulative_price instead.
  final String? expirationTwapStartPriceCumulative;

  /// settlement_price defines the settlement price for a time expiry futures
  /// market (in human readable format)
  final String? settlementPrice;

  /// expiration_twap_start_base_cumulative_price defines the cumulative price
  /// for the base asset at the start of the TWAP calculation window (in human
  /// readable format)
  final String? expirationTwapStartBaseCumulativePrice;

  /// expiration_twap_start_quote_cumulative_price defines the cumulative price
  /// for the quote asset at the start of the TWAP calculation window (in human
  /// readable format)
  final String? expirationTwapStartQuoteCumulativePrice;

  const ExpiryFuturesMarketInfo({
    this.marketId,
    this.expirationTimestamp,
    this.twapStartTimestamp,
    this.expirationTwapStartPriceCumulative,
    this.settlementPrice,
    this.expirationTwapStartBaseCumulativePrice,
    this.expirationTwapStartQuoteCumulativePrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    expirationTimestamp,
    twapStartTimestamp,
    expirationTwapStartPriceCumulative,
    settlementPrice,
    expirationTwapStartBaseCumulativePrice,
    expirationTwapStartQuoteCumulativePrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'twap_start_timestamp': twapStartTimestamp?.toString(),
      'expiration_twap_start_price_cumulative':
          expirationTwapStartPriceCumulative,
      'settlement_price': settlementPrice,
      'expiration_twap_start_base_cumulative_price':
          expirationTwapStartBaseCumulativePrice,
      'expiration_twap_start_quote_cumulative_price':
          expirationTwapStartQuoteCumulativePrice,
    };
  }

  factory ExpiryFuturesMarketInfo.fromJson(Map<String, dynamic> json) {
    return ExpiryFuturesMarketInfo(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        acceptCamelCase: true,
      ),
      twapStartTimestamp: json.valueAsBigInt<BigInt?>(
        'twap_start_timestamp',
        acceptCamelCase: true,
      ),
      expirationTwapStartPriceCumulative: json.valueAsString<String?>(
        'expiration_twap_start_price_cumulative',
        acceptCamelCase: true,
      ),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
      expirationTwapStartBaseCumulativePrice: json.valueAsString<String?>(
        'expiration_twap_start_base_cumulative_price',
        acceptCamelCase: true,
      ),
      expirationTwapStartQuoteCumulativePrice: json.valueAsString<String?>(
        'expiration_twap_start_quote_cumulative_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory ExpiryFuturesMarketInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExpiryFuturesMarketInfo(
      marketId: decode.getString<String?>(1),
      expirationTimestamp: decode.getBigInt<BigInt?>(2),
      twapStartTimestamp: decode.getBigInt<BigInt?>(3),
      expirationTwapStartPriceCumulative: decode.getString<String?>(4),
      settlementPrice: decode.getString<String?>(5),
      expirationTwapStartBaseCumulativePrice: decode.getString<String?>(6),
      expirationTwapStartQuoteCumulativePrice: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2ExpiryFuturesMarketInfo;
}

class PerpetualMarketInfo extends CosmosProtoMessage {
  /// market ID.
  final String? marketId;

  /// hourly_funding_rate_cap defines the maximum absolute value of the hourly
  /// funding rate
  final String? hourlyFundingRateCap;

  /// hourly_interest_rate defines the hourly interest rate
  final String? hourlyInterestRate;

  /// next_funding_timestamp defines the next funding timestamp in seconds of a
  /// perpetual market
  final BigInt? nextFundingTimestamp;

  /// funding_interval defines the next funding interval in seconds of a
  /// perpetual market.
  final BigInt? fundingInterval;

  const PerpetualMarketInfo({
    this.marketId,
    this.hourlyFundingRateCap,
    this.hourlyInterestRate,
    this.nextFundingTimestamp,
    this.fundingInterval,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    hourlyFundingRateCap,
    hourlyInterestRate,
    nextFundingTimestamp,
    fundingInterval,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'hourly_funding_rate_cap': hourlyFundingRateCap,
      'hourly_interest_rate': hourlyInterestRate,
      'next_funding_timestamp': nextFundingTimestamp?.toString(),
      'funding_interval': fundingInterval?.toString(),
    };
  }

  factory PerpetualMarketInfo.fromJson(Map<String, dynamic> json) {
    return PerpetualMarketInfo(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      hourlyFundingRateCap: json.valueAsString<String?>(
        'hourly_funding_rate_cap',
        acceptCamelCase: true,
      ),
      hourlyInterestRate: json.valueAsString<String?>(
        'hourly_interest_rate',
        acceptCamelCase: true,
      ),
      nextFundingTimestamp: json.valueAsBigInt<BigInt?>(
        'next_funding_timestamp',
        acceptCamelCase: true,
      ),
      fundingInterval: json.valueAsBigInt<BigInt?>(
        'funding_interval',
        acceptCamelCase: true,
      ),
    );
  }

  factory PerpetualMarketInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketInfo(
      marketId: decode.getString<String?>(1),
      hourlyFundingRateCap: decode.getString<String?>(2),
      hourlyInterestRate: decode.getString<String?>(3),
      nextFundingTimestamp: decode.getBigInt<BigInt?>(4),
      fundingInterval: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2PerpetualMarketInfo;
}

class PerpetualMarketFunding extends CosmosProtoMessage {
  /// cumulative_funding defines the cumulative funding of a perpetual market.
  final String? cumulativeFunding;

  /// cumulative_price defines the running time-integral of the perp premium
  /// ((VWAP - mark_price) / mark_price) i.e., sum(premium * seconds)
  /// used to compute the interval’s average premium for funding
  final String? cumulativePrice;

  /// the last funding timestamp in seconds
  final BigInt? lastTimestamp;

  const PerpetualMarketFunding({
    this.cumulativeFunding,
    this.cumulativePrice,
    this.lastTimestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    cumulativeFunding,
    cumulativePrice,
    lastTimestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'cumulative_funding': cumulativeFunding,
      'cumulative_price': cumulativePrice,
      'last_timestamp': lastTimestamp?.toString(),
    };
  }

  factory PerpetualMarketFunding.fromJson(Map<String, dynamic> json) {
    return PerpetualMarketFunding(
      cumulativeFunding: json.valueAsString<String?>(
        'cumulative_funding',
        acceptCamelCase: true,
      ),
      cumulativePrice: json.valueAsString<String?>(
        'cumulative_price',
        acceptCamelCase: true,
      ),
      lastTimestamp: json.valueAsBigInt<BigInt?>(
        'last_timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory PerpetualMarketFunding.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerpetualMarketFunding(
      cumulativeFunding: decode.getString<String?>(1),
      cumulativePrice: decode.getString<String?>(2),
      lastTimestamp: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2PerpetualMarketFunding;
}
