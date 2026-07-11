import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

enum SwapType implements ProtoEnumVariant {
  market(0, 'market'),
  limit(1, 'limit');

  const SwapType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SwapType fromValue(int? value) {
    return SwapType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "SwapType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SwapType from(Object? value) {
    return SwapType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "SwapType", value: value),
    );
  }
}

enum SwapVersion implements ProtoEnumVariant {
  v1(0, 'v1'),
  v2(1, 'v2');

  const SwapVersion(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SwapVersion fromValue(int? value) {
    return SwapVersion.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "SwapVersion", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SwapVersion from(Object? value) {
    return SwapVersion.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "SwapVersion", value: value),
    );
  }
}

class SwapState extends CosmosProtoMessage {
  final BigInt? interval;

  final BigInt? quantity;

  final BigInt? ttl;

  final BigInt? count;

  final BigInt? lastHeight;

  final String? deposit;

  final String? withdrawn;

  final String? in_;

  final String? out;

  final List<BigInt> failedSwaps;

  final List<String> failedSwapReasons;

  const SwapState({
    this.interval,
    this.quantity,
    this.ttl,
    this.count,
    this.lastHeight,
    this.deposit,
    this.withdrawn,
    this.in_,
    this.out,
    this.failedSwaps = const [],
    this.failedSwapReasons = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.uint64,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    interval,
    quantity,
    ttl,
    count,
    lastHeight,
    deposit,
    withdrawn,
    in_,
    out,
    failedSwaps,
    failedSwapReasons,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'interval': interval?.toString(),
      'quantity': quantity?.toString(),
      'ttl': ttl?.toString(),
      'count': count?.toString(),
      'last_height': lastHeight?.toString(),
      'deposit': deposit,
      'withdrawn': withdrawn,
      'in': in_,
      'out': out,
      'failed_swaps': failedSwaps.map((e) => e.toString()).toList(),
      'failed_swap_reasons': failedSwapReasons.map((e) => e).toList(),
    };
  }

