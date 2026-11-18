import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/opinit/ophost/v1/src/types.dart"
    as opinit_ophost_v1_types;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;

/// ResponseResultType defines the possible outcomes of the execution of a message
enum ResponseResultType implements ProtoEnumVariant {
  /// Default zero value enumeration
  responseResultTypeUnspecified(0, 'RESPONSE_RESULT_TYPE_UNSPECIFIED'),

  /// The message did not execute msg operation (because, for example, deposit had already been finalized)
  responseResultTypeNoop(1, 'RESPONSE_RESULT_TYPE_NOOP'),

  /// The message was executed successfully
  responseResultTypeSuccess(2, 'RESPONSE_RESULT_TYPE_SUCCESS');

  const ResponseResultType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseResultType fromValue(int? value) {
    value ??= 0;
    return ResponseResultType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ResponseResultType found for the given value. $value",
                details: {
                  "name": "ResponseResultType",
                  "value": value?.toString(),
                },
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseResultType from(Object? value) {
    value ??= 0;
    return ResponseResultType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ResponseResultType found for the given value. $value",
                details: {
                  "name": "ResponseResultType",
                  "value": value?.toString(),
                },
              ),
    );
  }
}

/// Params defines the set of opchild parameters.
class Params extends CosmosProtoMessage {
  /// max_validators is the maximum number of validators.
  final int? maxValidators;

  /// historical_entries is the number of historical entries to persist.
  final int? historicalEntries;

  final List<cosmos_base_v1beta1_coin.DecCoin> minGasPrices;

  /// the account address of bridge executor who can execute permissioned bridge
  /// messages.
  final List<String> bridgeExecutors;

  /// the account address of admin who can execute permissioned cosmos messages.
  final String? admin;

  /// the list of addresses that are allowed to pay zero fee.
  final List<String> feeWhitelist;

  /// Max gas for hook execution of `MsgFinalizeTokenDeposit`
  final BigInt? hookMaxGas;

