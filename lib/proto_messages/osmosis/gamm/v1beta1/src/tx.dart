import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/poolmanager/v1beta1/src/swap_route.dart"
    as osmosis_poolmanager_v1beta1_swap_route;

/// ===================== MsgJoinPool
/// This is really MsgJoinPoolNoSwap
class MsgJoinPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgJoinPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final String? shareOutAmount;

  final List<cosmos_base_v1beta1_coin.Coin> tokenInMaxs;

  const MsgJoinPool({
    this.sender,
    this.poolId,
    this.shareOutAmount,
    this.tokenInMaxs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "osmosis/gamm/join-pool"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
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
  List<Object?> get protoValues => [
    sender,
    poolId,
    shareOutAmount,
    tokenInMaxs,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'share_out_amount': shareOutAmount,
      'token_in_maxs': tokenInMaxs.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgJoinPool.fromJson(Map<String, dynamic> json) {
    return MsgJoinPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      shareOutAmount: json.valueAsString<String?>(
        'share_out_amount',
        acceptCamelCase: true,
      ),
      tokenInMaxs:
          (json.valueEnsureAsList<dynamic>(
                'token_in_maxs',
                acceptCamelCase: true,
              ))
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

  factory MsgJoinPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgJoinPool(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      shareOutAmount: decode.getString<String?>(3),
      tokenInMaxs:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgJoinPool;
  @override
  MsgJoinPoolResponse onServiceResponse(List<int> bytes) {
    return MsgJoinPoolResponse.deserialize(bytes);
  }

  @override
  MsgJoinPoolResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgJoinPoolResponse.fromJson(json);
  }
}

class MsgJoinPoolResponse extends CosmosProtoMessage {
  final String? shareOutAmount;

  final List<cosmos_base_v1beta1_coin.Coin> tokenIn;

  const MsgJoinPoolResponse({this.shareOutAmount, this.tokenIn = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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
  List<Object?> get protoValues => [shareOutAmount, tokenIn];

  @override
  Map<String, dynamic> toJson() {
    return {
      'share_out_amount': shareOutAmount,
      'token_in': tokenIn.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgJoinPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgJoinPoolResponse(
      shareOutAmount: json.valueAsString<String?>(
        'share_out_amount',
        acceptCamelCase: true,
      ),
      tokenIn:
          (json.valueEnsureAsList<dynamic>('token_in', acceptCamelCase: true))
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

  factory MsgJoinPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgJoinPoolResponse(
      shareOutAmount: decode.getString<String?>(1),
      tokenIn:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgJoinPoolResponse;
}

/// ===================== MsgExitPool
class MsgExitPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExitPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final String? shareInAmount;

  final List<cosmos_base_v1beta1_coin.Coin> tokenOutMins;

  const MsgExitPool({
    this.sender,
    this.poolId,
    this.shareInAmount,
    this.tokenOutMins = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "osmosis/gamm/exit-pool"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
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
  List<Object?> get protoValues => [
    sender,
    poolId,
    shareInAmount,
    tokenOutMins,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'share_in_amount': shareInAmount,
      'token_out_mins': tokenOutMins.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgExitPool.fromJson(Map<String, dynamic> json) {
    return MsgExitPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      shareInAmount: json.valueAsString<String?>(
        'share_in_amount',
        acceptCamelCase: true,
      ),
      tokenOutMins:
          (json.valueEnsureAsList<dynamic>(
                'token_out_mins',
                acceptCamelCase: true,
              ))
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

  factory MsgExitPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExitPool(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      shareInAmount: decode.getString<String?>(3),
      tokenOutMins:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgExitPool;
  @override
  MsgExitPoolResponse onServiceResponse(List<int> bytes) {
    return MsgExitPoolResponse.deserialize(bytes);
  }

  @override
  MsgExitPoolResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExitPoolResponse.fromJson(json);
  }
}

class MsgExitPoolResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> tokenOut;

  const MsgExitPoolResponse({this.tokenOut = const []});

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
  List<Object?> get protoValues => [tokenOut];

  @override
  Map<String, dynamic> toJson() {
    return {'token_out': tokenOut.map((e) => e.toJson()).toList()};
  }

  factory MsgExitPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgExitPoolResponse(
      tokenOut:
          (json.valueEnsureAsList<dynamic>('token_out', acceptCamelCase: true))
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

  factory MsgExitPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExitPoolResponse(
      tokenOut:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgExitPoolResponse;
}

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
          value: "osmosis/gamm/swap-exact-amount-in",
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
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgSwapExactAmountIn;
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
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgSwapExactAmountInResponse;
}

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
          value: "osmosis/gamm/swap-exact-amount-out",
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
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgSwapExactAmountOut;
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
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgSwapExactAmountOutResponse;
}

/// ===================== MsgJoinSwapExternAmountIn
class MsgJoinSwapExternAmountIn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgJoinSwapExternAmountInResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final cosmos_base_v1beta1_coin.Coin? tokenIn;

  final String? shareOutMinAmount;

  const MsgJoinSwapExternAmountIn({
    this.sender,
    this.poolId,
    this.tokenIn,
    this.shareOutMinAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/gamm/join-swap-extern-amount-in",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, tokenIn, shareOutMinAmount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'token_in': tokenIn?.toJson(),
      'share_out_min_amount': shareOutMinAmount,
    };
  }

  factory MsgJoinSwapExternAmountIn.fromJson(Map<String, dynamic> json) {
    return MsgJoinSwapExternAmountIn(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenIn: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'token_in',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      shareOutMinAmount: json.valueAsString<String?>(
        'share_out_min_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgJoinSwapExternAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgJoinSwapExternAmountIn(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      tokenIn: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      shareOutMinAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgJoinSwapExternAmountIn;
  @override
  MsgJoinSwapExternAmountInResponse onServiceResponse(List<int> bytes) {
    return MsgJoinSwapExternAmountInResponse.deserialize(bytes);
  }

  @override
  MsgJoinSwapExternAmountInResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgJoinSwapExternAmountInResponse.fromJson(json);
  }
}

/// repeated cosmos.base.v1beta1.Coin tokensIn = 5 [
/// (gogoproto.moretags) = "yaml:\"tokens_in\"",
/// (gogoproto.nullable) = false
/// ];
class MsgJoinSwapExternAmountInResponse extends CosmosProtoMessage {
  final String? shareOutAmount;

  const MsgJoinSwapExternAmountInResponse({this.shareOutAmount});

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
  List<Object?> get protoValues => [shareOutAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'share_out_amount': shareOutAmount};
  }

  factory MsgJoinSwapExternAmountInResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgJoinSwapExternAmountInResponse(
      shareOutAmount: json.valueAsString<String?>(
        'share_out_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgJoinSwapExternAmountInResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgJoinSwapExternAmountInResponse(
      shareOutAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1MsgJoinSwapExternAmountInResponse;
}

/// ===================== MsgJoinSwapShareAmountOut
class MsgJoinSwapShareAmountOut extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgJoinSwapShareAmountOutResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final String? tokenInDenom;

  final String? shareOutAmount;

  final String? tokenInMaxAmount;

  const MsgJoinSwapShareAmountOut({
    this.sender,
    this.poolId,
    this.tokenInDenom,
    this.shareOutAmount,
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
          value: "osmosis/gamm/join-swap-share-amount-out",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    poolId,
    tokenInDenom,
    shareOutAmount,
    tokenInMaxAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'token_in_denom': tokenInDenom,
      'share_out_amount': shareOutAmount,
      'token_in_max_amount': tokenInMaxAmount,
    };
  }

  factory MsgJoinSwapShareAmountOut.fromJson(Map<String, dynamic> json) {
    return MsgJoinSwapShareAmountOut(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenInDenom: json.valueAsString<String?>(
        'token_in_denom',
        acceptCamelCase: true,
      ),
      shareOutAmount: json.valueAsString<String?>(
        'share_out_amount',
        acceptCamelCase: true,
      ),
      tokenInMaxAmount: json.valueAsString<String?>(
        'token_in_max_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgJoinSwapShareAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgJoinSwapShareAmountOut(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      tokenInDenom: decode.getString<String?>(3),
      shareOutAmount: decode.getString<String?>(4),
      tokenInMaxAmount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgJoinSwapShareAmountOut;
  @override
  MsgJoinSwapShareAmountOutResponse onServiceResponse(List<int> bytes) {
    return MsgJoinSwapShareAmountOutResponse.deserialize(bytes);
  }

  @override
  MsgJoinSwapShareAmountOutResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgJoinSwapShareAmountOutResponse.fromJson(json);
  }
}

class MsgJoinSwapShareAmountOutResponse extends CosmosProtoMessage {
  final String? tokenInAmount;

  const MsgJoinSwapShareAmountOutResponse({this.tokenInAmount});

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

  factory MsgJoinSwapShareAmountOutResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgJoinSwapShareAmountOutResponse(
      tokenInAmount: json.valueAsString<String?>(
        'token_in_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgJoinSwapShareAmountOutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgJoinSwapShareAmountOutResponse(
      tokenInAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1MsgJoinSwapShareAmountOutResponse;
}

/// ===================== MsgExitSwapShareAmountIn
class MsgExitSwapShareAmountIn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExitSwapShareAmountInResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final String? tokenOutDenom;

  final String? shareInAmount;

  final String? tokenOutMinAmount;

  const MsgExitSwapShareAmountIn({
    this.sender,
    this.poolId,
    this.tokenOutDenom,
    this.shareInAmount,
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
          value: "osmosis/gamm/exit-swap-share-amount-in",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    poolId,
    tokenOutDenom,
    shareInAmount,
    tokenOutMinAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'token_out_denom': tokenOutDenom,
      'share_in_amount': shareInAmount,
      'token_out_min_amount': tokenOutMinAmount,
    };
  }

  factory MsgExitSwapShareAmountIn.fromJson(Map<String, dynamic> json) {
    return MsgExitSwapShareAmountIn(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenOutDenom: json.valueAsString<String?>(
        'token_out_denom',
        acceptCamelCase: true,
      ),
      shareInAmount: json.valueAsString<String?>(
        'share_in_amount',
        acceptCamelCase: true,
      ),
      tokenOutMinAmount: json.valueAsString<String?>(
        'token_out_min_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExitSwapShareAmountIn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExitSwapShareAmountIn(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      tokenOutDenom: decode.getString<String?>(3),
      shareInAmount: decode.getString<String?>(4),
      tokenOutMinAmount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgExitSwapShareAmountIn;
  @override
  MsgExitSwapShareAmountInResponse onServiceResponse(List<int> bytes) {
    return MsgExitSwapShareAmountInResponse.deserialize(bytes);
  }

  @override
  MsgExitSwapShareAmountInResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgExitSwapShareAmountInResponse.fromJson(json);
  }
}

class MsgExitSwapShareAmountInResponse extends CosmosProtoMessage {
  final String? tokenOutAmount;

  const MsgExitSwapShareAmountInResponse({this.tokenOutAmount});

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

  factory MsgExitSwapShareAmountInResponse.fromJson(Map<String, dynamic> json) {
    return MsgExitSwapShareAmountInResponse(
      tokenOutAmount: json.valueAsString<String?>(
        'token_out_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExitSwapShareAmountInResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExitSwapShareAmountInResponse(
      tokenOutAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1MsgExitSwapShareAmountInResponse;
}

/// ===================== MsgExitSwapExternAmountOut
class MsgExitSwapExternAmountOut extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExitSwapExternAmountOutResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final cosmos_base_v1beta1_coin.Coin? tokenOut;

  final String? shareInMaxAmount;

  const MsgExitSwapExternAmountOut({
    this.sender,
    this.poolId,
    this.tokenOut,
    this.shareInMaxAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/gamm/exit-swap-extern-amount-out",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, tokenOut, shareInMaxAmount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'token_out': tokenOut?.toJson(),
      'share_in_max_amount': shareInMaxAmount,
    };
  }

  factory MsgExitSwapExternAmountOut.fromJson(Map<String, dynamic> json) {
    return MsgExitSwapExternAmountOut(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      tokenOut: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'token_out',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      shareInMaxAmount: json.valueAsString<String?>(
        'share_in_max_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExitSwapExternAmountOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExitSwapExternAmountOut(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      tokenOut: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      shareInMaxAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MsgExitSwapExternAmountOut;
  @override
  MsgExitSwapExternAmountOutResponse onServiceResponse(List<int> bytes) {
    return MsgExitSwapExternAmountOutResponse.deserialize(bytes);
  }

  @override
  MsgExitSwapExternAmountOutResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgExitSwapExternAmountOutResponse.fromJson(json);
  }
}

class MsgExitSwapExternAmountOutResponse extends CosmosProtoMessage {
  final String? shareInAmount;

  const MsgExitSwapExternAmountOutResponse({this.shareInAmount});

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
  List<Object?> get protoValues => [shareInAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'share_in_amount': shareInAmount};
  }

  factory MsgExitSwapExternAmountOutResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgExitSwapExternAmountOutResponse(
      shareInAmount: json.valueAsString<String?>(
        'share_in_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExitSwapExternAmountOutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExitSwapExternAmountOutResponse(
      shareInAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1MsgExitSwapExternAmountOutResponse;
}
