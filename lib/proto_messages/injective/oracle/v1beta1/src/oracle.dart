import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

enum OracleType implements ProtoEnumVariant {
  unspecified(0, 'Unspecified'),
  band(1, 'Band'),
  priceFeed(2, 'PriceFeed'),
  coinbase(3, 'Coinbase'),
  chainlink(4, 'Chainlink'),
  razor(5, 'Razor'),
  dia(6, 'Dia'),
  api3(7, 'API3'),
  uma(8, 'Uma'),
  pyth(9, 'Pyth'),
  bandIBC(10, 'BandIBC'),
  provider(11, 'Provider'),
  stork(12, 'Stork'),
  chainlinkDataStreams(13, 'ChainlinkDataStreams'),

  /// PythPro uses the Pyth Lazer high-frequency feed, verified via an on-chain
  /// EVM contract.
  pythPro(14, 'PythPro'),

  /// SedaFast relays prices from the SEDA Fast WebSocket stream, verified
  /// on-chain via secp256k1 ECDSA over keccak256(dataResultId).
  /// See
  /// https://docs.seda.xyz/home/for-developers/define-your-delivery-method/seda-fast
  sedaFast(15, 'SedaFast');

  const OracleType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static OracleType fromValue(int? value) {
    return OracleType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "OracleType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OracleType from(Object? value) {
    return OracleType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "OracleType", value: value),
    );
  }
}

class Params extends CosmosProtoMessage {
  final String? pythContract;

  final String? chainlinkVerifierProxyContract;

  /// Reserved field number 3: previously
  /// accept_unverified_chainlink_data_streams_reports (bool). Do not reuse.
  final BigInt? chainlinkDataStreamsVerificationGasLimit;

  /// EVM hex address of the PythLazer verifier contract deployed on Injective.
  /// Must be set via governance before PythPro price relaying is active.
  /// (optional)
  final String? pythProVerifierContract;

  /// Gas cap for the eth_call used in PythPro update verification. Defaults to
  /// 500000.
  final BigInt? pythProVerificationGasLimit;

  /// Fee in wei passed as msg.value to the PythLazer verifyUpdate call.
  /// Update via governance if the on-chain contract fee changes. Defaults to 1.
  final BigInt? pythProVerificationFee;

  /// seda_fast_params groups all SEDA Fast oracle configuration. An empty
  /// public_key disables MsgRelaySedaFastPrices handling until set via
  /// MsgUpdateParams.
  final SedaFastParams? sedaFastParams;

