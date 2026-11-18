import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class SwapAmountInRoute extends CosmosProtoMessage {
  final BigInt? poolId;

  final String? tokenOutDenom;

  const SwapAmountInRoute({this.poolId, this.tokenOutDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tokenOutDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'token_out_denom': tokenOutDenom,
    };
  }

  factory SwapAmountInRoute.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapAmountInRoute(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenOutDenom: json.valueAsString<String?>(
        'token_out_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapAmountInRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapAmountInRoute(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenOutDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1SwapAmountInRoute;
}

class SwapAmountOutRoute extends CosmosProtoMessage {
  final BigInt? poolId;

  final String? tokenInDenom;

  const SwapAmountOutRoute({this.poolId, this.tokenInDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tokenInDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pool_id': config.encodeBigint(poolId),
      'token_in_denom': tokenInDenom,
    };
  }

  factory SwapAmountOutRoute.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapAmountOutRoute(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenInDenom: json.valueAsString<String?>(
        'token_in_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapAmountOutRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapAmountOutRoute(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenInDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1SwapAmountOutRoute;
}

class SwapAmountInSplitRoute extends CosmosProtoMessage {
  final List<SwapAmountInRoute> pools;

  final String? tokenInAmount;

  const SwapAmountInSplitRoute({this.pools = const [], this.tokenInAmount});

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
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pools, tokenInAmount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pools': pools.map((e) => config.encodeMessage(e)).toList(),
      'token_in_amount': tokenInAmount,
    };
  }

  factory SwapAmountInSplitRoute.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapAmountInSplitRoute(
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SwapAmountInRoute, Object>(
                  value: e,
                  parse:
                      (v) => SwapAmountInRoute.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      tokenInAmount: json.valueAsString<String?>(
        'token_in_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapAmountInSplitRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapAmountInSplitRoute(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => SwapAmountInRoute.deserialize(b))
              .toList(),
      tokenInAmount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1SwapAmountInSplitRoute;
}

class SwapAmountOutSplitRoute extends CosmosProtoMessage {
  final List<SwapAmountOutRoute> pools;

  final String? tokenOutAmount;

  const SwapAmountOutSplitRoute({this.pools = const [], this.tokenOutAmount});

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
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pools, tokenOutAmount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pools': pools.map((e) => config.encodeMessage(e)).toList(),
      'token_out_amount': tokenOutAmount,
    };
  }

  factory SwapAmountOutSplitRoute.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapAmountOutSplitRoute(
      pools:
          (json.valueEnsureAsList<dynamic>(
                'pools',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SwapAmountOutRoute, Object>(
                  value: e,
                  parse:
                      (v) => SwapAmountOutRoute.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      tokenOutAmount: json.valueAsString<String?>(
        'token_out_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapAmountOutSplitRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapAmountOutSplitRoute(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => SwapAmountOutRoute.deserialize(b))
              .toList(),
      tokenOutAmount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1SwapAmountOutSplitRoute;
}
