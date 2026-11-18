import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class RateLimit extends CosmosProtoMessage {
  /// address of the ERC20 token
  final String? tokenAddress;

  /// decimals of the ERC20 token
  final int? tokenDecimals;

  /// a Pyth-specific ID used to obtain USD price of the ERC20 token
  final String? tokenPriceId;

  /// length of the sliding window in which inbound (outbound) traffic is
  /// measured
  final BigInt? rateLimitWindow;

  /// the notional USD limit imposed on all outgoing traffic (per token)
  final String? rateLimitUsd;

  /// [DEPRECATED] the absolute amount of tokens that can be minted on Injective
  final String? absoluteMintLimit;

  /// transfers that occurred within the sliding window
  final List<BridgeTransfer> transfers;

  const RateLimit({
    this.tokenAddress,
    this.tokenDecimals,
    this.tokenPriceId,
    this.rateLimitWindow,
    this.rateLimitUsd,
    this.absoluteMintLimit,
    this.transfers = const [],
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
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tokenAddress,
    tokenDecimals,
    tokenPriceId,
    rateLimitWindow,
    rateLimitUsd,
    absoluteMintLimit,
    transfers,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'token_address': tokenAddress,
      'token_decimals': tokenDecimals,
      'token_price_id': tokenPriceId,
      'rate_limit_window': config.encodeBigint(rateLimitWindow),
      'rate_limit_usd': rateLimitUsd,
      'absolute_mint_limit': absoluteMintLimit,
      'transfers': transfers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory RateLimit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RateLimit(
      tokenAddress: json.valueAsString<String?>(
        'token_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenDecimals: json.valueAsInt<int?>(
        'token_decimals',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenPriceId: json.valueAsString<String?>(
        'token_price_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rateLimitWindow: json.valueAsBigInt<BigInt?>(
        'rate_limit_window',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rateLimitUsd: json.valueAsString<String?>(
        'rate_limit_usd',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      absoluteMintLimit: json.valueAsString<String?>(
        'absolute_mint_limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      transfers:
          (json.valueEnsureAsList<dynamic>(
                'transfers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BridgeTransfer, Object>(
                  value: e,
                  parse:
                      (v) => BridgeTransfer.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory RateLimit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RateLimit(
      tokenAddress: decode.getString<String?>(1),
      tokenDecimals: decode.getInt<int?>(2),
      tokenPriceId: decode.getString<String?>(3),
      rateLimitWindow: decode.getBigInt<BigInt?>(4),
      rateLimitUsd: decode.getString<String?>(5),
      absoluteMintLimit: decode.getString<String?>(6),
      transfers:
          decode
              .getListOfBytes(7)
              .map((b) => BridgeTransfer.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1RateLimit;
}

class BridgeTransfer extends CosmosProtoMessage {
  /// quantity that was bridged (chain format)
  final String? amount;

  /// the Injective block at which this amount was bridged
  final BigInt? blockNumber;

  /// type of transfer (withdrawal/deposit)
  final bool? isDeposit;

  const BridgeTransfer({this.amount, this.blockNumber, this.isDeposit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount, blockNumber, isDeposit];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'amount': amount,
      'block_number': config.encodeBigint(blockNumber),
      'is_deposit': isDeposit,
    };
  }

  factory BridgeTransfer.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BridgeTransfer(
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      isDeposit: json.valueAsBool<bool?>(
        'is_deposit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BridgeTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BridgeTransfer(
      amount: decode.getString<String?>(1),
      blockNumber: decode.getBigInt<BigInt?>(2),
      isDeposit: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1BridgeTransfer;
}

class RateLimitTransfers extends CosmosProtoMessage {
  /// contract address of the erc20 on Ethereum
  final String? token;

  /// records of deposit transfers across blocks
  final List<BlockTransferRecord> inflows;

  /// records of withdrawal transfers across blocks
  final List<BlockTransferRecord> outflows;

  const RateLimitTransfers({
    this.token,
    this.inflows = const [],
    this.outflows = const [],
  });

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
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [token, inflows, outflows];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'token': token,
      'inflows': inflows.map((e) => config.encodeMessage(e)).toList(),
      'outflows': outflows.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory RateLimitTransfers.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RateLimitTransfers(
      token: json.valueAsString<String?>(
        'token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inflows:
          (json.valueEnsureAsList<dynamic>(
                'inflows',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BlockTransferRecord, Object>(
                  value: e,
                  parse:
                      (v) => BlockTransferRecord.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      outflows:
          (json.valueEnsureAsList<dynamic>(
                'outflows',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BlockTransferRecord, Object>(
                  value: e,
                  parse:
                      (v) => BlockTransferRecord.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory RateLimitTransfers.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RateLimitTransfers(
      token: decode.getString<String?>(1),
      inflows:
          decode
              .getListOfBytes(2)
              .map((b) => BlockTransferRecord.deserialize(b))
              .toList(),
      outflows:
          decode
              .getListOfBytes(3)
              .map((b) => BlockTransferRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1RateLimitTransfers;
}

class BlockTransferRecord extends CosmosProtoMessage {
  /// block number at which the transfers occurred
  final BigInt? blockNumber;

  /// sum amount of transfers that happened in that block
  final String? amount;

  const BlockTransferRecord({this.blockNumber, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [blockNumber, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'block_number': config.encodeBigint(blockNumber), 'amount': amount};
  }

  factory BlockTransferRecord.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BlockTransferRecord(
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BlockTransferRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockTransferRecord(
      blockNumber: decode.getBigInt<BigInt?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1BlockTransferRecord;
}

class MintAmount extends CosmosProtoMessage {
  /// address of the erc20 bridged in
  final String? token;

  /// amount currently minted on chain
  final String? amount;

  const MintAmount({this.token, this.amount});

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
  List<Object?> get protoValues => [token, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'token': token, 'amount': amount};
  }

  factory MintAmount.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MintAmount(
      token: json.valueAsString<String?>(
        'token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MintAmount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MintAmount(
      token: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MintAmount;
}