  const Params({
    this.pythContract,
    this.chainlinkVerifierProxyContract,
    this.chainlinkDataStreamsVerificationGasLimit,
    this.pythProVerifierContract,
    this.pythProVerificationGasLimit,
    this.pythProVerificationFee,
    this.sedaFastParams,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "oracle/Params")],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.message(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    pythContract,
    chainlinkVerifierProxyContract,
    chainlinkDataStreamsVerificationGasLimit,
    pythProVerifierContract,
    pythProVerificationGasLimit,
    pythProVerificationFee,
    sedaFastParams,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pyth_contract': pythContract,
      'chainlink_verifier_proxy_contract': chainlinkVerifierProxyContract,
      'chainlink_data_streams_verification_gas_limit':
          chainlinkDataStreamsVerificationGasLimit?.toString(),
      'pyth_pro_verifier_contract': pythProVerifierContract,
      'pyth_pro_verification_gas_limit':
          pythProVerificationGasLimit?.toString(),
      'pyth_pro_verification_fee': pythProVerificationFee?.toString(),
      'seda_fast_params': sedaFastParams?.toJson(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      pythContract: json.valueAsString<String?>(
        'pyth_contract',
        acceptCamelCase: true,
      ),
      chainlinkVerifierProxyContract: json.valueAsString<String?>(
        'chainlink_verifier_proxy_contract',
        acceptCamelCase: true,
      ),
      chainlinkDataStreamsVerificationGasLimit: json.valueAsBigInt<BigInt?>(
        'chainlink_data_streams_verification_gas_limit',
        acceptCamelCase: true,
      ),
      pythProVerifierContract: json.valueAsString<String?>(
        'pyth_pro_verifier_contract',
        acceptCamelCase: true,
      ),
      pythProVerificationGasLimit: json.valueAsBigInt<BigInt?>(
        'pyth_pro_verification_gas_limit',
        acceptCamelCase: true,
      ),
      pythProVerificationFee: json.valueAsBigInt<BigInt?>(
        'pyth_pro_verification_fee',
        acceptCamelCase: true,
      ),
      sedaFastParams: json.valueTo<SedaFastParams?, Map<String, dynamic>>(
        key: 'seda_fast_params',
        parse: (v) => SedaFastParams.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      pythContract: decode.getString<String?>(1),
      chainlinkVerifierProxyContract: decode.getString<String?>(2),
      chainlinkDataStreamsVerificationGasLimit: decode.getBigInt<BigInt?>(4),
      pythProVerifierContract: decode.getString<String?>(5),
      pythProVerificationGasLimit: decode.getBigInt<BigInt?>(6),
      pythProVerificationFee: decode.getBigInt<BigInt?>(7),
      sedaFastParams: decode.messageTo<SedaFastParams?>(
        8,
        (b) => SedaFastParams.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1Params;
}

/// SedaFastParams holds the on-chain configuration for the SEDA Fast oracle.
/// See
/// https://docs.seda.xyz/home/for-developers/define-your-delivery-method/seda-fast
class SedaFastParams extends CosmosProtoMessage {
  /// SEC1 secp256k1 public key published by SEDA Fast at GET /info.
  /// Compressed (33 B, 0x02/0x03 prefix) or uncompressed (65 B, 0x04 prefix).
  /// Empty value disables all MsgRelaySedaFastPrices handling.
  final List<int>? publicKey;

  /// Allowlist of execProgramIds whose dataResult.result payload is an ASCII
  /// decimal string (e.g. "384.48255"), parsed as LegacyDec.
  final List<String> simpleProgramIds;

  /// Allowlist of execProgramIds whose dataResult.result payload is a UTF-8
  /// JSON object containing {price:{mantissa,expo},...}.
  final List<String> jsonProgramIds;

  const SedaFastParams({
    this.publicKey,
    this.simpleProgramIds = const [],
    this.jsonProgramIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    publicKey,
    simpleProgramIds,
    jsonProgramIds,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'public_key': switch (publicKey) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'simple_program_ids': simpleProgramIds.map((e) => e).toList(),
      'json_program_ids': jsonProgramIds.map((e) => e).toList(),
    };
  }

  factory SedaFastParams.fromJson(Map<String, dynamic> json) {
    return SedaFastParams(
      publicKey: json.valueAsBytes<List<int>?>(
        'public_key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      simpleProgramIds:
          (json.valueEnsureAsList<dynamic>(
            'simple_program_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      jsonProgramIds:
          (json.valueEnsureAsList<dynamic>(
            'json_program_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory SedaFastParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SedaFastParams(
      publicKey: decode.getBytes<List<int>?>(1),
      simpleProgramIds: decode.getListOrEmpty<String>(2),
      jsonProgramIds: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1SedaFastParams;
}

class OracleInfo extends CosmosProtoMessage {
  final String? symbol;

  final OracleType? oracleType;

  const OracleInfo({this.symbol, this.oracleType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.enumType(2)],
    );
  }

  @override
  List<Object?> get protoValues => [symbol, oracleType];

  @override
  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'oracle_type': oracleType?.protoName};
  }

  factory OracleInfo.fromJson(Map<String, dynamic> json) {
    return OracleInfo(
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      oracleType: json.valueTo<OracleType?, Object?>(
        key: 'oracle_type',
        parse: (v) => OracleType.from(v),
      ),
    );
  }

  factory OracleInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OracleInfo(
      symbol: decode.getString<String?>(1),
      oracleType: decode.getEnum<OracleType?>(2, OracleType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1OracleInfo;
}

class ChainlinkPriceState extends CosmosProtoMessage {
  final String? feedId;

  final String? answer;

  final BigInt? timestamp;

  final PriceState? priceState;

  const ChainlinkPriceState({
    this.feedId,
    this.answer,
    this.timestamp,
    this.priceState,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [feedId, answer, timestamp, priceState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'feed_id': feedId,
      'answer': answer,
      'timestamp': timestamp?.toString(),
      'price_state': priceState?.toJson(),
    };
  }

  factory ChainlinkPriceState.fromJson(Map<String, dynamic> json) {
    return ChainlinkPriceState(
      feedId: json.valueAsString<String?>('feed_id', acceptCamelCase: true),
      answer: json.valueAsString<String?>('answer', acceptCamelCase: true),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ChainlinkPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainlinkPriceState(
      feedId: decode.getString<String?>(1),
      answer: decode.getString<String?>(2),
      timestamp: decode.getBigInt<BigInt?>(3),
      priceState: decode.messageTo<PriceState?>(
        4,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1ChainlinkPriceState;
}

/// DEPRECATED! Oracle price from Band is no longer supported
class BandPriceState extends CosmosProtoMessage {
  final String? symbol;

  final String? rate;

  final BigInt? resolveTime;

  final BigInt? requestId;

  final PriceState? priceState;

  const BandPriceState({
    this.symbol,
    this.rate,
    this.resolveTime,
    this.requestId,
    this.priceState,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    symbol,
    rate,
    resolveTime,
    requestId,
    priceState,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'rate': rate,
      'resolve_time': resolveTime?.toString(),
      'request_ID': requestId?.toString(),
      'price_state': priceState?.toJson(),
    };
  }

  factory BandPriceState.fromJson(Map<String, dynamic> json) {
    return BandPriceState(
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      rate: json.valueAsString<String?>('rate', acceptCamelCase: true),
      resolveTime: json.valueAsBigInt<BigInt?>(
        'resolve_time',
        acceptCamelCase: true,
      ),
      requestId: json.valueAsBigInt<BigInt?>(
        'request_ID',
        acceptCamelCase: true,
      ),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory BandPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BandPriceState(
      symbol: decode.getString<String?>(1),
      rate: decode.getString<String?>(2),
      resolveTime: decode.getBigInt<BigInt?>(3),
      requestId: decode.getBigInt<BigInt?>(4),
      priceState: decode.messageTo<PriceState?>(
        5,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1BandPriceState;
}

class PriceFeedState extends CosmosProtoMessage {
  final String? base;

  final String? quote;

  final PriceState? priceState;

  final List<String> relayers;

  const PriceFeedState({
    this.base,
    this.quote,
    this.priceState,
    this.relayers = const [],
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
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [base, quote, priceState, relayers];

  @override
  Map<String, dynamic> toJson() {
    return {
      'base': base,
      'quote': quote,
      'price_state': priceState?.toJson(),
      'relayers': relayers.map((e) => e).toList(),
    };
  }

  factory PriceFeedState.fromJson(Map<String, dynamic> json) {
    return PriceFeedState(
      base: json.valueAsString<String?>('base', acceptCamelCase: true),
      quote: json.valueAsString<String?>('quote', acceptCamelCase: true),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
      relayers:
          (json.valueEnsureAsList<dynamic>(
            'relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory PriceFeedState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PriceFeedState(
      base: decode.getString<String?>(1),
      quote: decode.getString<String?>(2),
      priceState: decode.messageTo<PriceState?>(
        3,
        (b) => PriceState.deserialize(b),
      ),
      relayers: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PriceFeedState;
}

class ProviderInfo extends CosmosProtoMessage {
  final String? provider;

  final List<String> relayers;

  const ProviderInfo({this.provider, this.relayers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [provider, relayers];

  @override
  Map<String, dynamic> toJson() {
    return {'provider': provider, 'relayers': relayers.map((e) => e).toList()};
  }

  factory ProviderInfo.fromJson(Map<String, dynamic> json) {
    return ProviderInfo(
      provider: json.valueAsString<String?>('provider', acceptCamelCase: true),
      relayers:
          (json.valueEnsureAsList<dynamic>(
            'relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ProviderInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProviderInfo(
      provider: decode.getString<String?>(1),
      relayers: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1ProviderInfo;
}

class ProviderState extends CosmosProtoMessage {
  final ProviderInfo? providerInfo;

  final List<ProviderPriceState> providerPriceStates;

  const ProviderState({this.providerInfo, this.providerPriceStates = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [providerInfo, providerPriceStates];

  @override
  Map<String, dynamic> toJson() {
    return {
      'provider_info': providerInfo?.toJson(),
      'provider_price_states':
          providerPriceStates.map((e) => e.toJson()).toList(),
    };
  }

  factory ProviderState.fromJson(Map<String, dynamic> json) {
    return ProviderState(
      providerInfo: json.valueTo<ProviderInfo?, Map<String, dynamic>>(
        key: 'provider_info',
        parse: (v) => ProviderInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      providerPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'provider_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ProviderPriceState,
                  Map<String, dynamic>
                >(value: e, parse: (v) => ProviderPriceState.fromJson(v)),
              )
              .toList(),
    );
  }

  factory ProviderState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProviderState(
      providerInfo: decode.messageTo<ProviderInfo?>(
        1,
        (b) => ProviderInfo.deserialize(b),
      ),
      providerPriceStates:
          decode
              .getListOfBytes(2)
              .map((b) => ProviderPriceState.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1ProviderState;
}

class ProviderPriceState extends CosmosProtoMessage {
  final String? symbol;

  final PriceState? state;

  const ProviderPriceState({this.symbol, this.state});

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
  List<Object?> get protoValues => [symbol, state];

  @override
  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'state': state?.toJson()};
  }

  factory ProviderPriceState.fromJson(Map<String, dynamic> json) {
    return ProviderPriceState(
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      state: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ProviderPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ProviderPriceState(
      symbol: decode.getString<String?>(1),
      state: decode.messageTo<PriceState?>(2, (b) => PriceState.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1ProviderPriceState;
}

class CoinbasePriceState extends CosmosProtoMessage {
  /// kind should always be "prices"
  final String? kind;

  /// timestamp of the when the price was signed by coinbase
  final BigInt? timestamp;

  /// the symbol of the price, e.g. BTC
  final String? key;

  /// the value of the price scaled by 1e6
  final BigInt? value;

  /// the price state
  final PriceState? priceState;

  const CoinbasePriceState({
    this.kind,
    this.timestamp,
    this.key,
    this.value,
    this.priceState,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [kind, timestamp, key, value, priceState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'timestamp': timestamp?.toString(),
      'key': key,
      'value': value?.toString(),
      'price_state': priceState?.toJson(),
    };
  }

  factory CoinbasePriceState.fromJson(Map<String, dynamic> json) {
    return CoinbasePriceState(
      kind: json.valueAsString<String?>('kind', acceptCamelCase: true),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsBigInt<BigInt?>('value', acceptCamelCase: true),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory CoinbasePriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CoinbasePriceState(
      kind: decode.getString<String?>(1),
      timestamp: decode.getBigInt<BigInt?>(2),
      key: decode.getString<String?>(3),
      value: decode.getBigInt<BigInt?>(4),
      priceState: decode.messageTo<PriceState?>(
        5,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1CoinbasePriceState;
}

class StorkPriceState extends CosmosProtoMessage {
  /// timestamp of the when the price was signed by stork
  final BigInt? timestamp;

  /// the symbol of the price, e.g. BTC
  final String? symbol;

  /// the value of the price scaled by 1e18
  final String? value;

  /// the price state
  final PriceState? priceState;

  const StorkPriceState({
    this.timestamp,
    this.symbol,
    this.value,
    this.priceState,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [timestamp, symbol, value, priceState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp?.toString(),
      'symbol': symbol,
      'value': value,
      'price_state': priceState?.toJson(),
    };
  }

  factory StorkPriceState.fromJson(Map<String, dynamic> json) {
    return StorkPriceState(
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory StorkPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StorkPriceState(
      timestamp: decode.getBigInt<BigInt?>(1),
      symbol: decode.getString<String?>(2),
      value: decode.getString<String?>(3),
      priceState: decode.messageTo<PriceState?>(
        5,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1StorkPriceState;
}

class PriceState extends CosmosProtoMessage {
  final String? price;

  final String? cumulativePrice;

  final BigInt? timestamp;

  const PriceState({this.price, this.cumulativePrice, this.timestamp});

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
  List<Object?> get protoValues => [price, cumulativePrice, timestamp];

  @override
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cumulative_price': cumulativePrice,
      'timestamp': timestamp?.toString(),
    };
  }

  factory PriceState.fromJson(Map<String, dynamic> json) {
    return PriceState(
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      cumulativePrice: json.valueAsString<String?>(
        'cumulative_price',
        acceptCamelCase: true,
      ),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory PriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PriceState(
      price: decode.getString<String?>(1),
      cumulativePrice: decode.getString<String?>(2),
      timestamp: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PriceState;
}

class PythPriceState extends CosmosProtoMessage {
  final String? priceId;

  final String? emaPrice;

  final String? emaConf;

  final String? conf;

  final BigInt? publishTime;

  final PriceState? priceState;

  const PythPriceState({
    this.priceId,
    this.emaPrice,
    this.emaConf,
    this.conf,
    this.publishTime,
    this.priceState,
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
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.message(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    priceId,
    emaPrice,
    emaConf,
    conf,
    publishTime,
    priceState,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'price_id': priceId,
      'ema_price': emaPrice,
      'ema_conf': emaConf,
      'conf': conf,
      'publish_time': publishTime?.toString(),
      'price_state': priceState?.toJson(),
    };
  }

  factory PythPriceState.fromJson(Map<String, dynamic> json) {
    return PythPriceState(
      priceId: json.valueAsString<String?>('price_id', acceptCamelCase: true),
      emaPrice: json.valueAsString<String?>('ema_price', acceptCamelCase: true),
      emaConf: json.valueAsString<String?>('ema_conf', acceptCamelCase: true),
      conf: json.valueAsString<String?>('conf', acceptCamelCase: true),
      publishTime: json.valueAsBigInt<BigInt?>(
        'publish_time',
        acceptCamelCase: true,
      ),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory PythPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PythPriceState(
      priceId: decode.getString<String?>(1),
      emaPrice: decode.getString<String?>(2),
      emaConf: decode.getString<String?>(3),
      conf: decode.getString<String?>(4),
      publishTime: decode.getBigInt<BigInt?>(5),
      priceState: decode.messageTo<PriceState?>(
        6,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PythPriceState;
}

class ChainlinkDataStreamsPriceState extends CosmosProtoMessage {
  final String? feedId;

  final String? reportPrice;

  final BigInt? validFromTimestamp;

  final BigInt? observationsTimestamp;

  final PriceState? priceState;

  final BigInt? expiresAt;

  const ChainlinkDataStreamsPriceState({
    this.feedId,
    this.reportPrice,
    this.validFromTimestamp,
    this.observationsTimestamp,
    this.priceState,
    this.expiresAt,
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
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.uint64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    feedId,
    reportPrice,
    validFromTimestamp,
    observationsTimestamp,
    priceState,
    expiresAt,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'feed_id': feedId,
      'report_price': reportPrice,
      'valid_from_timestamp': validFromTimestamp?.toString(),
      'observations_timestamp': observationsTimestamp?.toString(),
      'price_state': priceState?.toJson(),
      'expires_at': expiresAt?.toString(),
    };
  }

  factory ChainlinkDataStreamsPriceState.fromJson(Map<String, dynamic> json) {
    return ChainlinkDataStreamsPriceState(
      feedId: json.valueAsString<String?>('feed_id', acceptCamelCase: true),
      reportPrice: json.valueAsString<String?>(
        'report_price',
        acceptCamelCase: true,
      ),
      validFromTimestamp: json.valueAsBigInt<BigInt?>(
        'valid_from_timestamp',
        acceptCamelCase: true,
      ),
      observationsTimestamp: json.valueAsBigInt<BigInt?>(
        'observations_timestamp',
        acceptCamelCase: true,
      ),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
      expiresAt: json.valueAsBigInt<BigInt?>(
        'expires_at',
        acceptCamelCase: true,
      ),
    );
  }

  factory ChainlinkDataStreamsPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainlinkDataStreamsPriceState(
      feedId: decode.getString<String?>(1),
      reportPrice: decode.getString<String?>(2),
      validFromTimestamp: decode.getBigInt<BigInt?>(3),
      observationsTimestamp: decode.getBigInt<BigInt?>(4),
      priceState: decode.messageTo<PriceState?>(
        5,
        (b) => PriceState.deserialize(b),
      ),
      expiresAt: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1ChainlinkDataStreamsPriceState;
}

/// DEPRECATED! Oracle price from Band is no longer supported
class BandOracleRequest extends CosmosProtoMessage {
  /// Unique Identifier for band ibc oracle request
  final BigInt? requestId;

  /// OracleScriptID is the unique identifier of the oracle script to be
  /// executed.
  final BigInt? oracleScriptId;

  /// Symbols is the list of symbols to prepare in the calldata
  final List<String> symbols;

  /// AskCount is the number of validators that are requested to respond to this
  /// oracle request. Higher value means more security, at a higher gas cost.
  final BigInt? askCount;

  /// MinCount is the minimum number of validators necessary for the request to
  /// proceed to the execution phase. Higher value means more security, at the
  /// cost of liveness.
  final BigInt? minCount;

  /// FeeLimit is the maximum tokens that will be paid to all data source
  /// providers.
  final List<cosmos_base_v1beta1_coin.Coin> feeLimit;

  /// PrepareGas is amount of gas to pay to prepare raw requests
  final BigInt? prepareGas;

  /// ExecuteGas is amount of gas to reserve for executing
  final BigInt? executeGas;

  /// MinSourceCount is the minimum number of data sources that must be used by
  /// each validator
  final BigInt? minSourceCount;

  const BandOracleRequest({
    this.requestId,
    this.oracleScriptId,
    this.symbols = const [],
    this.askCount,
    this.minCount,
    this.feeLimit = const [],
    this.prepareGas,
    this.executeGas,
    this.minSourceCount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.uint64(8),
        ProtoFieldConfig.uint64(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    requestId,
    oracleScriptId,
    symbols,
    askCount,
    minCount,
    feeLimit,
    prepareGas,
    executeGas,
    minSourceCount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId?.toString(),
      'oracle_script_id': oracleScriptId?.toString(),
      'symbols': symbols.map((e) => e).toList(),
      'ask_count': askCount?.toString(),
      'min_count': minCount?.toString(),
      'fee_limit': feeLimit.map((e) => e.toJson()).toList(),
      'prepare_gas': prepareGas?.toString(),
      'execute_gas': executeGas?.toString(),
      'min_source_count': minSourceCount?.toString(),
    };
  }

  factory BandOracleRequest.fromJson(Map<String, dynamic> json) {
    return BandOracleRequest(
      requestId: json.valueAsBigInt<BigInt?>(
        'request_id',
        acceptCamelCase: true,
      ),
      oracleScriptId: json.valueAsBigInt<BigInt?>(
        'oracle_script_id',
        acceptCamelCase: true,
      ),
      symbols:
          (json.valueEnsureAsList<dynamic>(
            'symbols',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      askCount: json.valueAsBigInt<BigInt?>('ask_count', acceptCamelCase: true),
      minCount: json.valueAsBigInt<BigInt?>('min_count', acceptCamelCase: true),
      feeLimit:
          (json.valueEnsureAsList<dynamic>('fee_limit', acceptCamelCase: true))
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
      prepareGas: json.valueAsBigInt<BigInt?>(
        'prepare_gas',
        acceptCamelCase: true,
      ),
      executeGas: json.valueAsBigInt<BigInt?>(
        'execute_gas',
        acceptCamelCase: true,
      ),
      minSourceCount: json.valueAsBigInt<BigInt?>(
        'min_source_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory BandOracleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BandOracleRequest(
      requestId: decode.getBigInt<BigInt?>(1),
      oracleScriptId: decode.getBigInt<BigInt?>(2),
      symbols: decode.getListOrEmpty<String>(3),
      askCount: decode.getBigInt<BigInt?>(4),
      minCount: decode.getBigInt<BigInt?>(5),
      feeLimit:
          decode
              .getListOfBytes(6)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      prepareGas: decode.getBigInt<BigInt?>(7),
      executeGas: decode.getBigInt<BigInt?>(8),
      minSourceCount: decode.getBigInt<BigInt?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1BandOracleRequest;
}

/// DEPRECATED! Oracle price from Band is no longer supported
class BandIBCParams extends CosmosProtoMessage {
  /// true if Band IBC should be enabled
  final bool? bandIbcEnabled;

  /// block request interval to send Band IBC prices
  final BigInt? ibcRequestInterval;

  /// band IBC source channel
  final String? ibcSourceChannel;

  /// band IBC version
  final String? ibcVersion;

  /// band IBC portID
  final String? ibcPortId;

  /// legacy oracle scheme ids
  final List<BigInt> legacyOracleIds;

  const BandIBCParams({
    this.bandIbcEnabled,
    this.ibcRequestInterval,
    this.ibcSourceChannel,
    this.ibcVersion,
    this.ibcPortId,
    this.legacyOracleIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.int64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bandIbcEnabled,
    ibcRequestInterval,
    ibcSourceChannel,
    ibcVersion,
    ibcPortId,
    legacyOracleIds,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'band_ibc_enabled': bandIbcEnabled,
      'ibc_request_interval': ibcRequestInterval?.toString(),
      'ibc_source_channel': ibcSourceChannel,
      'ibc_version': ibcVersion,
      'ibc_port_id': ibcPortId,
      'legacy_oracle_ids': legacyOracleIds.map((e) => e.toString()).toList(),
    };
  }

  factory BandIBCParams.fromJson(Map<String, dynamic> json) {
    return BandIBCParams(
      bandIbcEnabled: json.valueAsBool<bool?>(
        'band_ibc_enabled',
        acceptCamelCase: true,
      ),
      ibcRequestInterval: json.valueAsBigInt<BigInt?>(
        'ibc_request_interval',
        acceptCamelCase: true,
      ),
      ibcSourceChannel: json.valueAsString<String?>(
        'ibc_source_channel',
        acceptCamelCase: true,
      ),
      ibcVersion: json.valueAsString<String?>(
        'ibc_version',
        acceptCamelCase: true,
      ),
      ibcPortId: json.valueAsString<String?>(
        'ibc_port_id',
        acceptCamelCase: true,
      ),
      legacyOracleIds:
          (json.valueEnsureAsList<dynamic>(
            'legacy_oracle_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory BandIBCParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BandIBCParams(
      bandIbcEnabled: decode.getBool<bool?>(1),
      ibcRequestInterval: decode.getBigInt<BigInt?>(2),
      ibcSourceChannel: decode.getString<String?>(3),
      ibcVersion: decode.getString<String?>(4),
      ibcPortId: decode.getString<String?>(5),
      legacyOracleIds: decode.getListOrEmpty<BigInt>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1BandIBCParams;
}

class PriceRecords extends CosmosProtoMessage {
  final OracleType? oracle;

  final String? symbolId;

  final List<PriceRecord> latestPriceRecords;

  const PriceRecords({
    this.oracle,
    this.symbolId,
    this.latestPriceRecords = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [oracle, symbolId, latestPriceRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'oracle': oracle?.protoName,
      'symbol_id': symbolId,
      'latest_price_records':
          latestPriceRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory PriceRecords.fromJson(Map<String, dynamic> json) {
    return PriceRecords(
      oracle: json.valueTo<OracleType?, Object?>(
        key: 'oracle',
        parse: (v) => OracleType.from(v),
      ),
      symbolId: json.valueAsString<String?>('symbol_id', acceptCamelCase: true),
      latestPriceRecords:
          (json.valueEnsureAsList<dynamic>(
                'latest_price_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<PriceRecord, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => PriceRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory PriceRecords.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PriceRecords(
      oracle: decode.getEnum<OracleType?>(1, OracleType.values),
      symbolId: decode.getString<String?>(2),
      latestPriceRecords:
          decode
              .getListOfBytes(3)
              .map((b) => PriceRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PriceRecords;
}

class PriceRecord extends CosmosProtoMessage {
  final BigInt? timestamp;

  final String? price;

  const PriceRecord({this.timestamp, this.price});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [timestamp, price];

  @override
  Map<String, dynamic> toJson() {
    return {'timestamp': timestamp?.toString(), 'price': price};
  }

  factory PriceRecord.fromJson(Map<String, dynamic> json) {
    return PriceRecord(
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
    );
  }

  factory PriceRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PriceRecord(
      timestamp: decode.getBigInt<BigInt?>(1),
      price: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PriceRecord;
}

/// MetadataStatistics refers to the metadata summary statistics of the
/// historical sample considered
class MetadataStatistics extends CosmosProtoMessage {
  /// GroupCount refers to the number of groups used. Equals RecordsSampleSize if
  /// no grouping is used
  final int? groupCount;

  /// RecordsSampleSize refers to the total number of records used.
  final int? recordsSampleSize;

  /// Mean refers to the arithmetic mean
  /// For trades, the mean is the VWAP computed over the grouped trade records ∑
  /// (price * quantity) / ∑ quantity For oracle prices, the mean is computed
  /// over the price records ∑ (price) / prices_count
  final String? mean;

  /// TWAP refers to the time-weighted average price which equals ∑ (price_i *
  /// ∆t_i) / ∑ ∆t_i where ∆t_i = t_i - t_{i-1}
  final String? twap;

  /// FirstTimestamp is the timestamp of the oldest record considered
  final BigInt? firstTimestamp;

  /// LastTimestamp is the timestamp of the youngest record considered
  final BigInt? lastTimestamp;

  /// MinPrice refers to the smallest individual raw price considered
  final String? minPrice;

  /// MaxPrice refers to the largest individual raw price considered
  final String? maxPrice;

  /// MedianPrice refers to the median individual raw price considered
  final String? medianPrice;

  const MetadataStatistics({
    this.groupCount,
    this.recordsSampleSize,
    this.mean,
    this.twap,
    this.firstTimestamp,
    this.lastTimestamp,
    this.minPrice,
    this.maxPrice,
    this.medianPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.int64(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    groupCount,
    recordsSampleSize,
    mean,
    twap,
    firstTimestamp,
    lastTimestamp,
    minPrice,
    maxPrice,
    medianPrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'group_count': groupCount,
      'records_sample_size': recordsSampleSize,
      'mean': mean,
      'twap': twap,
      'first_timestamp': firstTimestamp?.toString(),
      'last_timestamp': lastTimestamp?.toString(),
      'min_price': minPrice,
      'max_price': maxPrice,
      'median_price': medianPrice,
    };
  }

  factory MetadataStatistics.fromJson(Map<String, dynamic> json) {
    return MetadataStatistics(
      groupCount: json.valueAsInt<int?>('group_count', acceptCamelCase: true),
      recordsSampleSize: json.valueAsInt<int?>(
        'records_sample_size',
        acceptCamelCase: true,
      ),
      mean: json.valueAsString<String?>('mean', acceptCamelCase: true),
      twap: json.valueAsString<String?>('twap', acceptCamelCase: true),
      firstTimestamp: json.valueAsBigInt<BigInt?>(
        'first_timestamp',
        acceptCamelCase: true,
      ),
      lastTimestamp: json.valueAsBigInt<BigInt?>(
        'last_timestamp',
        acceptCamelCase: true,
      ),
      minPrice: json.valueAsString<String?>('min_price', acceptCamelCase: true),
      maxPrice: json.valueAsString<String?>('max_price', acceptCamelCase: true),
      medianPrice: json.valueAsString<String?>(
        'median_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory MetadataStatistics.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MetadataStatistics(
      groupCount: decode.getInt<int?>(1),
      recordsSampleSize: decode.getInt<int?>(2),
      mean: decode.getString<String?>(3),
      twap: decode.getString<String?>(4),
      firstTimestamp: decode.getBigInt<BigInt?>(5),
      lastTimestamp: decode.getBigInt<BigInt?>(6),
      minPrice: decode.getString<String?>(7),
      maxPrice: decode.getString<String?>(8),
      medianPrice: decode.getString<String?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MetadataStatistics;
}

class PriceAttestation extends CosmosProtoMessage {
  final String? priceId;

  /// MaxPrice refers to the largest individual raw price considered
  final BigInt? price;

  final BigInt? conf;

  final int? expo;

  final BigInt? emaPrice;

  final BigInt? emaConf;

  final int? emaExpo;

  final BigInt? publishTime;

  const PriceAttestation({
    this.priceId,
    this.price,
    this.conf,
    this.expo,
    this.emaPrice,
    this.emaConf,
    this.emaExpo,
    this.publishTime,
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
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.int32(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.int32(7),
        ProtoFieldConfig.int64(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    priceId,
    price,
    conf,
    expo,
    emaPrice,
    emaConf,
    emaExpo,
    publishTime,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'price_id': priceId,
      'price': price?.toString(),
      'conf': conf?.toString(),
      'expo': expo,
      'ema_price': emaPrice?.toString(),
      'ema_conf': emaConf?.toString(),
      'ema_expo': emaExpo,
      'publish_time': publishTime?.toString(),
    };
  }

  factory PriceAttestation.fromJson(Map<String, dynamic> json) {
    return PriceAttestation(
      priceId: json.valueAsString<String?>('price_id', acceptCamelCase: true),
      price: json.valueAsBigInt<BigInt?>('price', acceptCamelCase: true),
      conf: json.valueAsBigInt<BigInt?>('conf', acceptCamelCase: true),
      expo: json.valueAsInt<int?>('expo', acceptCamelCase: true),
      emaPrice: json.valueAsBigInt<BigInt?>('ema_price', acceptCamelCase: true),
      emaConf: json.valueAsBigInt<BigInt?>('ema_conf', acceptCamelCase: true),
      emaExpo: json.valueAsInt<int?>('ema_expo', acceptCamelCase: true),
      publishTime: json.valueAsBigInt<BigInt?>(
        'publish_time',
        acceptCamelCase: true,
      ),
    );
  }

  factory PriceAttestation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PriceAttestation(
      priceId: decode.getString<String?>(1),
      price: decode.getBigInt<BigInt?>(2),
      conf: decode.getBigInt<BigInt?>(3),
      expo: decode.getInt<int?>(4),
      emaPrice: decode.getBigInt<BigInt?>(5),
      emaConf: decode.getBigInt<BigInt?>(6),
      emaExpo: decode.getInt<int?>(7),
      publishTime: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PriceAttestation;
}

class AssetPair extends CosmosProtoMessage {
  final String? assetId;

  final List<SignedPriceOfAssetPair> signedPrices;

  const AssetPair({this.assetId, this.signedPrices = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [assetId, signedPrices];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset_id': assetId,
      'signed_prices': signedPrices.map((e) => e.toJson()).toList(),
    };
  }

  factory AssetPair.fromJson(Map<String, dynamic> json) {
    return AssetPair(
      assetId: json.valueAsString<String?>('asset_id', acceptCamelCase: true),
      signedPrices:
          (json.valueEnsureAsList<dynamic>(
                'signed_prices',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  SignedPriceOfAssetPair,
                  Map<String, dynamic>
                >(value: e, parse: (v) => SignedPriceOfAssetPair.fromJson(v)),
              )
              .toList(),
    );
  }

  factory AssetPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AssetPair(
      assetId: decode.getString<String?>(1),
      signedPrices:
          decode
              .getListOfBytes(2)
              .map((b) => SignedPriceOfAssetPair.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1AssetPair;
}

class SignedPriceOfAssetPair extends CosmosProtoMessage {
  final String? publisherKey;

  final BigInt? timestamp;

  final String? price;

  final List<int>? signature;

  const SignedPriceOfAssetPair({
    this.publisherKey,
    this.timestamp,
    this.price,
    this.signature,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [publisherKey, timestamp, price, signature];

  @override
  Map<String, dynamic> toJson() {
    return {
      'publisher_key': publisherKey,
      'timestamp': timestamp?.toString(),
      'price': price,
      'signature': switch (signature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory SignedPriceOfAssetPair.fromJson(Map<String, dynamic> json) {
    return SignedPriceOfAssetPair(
      publisherKey: json.valueAsString<String?>(
        'publisher_key',
        acceptCamelCase: true,
      ),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      signature: json.valueAsBytes<List<int>?>(
        'signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory SignedPriceOfAssetPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignedPriceOfAssetPair(
      publisherKey: decode.getString<String?>(1),
      timestamp: decode.getBigInt<BigInt?>(2),
      price: decode.getString<String?>(3),
      signature: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1SignedPriceOfAssetPair;
}

class ChainlinkReport extends CosmosProtoMessage {
  final List<int>? feedId;

  final List<int>? fullReport;

  final BigInt? validFromTimestamp;

  final BigInt? observationsTimestamp;

  const ChainlinkReport({
    this.feedId,
    this.fullReport,
    this.validFromTimestamp,
    this.observationsTimestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    feedId,
    fullReport,
    validFromTimestamp,
    observationsTimestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'feed_id': switch (feedId) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'full_report': switch (fullReport) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'valid_from_timestamp': validFromTimestamp?.toString(),
      'observations_timestamp': observationsTimestamp?.toString(),
    };
  }

  factory ChainlinkReport.fromJson(Map<String, dynamic> json) {
    return ChainlinkReport(
      feedId: json.valueAsBytes<List<int>?>(
        'feed_id',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      fullReport: json.valueAsBytes<List<int>?>(
        'full_report',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      validFromTimestamp: json.valueAsBigInt<BigInt?>(
        'valid_from_timestamp',
        acceptCamelCase: true,
      ),
      observationsTimestamp: json.valueAsBigInt<BigInt?>(
        'observations_timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory ChainlinkReport.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainlinkReport(
      feedId: decode.getBytes<List<int>?>(1),
      fullReport: decode.getBytes<List<int>?>(2),
      validFromTimestamp: decode.getBigInt<BigInt?>(3),
      observationsTimestamp: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1ChainlinkReport;
}

/// PythProPriceState holds the verified price state for a single PythPro feed.
class PythProPriceState extends CosmosProtoMessage {
  /// feed_id is the uint32 Pyth Lazer feed identifier.
  final int? feedId;

  /// timestamp is the price timestamp extracted from the verified payload
  /// (microseconds from epoch).
  final BigInt? timestamp;

  /// price_state holds the verified price, cumulative price, and block
  /// timestamp.
  final PriceState? priceState;

  const PythProPriceState({this.feedId, this.timestamp, this.priceState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [feedId, timestamp, priceState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'feed_id': feedId,
      'timestamp': timestamp?.toString(),
      'price_state': priceState?.toJson(),
    };
  }

  factory PythProPriceState.fromJson(Map<String, dynamic> json) {
    return PythProPriceState(
      feedId: json.valueAsInt<int?>('feed_id', acceptCamelCase: true),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory PythProPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PythProPriceState(
      feedId: decode.getInt<int?>(1),
      timestamp: decode.getBigInt<BigInt?>(2),
      priceState: decode.messageTo<PriceState?>(
        3,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PythProPriceState;
}

/// SedaFastPriceState holds the verified price state for a single SEDA Fast
/// feed.
class SedaFastPriceState extends CosmosProtoMessage {
  /// feed_id is the hex-encoded execInputs string from the SEDA Fast
  /// dataRequest. It is the stable on-chain identity of the feed, invariant
  /// across relayer restarts and per-execution result IDs.
  final String? feedId;

  /// timestamp is the dataResult.blockTimestamp value (milliseconds from
  /// epoch) extracted from the verified SEDA Fast response.
  final BigInt? timestamp;

  /// price_state holds the verified price, cumulative price, and block
  /// timestamp.
  final PriceState? priceState;

  const SedaFastPriceState({this.feedId, this.timestamp, this.priceState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [feedId, timestamp, priceState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'feed_id': feedId,
      'timestamp': timestamp?.toString(),
      'price_state': priceState?.toJson(),
    };
  }

  factory SedaFastPriceState.fromJson(Map<String, dynamic> json) {
    return SedaFastPriceState(
      feedId: json.valueAsString<String?>('feed_id', acceptCamelCase: true),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      priceState: json.valueTo<PriceState?, Map<String, dynamic>>(
        key: 'price_state',
        parse: (v) => PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SedaFastPriceState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SedaFastPriceState(
      feedId: decode.getString<String?>(1),
      timestamp: decode.getBigInt<BigInt?>(2),
      priceState: decode.messageTo<PriceState?>(
        3,
        (b) => PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1SedaFastPriceState;
}