  const Params({
    this.maxValidators,
    this.historicalEntries,
    this.minGasPrices = const [],
    this.bridgeExecutors = const [],
    this.admin,
    this.feeWhitelist = const [],
    this.hookMaxGas,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "opchild/Params")],
      fields: [
        ProtoFieldConfig.uint32(1, options: const []),
        ProtoFieldConfig.uint32(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    maxValidators,
    historicalEntries,
    minGasPrices,
    bridgeExecutors,
    admin,
    feeWhitelist,
    hookMaxGas,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'max_validators': maxValidators,
      'historical_entries': historicalEntries,
      'min_gas_prices':
          minGasPrices.map((e) => config.encodeMessage(e)).toList(),
      'bridge_executors': bridgeExecutors.map((e) => e).toList(),
      'admin': admin,
      'fee_whitelist': feeWhitelist.map((e) => e).toList(),
      'hook_max_gas': config.encodeBigint(hookMaxGas),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      maxValidators: json.valueAsInt<int?>(
        'max_validators',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      historicalEntries: json.valueAsInt<int?>(
        'historical_entries',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minGasPrices:
          (json.valueEnsureAsList<dynamic>(
                'min_gas_prices',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      bridgeExecutors:
          (json.valueEnsureAsList<dynamic>(
            'bridge_executors',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feeWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'fee_whitelist',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      hookMaxGas: json.valueAsBigInt<BigInt?>(
        'hook_max_gas',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      maxValidators: decode.getInt<int?>(1),
      historicalEntries: decode.getInt<int?>(2),
      minGasPrices:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      bridgeExecutors: decode.getListOrEmpty<String>(4),
      admin: decode.getString<String?>(5),
      feeWhitelist: decode.getListOrEmpty<String>(6),
      hookMaxGas: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1Params;
}

/// Validator defines a validator, together with the total amount of the
/// Validator's bond shares and their exchange rate to coins. Slashing results in
/// a decrease in the exchange rate, allowing correct calculation of future
/// undelegations without iterating over delegators. When coins are delegated to
/// this validator, the validator is credited with a delegation whose number of
/// bond shares is based on the amount of coins delegated divided by the current
/// exchange rate. Voting power can be calculated as total bonded shares
/// multiplied by exchange rate.
class Validator extends CosmosProtoMessage {
  final String? moniker;

  /// operator_address defines the address of the validator's operator;
  /// bech encoded in JSON.
  final String? operatorAddress;

  /// consensus_pubkey is the consensus public key of the validator,
  /// as a Protobuf Any.
  final google_protobuf_any.Any? consensusPubkey;

  final BigInt? consPower;

  const Validator({
    this.moniker,
    this.operatorAddress,
    this.consensusPubkey,
    this.consPower,
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
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.int64(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    moniker,
    operatorAddress,
    consensusPubkey,
    consPower,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'moniker': moniker,
      'operator_address': operatorAddress,
      'consensus_pubkey': config.encodeMessage(consensusPubkey),
      'cons_power': config.encodeBigint(consPower),
    };
  }

  factory Validator.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Validator(
      moniker: json.valueAsString<String?>(
        'moniker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      operatorAddress: json.valueAsString<String?>(
        'operator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      consensusPubkey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'consensus_pubkey',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      consPower: json.valueAsBigInt<BigInt?>(
        'cons_power',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Validator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Validator(
      moniker: decode.getString<String?>(1),
      operatorAddress: decode.getString<String?>(2),
      consensusPubkey: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      consPower: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1Validator;
}

/// BridgeInfo defines the information of the bridge.
class BridgeInfo extends CosmosProtoMessage {
  /// bridge id is the unique identifier of the bridge which is assigned from l1.
  final BigInt? bridgeId;

  /// bridge_addr is the address of the bridge on l1.
  final String? bridgeAddr;

  /// l1_chain_id is the chain id of the l1 chain.
  final String? l1ChainId;

  /// l1_client_id is the IBC client ID, which is allocated for l1 chain, in l2 chain state.
  /// This is used to verify the validator set in oracle update messages.
  final String? l1ClientId;

  /// bridge_config is the configuration of the bridge.
  final opinit_ophost_v1_types.BridgeConfig? bridgeConfig;

  const BridgeInfo({
    this.bridgeId,
    this.bridgeAddr,
    this.l1ChainId,
    this.l1ClientId,
    this.bridgeConfig,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bridgeId,
    bridgeAddr,
    l1ChainId,
    l1ClientId,
    bridgeConfig,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'bridge_id': config.encodeBigint(bridgeId),
      'bridge_addr': bridgeAddr,
      'l1_chain_id': l1ChainId,
      'l1_client_id': l1ClientId,
      'bridge_config': config.encodeMessage(bridgeConfig),
    };
  }

  factory BridgeInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BridgeInfo(
      bridgeId: json.valueAsBigInt<BigInt?>(
        'bridge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bridgeAddr: json.valueAsString<String?>(
        'bridge_addr',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      l1ChainId: json.valueAsString<String?>(
        'l1_chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      l1ClientId: json.valueAsString<String?>(
        'l1_client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bridgeConfig: json.valueTo<opinit_ophost_v1_types.BridgeConfig?, Object>(
        key: 'bridge_config',
        parse:
            (v) => opinit_ophost_v1_types.BridgeConfig.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BridgeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BridgeInfo(
      bridgeId: decode.getBigInt<BigInt?>(1),
      bridgeAddr: decode.getString<String?>(2),
      l1ChainId: decode.getString<String?>(3),
      l1ClientId: decode.getString<String?>(4),
      bridgeConfig: decode.messageTo<opinit_ophost_v1_types.BridgeConfig?>(
        5,
        (b) => opinit_ophost_v1_types.BridgeConfig.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1BridgeInfo;
}

/// MigrationInfo defines the information of the migration.
class MigrationInfo extends CosmosProtoMessage {
  /// denom is the denom of the token on l2 chain.
  final String? denom;

  /// ibc_channel_id is the IBC channel ID, which is allocated for l1 chain, in l2 chain state.
  final String? ibcChannelId;

  /// ibc_port_id is the IBC port ID, which is allocated for l1 chain, in l2 chain state.
  final String? ibcPortId;

  /// base_ibc_denom_path is the full IBC denom path of the stored base denom.
  /// It is required when the stored base denom is an ibc/{hash} denom.
  final String? baseIbcDenomPath;

  const MigrationInfo({
    this.denom,
    this.ibcChannelId,
    this.ibcPortId,
    this.baseIbcDenomPath,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    denom,
    ibcChannelId,
    ibcPortId,
    baseIbcDenomPath,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'denom': denom,
      'ibc_channel_id': ibcChannelId,
      'ibc_port_id': ibcPortId,
      'base_ibc_denom_path': baseIbcDenomPath,
    };
  }

  factory MigrationInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MigrationInfo(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibcChannelId: json.valueAsString<String?>(
        'ibc_channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ibcPortId: json.valueAsString<String?>(
        'ibc_port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseIbcDenomPath: json.valueAsString<String?>(
        'base_ibc_denom_path',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MigrationInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MigrationInfo(
      denom: decode.getString<String?>(1),
      ibcChannelId: decode.getString<String?>(2),
      ibcPortId: decode.getString<String?>(3),
      baseIbcDenomPath: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MigrationInfo;
}

/// OraclePriceData defines a single oracle price without proof (used in batched updates).
class OraclePriceData extends CosmosProtoMessage {
  /// currency_pair is the currency pair being relayed.
  final String? currencyPair;

  /// price is the oracle price from L1.
  final String? price;

  /// decimals is the number of decimals for the price.
  final BigInt? decimals;

  /// nonce is the nonce from L1 oracle module.
  final BigInt? nonce;

  /// currency_pair_id is the ID of the currency pair in L1's oracle module.
  final BigInt? currencyPairId;

  /// timestamp is the block timestamp of the price from L1's oracle module, in unix nanoseconds.
  final BigInt? timestamp;

  const OraclePriceData({
    this.currencyPair,
    this.price,
    this.decimals,
    this.nonce,
    this.currencyPairId,
    this.timestamp,
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
        ProtoFieldConfig.uint64(5, options: const []),
        ProtoFieldConfig.int64(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    currencyPair,
    price,
    decimals,
    nonce,
    currencyPairId,
    timestamp,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'currency_pair': currencyPair,
      'price': price,
      'decimals': config.encodeBigint(decimals),
      'nonce': config.encodeBigint(nonce),
      'currency_pair_id': config.encodeBigint(currencyPairId),
      'timestamp': config.encodeBigint(timestamp),
    };
  }

  factory OraclePriceData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OraclePriceData(
      currencyPair: json.valueAsString<String?>(
        'currency_pair',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      price: json.valueAsString<String?>(
        'price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      decimals: json.valueAsBigInt<BigInt?>(
        'decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      currencyPairId: json.valueAsBigInt<BigInt?>(
        'currency_pair_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OraclePriceData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePriceData(
      currencyPair: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
      decimals: decode.getBigInt<BigInt?>(3),
      nonce: decode.getBigInt<BigInt?>(4),
      currencyPairId: decode.getBigInt<BigInt?>(5),
      timestamp: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1OraclePriceData;
}

/// OracleData defines the oracle price data relayed from L1.
/// The relayer must provide batched oracle price data with a Merkle proof that the hash exists in
/// L1's ophost module state. L2 verifies the proof against L1's state root, updated by IBC light client.
class OracleData extends CosmosProtoMessage {
  /// bridge_id is the unique identifier of the bridge.
  final BigInt? bridgeId;

  /// oracle_price_hash is the hash of all oracle prices stored in L1 ophost state.
  final BuBytes? oraclePriceHash;

  /// prices contains all the oracle price data from L1.
  final List<OraclePriceData> prices;

  /// l1_block_height is the L1 block height at which this oracle data was recorded.
  final BigInt? l1BlockHeight;

  /// l1_block_time is the L1 block timestamp, in unix nanoseconds.
  final BigInt? l1BlockTime;

  /// proof is the Merkle proof that verifies the oracle_price_hash exists
  /// in L1's ophost module state at the specified height.
  final BuBytes? proof;

  /// proof_height is the L1 height at which the proof was generated.
  final ibc_core_client_v1_client.Height? proofHeight;

  OracleData({
    this.bridgeId,
    List<int>? oraclePriceHash,
    this.prices = const [],
    this.l1BlockHeight,
    this.l1BlockTime,
    List<int>? proof,
    this.proofHeight,
  }) : oraclePriceHash = oraclePriceHash?.asImmutableBytes,
       proof = proof?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.bytes(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bridgeId,
    oraclePriceHash,
    prices,
    l1BlockHeight,
    l1BlockTime,
    proof,
    proofHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'bridge_id': config.encodeBigint(bridgeId),
      'oracle_price_hash': config.encodeBinary(oraclePriceHash),
      'prices': prices.map((e) => config.encodeMessage(e)).toList(),
      'l1_block_height': config.encodeBigint(l1BlockHeight),
      'l1_block_time': config.encodeBigint(l1BlockTime),
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory OracleData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OracleData(
      bridgeId: json.valueAsBigInt<BigInt?>(
        'bridge_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      oraclePriceHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'oracle_price_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      prices:
          (json.valueEnsureAsList<dynamic>(
                'prices',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OraclePriceData, Object>(
                  value: e,
                  parse:
                      (v) => OraclePriceData.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      l1BlockHeight: json.valueAsBigInt<BigInt?>(
        'l1_block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      l1BlockTime: json.valueAsBigInt<BigInt?>(
        'l1_block_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proof: config.decodeBinary<List<int>?>(
        json.valueAs('proof', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OracleData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OracleData(
      bridgeId: decode.getBigInt<BigInt?>(1),
      oraclePriceHash: decode.getBytes<List<int>?>(2),
      prices:
          decode
              .getListOfBytes(3)
              .map((b) => OraclePriceData.deserialize(b))
              .toList(),
      l1BlockHeight: decode.getBigInt<BigInt?>(4),
      l1BlockTime: decode.getBigInt<BigInt?>(5),
      proof: decode.getBytes<List<int>?>(6),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        7,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1OracleData;
}
