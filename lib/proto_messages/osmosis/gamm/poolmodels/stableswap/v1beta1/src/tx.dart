import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/gamm/poolmodels/stableswap/v1beta1/src/stableswap_pool.dart"
    as osmosis_gamm_poolmodels_stableswap_v1beta1_stableswap_pool;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// ===================== MsgCreatePool
class MsgCreateStableswapPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateStableswapPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final osmosis_gamm_poolmodels_stableswap_v1beta1_stableswap_pool.PoolParams?
  poolParams;

  final List<cosmos_base_v1beta1_coin.Coin> initialPoolLiquidity;

  final List<BigInt> scalingFactors;

  final String? futurePoolGovernor;

  final String? scalingFactorController;

  const MsgCreateStableswapPool({
    this.sender,
    this.poolParams,
    this.initialPoolLiquidity = const [],
    this.scalingFactors = const [],
    this.futurePoolGovernor,
    this.scalingFactorController,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/gamm/create-stableswap-pool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    poolParams,
    initialPoolLiquidity,
    scalingFactors,
    futurePoolGovernor,
    scalingFactorController,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_params': poolParams?.toJson(),
      'initial_pool_liquidity':
          initialPoolLiquidity.map((e) => e.toJson()).toList(),
      'scaling_factors': scalingFactors.map((e) => e.toString()).toList(),
      'future_pool_governor': futurePoolGovernor,
      'scaling_factor_controller': scalingFactorController,
    };
  }

  factory MsgCreateStableswapPool.fromJson(Map<String, dynamic> json) {
    return MsgCreateStableswapPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolParams: json.valueTo<
        osmosis_gamm_poolmodels_stableswap_v1beta1_stableswap_pool.PoolParams?,
        Map<String, dynamic>
      >(
        key: 'pool_params',
        parse:
            (v) => osmosis_gamm_poolmodels_stableswap_v1beta1_stableswap_pool
                .PoolParams.fromJson(v),
        acceptCamelCase: true,
      ),
      initialPoolLiquidity:
          (json.valueEnsureAsList<dynamic>(
                'initial_pool_liquidity',
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
      scalingFactors:
          (json.valueEnsureAsList<dynamic>(
            'scaling_factors',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      futurePoolGovernor: json.valueAsString<String?>(
        'future_pool_governor',
        acceptCamelCase: true,
      ),
      scalingFactorController: json.valueAsString<String?>(
        'scaling_factor_controller',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateStableswapPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateStableswapPool(
      sender: decode.getString<String?>(1),
      poolParams: decode.messageTo<
        osmosis_gamm_poolmodels_stableswap_v1beta1_stableswap_pool.PoolParams?
      >(
        2,
        (b) => osmosis_gamm_poolmodels_stableswap_v1beta1_stableswap_pool
            .PoolParams.deserialize(b),
      ),
      initialPoolLiquidity:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      scalingFactors: decode.getListOrEmpty<BigInt>(4),
      futurePoolGovernor: decode.getString<String?>(5),
      scalingFactorController: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsStableswapV1beta1MsgCreateStableswapPool;
  @override
  MsgCreateStableswapPoolResponse onServiceResponse(List<int> bytes) {
    return MsgCreateStableswapPoolResponse.deserialize(bytes);
  }

  @override
  MsgCreateStableswapPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateStableswapPoolResponse.fromJson(json);
  }
}

/// Returns a poolID with custom poolName.
class MsgCreateStableswapPoolResponse extends CosmosProtoMessage {
  final BigInt? poolId;

  const MsgCreateStableswapPoolResponse({this.poolId});

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
  List<Object?> get protoValues => [poolId];

  @override
  Map<String, dynamic> toJson() {
    return {'pool_id': poolId?.toString()};
  }

  factory MsgCreateStableswapPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateStableswapPoolResponse(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateStableswapPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateStableswapPoolResponse(
      poolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsStableswapV1beta1MsgCreateStableswapPoolResponse;
}

/// Sender must be the pool's scaling_factor_governor in order for the tx to
/// succeed. Adjusts stableswap scaling factors.
class MsgStableSwapAdjustScalingFactors extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgStableSwapAdjustScalingFactorsResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? poolId;

  final List<BigInt> scalingFactors;

  const MsgStableSwapAdjustScalingFactors({
    this.sender,
    this.poolId,
    this.scalingFactors = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/gamm/stableswap-adjust-scaling-factors",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, poolId, scalingFactors];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_id': poolId?.toString(),
      'scaling_factors': scalingFactors.map((e) => e.toString()).toList(),
    };
  }

  factory MsgStableSwapAdjustScalingFactors.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgStableSwapAdjustScalingFactors(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      scalingFactors:
          (json.valueEnsureAsList<dynamic>(
            'scaling_factors',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory MsgStableSwapAdjustScalingFactors.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStableSwapAdjustScalingFactors(
      sender: decode.getString<String?>(1),
      poolId: decode.getBigInt<BigInt?>(2),
      scalingFactors: decode.getListOrEmpty<BigInt>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsStableswapV1beta1MsgStableSwapAdjustScalingFactors;
  @override
  MsgStableSwapAdjustScalingFactorsResponse onServiceResponse(List<int> bytes) {
    return MsgStableSwapAdjustScalingFactorsResponse.deserialize(bytes);
  }

  @override
  MsgStableSwapAdjustScalingFactorsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgStableSwapAdjustScalingFactorsResponse.fromJson(json);
  }
}

class MsgStableSwapAdjustScalingFactorsResponse extends CosmosProtoMessage {
  const MsgStableSwapAdjustScalingFactorsResponse();

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

  factory MsgStableSwapAdjustScalingFactorsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgStableSwapAdjustScalingFactorsResponse();
  }

  factory MsgStableSwapAdjustScalingFactorsResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgStableSwapAdjustScalingFactorsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsStableswapV1beta1MsgStableSwapAdjustScalingFactorsResponse;
}
