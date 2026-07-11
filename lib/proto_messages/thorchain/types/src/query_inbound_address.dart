import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryInboundAddressResponse extends CosmosProtoMessage {
  final String? chain;

  final String? pubKey;

  final String? address;

  final String? router;

  /// Returns true if trading is unavailable for this chain, either because
  /// trading is halted globally or specifically for this chain
  final bool? halted;

  /// Returns true if trading is paused globally
  final bool? globalTradingPaused;

  /// Returns true if trading is paused for this chain
  final bool? chainTradingPaused;

  /// Returns true if LP actions are paused for this chain
  final bool? chainLpActionsPaused;

  /// The chain's observed fee rate in 1e8 format, before the 1.5x that makes an
  /// outbound more likely to have a sufficient gas rate.  Used by validators to
  /// check whether they need to report a fee change.
  final String? observedFeeRate;

  /// The minimum fee rate used by vaults to send outbound TXs. The actual fee
  /// rate may be higher. For EVM chains this is returned in gwei (1e9).
  final String? gasRate;

  /// Units of the gas_rate.
  final String? gasRateUnits;

  /// Avg size of outbound TXs on each chain. For UTXO chains it may be larger
  /// than average, as it takes into account vault consolidation txs, which can
  /// have many vouts
  final String? outboundTxSize;

  /// The total outbound fee charged to the user for outbound txs in the gas
  /// asset of the chain.
  final String? outboundFee;

  /// Defines the minimum transaction size for the chain in base units (sats,
  /// wei, uatom). Transactions with asset amounts lower than the dust_threshold
  /// are ignored.
  final String? dustThreshold;

  /// The private view key for scanning inbound transactions (XMR only).
  final String? viewKey;

  const QueryInboundAddressResponse({
    this.chain,
    this.pubKey,
    this.address,
    this.router,
    this.halted,
    this.globalTradingPaused,
    this.chainTradingPaused,
    this.chainLpActionsPaused,
    this.observedFeeRate,
    this.gasRate,
    this.gasRateUnits,
    this.outboundTxSize,
    this.outboundFee,
    this.dustThreshold,
    this.viewKey,
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
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
        ProtoFieldConfig.bool(7, options: const []),
        ProtoFieldConfig.bool(8, options: const []),
        ProtoFieldConfig.string(14),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.string(15),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chain,
    pubKey,
    address,
    router,
    halted,
    globalTradingPaused,
    chainTradingPaused,
    chainLpActionsPaused,
    observedFeeRate,
    gasRate,
    gasRateUnits,
    outboundTxSize,
    outboundFee,
    dustThreshold,
    viewKey,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'pub_key': pubKey,
      'address': address,
      'router': router,
      'halted': halted,
      'global_trading_paused': globalTradingPaused,
      'chain_trading_paused': chainTradingPaused,
      'chain_lp_actions_paused': chainLpActionsPaused,
      'observed_fee_rate': observedFeeRate,
      'gas_rate': gasRate,
      'gas_rate_units': gasRateUnits,
      'outbound_tx_size': outboundTxSize,
      'outbound_fee': outboundFee,
      'dust_threshold': dustThreshold,
      'view_key': viewKey,
    };
  }

  factory QueryInboundAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryInboundAddressResponse(
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      router: json.valueAsString<String?>('router', acceptCamelCase: true),
      halted: json.valueAsBool<bool?>('halted', acceptCamelCase: true),
      globalTradingPaused: json.valueAsBool<bool?>(
        'global_trading_paused',
        acceptCamelCase: true,
      ),
      chainTradingPaused: json.valueAsBool<bool?>(
        'chain_trading_paused',
        acceptCamelCase: true,
      ),
      chainLpActionsPaused: json.valueAsBool<bool?>(
        'chain_lp_actions_paused',
        acceptCamelCase: true,
      ),
      observedFeeRate: json.valueAsString<String?>(
        'observed_fee_rate',
        acceptCamelCase: true,
      ),
      gasRate: json.valueAsString<String?>('gas_rate', acceptCamelCase: true),
      gasRateUnits: json.valueAsString<String?>(
        'gas_rate_units',
        acceptCamelCase: true,
      ),
      outboundTxSize: json.valueAsString<String?>(
        'outbound_tx_size',
        acceptCamelCase: true,
      ),
      outboundFee: json.valueAsString<String?>(
        'outbound_fee',
        acceptCamelCase: true,
      ),
      dustThreshold: json.valueAsString<String?>(
        'dust_threshold',
        acceptCamelCase: true,
      ),
      viewKey: json.valueAsString<String?>('view_key', acceptCamelCase: true),
    );
  }

  factory QueryInboundAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInboundAddressResponse(
      chain: decode.getString<String?>(1),
      pubKey: decode.getString<String?>(2),
      address: decode.getString<String?>(3),
      router: decode.getString<String?>(4),
      halted: decode.getBool<bool?>(5),
      globalTradingPaused: decode.getBool<bool?>(6),
      chainTradingPaused: decode.getBool<bool?>(7),
      chainLpActionsPaused: decode.getBool<bool?>(8),
      observedFeeRate: decode.getString<String?>(14),
      gasRate: decode.getString<String?>(9),
      gasRateUnits: decode.getString<String?>(10),
      outboundTxSize: decode.getString<String?>(11),
      outboundFee: decode.getString<String?>(12),
      dustThreshold: decode.getString<String?>(13),
      viewKey: decode.getString<String?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInboundAddressResponse;
}

class QueryInboundAddressesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInboundAddressesResponse> {
  final String? height;

  const QueryInboundAddressesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/inbound_addresses",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryInboundAddressesRequest.fromJson(Map<String, dynamic> json) {
    return QueryInboundAddressesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryInboundAddressesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInboundAddressesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInboundAddressesRequest;
  @override
  QueryInboundAddressesResponse onQueryResponse(List<int> bytes) {
    return QueryInboundAddressesResponse.deserialize(bytes);
  }

  @override
  QueryInboundAddressesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInboundAddressesResponse.fromJson(json);
  }
}

class QueryInboundAddressesResponse extends CosmosProtoMessage {
  final List<QueryInboundAddressResponse> inboundAddresses;

  const QueryInboundAddressesResponse({this.inboundAddresses = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [inboundAddresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'inbound_addresses': inboundAddresses.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryInboundAddressesResponse.fromJson(Map<String, dynamic> json) {
    return QueryInboundAddressesResponse(
      inboundAddresses:
          (json.valueEnsureAsList<dynamic>(
                'inbound_addresses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryInboundAddressResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryInboundAddressResponse.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryInboundAddressesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInboundAddressesResponse(
      inboundAddresses:
          decode
              .getListOfBytes(1)
              .map((b) => QueryInboundAddressResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInboundAddressesResponse;
}
