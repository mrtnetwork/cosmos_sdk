import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// TokenPrice stores latest price data for a token
class TokenPrice extends CosmosProtoMessage {
  /// Base denom on Stride
  final String? baseDenom;

  /// Quote denom on Stride
  final String? quoteDenom;

  /// Base denom on Osmosis
  final String? osmosisBaseDenom;

  /// Quote denom on Osmosis
  final String? osmosisQuoteDenom;

  /// Pool ID on Osmosis
  final BigInt? osmosisPoolId;

  /// Spot price of base_denom denominated in quote_denom
  final String? spotPrice;

  /// Last time a query request was submitted
  final google_protobuf_timestamp.Timestamp? lastRequestTime;

  /// Last time a query response was received
  final google_protobuf_timestamp.Timestamp? lastResponseTime;

  /// Whether there is a spot price query currently in progress
  final bool? queryInProgress;

  const TokenPrice({
    this.baseDenom,
    this.quoteDenom,
    this.osmosisBaseDenom,
    this.osmosisQuoteDenom,
    this.osmosisPoolId,
    this.spotPrice,
    this.lastRequestTime,
    this.lastResponseTime,
    this.queryInProgress,
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
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.bool(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    baseDenom,
    quoteDenom,
    osmosisBaseDenom,
    osmosisQuoteDenom,
    osmosisPoolId,
    spotPrice,
    lastRequestTime,
    lastResponseTime,
    queryInProgress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'osmosis_base_denom': osmosisBaseDenom,
      'osmosis_quote_denom': osmosisQuoteDenom,
      'osmosis_pool_id': osmosisPoolId?.toString(),
      'spot_price': spotPrice,
      'last_request_time': lastRequestTime?.toRfc3339(),
      'last_response_time': lastResponseTime?.toRfc3339(),
      'query_in_progress': queryInProgress,
    };
  }

  factory TokenPrice.fromJson(Map<String, dynamic> json) {
    return TokenPrice(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      osmosisBaseDenom: json.valueAsString<String?>(
        'osmosis_base_denom',
        acceptCamelCase: true,
      ),
      osmosisQuoteDenom: json.valueAsString<String?>(
        'osmosis_quote_denom',
        acceptCamelCase: true,
      ),
      osmosisPoolId: json.valueAsBigInt<BigInt?>(
        'osmosis_pool_id',
        acceptCamelCase: true,
      ),
      spotPrice: json.valueAsString<String?>(
        'spot_price',
        acceptCamelCase: true,
      ),
      lastRequestTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'last_request_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      lastResponseTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'last_response_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      queryInProgress: json.valueAsBool<bool?>(
        'query_in_progress',
        acceptCamelCase: true,
      ),
    );
  }

  factory TokenPrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPrice(
      baseDenom: decode.getString<String?>(1),
      quoteDenom: decode.getString<String?>(2),
      osmosisBaseDenom: decode.getString<String?>(3),
      osmosisQuoteDenom: decode.getString<String?>(4),
      osmosisPoolId: decode.getBigInt<BigInt?>(5),
      spotPrice: decode.getString<String?>(6),
      lastRequestTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      lastResponseTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        8,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      queryInProgress: decode.getBool<bool?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleTokenPrice;
}

/// OracleParams stores global oracle parameters
class Params extends CosmosProtoMessage {
  /// Osmosis chain identifier
  final String? osmosisChainId;

  /// Osmosis IBC connection identifier
  final String? osmosisConnectionId;

  /// Time between price updates
  /// Also used to timeout icq requests
  final BigInt? updateIntervalSec;

  /// Max time before price is considered stale/expired
  final BigInt? priceExpirationTimeoutSec;

  const Params({
    this.osmosisChainId,
    this.osmosisConnectionId,
    this.updateIntervalSec,
    this.priceExpirationTimeoutSec,
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
        ProtoFieldConfig.uint64(3, options: const []),
        ProtoFieldConfig.uint64(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    osmosisChainId,
    osmosisConnectionId,
    updateIntervalSec,
    priceExpirationTimeoutSec,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'osmosis_chain_id': osmosisChainId,
      'osmosis_connection_id': osmosisConnectionId,
      'update_interval_sec': updateIntervalSec?.toString(),
      'price_expiration_timeout_sec': priceExpirationTimeoutSec?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      osmosisChainId: json.valueAsString<String?>(
        'osmosis_chain_id',
        acceptCamelCase: true,
      ),
      osmosisConnectionId: json.valueAsString<String?>(
        'osmosis_connection_id',
        acceptCamelCase: true,
      ),
      updateIntervalSec: json.valueAsBigInt<BigInt?>(
        'update_interval_sec',
        acceptCamelCase: true,
      ),
      priceExpirationTimeoutSec: json.valueAsBigInt<BigInt?>(
        'price_expiration_timeout_sec',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      osmosisChainId: decode.getString<String?>(1),
      osmosisConnectionId: decode.getString<String?>(2),
      updateIntervalSec: decode.getBigInt<BigInt?>(3),
      priceExpirationTimeoutSec: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleParams;
}
