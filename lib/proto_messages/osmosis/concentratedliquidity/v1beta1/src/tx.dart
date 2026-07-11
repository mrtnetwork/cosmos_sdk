import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// ===================== MsgCreatePosition
class MsgCreatePosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreatePositionResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? poolId;

  final String? sender;

  final BigInt? lowerTick;

  final BigInt? upperTick;

  /// tokens_provided is the amount of tokens provided for the position.
  /// It must at a minimum be of length 1 (for a single sided position)
  /// and at a maximum be of length 2 (for a position that straddles the current
  /// tick).
  final List<cosmos_base_v1beta1_coin.Coin> tokensProvided;

  final String? tokenMinAmount0;

  final String? tokenMinAmount1;

  const MsgCreatePosition({
    this.poolId,
    this.sender,
    this.lowerTick,
    this.upperTick,
    this.tokensProvided = const [],
    this.tokenMinAmount0,
    this.tokenMinAmount1,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/cl-create-position",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    sender,
    lowerTick,
    upperTick,
    tokensProvided,
    tokenMinAmount0,
    tokenMinAmount1,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'sender': sender,
      'lower_tick': lowerTick?.toString(),
      'upper_tick': upperTick?.toString(),
      'tokens_provided': tokensProvided.map((e) => e.toJson()).toList(),
      'token_min_amount0': tokenMinAmount0,
      'token_min_amount1': tokenMinAmount1,
    };
  }

  factory MsgCreatePosition.fromJson(Map<String, dynamic> json) {
    return MsgCreatePosition(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      lowerTick: json.valueAsBigInt<BigInt?>(
        'lower_tick',
        acceptCamelCase: true,
      ),
      upperTick: json.valueAsBigInt<BigInt?>(
        'upper_tick',
        acceptCamelCase: true,
      ),
      tokensProvided:
          (json.valueEnsureAsList<dynamic>(
                'tokens_provided',
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
      tokenMinAmount0: json.valueAsString<String?>(
        'token_min_amount0',
        acceptCamelCase: true,
      ),
      tokenMinAmount1: json.valueAsString<String?>(
        'token_min_amount1',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreatePosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreatePosition(
      poolId: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
      lowerTick: decode.getBigInt<BigInt?>(3),
      upperTick: decode.getBigInt<BigInt?>(4),
      tokensProvided:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      tokenMinAmount0: decode.getString<String?>(6),
      tokenMinAmount1: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgCreatePosition;
  @override
  MsgCreatePositionResponse onServiceResponse(List<int> bytes) {
    return MsgCreatePositionResponse.deserialize(bytes);
  }

  @override
  MsgCreatePositionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreatePositionResponse.fromJson(json);
  }
}

class MsgCreatePositionResponse extends CosmosProtoMessage {
  final BigInt? positionId;

  final String? amount0;

  final String? amount1;

  final String? liquidityCreated;

  /// the lower and upper tick are in the response because there are
  /// instances in which multiple ticks represent the same price, so
  /// we may move their provided tick to the canonical tick that represents
  /// the same price.
  final BigInt? lowerTick;

  final BigInt? upperTick;

  const MsgCreatePositionResponse({
    this.positionId,
    this.amount0,
    this.amount1,
    this.liquidityCreated,
    this.lowerTick,
    this.upperTick,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.int64(6, options: const []),
        ProtoFieldConfig.int64(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    positionId,
    amount0,
    amount1,
    liquidityCreated,
    lowerTick,
    upperTick,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_id': positionId?.toString(),
      'amount0': amount0,
      'amount1': amount1,
      'liquidity_created': liquidityCreated,
      'lower_tick': lowerTick?.toString(),
      'upper_tick': upperTick?.toString(),
    };
  }

  factory MsgCreatePositionResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreatePositionResponse(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      amount0: json.valueAsString<String?>('amount0', acceptCamelCase: true),
      amount1: json.valueAsString<String?>('amount1', acceptCamelCase: true),
      liquidityCreated: json.valueAsString<String?>(
        'liquidity_created',
        acceptCamelCase: true,
      ),
      lowerTick: json.valueAsBigInt<BigInt?>(
        'lower_tick',
        acceptCamelCase: true,
      ),
      upperTick: json.valueAsBigInt<BigInt?>(
        'upper_tick',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreatePositionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreatePositionResponse(
      positionId: decode.getBigInt<BigInt?>(1),
      amount0: decode.getString<String?>(2),
      amount1: decode.getString<String?>(3),
      liquidityCreated: decode.getString<String?>(5),
      lowerTick: decode.getBigInt<BigInt?>(6),
      upperTick: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgCreatePositionResponse;
}

/// ===================== MsgAddToPosition
class MsgAddToPosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddToPositionResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? positionId;

  final String? sender;

  /// amount0 represents the amount of token0 willing to put in.
  final String? amount0;

  /// amount1 represents the amount of token1 willing to put in.
  final String? amount1;

  /// token_min_amount0 represents the minimum amount of token0 desired from the
  /// new position being created. Note that this field indicates the min amount0
  /// corresponding to the liquidity that is being added, not the total
  /// liquidity of the position.
  final String? tokenMinAmount0;

  /// token_min_amount1 represents the minimum amount of token1 desired from the
  /// new position being created. Note that this field indicates the min amount1
  /// corresponding to the liquidity that is being added, not the total
  /// liquidity of the position.
  final String? tokenMinAmount1;

  const MsgAddToPosition({
    this.positionId,
    this.sender,
    this.amount0,
    this.amount1,
    this.tokenMinAmount0,
    this.tokenMinAmount1,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/cl-add-to-position",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    positionId,
    sender,
    amount0,
    amount1,
    tokenMinAmount0,
    tokenMinAmount1,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_id': positionId?.toString(),
      'sender': sender,
      'amount0': amount0,
      'amount1': amount1,
      'token_min_amount0': tokenMinAmount0,
      'token_min_amount1': tokenMinAmount1,
    };
  }

  factory MsgAddToPosition.fromJson(Map<String, dynamic> json) {
    return MsgAddToPosition(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      amount0: json.valueAsString<String?>('amount0', acceptCamelCase: true),
      amount1: json.valueAsString<String?>('amount1', acceptCamelCase: true),
      tokenMinAmount0: json.valueAsString<String?>(
        'token_min_amount0',
        acceptCamelCase: true,
      ),
      tokenMinAmount1: json.valueAsString<String?>(
        'token_min_amount1',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgAddToPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddToPosition(
      positionId: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
      amount0: decode.getString<String?>(3),
      amount1: decode.getString<String?>(4),
      tokenMinAmount0: decode.getString<String?>(5),
      tokenMinAmount1: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgAddToPosition;
  @override
  MsgAddToPositionResponse onServiceResponse(List<int> bytes) {
    return MsgAddToPositionResponse.deserialize(bytes);
  }

  @override
  MsgAddToPositionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddToPositionResponse.fromJson(json);
  }
}

class MsgAddToPositionResponse extends CosmosProtoMessage {
  final BigInt? positionId;

  final String? amount0;

  final String? amount1;

  const MsgAddToPositionResponse({this.positionId, this.amount0, this.amount1});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [positionId, amount0, amount1];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_id': positionId?.toString(),
      'amount0': amount0,
      'amount1': amount1,
    };
  }

  factory MsgAddToPositionResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddToPositionResponse(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      amount0: json.valueAsString<String?>('amount0', acceptCamelCase: true),
      amount1: json.valueAsString<String?>('amount1', acceptCamelCase: true),
    );
  }

  factory MsgAddToPositionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddToPositionResponse(
      positionId: decode.getBigInt<BigInt?>(1),
      amount0: decode.getString<String?>(2),
      amount1: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgAddToPositionResponse;
}

/// ===================== MsgWithdrawPosition
class MsgWithdrawPosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawPositionResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? positionId;

  final String? sender;

  final String? liquidityAmount;

  const MsgWithdrawPosition({
    this.positionId,
    this.sender,
    this.liquidityAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/cl-withdraw-position",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [positionId, sender, liquidityAmount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_id': positionId?.toString(),
      'sender': sender,
      'liquidity_amount': liquidityAmount,
    };
  }

  factory MsgWithdrawPosition.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawPosition(
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      liquidityAmount: json.valueAsString<String?>(
        'liquidity_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWithdrawPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawPosition(
      positionId: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
      liquidityAmount: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgWithdrawPosition;
  @override
  MsgWithdrawPositionResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawPositionResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawPositionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgWithdrawPositionResponse.fromJson(json);
  }
}

class MsgWithdrawPositionResponse extends CosmosProtoMessage {
  final String? amount0;

  final String? amount1;

  const MsgWithdrawPositionResponse({this.amount0, this.amount1});

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
  List<Object?> get protoValues => [amount0, amount1];

  @override
  Map<String, dynamic> toJson() {
    return {'amount0': amount0, 'amount1': amount1};
  }

  factory MsgWithdrawPositionResponse.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawPositionResponse(
      amount0: json.valueAsString<String?>('amount0', acceptCamelCase: true),
      amount1: json.valueAsString<String?>('amount1', acceptCamelCase: true),
    );
  }

  factory MsgWithdrawPositionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawPositionResponse(
      amount0: decode.getString<String?>(1),
      amount1: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgWithdrawPositionResponse;
}

/// ===================== MsgCollectSpreadRewards
class MsgCollectSpreadRewards extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCollectSpreadRewardsResponse>,
        ICosmosProtoAminoMessage {
  final List<BigInt> positionIds;

  final String? sender;

  const MsgCollectSpreadRewards({this.positionIds = const [], this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/cl-col-sp-rewards",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [positionIds, sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_ids': positionIds.map((e) => e.toString()).toList(),
      'sender': sender,
    };
  }

  factory MsgCollectSpreadRewards.fromJson(Map<String, dynamic> json) {
    return MsgCollectSpreadRewards(
      positionIds:
          (json.valueEnsureAsList<dynamic>(
            'position_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgCollectSpreadRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCollectSpreadRewards(
      positionIds: decode.getListOrEmpty<BigInt>(1),
      sender: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgCollectSpreadRewards;
  @override
  MsgCollectSpreadRewardsResponse onServiceResponse(List<int> bytes) {
    return MsgCollectSpreadRewardsResponse.deserialize(bytes);
  }

  @override
  MsgCollectSpreadRewardsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCollectSpreadRewardsResponse.fromJson(json);
  }
}

class MsgCollectSpreadRewardsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> collectedSpreadRewards;

  const MsgCollectSpreadRewardsResponse({
    this.collectedSpreadRewards = const [],
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
  List<Object?> get protoValues => [collectedSpreadRewards];

  @override
  Map<String, dynamic> toJson() {
    return {
      'collected_spread_rewards':
          collectedSpreadRewards.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgCollectSpreadRewardsResponse.fromJson(Map<String, dynamic> json) {
    return MsgCollectSpreadRewardsResponse(
      collectedSpreadRewards:
          (json.valueEnsureAsList<dynamic>(
                'collected_spread_rewards',
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

  factory MsgCollectSpreadRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCollectSpreadRewardsResponse(
      collectedSpreadRewards:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgCollectSpreadRewardsResponse;
}

/// ===================== MsgCollectIncentives
class MsgCollectIncentives extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCollectIncentivesResponse>,
        ICosmosProtoAminoMessage {
  final List<BigInt> positionIds;

  final String? sender;

  const MsgCollectIncentives({this.positionIds = const [], this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/cl-collect-incentives",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [positionIds, sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_ids': positionIds.map((e) => e.toString()).toList(),
      'sender': sender,
    };
  }

  factory MsgCollectIncentives.fromJson(Map<String, dynamic> json) {
    return MsgCollectIncentives(
      positionIds:
          (json.valueEnsureAsList<dynamic>(
            'position_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgCollectIncentives.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCollectIncentives(
      positionIds: decode.getListOrEmpty<BigInt>(1),
      sender: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgCollectIncentives;
  @override
  MsgCollectIncentivesResponse onServiceResponse(List<int> bytes) {
    return MsgCollectIncentivesResponse.deserialize(bytes);
  }

  @override
  MsgCollectIncentivesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCollectIncentivesResponse.fromJson(json);
  }
}

class MsgCollectIncentivesResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> collectedIncentives;

  final List<cosmos_base_v1beta1_coin.Coin> forfeitedIncentives;

  const MsgCollectIncentivesResponse({
    this.collectedIncentives = const [],
    this.forfeitedIncentives = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [collectedIncentives, forfeitedIncentives];

  @override
  Map<String, dynamic> toJson() {
    return {
      'collected_incentives':
          collectedIncentives.map((e) => e.toJson()).toList(),
      'forfeited_incentives':
          forfeitedIncentives.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgCollectIncentivesResponse.fromJson(Map<String, dynamic> json) {
    return MsgCollectIncentivesResponse(
      collectedIncentives:
          (json.valueEnsureAsList<dynamic>(
                'collected_incentives',
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
      forfeitedIncentives:
          (json.valueEnsureAsList<dynamic>(
                'forfeited_incentives',
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

  factory MsgCollectIncentivesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCollectIncentivesResponse(
      collectedIncentives:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      forfeitedIncentives:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgCollectIncentivesResponse;
}

/// ===================== MsgTransferPositions
class MsgTransferPositions extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgTransferPositionsResponse>,
        ICosmosProtoAminoMessage {
  final List<BigInt> positionIds;

  final String? sender;

  final String? newOwner;

  const MsgTransferPositions({
    this.positionIds = const [],
    this.sender,
    this.newOwner,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/cl-transfer-positions",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [positionIds, sender, newOwner];

  @override
  Map<String, dynamic> toJson() {
    return {
      'position_ids': positionIds.map((e) => e.toString()).toList(),
      'sender': sender,
      'new_owner': newOwner,
    };
  }

  factory MsgTransferPositions.fromJson(Map<String, dynamic> json) {
    return MsgTransferPositions(
      positionIds:
          (json.valueEnsureAsList<dynamic>(
            'position_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      newOwner: json.valueAsString<String?>('new_owner', acceptCamelCase: true),
    );
  }

  factory MsgTransferPositions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTransferPositions(
      positionIds: decode.getListOrEmpty<BigInt>(1),
      sender: decode.getString<String?>(2),
      newOwner: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgTransferPositions;
  @override
  MsgTransferPositionsResponse onServiceResponse(List<int> bytes) {
    return MsgTransferPositionsResponse.deserialize(bytes);
  }

  @override
  MsgTransferPositionsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgTransferPositionsResponse.fromJson(json);
  }
}

class MsgTransferPositionsResponse extends CosmosProtoMessage {
  const MsgTransferPositionsResponse();

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

  factory MsgTransferPositionsResponse.fromJson(Map<String, dynamic> json) {
    return MsgTransferPositionsResponse();
  }

  factory MsgTransferPositionsResponse.deserialize(List<int> bytes) {
    return MsgTransferPositionsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1MsgTransferPositionsResponse;
}