  factory SwapState.fromJson(Map<String, dynamic> json) {
    return SwapState(
      interval: json.valueAsBigInt<BigInt?>('interval', acceptCamelCase: true),
      quantity: json.valueAsBigInt<BigInt?>('quantity', acceptCamelCase: true),
      ttl: json.valueAsBigInt<BigInt?>('ttl', acceptCamelCase: true),
      count: json.valueAsBigInt<BigInt?>('count', acceptCamelCase: true),
      lastHeight: json.valueAsBigInt<BigInt?>(
        'last_height',
        acceptCamelCase: true,
      ),
      deposit: json.valueAsString<String?>('deposit', acceptCamelCase: true),
      withdrawn: json.valueAsString<String?>(
        'withdrawn',
        acceptCamelCase: true,
      ),
      in_: json.valueAsString<String?>('in', acceptCamelCase: true),
      out: json.valueAsString<String?>('out', acceptCamelCase: true),
      failedSwaps:
          (json.valueEnsureAsList<dynamic>(
            'failed_swaps',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      failedSwapReasons:
          (json.valueEnsureAsList<dynamic>(
            'failed_swap_reasons',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory SwapState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapState(
      interval: decode.getBigInt<BigInt?>(1),
      quantity: decode.getBigInt<BigInt?>(2),
      ttl: decode.getBigInt<BigInt?>(3),
      count: decode.getBigInt<BigInt?>(4),
      lastHeight: decode.getBigInt<BigInt?>(5),
      deposit: decode.getString<String?>(6),
      withdrawn: decode.getString<String?>(7),
      in_: decode.getString<String?>(8),
      out: decode.getString<String?>(9),
      failedSwaps: decode.getListOrEmpty<BigInt>(10),
      failedSwapReasons: decode.getListOrEmpty<String>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSwapState;
}

class MsgSwap extends CosmosProtoMessage {
  final common_common.Tx? tx;

  final common_common.Asset? targetAsset;

  final String? destination;

  final String? tradeTarget;

  final String? affiliateAddress;

  final String? affiliateBasisPoints;

  final List<int>? signer;

  final String? aggregator;

  final String? aggregatorTargetAddress;

  final String? aggregatorTargetLimit;

  final SwapType? swapType;

  final BigInt? streamQuantity;

  final BigInt? streamInterval;

  final BigInt? initialBlockHeight;

  final SwapState? state;

  final SwapVersion? version;

  final int? index;

  const MsgSwap({
    this.tx,
    this.targetAsset,
    this.destination,
    this.tradeTarget,
    this.affiliateAddress,
    this.affiliateBasisPoints,
    this.signer,
    this.aggregator,
    this.aggregatorTargetAddress,
    this.aggregatorTargetLimit,
    this.swapType,
    this.streamQuantity,
    this.streamInterval,
    this.initialBlockHeight,
    this.state,
    this.version,
    this.index,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.bytes(7, options: const []),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.enumType(11),
        ProtoFieldConfig.uint64(12),
        ProtoFieldConfig.uint64(13),
        ProtoFieldConfig.int64(14),
        ProtoFieldConfig.message(15),
        ProtoFieldConfig.enumType(16),
        ProtoFieldConfig.uint32(17),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tx,
    targetAsset,
    destination,
    tradeTarget,
    affiliateAddress,
    affiliateBasisPoints,
    signer,
    aggregator,
    aggregatorTargetAddress,
    aggregatorTargetLimit,
    swapType,
    streamQuantity,
    streamInterval,
    initialBlockHeight,
    state,
    version,
    index,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx': tx?.toJson(),
      'target_asset': targetAsset?.toJson(),
      'destination': destination,
      'trade_target': tradeTarget,
      'affiliate_address': affiliateAddress,
      'affiliate_basis_points': affiliateBasisPoints,
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'aggregator': aggregator,
      'aggregator_target_address': aggregatorTargetAddress,
      'aggregator_target_limit': aggregatorTargetLimit,
      'swap_type': swapType?.protoName,
      'stream_quantity': streamQuantity?.toString(),
      'stream_interval': streamInterval?.toString(),
      'initial_block_height': initialBlockHeight?.toString(),
      'state': state?.toJson(),
      'version': version?.protoName,
      'index': index,
    };
  }

  factory MsgSwap.fromJson(Map<String, dynamic> json) {
    return MsgSwap(
      tx: json.valueTo<common_common.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => common_common.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
      targetAsset: json.valueTo<common_common.Asset?, Map<String, dynamic>>(
        key: 'target_asset',
        parse: (v) => common_common.Asset.fromJson(v),
        acceptCamelCase: true,
      ),
      destination: json.valueAsString<String?>(
        'destination',
        acceptCamelCase: true,
      ),
      tradeTarget: json.valueAsString<String?>(
        'trade_target',
        acceptCamelCase: true,
      ),
      affiliateAddress: json.valueAsString<String?>(
        'affiliate_address',
        acceptCamelCase: true,
      ),
      affiliateBasisPoints: json.valueAsString<String?>(
        'affiliate_basis_points',
        acceptCamelCase: true,
      ),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      aggregator: json.valueAsString<String?>(
        'aggregator',
        acceptCamelCase: true,
      ),
      aggregatorTargetAddress: json.valueAsString<String?>(
        'aggregator_target_address',
        acceptCamelCase: true,
      ),
      aggregatorTargetLimit: json.valueAsString<String?>(
        'aggregator_target_limit',
        acceptCamelCase: true,
      ),
      swapType: json.valueTo<SwapType?, Object?>(
        key: 'swap_type',
        parse: (v) => SwapType.from(v),
      ),
      streamQuantity: json.valueAsBigInt<BigInt?>(
        'stream_quantity',
        acceptCamelCase: true,
      ),
      streamInterval: json.valueAsBigInt<BigInt?>(
        'stream_interval',
        acceptCamelCase: true,
      ),
      initialBlockHeight: json.valueAsBigInt<BigInt?>(
        'initial_block_height',
        acceptCamelCase: true,
      ),
      state: json.valueTo<SwapState?, Map<String, dynamic>>(
        key: 'state',
        parse: (v) => SwapState.fromJson(v),
        acceptCamelCase: true,
      ),
      version: json.valueTo<SwapVersion?, Object?>(
        key: 'version',
        parse: (v) => SwapVersion.from(v),
      ),
      index: json.valueAsInt<int?>('index', acceptCamelCase: true),
    );
  }

  factory MsgSwap.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSwap(
      tx: decode.messageTo<common_common.Tx?>(
        1,
        (b) => common_common.Tx.deserialize(b),
      ),
      targetAsset: decode.messageTo<common_common.Asset?>(
        2,
        (b) => common_common.Asset.deserialize(b),
      ),
      destination: decode.getString<String?>(3),
      tradeTarget: decode.getString<String?>(4),
      affiliateAddress: decode.getString<String?>(5),
      affiliateBasisPoints: decode.getString<String?>(6),
      signer: decode.getBytes<List<int>?>(7),
      aggregator: decode.getString<String?>(8),
      aggregatorTargetAddress: decode.getString<String?>(9),
      aggregatorTargetLimit: decode.getString<String?>(10),
      swapType: decode.getEnum<SwapType?>(11, SwapType.values),
      streamQuantity: decode.getBigInt<BigInt?>(12),
      streamInterval: decode.getBigInt<BigInt?>(13),
      initialBlockHeight: decode.getBigInt<BigInt?>(14),
      state: decode.messageTo<SwapState?>(15, (b) => SwapState.deserialize(b)),
      version: decode.getEnum<SwapVersion?>(16, SwapVersion.values),
      index: decode.getInt<int?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgSwap;
}
