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
  Map<String, dynamic> toJson() {
    return {
      'token_address': tokenAddress,
      'token_decimals': tokenDecimals,
      'token_price_id': tokenPriceId,
      'rate_limit_window': rateLimitWindow?.toString(),
      'rate_limit_usd': rateLimitUsd,
      'absolute_mint_limit': absoluteMintLimit,
      'transfers': transfers.map((e) => e.toJson()).toList(),
    };
  }

  factory RateLimit.fromJson(Map<String, dynamic> json) {
    return RateLimit(
      tokenAddress: json.valueAsString<String?>(
        'token_address',
        acceptCamelCase: true,
      ),
      tokenDecimals: json.valueAsInt<int?>(
        'token_decimals',
        acceptCamelCase: true,
      ),
      tokenPriceId: json.valueAsString<String?>(
        'token_price_id',
        acceptCamelCase: true,
      ),
      rateLimitWindow: json.valueAsBigInt<BigInt?>(
        'rate_limit_window',
        acceptCamelCase: true,
      ),
      rateLimitUsd: json.valueAsString<String?>(
        'rate_limit_usd',
        acceptCamelCase: true,
      ),
      absoluteMintLimit: json.valueAsString<String?>(
        'absolute_mint_limit',
        acceptCamelCase: true,
      ),
      transfers:
          (json.valueEnsureAsList<dynamic>('transfers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<BridgeTransfer, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => BridgeTransfer.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'block_number': blockNumber?.toString(),
      'is_deposit': isDeposit,
    };
  }

  factory BridgeTransfer.fromJson(Map<String, dynamic> json) {
    return BridgeTransfer(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        acceptCamelCase: true,
      ),
      isDeposit: json.valueAsBool<bool?>('is_deposit', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'inflows': inflows.map((e) => e.toJson()).toList(),
      'outflows': outflows.map((e) => e.toJson()).toList(),
    };
  }

  factory RateLimitTransfers.fromJson(Map<String, dynamic> json) {
    return RateLimitTransfers(
      token: json.valueAsString<String?>('token', acceptCamelCase: true),
      inflows:
          (json.valueEnsureAsList<dynamic>('inflows', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  BlockTransferRecord,
                  Map<String, dynamic>
                >(value: e, parse: (v) => BlockTransferRecord.fromJson(v)),
              )
              .toList(),
      outflows:
          (json.valueEnsureAsList<dynamic>('outflows', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  BlockTransferRecord,
                  Map<String, dynamic>
                >(value: e, parse: (v) => BlockTransferRecord.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'block_number': blockNumber?.toString(), 'amount': amount};
  }

  factory BlockTransferRecord.fromJson(Map<String, dynamic> json) {
    return BlockTransferRecord(
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'token': token, 'amount': amount};
  }

  factory MintAmount.fromJson(Map<String, dynamic> json) {
    return MintAmount(
      token: json.valueAsString<String?>('token', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
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
