import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/swap_route.dart"
    as osmosis_poolmanager_v1beta1_swap_route;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// ===================== MsgSwapExactAmountIn
class MsgSwapExactAmountIn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSwapExactAmountInResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountInRoute> routes;

  final cosmos_base_v1beta1_coin.Coin? tokenIn;

  final String? tokenOutMinAmount;

  const MsgSwapExactAmountIn({
    this.sender,
    this.routes = const [],
    this.tokenIn,
    this.tokenOutMinAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/swap-exact-amount-in",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, routes, tokenIn, tokenOutMinAmount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'routes': routes.map((e) => e.toJson()).toList(),
      'token_in': tokenIn?.toJson(),
      'token_out_min_amount': tokenOutMinAmount,
    };
  }

  factory MsgSwapExactAmountIn.fromJson(Map<String, dynamic> json) {
    return MsgSwapExactAmountIn(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
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
      tokenIn: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'token_in',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      tokenOutMinAmount: json.valueAsString<String?>(
        'token_out_min_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSwapExactAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSwapExactAmountIn(
      sender: decode.getString<String?>(1),
      routes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountInRoute.deserialize(b),
              )
              .toList(),
      tokenIn: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      tokenOutMinAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1MsgSwapExactAmountIn;
  @override
  MsgSwapExactAmountInResponse onServiceResponse(List<int> bytes) {
    return MsgSwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  MsgSwapExactAmountInResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSwapExactAmountInResponse.fromJson(json);
  }
}

class MsgSwapExactAmountInResponse extends CosmosProtoMessage {
  final String? tokenOutAmount;

  const MsgSwapExactAmountInResponse({this.tokenOutAmount});

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

  factory MsgSwapExactAmountInResponse.fromJson(Map<String, dynamic> json) {
    return MsgSwapExactAmountInResponse(
      tokenOutAmount: json.valueAsString<String?>(
        'token_out_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSwapExactAmountInResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSwapExactAmountInResponse(
      tokenOutAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSwapExactAmountInResponse;
}

/// ===================== MsgSplitRouteSwapExactAmountIn
class MsgSplitRouteSwapExactAmountIn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSplitRouteSwapExactAmountInResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountInSplitRoute>
  routes;

  final String? tokenInDenom;

  final String? tokenOutMinAmount;

  const MsgSplitRouteSwapExactAmountIn({
    this.sender,
    this.routes = const [],
    this.tokenInDenom,
    this.tokenOutMinAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/split-amount-in",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    routes,
    tokenInDenom,
    tokenOutMinAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'routes': routes.map((e) => e.toJson()).toList(),
      'token_in_denom': tokenInDenom,
      'token_out_min_amount': tokenOutMinAmount,
    };
  }

  factory MsgSplitRouteSwapExactAmountIn.fromJson(Map<String, dynamic> json) {
    return MsgSplitRouteSwapExactAmountIn(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      routes:
          (json.valueEnsureAsList<dynamic>('routes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_swap_route.SwapAmountInSplitRoute,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_swap_route
                          .SwapAmountInSplitRoute.fromJson(v),
                ),
              )
              .toList(),
      tokenInDenom: json.valueAsString<String?>(
        'token_in_denom',
        acceptCamelCase: true,
      ),
      tokenOutMinAmount: json.valueAsString<String?>(
        'token_out_min_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSplitRouteSwapExactAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSplitRouteSwapExactAmountIn(
      sender: decode.getString<String?>(1),
      routes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountInSplitRoute.deserialize(b),
              )
              .toList(),
      tokenInDenom: decode.getString<String?>(3),
      tokenOutMinAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountIn;
  @override
  MsgSplitRouteSwapExactAmountInResponse onServiceResponse(List<int> bytes) {
    return MsgSplitRouteSwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  MsgSplitRouteSwapExactAmountInResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSplitRouteSwapExactAmountInResponse.fromJson(json);
  }
}

class MsgSplitRouteSwapExactAmountInResponse extends CosmosProtoMessage {
  final String? tokenOutAmount;

  const MsgSplitRouteSwapExactAmountInResponse({this.tokenOutAmount});

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

  factory MsgSplitRouteSwapExactAmountInResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSplitRouteSwapExactAmountInResponse(
      tokenOutAmount: json.valueAsString<String?>(
        'token_out_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSplitRouteSwapExactAmountInResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSplitRouteSwapExactAmountInResponse(
      tokenOutAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountInResponse;
}

/// ===================== MsgSwapExactAmountOut
class MsgSwapExactAmountOut extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSwapExactAmountOutResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutRoute> routes;

  final String? tokenInMaxAmount;

  final cosmos_base_v1beta1_coin.Coin? tokenOut;

  const MsgSwapExactAmountOut({
    this.sender,
    this.routes = const [],
    this.tokenInMaxAmount,
    this.tokenOut,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/swap-exact-amount-out",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, routes, tokenInMaxAmount, tokenOut];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'routes': routes.map((e) => e.toJson()).toList(),
      'token_in_max_amount': tokenInMaxAmount,
      'token_out': tokenOut?.toJson(),
    };
  }

  factory MsgSwapExactAmountOut.fromJson(Map<String, dynamic> json) {
    return MsgSwapExactAmountOut(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
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
      tokenInMaxAmount: json.valueAsString<String?>(
        'token_in_max_amount',
        acceptCamelCase: true,
      ),
      tokenOut: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'token_out',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSwapExactAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSwapExactAmountOut(
      sender: decode.getString<String?>(1),
      routes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountOutRoute.deserialize(b),
              )
              .toList(),
      tokenInMaxAmount: decode.getString<String?>(3),
      tokenOut: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1MsgSwapExactAmountOut;
  @override
  MsgSwapExactAmountOutResponse onServiceResponse(List<int> bytes) {
    return MsgSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  MsgSwapExactAmountOutResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSwapExactAmountOutResponse.fromJson(json);
  }
}

class MsgSwapExactAmountOutResponse extends CosmosProtoMessage {
  final String? tokenInAmount;

  const MsgSwapExactAmountOutResponse({this.tokenInAmount});

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

  factory MsgSwapExactAmountOutResponse.fromJson(Map<String, dynamic> json) {
    return MsgSwapExactAmountOutResponse(
      tokenInAmount: json.valueAsString<String?>(
        'token_in_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSwapExactAmountOutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSwapExactAmountOutResponse(
      tokenInAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSwapExactAmountOutResponse;
}

/// ===================== MsgSplitRouteSwapExactAmountOut
class MsgSplitRouteSwapExactAmountOut extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSplitRouteSwapExactAmountOutResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutSplitRoute>
  routes;

  final String? tokenOutDenom;

  final String? tokenInMaxAmount;

  const MsgSplitRouteSwapExactAmountOut({
    this.sender,
    this.routes = const [],
    this.tokenOutDenom,
    this.tokenInMaxAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/split-amount-out",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    routes,
    tokenOutDenom,
    tokenInMaxAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'routes': routes.map((e) => e.toJson()).toList(),
      'token_out_denom': tokenOutDenom,
      'token_in_max_amount': tokenInMaxAmount,
    };
  }

  factory MsgSplitRouteSwapExactAmountOut.fromJson(Map<String, dynamic> json) {
    return MsgSplitRouteSwapExactAmountOut(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      routes:
          (json.valueEnsureAsList<dynamic>('routes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_poolmanager_v1beta1_swap_route.SwapAmountOutSplitRoute,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_poolmanager_v1beta1_swap_route
                          .SwapAmountOutSplitRoute.fromJson(v),
                ),
              )
              .toList(),
      tokenOutDenom: json.valueAsString<String?>(
        'token_out_denom',
        acceptCamelCase: true,
      ),
      tokenInMaxAmount: json.valueAsString<String?>(
        'token_in_max_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSplitRouteSwapExactAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSplitRouteSwapExactAmountOut(
      sender: decode.getString<String?>(1),
      routes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_poolmanager_v1beta1_swap_route
                    .SwapAmountOutSplitRoute.deserialize(b),
              )
              .toList(),
      tokenOutDenom: decode.getString<String?>(3),
      tokenInMaxAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountOut;
  @override
  MsgSplitRouteSwapExactAmountOutResponse onServiceResponse(List<int> bytes) {
    return MsgSplitRouteSwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  MsgSplitRouteSwapExactAmountOutResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSplitRouteSwapExactAmountOutResponse.fromJson(json);
  }
}

class MsgSplitRouteSwapExactAmountOutResponse extends CosmosProtoMessage {
  final String? tokenInAmount;

  const MsgSplitRouteSwapExactAmountOutResponse({this.tokenInAmount});

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

  factory MsgSplitRouteSwapExactAmountOutResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSplitRouteSwapExactAmountOutResponse(
      tokenInAmount: json.valueAsString<String?>(
        'token_in_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSplitRouteSwapExactAmountOutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSplitRouteSwapExactAmountOutResponse(
      tokenInAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountOutResponse;
}

/// ===================== MsgSetDenomPairTakerFee
class MsgSetDenomPairTakerFee extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetDenomPairTakerFeeResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<DenomPairTakerFee> denomPairTakerFee;

  const MsgSetDenomPairTakerFee({
    this.sender,
    this.denomPairTakerFee = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/set-denom-pair-taker-fee",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denomPairTakerFee];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'denom_pair_taker_fee': denomPairTakerFee.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgSetDenomPairTakerFee.fromJson(Map<String, dynamic> json) {
    return MsgSetDenomPairTakerFee(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denomPairTakerFee:
          (json.valueEnsureAsList<dynamic>(
                'denom_pair_taker_fee',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<DenomPairTakerFee, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => DenomPairTakerFee.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory MsgSetDenomPairTakerFee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetDenomPairTakerFee(
      sender: decode.getString<String?>(1),
      denomPairTakerFee:
          decode
              .getListOfBytes(2)
              .map((b) => DenomPairTakerFee.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSetDenomPairTakerFee;
  @override
  MsgSetDenomPairTakerFeeResponse onServiceResponse(List<int> bytes) {
    return MsgSetDenomPairTakerFeeResponse.deserialize(bytes);
  }

  @override
  MsgSetDenomPairTakerFeeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetDenomPairTakerFeeResponse.fromJson(json);
  }
}

class MsgSetDenomPairTakerFeeResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgSetDenomPairTakerFeeResponse({this.success});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success};
  }

  factory MsgSetDenomPairTakerFeeResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetDenomPairTakerFeeResponse(
      success: json.valueAsBool<bool?>('success', acceptCamelCase: true),
    );
  }

  factory MsgSetDenomPairTakerFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetDenomPairTakerFeeResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSetDenomPairTakerFeeResponse;
}

/// ===================== MsgSetTakerFeeShareAgreementForDenom
class MsgSetTakerFeeShareAgreementForDenom extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgSetTakerFeeShareAgreementForDenomResponse
        >,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// denom is the denom that the taker fee share agreement is being set for.
  /// Ex. If this is set to "nBTC", then any trade route that includes "nBTC"
  /// will have the skim_percent skimmed from the taker fees and sent to the
  /// skim_address.
  final String? denom;

  /// skim_percent is the percentage of taker fees that will be skimmed for the
  /// bridge provider, in the event that the bridge provider's denom is included
  /// in the swap route.
  final String? skimPercent;

  /// skim_address is the address belonging to the respective bridge provider
  /// that the skimmed taker fees will be sent to at the end of each epoch.
  final String? skimAddress;

  const MsgSetTakerFeeShareAgreementForDenom({
    this.sender,
    this.denom,
    this.skimPercent,
    this.skimAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/set-taker-fee-share-agreement-for-denom",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denom, skimPercent, skimAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'denom': denom,
      'skim_percent': skimPercent,
      'skim_address': skimAddress,
    };
  }

  factory MsgSetTakerFeeShareAgreementForDenom.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetTakerFeeShareAgreementForDenom(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      skimPercent: json.valueAsString<String?>(
        'skim_percent',
        acceptCamelCase: true,
      ),
      skimAddress: json.valueAsString<String?>(
        'skim_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetTakerFeeShareAgreementForDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetTakerFeeShareAgreementForDenom(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      skimPercent: decode.getString<String?>(3),
      skimAddress: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSetTakerFeeShareAgreementForDenom;
  @override
  MsgSetTakerFeeShareAgreementForDenomResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgSetTakerFeeShareAgreementForDenomResponse.deserialize(bytes);
  }

  @override
  MsgSetTakerFeeShareAgreementForDenomResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetTakerFeeShareAgreementForDenomResponse.fromJson(json);
  }
}

class MsgSetTakerFeeShareAgreementForDenomResponse extends CosmosProtoMessage {
  const MsgSetTakerFeeShareAgreementForDenomResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSetTakerFeeShareAgreementForDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetTakerFeeShareAgreementForDenomResponse();
  }

  factory MsgSetTakerFeeShareAgreementForDenomResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgSetTakerFeeShareAgreementForDenomResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSetTakerFeeShareAgreementForDenomResponse;
}

/// ===================== MsgSetRegisteredAlloyedPool
class MsgSetRegisteredAlloyedPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetRegisteredAlloyedPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// pool_id is the id of the pool that is being registered as an alloyed pool.
  /// Only alloyed pools that intend to be used in taker fee revenue sharing
  /// should be registered.
  final BigInt? poolId;

  const MsgSetRegisteredAlloyedPool({this.sender, this.poolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/poolmanager/set-registered-alloyed-pool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'pool_id': poolId?.toString()};
  }

  factory MsgSetRegisteredAlloyedPool.fromJson(Map<String, dynamic> json) {
    return MsgSetRegisteredAlloyedPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgSetRegisteredAlloyedPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetRegisteredAlloyedPool(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSetRegisteredAlloyedPool;
  @override
  MsgSetRegisteredAlloyedPoolResponse onServiceResponse(List<int> bytes) {
    return MsgSetRegisteredAlloyedPoolResponse.deserialize(bytes);
  }

  @override
  MsgSetRegisteredAlloyedPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetRegisteredAlloyedPoolResponse.fromJson(json);
  }
}

class MsgSetRegisteredAlloyedPoolResponse extends CosmosProtoMessage {
  const MsgSetRegisteredAlloyedPoolResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSetRegisteredAlloyedPoolResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetRegisteredAlloyedPoolResponse();
  }

  factory MsgSetRegisteredAlloyedPoolResponse.deserialize(List<int> bytes) {
    return MsgSetRegisteredAlloyedPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1MsgSetRegisteredAlloyedPoolResponse;
}

class DenomPairTakerFee extends CosmosProtoMessage {
  /// DEPRECATED: Now that we are using uni-directional trading pairs, we are
  /// using tokenInDenom and tokenOutDenom instead of denom0 and denom1 to
  /// prevent confusion.
  final String? denom0;

  final String? denom1;

  final String? takerFee;

  final String? tokenInDenom;

  final String? tokenOutDenom;

  const DenomPairTakerFee({
    this.denom0,
    this.denom1,
    this.takerFee,
    this.tokenInDenom,
    this.tokenOutDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    denom0,
    denom1,
    takerFee,
    tokenInDenom,
    tokenOutDenom,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom0': denom0,
      'denom1': denom1,
      'taker_fee': takerFee,
      'tokenInDenom': tokenInDenom,
      'tokenOutDenom': tokenOutDenom,
    };
  }

  factory DenomPairTakerFee.fromJson(Map<String, dynamic> json) {
    return DenomPairTakerFee(
      denom0: json.valueAsString<String?>('denom0', acceptCamelCase: true),
      denom1: json.valueAsString<String?>('denom1', acceptCamelCase: true),
      takerFee: json.valueAsString<String?>('taker_fee', acceptCamelCase: true),
      tokenInDenom: json.valueAsString<String?>(
        'tokenInDenom',
        acceptCamelCase: true,
      ),
      tokenOutDenom: json.valueAsString<String?>(
        'tokenOutDenom',
        acceptCamelCase: true,
      ),
    );
  }

  factory DenomPairTakerFee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomPairTakerFee(
      denom0: decode.getString<String?>(1),
      denom1: decode.getString<String?>(2),
      takerFee: decode.getString<String?>(3),
      tokenInDenom: decode.getString<String?>(4),
      tokenOutDenom: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1DenomPairTakerFee;
}
