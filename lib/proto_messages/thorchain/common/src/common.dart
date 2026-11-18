import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/server_bifrost_localhost.dart"
    as types_server_bifrost_localhost;

enum Status implements ProtoEnumVariant {
  incomplete(0, 'incomplete'),
  done(1, 'done'),
  reverted(2, 'reverted');

  const Status(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Status fromValue(int? value) {
    value ??= 0;
    return Status.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching Status found for the given value. $value",
                details: {"name": "Status", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Status from(Object? value) {
    value ??= 0;
    return Status.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching Status found for the given value. $value",
                details: {"name": "Status", "value": value?.toString()},
              ),
    );
  }
}

class Asset extends CosmosProtoMessage {
  final String? chain;

  final String? symbol;

  final String? ticker;

  final bool? synth;

  final bool? trade;

  final bool? secured;

  const Asset({
    this.chain,
    this.symbol,
    this.ticker,
    this.synth,
    this.trade,
    this.secured,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.bool(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chain,
    symbol,
    ticker,
    synth,
    trade,
    secured,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'chain': chain,
      'symbol': symbol,
      'ticker': ticker,
      'synth': synth,
      'trade': trade,
      'secured': secured,
    };
  }

  factory Asset.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Asset(
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      symbol: json.valueAsString<String?>(
        'symbol',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ticker: json.valueAsString<String?>(
        'ticker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      synth: json.valueAsBool<bool?>(
        'synth',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      trade: json.valueAsBool<bool?>(
        'trade',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      secured: json.valueAsBool<bool?>(
        'secured',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Asset.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Asset(
      chain: decode.getString<String?>(1),
      symbol: decode.getString<String?>(2),
      ticker: decode.getString<String?>(3),
      synth: decode.getBool<bool?>(4),
      trade: decode.getBool<bool?>(5),
      secured: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonAsset;
}

class Coin extends CosmosProtoMessage {
  final Asset? asset;

  final String? amount;

  final BigInt? decimals;

  const Coin({this.asset, this.amount, this.decimals});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionString(name: "amino.encoding", value: "asset")],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asset, amount, decimals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'asset': config.encodeMessage(asset),
      'amount': amount,
      'decimals': config.encodeBigint(decimals),
    };
  }

  factory Coin.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Coin(
      asset: json.valueTo<Asset?, Object>(
        key: 'asset',
        parse: (v) => Asset.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      decimals: json.valueAsBigInt<BigInt?>(
        'decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Coin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Coin(
      asset: decode.messageTo<Asset?>(1, (b) => Asset.deserialize(b)),
      amount: decode.getString<String?>(2),
      decimals: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonCoin;
}

/// PubKeySet contains two pub keys , secp256k1 and ed25519
class PubKeySet extends CosmosProtoMessage {
  final String? secp256k1;

  final String? ed25519;

  const PubKeySet({this.secp256k1, this.ed25519});

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
  List<Object?> get protoValues => [secp256k1, ed25519];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'secp256k1': secp256k1, 'ed25519': ed25519};
  }

  factory PubKeySet.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PubKeySet(
      secp256k1: json.valueAsString<String?>(
        'secp256k1',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ed25519: json.valueAsString<String?>(
        'ed25519',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PubKeySet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PubKeySet(
      secp256k1: decode.getString<String?>(1),
      ed25519: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonPubKeySet;
}

class Tx extends CosmosProtoMessage {
  final String? id;

  final String? chain;

  final String? fromAddress;

  final String? toAddress;

  final List<Coin> coins;

  final List<Coin> gas;

  final String? memo;

  const Tx({
    this.id,
    this.chain,
    this.fromAddress,
    this.toAddress,
    this.coins = const [],
    this.gas = const [],
    this.memo,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    chain,
    fromAddress,
    toAddress,
    coins,
    gas,
    memo,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
      'chain': chain,
      'from_address': fromAddress,
      'to_address': toAddress,
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
      'gas': gas.map((e) => config.encodeMessage(e)).toList(),
      'memo': memo,
    };
  }

  factory Tx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Tx(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      fromAddress: json.valueAsString<String?>(
        'from_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Coin, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Coin.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
      gas:
          (json.valueEnsureAsList<dynamic>(
                'gas',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Coin, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Coin.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Tx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Tx(
      id: decode.getString<String?>(1),
      chain: decode.getString<String?>(2),
      fromAddress: decode.getString<String?>(3),
      toAddress: decode.getString<String?>(4),
      coins: decode.getListOfBytes(5).map((b) => Coin.deserialize(b)).toList(),
      gas: decode.getListOfBytes(6).map((b) => Coin.deserialize(b)).toList(),
      memo: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonTx;
}

class OutputRef extends CosmosProtoMessage {
  final String? txHash;

  final int? outputIndex;

  final String? keyImage;

  final String? spendTxHash;

  const OutputRef({
    this.txHash,
    this.outputIndex,
    this.keyImage,
    this.spendTxHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txHash, outputIndex, keyImage, spendTxHash];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx_hash': txHash,
      'output_index': outputIndex,
      'key_image': keyImage,
      'spend_tx_hash': spendTxHash,
    };
  }

  factory OutputRef.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OutputRef(
      txHash: json.valueAsString<String?>(
        'tx_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outputIndex: json.valueAsInt<int?>(
        'output_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keyImage: json.valueAsString<String?>(
        'key_image',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spendTxHash: json.valueAsString<String?>(
        'spend_tx_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OutputRef.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OutputRef(
      txHash: decode.getString<String?>(1),
      outputIndex: decode.getInt<int?>(2),
      keyImage: decode.getString<String?>(3),
      spendTxHash: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonOutputRef;
}

class ObservedTx extends CosmosProtoMessage {
  final Tx? tx;

  final Status? status;

  final List<String> outHashes;

  final BigInt? blockHeight;

  final List<String> signers;

  final String? observedPubKey;

  final BigInt? keysignMs;

  final BigInt? finaliseHeight;

  final String? aggregator;

  final String? aggregatorTarget;

  final String? aggregatorTargetLimit;

  final List<OutputRef> spentOutputRefs;

  const ObservedTx({
    this.tx,
    this.status,
    this.outHashes = const [],
    this.blockHeight,
    this.signers = const [],
    this.observedPubKey,
    this.keysignMs,
    this.finaliseHeight,
    this.aggregator,
    this.aggregatorTarget,
    this.aggregatorTargetLimit,
    this.spentOutputRefs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.int64(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tx,
    status,
    outHashes,
    blockHeight,
    signers,
    observedPubKey,
    keysignMs,
    finaliseHeight,
    aggregator,
    aggregatorTarget,
    aggregatorTargetLimit,
    spentOutputRefs,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx': config.encodeMessage(tx),
      'status': config.encodeEnum(status),
      'out_hashes': outHashes.map((e) => e).toList(),
      'block_height': config.encodeBigint(blockHeight),
      'signers': signers.map((e) => e).toList(),
      'observed_pub_key': observedPubKey,
      'keysign_ms': config.encodeBigint(keysignMs),
      'finalise_height': config.encodeBigint(finaliseHeight),
      'aggregator': aggregator,
      'aggregator_target': aggregatorTarget,
      'aggregator_target_limit': aggregatorTargetLimit,
      'spent_output_refs':
          spentOutputRefs.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ObservedTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ObservedTx(
      tx: json.valueTo<Tx?, Object>(
        key: 'tx',
        parse: (v) => Tx.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueTo<Status?, Object?>(
        key: 'status',
        parse: (v) => Status.from(v),
      ),
      outHashes:
          (json.valueEnsureAsList<dynamic>(
            'out_hashes',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signers:
          (json.valueEnsureAsList<dynamic>(
            'signers',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      observedPubKey: json.valueAsString<String?>(
        'observed_pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keysignMs: json.valueAsBigInt<BigInt?>(
        'keysign_ms',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      finaliseHeight: json.valueAsBigInt<BigInt?>(
        'finalise_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregator: json.valueAsString<String?>(
        'aggregator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregatorTarget: json.valueAsString<String?>(
        'aggregator_target',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregatorTargetLimit: json.valueAsString<String?>(
        'aggregator_target_limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spentOutputRefs:
          (json.valueEnsureAsList<dynamic>(
                'spent_output_refs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OutputRef, Object>(
                  value: e,
                  parse:
                      (v) => OutputRef.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory ObservedTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ObservedTx(
      tx: decode.messageTo<Tx?>(1, (b) => Tx.deserialize(b)),
      status: decode.getEnum<Status?>(2, Status.values),
      outHashes: decode.getListOrEmpty<String>(3),
      blockHeight: decode.getBigInt<BigInt?>(4),
      signers: decode.getListOrEmpty<String>(5),
      observedPubKey: decode.getString<String?>(6),
      keysignMs: decode.getBigInt<BigInt?>(7),
      finaliseHeight: decode.getBigInt<BigInt?>(8),
      aggregator: decode.getString<String?>(9),
      aggregatorTarget: decode.getString<String?>(10),
      aggregatorTargetLimit: decode.getString<String?>(11),
      spentOutputRefs:
          decode
              .getListOfBytes(12)
              .map((b) => OutputRef.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonObservedTx;
}

class Attestation extends CosmosProtoMessage {
  final BuBytes? pubKey;

  final BuBytes? signature;

  Attestation({List<int>? pubKey, List<int>? signature})
    : pubKey = pubKey?.asImmutableBytes,
      signature = signature?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey, signature];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'PubKey': config.encodeBinary(pubKey),
      'Signature': config.encodeBinary(signature),
    };
  }

  factory Attestation.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Attestation(
      pubKey: config.decodeBinary<List<int>?>(
        json.valueAs('PubKey', normalizeKeyLookup: config.normalizeKeys),
      ),
      signature: config.decodeBinary<List<int>?>(
        json.valueAs('Signature', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory Attestation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Attestation(
      pubKey: decode.getBytes<List<int>?>(1),
      signature: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonAttestation;
}

/// allow future observation if this is an instant observation and gas
/// is wrong, requiring future observation to correct
class QuorumTx extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          types_server_bifrost_localhost.SendQuorumTxResult
        > {
  final ObservedTx? obsTx;

  final List<Attestation> attestations;

  final bool? inbound;

  final bool? allowFutureObservation;

  const QuorumTx({
    this.obsTx,
    this.attestations = const [],
    this.inbound,
    this.allowFutureObservation,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    obsTx,
    attestations,
    inbound,
    allowFutureObservation,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'obsTx': config.encodeMessage(obsTx),
      'attestations': attestations.map((e) => config.encodeMessage(e)).toList(),
      'inbound': inbound,
      'allow_future_observation': allowFutureObservation,
    };
  }

  factory QuorumTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuorumTx(
      obsTx: json.valueTo<ObservedTx?, Object>(
        key: 'obsTx',
        parse:
            (v) => ObservedTx.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Attestation, Object>(
                  value: e,
                  parse:
                      (v) => Attestation.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      inbound: json.valueAsBool<bool?>(
        'inbound',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      allowFutureObservation: json.valueAsBool<bool?>(
        'allow_future_observation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuorumTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuorumTx(
      obsTx: decode.messageTo<ObservedTx?>(1, (b) => ObservedTx.deserialize(b)),
      attestations:
          decode
              .getListOfBytes(2)
              .map((b) => Attestation.deserialize(b))
              .toList(),
      inbound: decode.getBool<bool?>(3),
      allowFutureObservation: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonQuorumTx;
  @override
  types_server_bifrost_localhost.SendQuorumTxResult onServiceResponse(
    List<int> bytes,
  ) {
    return types_server_bifrost_localhost.SendQuorumTxResult.deserialize(bytes);
  }

  @override
  types_server_bifrost_localhost.SendQuorumTxResult onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return types_server_bifrost_localhost.SendQuorumTxResult.fromJson(json);
  }
}

class NetworkFee extends CosmosProtoMessage {
  final BigInt? height;

  final String? chain;

  final BigInt? transactionSize;

  final BigInt? transactionRate;

  const NetworkFee({
    this.height,
    this.chain,
    this.transactionSize,
    this.transactionRate,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    height,
    chain,
    transactionSize,
    transactionRate,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'chain': chain,
      'transaction_size': config.encodeBigint(transactionSize),
      'transaction_rate': config.encodeBigint(transactionRate),
    };
  }

  factory NetworkFee.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return NetworkFee(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      transactionSize: json.valueAsBigInt<BigInt?>(
        'transaction_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      transactionRate: json.valueAsBigInt<BigInt?>(
        'transaction_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory NetworkFee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NetworkFee(
      height: decode.getBigInt<BigInt?>(1),
      chain: decode.getString<String?>(2),
      transactionSize: decode.getBigInt<BigInt?>(3),
      transactionRate: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonNetworkFee;
}

class QuorumNetworkFee extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          types_server_bifrost_localhost.SendQuorumNetworkFeeResult
        > {
  final NetworkFee? networkFee;

  final List<Attestation> attestations;

  const QuorumNetworkFee({this.networkFee, this.attestations = const []});

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
  List<Object?> get protoValues => [networkFee, attestations];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'network_fee': config.encodeMessage(networkFee),
      'attestations': attestations.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuorumNetworkFee.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuorumNetworkFee(
      networkFee: json.valueTo<NetworkFee?, Object>(
        key: 'network_fee',
        parse:
            (v) => NetworkFee.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Attestation, Object>(
                  value: e,
                  parse:
                      (v) => Attestation.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuorumNetworkFee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuorumNetworkFee(
      networkFee: decode.messageTo<NetworkFee?>(
        1,
        (b) => NetworkFee.deserialize(b),
      ),
      attestations:
          decode
              .getListOfBytes(2)
              .map((b) => Attestation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonQuorumNetworkFee;
  @override
  types_server_bifrost_localhost.SendQuorumNetworkFeeResult onServiceResponse(
    List<int> bytes,
  ) {
    return types_server_bifrost_localhost
        .SendQuorumNetworkFeeResult.deserialize(bytes);
  }

  @override
  types_server_bifrost_localhost.SendQuorumNetworkFeeResult
  onServiceResponseJson(Map<String, dynamic> json) {
    return types_server_bifrost_localhost.SendQuorumNetworkFeeResult.fromJson(
      json,
    );
  }
}

class Solvency extends CosmosProtoMessage {
  final String? id;

  final String? chain;

  final String? pubKey;

  final List<Coin> coins;

  final BigInt? height;

  const Solvency({
    this.id,
    this.chain,
    this.pubKey,
    this.coins = const [],
    this.height,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, chain, pubKey, coins, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
      'chain': chain,
      'pub_key': pubKey,
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
      'height': config.encodeBigint(height),
    };
  }

  factory Solvency.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Solvency(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubKey: json.valueAsString<String?>(
        'pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Coin, Object>(
                  value: e,
                  parse:
                      (v) =>
                          Coin.fromJson(JsonParser.valueAs(v), config: config),
                ),
              )
              .toList(),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Solvency.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Solvency(
      id: decode.getString<String?>(1),
      chain: decode.getString<String?>(2),
      pubKey: decode.getString<String?>(3),
      coins: decode.getListOfBytes(4).map((b) => Coin.deserialize(b)).toList(),
      height: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonSolvency;
}

class QuorumSolvency extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          types_server_bifrost_localhost.SendQuorumSolvencyResult
        > {
  final Solvency? solvency;

  final List<Attestation> attestations;

  const QuorumSolvency({this.solvency, this.attestations = const []});

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
  List<Object?> get protoValues => [solvency, attestations];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'solvency': config.encodeMessage(solvency),
      'attestations': attestations.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuorumSolvency.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuorumSolvency(
      solvency: json.valueTo<Solvency?, Object>(
        key: 'solvency',
        parse: (v) => Solvency.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Attestation, Object>(
                  value: e,
                  parse:
                      (v) => Attestation.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuorumSolvency.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuorumSolvency(
      solvency: decode.messageTo<Solvency?>(1, (b) => Solvency.deserialize(b)),
      attestations:
          decode
              .getListOfBytes(2)
              .map((b) => Attestation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonQuorumSolvency;
  @override
  types_server_bifrost_localhost.SendQuorumSolvencyResult onServiceResponse(
    List<int> bytes,
  ) {
    return types_server_bifrost_localhost.SendQuorumSolvencyResult.deserialize(
      bytes,
    );
  }

  @override
  types_server_bifrost_localhost.SendQuorumSolvencyResult onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return types_server_bifrost_localhost.SendQuorumSolvencyResult.fromJson(
      json,
    );
  }
}

class ErrataTx extends CosmosProtoMessage {
  final String? id;

  final String? chain;

  const ErrataTx({this.id, this.chain});

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
  List<Object?> get protoValues => [id, chain];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'id': id, 'chain': chain};
  }

  factory ErrataTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ErrataTx(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ErrataTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ErrataTx(
      id: decode.getString<String?>(1),
      chain: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonErrataTx;
}

class QuorumErrataTx extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          types_server_bifrost_localhost.SendQuorumErrataTxResult
        > {
  final ErrataTx? errataTx;

  final List<Attestation> attestations;

  const QuorumErrataTx({this.errataTx, this.attestations = const []});

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
  List<Object?> get protoValues => [errataTx, attestations];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'errata_tx': config.encodeMessage(errataTx),
      'attestations': attestations.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuorumErrataTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuorumErrataTx(
      errataTx: json.valueTo<ErrataTx?, Object>(
        key: 'errata_tx',
        parse: (v) => ErrataTx.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Attestation, Object>(
                  value: e,
                  parse:
                      (v) => Attestation.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuorumErrataTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuorumErrataTx(
      errataTx: decode.messageTo<ErrataTx?>(1, (b) => ErrataTx.deserialize(b)),
      attestations:
          decode
              .getListOfBytes(2)
              .map((b) => Attestation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonQuorumErrataTx;
  @override
  types_server_bifrost_localhost.SendQuorumErrataTxResult onServiceResponse(
    List<int> bytes,
  ) {
    return types_server_bifrost_localhost.SendQuorumErrataTxResult.deserialize(
      bytes,
    );
  }

  @override
  types_server_bifrost_localhost.SendQuorumErrataTxResult onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return types_server_bifrost_localhost.SendQuorumErrataTxResult.fromJson(
      json,
    );
  }
}

class PriceFeed extends CosmosProtoMessage {
  /// time of sending node in milliseconds, only used to check
  /// which price feed is more recent
  final BuBytes? version;

  final BigInt? time;

  final List<OraclePrice> rates;

  PriceFeed({List<int>? version, this.time, this.rates = const []})
    : version = version?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [version, time, rates];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'version': config.encodeBinary(version),
      'time': config.encodeBigint(time),
      'rates': rates.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory PriceFeed.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PriceFeed(
      version: config.decodeBinary<List<int>?>(
        json.valueAs('version', normalizeKeyLookup: config.normalizeKeys),
      ),
      time: json.valueAsBigInt<BigInt?>(
        'time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rates:
          (json.valueEnsureAsList<dynamic>(
                'rates',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<OraclePrice, Object>(
                  value: e,
                  parse:
                      (v) => OraclePrice.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory PriceFeed.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PriceFeed(
      version: decode.getBytes<List<int>?>(1),
      time: decode.getBigInt<BigInt?>(2),
      rates:
          decode
              .getListOfBytes(3)
              .map((b) => OraclePrice.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonPriceFeed;
}

class QuorumPriceFeed extends CosmosProtoMessage {
  final PriceFeed? priceFeed;

  final List<Attestation> attestations;

  const QuorumPriceFeed({this.priceFeed, this.attestations = const []});

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
  List<Object?> get protoValues => [priceFeed, attestations];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'price_feed': config.encodeMessage(priceFeed),
      'attestations': attestations.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuorumPriceFeed.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuorumPriceFeed(
      priceFeed: json.valueTo<PriceFeed?, Object>(
        key: 'price_feed',
        parse: (v) => PriceFeed.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Attestation, Object>(
                  value: e,
                  parse:
                      (v) => Attestation.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuorumPriceFeed.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuorumPriceFeed(
      priceFeed: decode.messageTo<PriceFeed?>(
        1,
        (b) => PriceFeed.deserialize(b),
      ),
      attestations:
          decode
              .getListOfBytes(2)
              .map((b) => Attestation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonQuorumPriceFeed;
}

class QuorumPriceFeedBatch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          types_server_bifrost_localhost.SendQuorumPriceFeedBatchResult
        > {
  final List<QuorumPriceFeed> quorumPriceFeeds;

  const QuorumPriceFeedBatch({this.quorumPriceFeeds = const []});

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
  List<Object?> get protoValues => [quorumPriceFeeds];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'quorum_price_feeds':
          quorumPriceFeeds.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuorumPriceFeedBatch.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuorumPriceFeedBatch(
      quorumPriceFeeds:
          (json.valueEnsureAsList<dynamic>(
                'quorum_price_feeds',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QuorumPriceFeed, Object>(
                  value: e,
                  parse:
                      (v) => QuorumPriceFeed.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuorumPriceFeedBatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuorumPriceFeedBatch(
      quorumPriceFeeds:
          decode
              .getListOfBytes(1)
              .map((b) => QuorumPriceFeed.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonQuorumPriceFeedBatch;
  @override
  types_server_bifrost_localhost.SendQuorumPriceFeedBatchResult
  onServiceResponse(List<int> bytes) {
    return types_server_bifrost_localhost
        .SendQuorumPriceFeedBatchResult.deserialize(bytes);
  }

  @override
  types_server_bifrost_localhost.SendQuorumPriceFeedBatchResult
  onServiceResponseJson(Map<String, dynamic> json) {
    return types_server_bifrost_localhost
        .SendQuorumPriceFeedBatchResult.fromJson(json);
  }
}

class OraclePrice extends CosmosProtoMessage {
  final BigInt? amount;

  final int? decimals;

  const OraclePrice({this.amount, this.decimals});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint32(2)],
    );
  }

  @override
  List<Object?> get protoValues => [amount, decimals];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'amount': config.encodeBigint(amount), 'decimals': decimals};
  }

  factory OraclePrice.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OraclePrice(
      amount: json.valueAsBigInt<BigInt?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      decimals: json.valueAsInt<int?>(
        'decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OraclePrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OraclePrice(
      amount: decode.getBigInt<BigInt?>(1),
      decimals: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.commonOraclePrice;
}
