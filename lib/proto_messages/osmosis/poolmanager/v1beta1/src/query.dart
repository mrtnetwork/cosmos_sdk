import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/genesis.dart"
    as osmosis_poolmanager_v1beta1_genesis;
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/swap_route.dart"
    as osmosis_poolmanager_v1beta1_swap_route;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/taker_fee_share.dart"
    as osmosis_poolmanager_v1beta1_taker_fee_share;

/// =============================== Params
class ParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ParamsResponse> {
  const ParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/Params",
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

  factory ParamsRequest.fromJson(Map<String, dynamic> json) {
    return ParamsRequest();
  }

  factory ParamsRequest.deserialize(List<int> bytes) {
    return ParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1ParamsRequest;
  @override
  ParamsResponse onQueryResponse(List<int> bytes) {
    return ParamsResponse.deserialize(bytes);
  }

  @override
  ParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ParamsResponse.fromJson(json);
  }
}

class ParamsResponse extends CosmosProtoMessage {
  final osmosis_poolmanager_v1beta1_genesis.Params? params;

  const ParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory ParamsResponse.fromJson(Map<String, dynamic> json) {
    return ParamsResponse(
      params: json.valueTo<
        osmosis_poolmanager_v1beta1_genesis.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => osmosis_poolmanager_v1beta1_genesis.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamsResponse(
      params: decode.messageTo<osmosis_poolmanager_v1beta1_genesis.Params?>(
        1,
        (b) => osmosis_poolmanager_v1beta1_genesis.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1ParamsResponse;
}

/// =============================== EstimateSwapExactAmountIn
class EstimateSwapExactAmountInRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateSwapExactAmountInResponse> {
  /// DEPRECATED
  final String? sender;

  final BigInt? poolId;

  final String? tokenIn;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountInRoute> routes;

  const EstimateSwapExactAmountInRequest({
    this.sender,
    this.poolId,
    this.tokenIn,
    this.routes = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/estimate/swap_exact_amount_in",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, tokenIn, routes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'token_in': tokenIn,
      'routes': routes.map((e) => e.toJson()).toList(),
    };
  }

  factory EstimateSwapExactAmountInRequest.fromJson(Map<String, dynamic> json) {
    return EstimateSwapExactAmountInRequest(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenIn: json.valueAsString<String?>('token_in', acceptCamelCase: true),
      routes:
          (json.valueEnsureAsList<dynamic>('routes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_swap_route.SwapAmountInRoute,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_swap_route
                          .SwapAmountInRoute.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory EstimateSwapExactAmountInRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSwapExactAmountInRequest(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      tokenIn: decode.getString<String?>(3),
      routes:
          decode
              .getListOfBytes(4)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountInRoute.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSwapExactAmountInRequest;
  @override
  EstimateSwapExactAmountInResponse onQueryResponse(List<int> bytes) {
    return EstimateSwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  EstimateSwapExactAmountInResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountInResponse.fromJson(json);
  }
}

class EstimateSwapExactAmountInWithPrimitiveTypesRequest
    extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateSwapExactAmountInResponse> {
  final BigInt? poolId;

  final String? tokenIn;

  final List<BigInt> routesPoolId;

  final List<String> routesTokenOutDenom;

  const EstimateSwapExactAmountInWithPrimitiveTypesRequest({
    this.poolId,
    this.tokenIn,
    this.routesPoolId = const [],
    this.routesTokenOutDenom = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/estimate/swap_exact_amount_in_with_primitive_types",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    tokenIn,
    routesPoolId,
    routesTokenOutDenom,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'token_in': tokenIn,
      'routes_pool_id': routesPoolId.map((e) => e.toString()).toList(),
      'routes_token_out_denom': routesTokenOutDenom.map((e) => e).toList(),
    };
  }

  factory EstimateSwapExactAmountInWithPrimitiveTypesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountInWithPrimitiveTypesRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenIn: json.valueAsString<String?>('token_in', acceptCamelCase: true),
      routesPoolId:
          (json.valueEnsureAsList<dynamic>(
            'routes_pool_id',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      routesTokenOutDenom:
          (json.valueEnsureAsList<dynamic>(
            'routes_token_out_denom',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory EstimateSwapExactAmountInWithPrimitiveTypesRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSwapExactAmountInWithPrimitiveTypesRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenIn: decode.getString<String?>(2),
      routesPoolId: decode.getListOrEmpty<BigInt>(3),
      routesTokenOutDenom: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSwapExactAmountInWithPrimitiveTypesRequest;
  @override
  EstimateSwapExactAmountInResponse onQueryResponse(List<int> bytes) {
    return EstimateSwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  EstimateSwapExactAmountInResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountInResponse.fromJson(json);
  }
}

class EstimateSinglePoolSwapExactAmountInRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateSwapExactAmountInResponse> {
  final BigInt? poolId;

  final String? tokenIn;

  final String? tokenOutDenom;

  const EstimateSinglePoolSwapExactAmountInRequest({
    this.poolId,
    this.tokenIn,
    this.tokenOutDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/estimate/single_pool_swap_exact_amount_in",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tokenIn, tokenOutDenom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'token_in': tokenIn,
      'token_out_denom': tokenOutDenom,
    };
  }

  factory EstimateSinglePoolSwapExactAmountInRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSinglePoolSwapExactAmountInRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenIn: json.valueAsString<String?>('token_in', acceptCamelCase: true),
      tokenOutDenom: json.valueAsString<String?>(
        'token_out_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory EstimateSinglePoolSwapExactAmountInRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSinglePoolSwapExactAmountInRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenIn: decode.getString<String?>(2),
      tokenOutDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSinglePoolSwapExactAmountInRequest;
  @override
  EstimateSwapExactAmountInResponse onQueryResponse(List<int> bytes) {
    return EstimateSwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  EstimateSwapExactAmountInResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountInResponse.fromJson(json);
  }
}

class EstimateSwapExactAmountInResponse extends CosmosProtoMessage {
  final String? tokenOutAmount;

  const EstimateSwapExactAmountInResponse({this.tokenOutAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [tokenOutAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'token_out_amount': tokenOutAmount};
  }

  factory EstimateSwapExactAmountInResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountInResponse(
      tokenOutAmount: json.valueAsString<String?>(
        'token_out_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory EstimateSwapExactAmountInResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSwapExactAmountInResponse(
      tokenOutAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSwapExactAmountInResponse;
}

/// =============================== EstimateSwapExactAmountOut
class EstimateSwapExactAmountOutRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateSwapExactAmountOutResponse> {
  /// DEPRECATED
  final String? sender;

  final BigInt? poolId;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutRoute> routes;

  final String? tokenOut;

  const EstimateSwapExactAmountOutRequest({
    this.sender,
    this.poolId,
    this.routes = const [],
    this.tokenOut,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/estimate/swap_exact_amount_out",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, routes, tokenOut];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'routes': routes.map((e) => e.toJson()).toList(),
      'token_out': tokenOut,
    };
  }

  factory EstimateSwapExactAmountOutRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountOutRequest(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      routes:
          (json.valueEnsureAsList<dynamic>('routes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutRoute,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_swap_route
                          .SwapAmountOutRoute.fromJson(v),
                ),
              )
              .toList(),
      tokenOut: json.valueAsString<String?>('token_out', acceptCamelCase: true),
    );
  }

  factory EstimateSwapExactAmountOutRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSwapExactAmountOutRequest(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      routes:
          decode
              .getListOfBytes(3)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountOutRoute.deserialize(b),
              )
              .toList(),
      tokenOut: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSwapExactAmountOutRequest;
  @override
  EstimateSwapExactAmountOutResponse onQueryResponse(List<int> bytes) {
    return EstimateSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  EstimateSwapExactAmountOutResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountOutResponse.fromJson(json);
  }
}

class EstimateSwapExactAmountOutWithPrimitiveTypesRequest
    extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateSwapExactAmountOutResponse> {
  final BigInt? poolId;

  final List<BigInt> routesPoolId;

  final List<String> routesTokenInDenom;

  final String? tokenOut;

  const EstimateSwapExactAmountOutWithPrimitiveTypesRequest({
    this.poolId,
    this.routesPoolId = const [],
    this.routesTokenInDenom = const [],
    this.tokenOut,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/estimate/swap_exact_amount_out_with_primitive_types",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    routesPoolId,
    routesTokenInDenom,
    tokenOut,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'routes_pool_id': routesPoolId.map((e) => e.toString()).toList(),
      'routes_token_in_denom': routesTokenInDenom.map((e) => e).toList(),
      'token_out': tokenOut,
    };
  }

  factory EstimateSwapExactAmountOutWithPrimitiveTypesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountOutWithPrimitiveTypesRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      routesPoolId:
          (json.valueEnsureAsList<dynamic>(
            'routes_pool_id',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      routesTokenInDenom:
          (json.valueEnsureAsList<dynamic>(
            'routes_token_in_denom',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      tokenOut: json.valueAsString<String?>('token_out', acceptCamelCase: true),
    );
  }

  factory EstimateSwapExactAmountOutWithPrimitiveTypesRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSwapExactAmountOutWithPrimitiveTypesRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      routesPoolId: decode.getListOrEmpty<BigInt>(2),
      routesTokenInDenom: decode.getListOrEmpty<String>(3),
      tokenOut: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSwapExactAmountOutWithPrimitiveTypesRequest;
  @override
  EstimateSwapExactAmountOutResponse onQueryResponse(List<int> bytes) {
    return EstimateSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  EstimateSwapExactAmountOutResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountOutResponse.fromJson(json);
  }
}

class EstimateSinglePoolSwapExactAmountOutRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateSwapExactAmountOutResponse> {
  final BigInt? poolId;

  final String? tokenInDenom;

  final String? tokenOut;

  const EstimateSinglePoolSwapExactAmountOutRequest({
    this.poolId,
    this.tokenInDenom,
    this.tokenOut,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/estimate_out/single_pool_swap_exact_amount_out",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, tokenInDenom, tokenOut];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'token_in_denom': tokenInDenom,
      'token_out': tokenOut,
    };
  }

  factory EstimateSinglePoolSwapExactAmountOutRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSinglePoolSwapExactAmountOutRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenInDenom: json.valueAsString<String?>(
        'token_in_denom',
        acceptCamelCase: true,
      ),
      tokenOut: json.valueAsString<String?>('token_out', acceptCamelCase: true),
    );
  }

  factory EstimateSinglePoolSwapExactAmountOutRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSinglePoolSwapExactAmountOutRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      tokenInDenom: decode.getString<String?>(2),
      tokenOut: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSinglePoolSwapExactAmountOutRequest;
  @override
  EstimateSwapExactAmountOutResponse onQueryResponse(List<int> bytes) {
    return EstimateSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  EstimateSwapExactAmountOutResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountOutResponse.fromJson(json);
  }
}

class EstimateSwapExactAmountOutResponse extends CosmosProtoMessage {
  final String? tokenInAmount;

  const EstimateSwapExactAmountOutResponse({this.tokenInAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [tokenInAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'token_in_amount': tokenInAmount};
  }

  factory EstimateSwapExactAmountOutResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateSwapExactAmountOutResponse(
      tokenInAmount: json.valueAsString<String?>(
        'token_in_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory EstimateSwapExactAmountOutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateSwapExactAmountOutResponse(
      tokenInAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateSwapExactAmountOutResponse;
}

/// =============================== NumPools
class NumPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<NumPoolsResponse> {
  const NumPoolsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/num_pools",
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

  factory NumPoolsRequest.fromJson(Map<String, dynamic> json) {
    return NumPoolsRequest();
  }

  factory NumPoolsRequest.deserialize(List<int> bytes) {
    return NumPoolsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1NumPoolsRequest;
  @override
  NumPoolsResponse onQueryResponse(List<int> bytes) {
    return NumPoolsResponse.deserialize(bytes);
  }

  @override
  NumPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return NumPoolsResponse.fromJson(json);
  }
}

class NumPoolsResponse extends CosmosProtoMessage {
  final BigInt? numPools;

  const NumPoolsResponse({this.numPools});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [numPools];

  @override
  Map<String, dynamic> toJson() {
    return {'num_pools': numPools?.toString()};
  }

  factory NumPoolsResponse.fromJson(Map<String, dynamic> json) {
    return NumPoolsResponse(
      numPools: json.valueAsBigInt<BigInt?>('num_pools', acceptCamelCase: true),
    );
  }

  factory NumPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return NumPoolsResponse(numPools: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1NumPoolsResponse;
}

/// =============================== Pool
class PoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<PoolResponse> {
  final BigInt? poolId;

  const PoolRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/pools/{pool_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory PoolRequest.fromJson(Map<String, dynamic> json) {
    return PoolRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory PoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1PoolRequest;
  @override
  PoolResponse onQueryResponse(List<int> bytes) {
    return PoolResponse.deserialize(bytes);
  }

  @override
  PoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return PoolResponse.fromJson(json);
  }
}

class PoolResponse extends CosmosProtoMessage {
  final google_protobuf_any.Any? pool;

  const PoolResponse({this.pool});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [pool];

  @override
  Map<String, dynamic> toJson() {
    return {'pool': pool?.toJson()};
  }

  factory PoolResponse.fromJson(Map<String, dynamic> json) {
    return PoolResponse(
      pool: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'pool',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory PoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolResponse(
      pool: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1PoolResponse;
}

/// =============================== AllPools
class AllPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AllPoolsResponse> {
  const AllPoolsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/all-pools",
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

  factory AllPoolsRequest.fromJson(Map<String, dynamic> json) {
    return AllPoolsRequest();
  }

  factory AllPoolsRequest.deserialize(List<int> bytes) {
    return AllPoolsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1AllPoolsRequest;
  @override
  AllPoolsResponse onQueryResponse(List<int> bytes) {
    return AllPoolsResponse.deserialize(bytes);
  }

  @override
  AllPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AllPoolsResponse.fromJson(json);
  }
}

class AllPoolsResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> pools;

  const AllPoolsResponse({this.pools = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pools];

  @override
  Map<String, dynamic> toJson() {
    return {'pools': pools.map((e) => e.toJson()).toList()};
  }

  factory AllPoolsResponse.fromJson(Map<String, dynamic> json) {
    return AllPoolsResponse(
      pools:
          (json.valueEnsureAsList<dynamic>('pools', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory AllPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllPoolsResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1AllPoolsResponse;
}

/// =======================================================
/// ListPoolsByDenomRequest
class ListPoolsByDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ListPoolsByDenomResponse> {
  final String? denom;

  const ListPoolsByDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/list-pools-by-denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory ListPoolsByDenomRequest.fromJson(Map<String, dynamic> json) {
    return ListPoolsByDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory ListPoolsByDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListPoolsByDenomRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1ListPoolsByDenomRequest;
  @override
  ListPoolsByDenomResponse onQueryResponse(List<int> bytes) {
    return ListPoolsByDenomResponse.deserialize(bytes);
  }

  @override
  ListPoolsByDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ListPoolsByDenomResponse.fromJson(json);
  }
}

class ListPoolsByDenomResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> pools;

  const ListPoolsByDenomResponse({this.pools = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pools];

  @override
  Map<String, dynamic> toJson() {
    return {'pools': pools.map((e) => e.toJson()).toList()};
  }

  factory ListPoolsByDenomResponse.fromJson(Map<String, dynamic> json) {
    return ListPoolsByDenomResponse(
      pools:
          (json.valueEnsureAsList<dynamic>('pools', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory ListPoolsByDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListPoolsByDenomResponse(
      pools:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1ListPoolsByDenomResponse;
}

/// ==========================================================
/// SpotPriceRequest defines the gRPC request structure for a SpotPrice
/// query.
class SpotPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SpotPriceResponse> {
  final BigInt? poolId;

  final String? baseAssetDenom;

  final String? quoteAssetDenom;

  const SpotPriceRequest({
    this.poolId,
    this.baseAssetDenom,
    this.quoteAssetDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/pools/{pool_id}/prices",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolId, baseAssetDenom, quoteAssetDenom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'base_asset_denom': baseAssetDenom,
      'quote_asset_denom': quoteAssetDenom,
    };
  }

  factory SpotPriceRequest.fromJson(Map<String, dynamic> json) {
    return SpotPriceRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      baseAssetDenom: json.valueAsString<String?>(
        'base_asset_denom',
        acceptCamelCase: true,
      ),
      quoteAssetDenom: json.valueAsString<String?>(
        'quote_asset_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory SpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotPriceRequest(
      poolId: decode.getBigInt<BigInt?>(1),
      baseAssetDenom: decode.getString<String?>(2),
      quoteAssetDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1SpotPriceRequest;
  @override
  SpotPriceResponse onQueryResponse(List<int> bytes) {
    return SpotPriceResponse.deserialize(bytes);
  }

  @override
  SpotPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return SpotPriceResponse.fromJson(json);
  }
}

/// SpotPriceResponse defines the gRPC response structure for a SpotPrice
/// query.
class SpotPriceResponse extends CosmosProtoMessage {
  /// String of the Dec. Ex) 10.203uatom
  final String? spotPrice;

  const SpotPriceResponse({this.spotPrice});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [spotPrice];

  @override
  Map<String, dynamic> toJson() {
    return {'spot_price': spotPrice};
  }

  factory SpotPriceResponse.fromJson(Map<String, dynamic> json) {
    return SpotPriceResponse(
      spotPrice: json.valueAsString<String?>(
        'spot_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory SpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotPriceResponse(spotPrice: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1SpotPriceResponse;
}

/// =============================== TotalPoolLiquidity
class TotalPoolLiquidityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TotalPoolLiquidityResponse> {
  final BigInt? poolId;

  const TotalPoolLiquidityRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/pools/{pool_id}/total_pool_liquidity",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory TotalPoolLiquidityRequest.fromJson(Map<String, dynamic> json) {
    return TotalPoolLiquidityRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory TotalPoolLiquidityRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalPoolLiquidityRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TotalPoolLiquidityRequest;
  @override
  TotalPoolLiquidityResponse onQueryResponse(List<int> bytes) {
    return TotalPoolLiquidityResponse.deserialize(bytes);
  }

  @override
  TotalPoolLiquidityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TotalPoolLiquidityResponse.fromJson(json);
  }
}

class TotalPoolLiquidityResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> liquidity;

  const TotalPoolLiquidityResponse({this.liquidity = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [liquidity];

  @override
  Map<String, dynamic> toJson() {
    return {'liquidity': liquidity.map((e) => e.toJson()).toList()};
  }

  factory TotalPoolLiquidityResponse.fromJson(Map<String, dynamic> json) {
    return TotalPoolLiquidityResponse(
      liquidity:
          (json.valueEnsureAsList<dynamic>('liquidity', acceptCamelCase: true))
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
    );
  }

  factory TotalPoolLiquidityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalPoolLiquidityResponse(
      liquidity:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TotalPoolLiquidityResponse;
}

/// =============================== TotalLiquidity
class TotalLiquidityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TotalLiquidityResponse> {
  const TotalLiquidityRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/total_liquidity",
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

  factory TotalLiquidityRequest.fromJson(Map<String, dynamic> json) {
    return TotalLiquidityRequest();
  }

  factory TotalLiquidityRequest.deserialize(List<int> bytes) {
    return TotalLiquidityRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1TotalLiquidityRequest;
  @override
  TotalLiquidityResponse onQueryResponse(List<int> bytes) {
    return TotalLiquidityResponse.deserialize(bytes);
  }

  @override
  TotalLiquidityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TotalLiquidityResponse.fromJson(json);
  }
}

class TotalLiquidityResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> liquidity;

  const TotalLiquidityResponse({this.liquidity = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [liquidity];

  @override
  Map<String, dynamic> toJson() {
    return {'liquidity': liquidity.map((e) => e.toJson()).toList()};
  }

  factory TotalLiquidityResponse.fromJson(Map<String, dynamic> json) {
    return TotalLiquidityResponse(
      liquidity:
          (json.valueEnsureAsList<dynamic>('liquidity', acceptCamelCase: true))
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
    );
  }

  factory TotalLiquidityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalLiquidityResponse(
      liquidity:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1TotalLiquidityResponse;
}

/// =============================== TotalVolumeForPool
class TotalVolumeForPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TotalVolumeForPoolResponse> {
  final BigInt? poolId;

  const TotalVolumeForPoolRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/pools/{pool_id}/total_volume",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory TotalVolumeForPoolRequest.fromJson(Map<String, dynamic> json) {
    return TotalVolumeForPoolRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory TotalVolumeForPoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalVolumeForPoolRequest(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TotalVolumeForPoolRequest;
  @override
  TotalVolumeForPoolResponse onQueryResponse(List<int> bytes) {
    return TotalVolumeForPoolResponse.deserialize(bytes);
  }

  @override
  TotalVolumeForPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TotalVolumeForPoolResponse.fromJson(json);
  }
}

class TotalVolumeForPoolResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> volume;

  const TotalVolumeForPoolResponse({this.volume = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [volume];

  @override
  Map<String, dynamic> toJson() {
    return {'volume': volume.map((e) => e.toJson()).toList()};
  }

  factory TotalVolumeForPoolResponse.fromJson(Map<String, dynamic> json) {
    return TotalVolumeForPoolResponse(
      volume:
          (json.valueEnsureAsList<dynamic>('volume', acceptCamelCase: true))
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
    );
  }

  factory TotalVolumeForPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TotalVolumeForPoolResponse(
      volume:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TotalVolumeForPoolResponse;
}

/// =============================== TradingPairTakerFee
class TradingPairTakerFeeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TradingPairTakerFeeResponse> {
  final String? denom0;

  final String? denom1;

  const TradingPairTakerFeeRequest({this.denom0, this.denom1});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/trading_pair_takerfee",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom0, denom1];

  @override
  Map<String, dynamic> toJson() {
    return {'denom_0': denom0, 'denom_1': denom1};
  }

  factory TradingPairTakerFeeRequest.fromJson(Map<String, dynamic> json) {
    return TradingPairTakerFeeRequest(
      denom0: json.valueAsString<String?>('denom_0', acceptCamelCase: true),
      denom1: json.valueAsString<String?>('denom_1', acceptCamelCase: true),
    );
  }

  factory TradingPairTakerFeeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingPairTakerFeeRequest(
      denom0: decode.getString<String?>(1),
      denom1: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TradingPairTakerFeeRequest;
  @override
  TradingPairTakerFeeResponse onQueryResponse(List<int> bytes) {
    return TradingPairTakerFeeResponse.deserialize(bytes);
  }

  @override
  TradingPairTakerFeeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TradingPairTakerFeeResponse.fromJson(json);
  }
}

class TradingPairTakerFeeResponse extends CosmosProtoMessage {
  final String? takerFee;

  const TradingPairTakerFeeResponse({this.takerFee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [takerFee];

  @override
  Map<String, dynamic> toJson() {
    return {'taker_fee': takerFee};
  }

  factory TradingPairTakerFeeResponse.fromJson(Map<String, dynamic> json) {
    return TradingPairTakerFeeResponse(
      takerFee: json.valueAsString<String?>('taker_fee', acceptCamelCase: true),
    );
  }

  factory TradingPairTakerFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradingPairTakerFeeResponse(takerFee: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TradingPairTakerFeeResponse;
}

/// =============================== EstimateTradeBasedOnPriceImpact
/// EstimateTradeBasedOnPriceImpactRequest represents a request to estimate a
/// trade for Balancer/StableSwap/Concentrated liquidity pool types based on the
/// given parameters.
class EstimateTradeBasedOnPriceImpactRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<EstimateTradeBasedOnPriceImpactResponse> {
  /// from_coin is the total amount of tokens that the user wants to sell.
  final cosmos_base_v1beta1_coin.Coin? fromCoin;

  /// to_coin_denom is the denom identifier of the token that the user wants to
  /// buy.
  final String? toCoinDenom;

  /// pool_id is the identifier of the liquidity pool that the trade will occur
  /// on.
  final BigInt? poolId;

  /// max_price_impact is the maximum percentage that the user is willing
  /// to affect the price of the liquidity pool.
  final String? maxPriceImpact;

  /// external_price is an optional external price that the user can enter.
  /// It adjusts the MaxPriceImpact as the SpotPrice of a pool can be changed at
  /// any time.
  final String? externalPrice;

  const EstimateTradeBasedOnPriceImpactRequest({
    this.fromCoin,
    this.toCoinDenom,
    this.poolId,
    this.maxPriceImpact,
    this.externalPrice,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/{pool_id}/estimate_trade",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fromCoin,
    toCoinDenom,
    poolId,
    maxPriceImpact,
    externalPrice,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_coin': fromCoin?.toJson(),
      'to_coin_denom': toCoinDenom,
      'pool_id': poolId?.toString(),
      'max_price_impact': maxPriceImpact,
      'external_price': externalPrice,
    };
  }

  factory EstimateTradeBasedOnPriceImpactRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateTradeBasedOnPriceImpactRequest(
      fromCoin: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'from_coin',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      toCoinDenom: json.valueAsString<String?>(
        'to_coin_denom',
        acceptCamelCase: true,
      ),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      maxPriceImpact: json.valueAsString<String?>(
        'max_price_impact',
        acceptCamelCase: true,
      ),
      externalPrice: json.valueAsString<String?>(
        'external_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory EstimateTradeBasedOnPriceImpactRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateTradeBasedOnPriceImpactRequest(
      fromCoin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      toCoinDenom: decode.getString<String?>(2),
      poolId: decode.getBigInt<BigInt?>(3),
      maxPriceImpact: decode.getString<String?>(4),
      externalPrice: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateTradeBasedOnPriceImpactRequest;
  @override
  EstimateTradeBasedOnPriceImpactResponse onQueryResponse(List<int> bytes) {
    return EstimateTradeBasedOnPriceImpactResponse.deserialize(bytes);
  }

  @override
  EstimateTradeBasedOnPriceImpactResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return EstimateTradeBasedOnPriceImpactResponse.fromJson(json);
  }
}

/// EstimateTradeBasedOnPriceImpactResponse represents the response data
/// for an estimated trade based on price impact. If a trade fails to be
/// estimated the response would be 0,0 for input_coin and output_coin and will
/// not error.
class EstimateTradeBasedOnPriceImpactResponse extends CosmosProtoMessage {
  /// input_coin is the actual input amount that would be tradeable
  /// under the specified price impact.
  final cosmos_base_v1beta1_coin.Coin? inputCoin;

  /// output_coin is the amount of tokens of the ToCoinDenom type
  /// that will be received for the actual InputCoin trade.
  final cosmos_base_v1beta1_coin.Coin? outputCoin;

  const EstimateTradeBasedOnPriceImpactResponse({
    this.inputCoin,
    this.outputCoin,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [inputCoin, outputCoin];

  @override
  Map<String, dynamic> toJson() {
    return {
      'input_coin': inputCoin?.toJson(),
      'output_coin': outputCoin?.toJson(),
    };
  }

  factory EstimateTradeBasedOnPriceImpactResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EstimateTradeBasedOnPriceImpactResponse(
      inputCoin: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'input_coin',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      outputCoin: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'output_coin',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory EstimateTradeBasedOnPriceImpactResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateTradeBasedOnPriceImpactResponse(
      inputCoin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      outputCoin: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1EstimateTradeBasedOnPriceImpactResponse;
}

/// =============================== AllTakerFeeShareAgreementsRequest
class AllTakerFeeShareAgreementsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AllTakerFeeShareAgreementsResponse> {
  const AllTakerFeeShareAgreementsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/all_taker_fee_share_agreements",
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

  factory AllTakerFeeShareAgreementsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AllTakerFeeShareAgreementsRequest();
  }

  factory AllTakerFeeShareAgreementsRequest.deserialize(List<int> bytes) {
    return AllTakerFeeShareAgreementsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AllTakerFeeShareAgreementsRequest;
  @override
  AllTakerFeeShareAgreementsResponse onQueryResponse(List<int> bytes) {
    return AllTakerFeeShareAgreementsResponse.deserialize(bytes);
  }

  @override
  AllTakerFeeShareAgreementsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AllTakerFeeShareAgreementsResponse.fromJson(json);
  }
}

class AllTakerFeeShareAgreementsResponse extends CosmosProtoMessage {
  final List<osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeShareAgreement>
  takerFeeShareAgreements;

  const AllTakerFeeShareAgreementsResponse({
    this.takerFeeShareAgreements = const [],
  });

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [takerFeeShareAgreements];

  @override
  Map<String, dynamic> toJson() {
    return {
      'taker_fee_share_agreements':
          takerFeeShareAgreements.map((e) => e.toJson()).toList(),
    };
  }

  factory AllTakerFeeShareAgreementsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AllTakerFeeShareAgreementsResponse(
      takerFeeShareAgreements:
          (json.valueEnsureAsList<dynamic>(
                'taker_fee_share_agreements',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeShareAgreement,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_taker_fee_share
                          .TakerFeeShareAgreement.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AllTakerFeeShareAgreementsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllTakerFeeShareAgreementsResponse(
      takerFeeShareAgreements:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_poolmanager_v1beta1_taker_fee_share
                    .TakerFeeShareAgreement.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AllTakerFeeShareAgreementsResponse;
}

/// =============================== TakerFeeShareAgreementFromDenomRequest
class TakerFeeShareAgreementFromDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TakerFeeShareAgreementFromDenomResponse> {
  final String? denom;

  const TakerFeeShareAgreementFromDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{denom}/taker_fee_share_agreement_from_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory TakerFeeShareAgreementFromDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return TakerFeeShareAgreementFromDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory TakerFeeShareAgreementFromDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeShareAgreementFromDenomRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TakerFeeShareAgreementFromDenomRequest;
  @override
  TakerFeeShareAgreementFromDenomResponse onQueryResponse(List<int> bytes) {
    return TakerFeeShareAgreementFromDenomResponse.deserialize(bytes);
  }

  @override
  TakerFeeShareAgreementFromDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return TakerFeeShareAgreementFromDenomResponse.fromJson(json);
  }
}

class TakerFeeShareAgreementFromDenomResponse extends CosmosProtoMessage {
  final osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeShareAgreement?
  takerFeeShareAgreement;

  const TakerFeeShareAgreementFromDenomResponse({this.takerFeeShareAgreement});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [takerFeeShareAgreement];

  @override
  Map<String, dynamic> toJson() {
    return {'taker_fee_share_agreement': takerFeeShareAgreement?.toJson()};
  }

  factory TakerFeeShareAgreementFromDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return TakerFeeShareAgreementFromDenomResponse(
      takerFeeShareAgreement: json.valueTo<
        osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeShareAgreement?,
        Map<String, dynamic>
      >(
        key: 'taker_fee_share_agreement',
        parse:
            (v) => osmosis_poolmanager_v1beta1_taker_fee_share
                .TakerFeeShareAgreement.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory TakerFeeShareAgreementFromDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeShareAgreementFromDenomResponse(
      takerFeeShareAgreement: decode.messageTo<
        osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeShareAgreement?
      >(
        1,
        (b) => osmosis_poolmanager_v1beta1_taker_fee_share
            .TakerFeeShareAgreement.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TakerFeeShareAgreementFromDenomResponse;
}

/// =============================== TakerFeeShareDenomsToAccruedValueRequest
class TakerFeeShareDenomsToAccruedValueRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TakerFeeShareDenomsToAccruedValueResponse> {
  final String? denom;

  final String? takerFeeDenom;

  const TakerFeeShareDenomsToAccruedValueRequest({
    this.denom,
    this.takerFeeDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{takerFeeDenom}/{denom}/taker_fee_share_denoms_to_accrued_value",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, takerFeeDenom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'takerFeeDenom': takerFeeDenom};
  }

  factory TakerFeeShareDenomsToAccruedValueRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return TakerFeeShareDenomsToAccruedValueRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      takerFeeDenom: json.valueAsString<String?>(
        'takerFeeDenom',
        acceptCamelCase: true,
      ),
    );
  }

  factory TakerFeeShareDenomsToAccruedValueRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeShareDenomsToAccruedValueRequest(
      denom: decode.getString<String?>(1),
      takerFeeDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TakerFeeShareDenomsToAccruedValueRequest;
  @override
  TakerFeeShareDenomsToAccruedValueResponse onQueryResponse(List<int> bytes) {
    return TakerFeeShareDenomsToAccruedValueResponse.deserialize(bytes);
  }

  @override
  TakerFeeShareDenomsToAccruedValueResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return TakerFeeShareDenomsToAccruedValueResponse.fromJson(json);
  }
}

class TakerFeeShareDenomsToAccruedValueResponse extends CosmosProtoMessage {
  final String? amount;

  const TakerFeeShareDenomsToAccruedValueResponse({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  factory TakerFeeShareDenomsToAccruedValueResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return TakerFeeShareDenomsToAccruedValueResponse(
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory TakerFeeShareDenomsToAccruedValueResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeShareDenomsToAccruedValueResponse(
      amount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TakerFeeShareDenomsToAccruedValueResponse;
}

/// =============================== AllTakerFeeShareAccumulatorsRequest
class AllTakerFeeShareAccumulatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AllTakerFeeShareAccumulatorsResponse> {
  const AllTakerFeeShareAccumulatorsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/all_taker_fee_share_accumulators",
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

  factory AllTakerFeeShareAccumulatorsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return AllTakerFeeShareAccumulatorsRequest();
  }

  factory AllTakerFeeShareAccumulatorsRequest.deserialize(List<int> bytes) {
    return AllTakerFeeShareAccumulatorsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AllTakerFeeShareAccumulatorsRequest;
  @override
  AllTakerFeeShareAccumulatorsResponse onQueryResponse(List<int> bytes) {
    return AllTakerFeeShareAccumulatorsResponse.deserialize(bytes);
  }

  @override
  AllTakerFeeShareAccumulatorsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AllTakerFeeShareAccumulatorsResponse.fromJson(json);
  }
}

class AllTakerFeeShareAccumulatorsResponse extends CosmosProtoMessage {
  final List<
    osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeSkimAccumulator
  >
  takerFeeSkimAccumulators;

  const AllTakerFeeShareAccumulatorsResponse({
    this.takerFeeSkimAccumulators = const [],
  });

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [takerFeeSkimAccumulators];

  @override
  Map<String, dynamic> toJson() {
    return {
      'taker_fee_skim_accumulators':
          takerFeeSkimAccumulators.map((e) => e.toJson()).toList(),
    };
  }

  factory AllTakerFeeShareAccumulatorsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AllTakerFeeShareAccumulatorsResponse(
      takerFeeSkimAccumulators:
          (json.valueEnsureAsList<dynamic>(
                'taker_fee_skim_accumulators',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_taker_fee_share.TakerFeeSkimAccumulator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_taker_fee_share
                          .TakerFeeSkimAccumulator.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AllTakerFeeShareAccumulatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllTakerFeeShareAccumulatorsResponse(
      takerFeeSkimAccumulators:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_poolmanager_v1beta1_taker_fee_share
                    .TakerFeeSkimAccumulator.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AllTakerFeeShareAccumulatorsResponse;
}

/// =============================== RegisteredAlloyedPoolFromDenomRequest
class RegisteredAlloyedPoolFromDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<RegisteredAlloyedPoolFromDenomResponse> {
  final String? denom;

  const RegisteredAlloyedPoolFromDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{denom}/registered_alloyed_pool_from_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory RegisteredAlloyedPoolFromDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisteredAlloyedPoolFromDenomRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory RegisteredAlloyedPoolFromDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RegisteredAlloyedPoolFromDenomRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromDenomRequest;
  @override
  RegisteredAlloyedPoolFromDenomResponse onQueryResponse(List<int> bytes) {
    return RegisteredAlloyedPoolFromDenomResponse.deserialize(bytes);
  }

  @override
  RegisteredAlloyedPoolFromDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return RegisteredAlloyedPoolFromDenomResponse.fromJson(json);
  }
}

class RegisteredAlloyedPoolFromDenomResponse extends CosmosProtoMessage {
  final osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState?
  contractState;

  const RegisteredAlloyedPoolFromDenomResponse({this.contractState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [contractState];

  @override
  Map<String, dynamic> toJson() {
    return {'contract_state': contractState?.toJson()};
  }

  factory RegisteredAlloyedPoolFromDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisteredAlloyedPoolFromDenomResponse(
      contractState: json.valueTo<
        osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState?,
        Map<String, dynamic>
      >(
        key: 'contract_state',
        parse:
            (v) => osmosis_poolmanager_v1beta1_taker_fee_share
                .AlloyContractTakerFeeShareState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory RegisteredAlloyedPoolFromDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RegisteredAlloyedPoolFromDenomResponse(
      contractState: decode.messageTo<
        osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState?
      >(
        1,
        (b) => osmosis_poolmanager_v1beta1_taker_fee_share
            .AlloyContractTakerFeeShareState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromDenomResponse;
}

/// =============================== RegisteredAlloyedPoolFromPoolIdRequest
class RegisteredAlloyedPoolFromPoolIdRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<RegisteredAlloyedPoolFromPoolIdResponse> {
  final BigInt? poolId;

  const RegisteredAlloyedPoolFromPoolIdRequest({this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/poolmanager/v1beta1/{pool_id}/registered_alloyed_pool_from_pool_id",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory RegisteredAlloyedPoolFromPoolIdRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisteredAlloyedPoolFromPoolIdRequest(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory RegisteredAlloyedPoolFromPoolIdRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RegisteredAlloyedPoolFromPoolIdRequest(
      poolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromPoolIdRequest;
  @override
  RegisteredAlloyedPoolFromPoolIdResponse onQueryResponse(List<int> bytes) {
    return RegisteredAlloyedPoolFromPoolIdResponse.deserialize(bytes);
  }

  @override
  RegisteredAlloyedPoolFromPoolIdResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return RegisteredAlloyedPoolFromPoolIdResponse.fromJson(json);
  }
}

class RegisteredAlloyedPoolFromPoolIdResponse extends CosmosProtoMessage {
  final osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState?
  contractState;

  const RegisteredAlloyedPoolFromPoolIdResponse({this.contractState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [contractState];

  @override
  Map<String, dynamic> toJson() {
    return {'contract_state': contractState?.toJson()};
  }

  factory RegisteredAlloyedPoolFromPoolIdResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisteredAlloyedPoolFromPoolIdResponse(
      contractState: json.valueTo<
        osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState?,
        Map<String, dynamic>
      >(
        key: 'contract_state',
        parse:
            (v) => osmosis_poolmanager_v1beta1_taker_fee_share
                .AlloyContractTakerFeeShareState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory RegisteredAlloyedPoolFromPoolIdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RegisteredAlloyedPoolFromPoolIdResponse(
      contractState: decode.messageTo<
        osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState?
      >(
        1,
        (b) => osmosis_poolmanager_v1beta1_taker_fee_share
            .AlloyContractTakerFeeShareState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromPoolIdResponse;
}

/// =============================== AllRegisteredAlloyedPoolsRequest
class AllRegisteredAlloyedPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AllRegisteredAlloyedPoolsResponse> {
  const AllRegisteredAlloyedPoolsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/poolmanager/v1beta1/all_registered_alloyed_pools",
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

  factory AllRegisteredAlloyedPoolsRequest.fromJson(Map<String, dynamic> json) {
    return AllRegisteredAlloyedPoolsRequest();
  }

  factory AllRegisteredAlloyedPoolsRequest.deserialize(List<int> bytes) {
    return AllRegisteredAlloyedPoolsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AllRegisteredAlloyedPoolsRequest;
  @override
  AllRegisteredAlloyedPoolsResponse onQueryResponse(List<int> bytes) {
    return AllRegisteredAlloyedPoolsResponse.deserialize(bytes);
  }

  @override
  AllRegisteredAlloyedPoolsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return AllRegisteredAlloyedPoolsResponse.fromJson(json);
  }
}

class AllRegisteredAlloyedPoolsResponse extends CosmosProtoMessage {
  final List<
    osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState
  >
  contractStates;

  const AllRegisteredAlloyedPoolsResponse({this.contractStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractStates];

  @override
  Map<String, dynamic> toJson() {
    return {'contract_states': contractStates.map((e) => e.toJson()).toList()};
  }

  factory AllRegisteredAlloyedPoolsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AllRegisteredAlloyedPoolsResponse(
      contractStates:
          (json.valueEnsureAsList<dynamic>(
                'contract_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_taker_fee_share.AlloyContractTakerFeeShareState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_taker_fee_share
                          .AlloyContractTakerFeeShareState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory AllRegisteredAlloyedPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AllRegisteredAlloyedPoolsResponse(
      contractStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_poolmanager_v1beta1_taker_fee_share
                    .AlloyContractTakerFeeShareState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AllRegisteredAlloyedPoolsResponse;
}
