import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/gamm/v1beta1/src/balancer_pool.dart"
    as osmosis_gamm_v1beta1_balancer_pool;

/// ===================== MsgCreatePool
class MsgCreateBalancerPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateBalancerPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final osmosis_gamm_v1beta1_balancer_pool.PoolParams? poolParams;

  final List<osmosis_gamm_v1beta1_balancer_pool.PoolAsset> poolAssets;

  final String? futurePoolGovernor;

  const MsgCreateBalancerPool({
    this.sender,
    this.poolParams,
    this.poolAssets = const [],
    this.futurePoolGovernor,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/gamm/create-balancer-pool",
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
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    poolParams,
    poolAssets,
    futurePoolGovernor,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'pool_params': poolParams?.toJson(),
      'pool_assets': poolAssets.map((e) => e.toJson()).toList(),
      'future_pool_governor': futurePoolGovernor,
    };
  }

  factory MsgCreateBalancerPool.fromJson(Map<String, dynamic> json) {
    return MsgCreateBalancerPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      poolParams: json.valueTo<
        osmosis_gamm_v1beta1_balancer_pool.PoolParams?,
        Map<String, dynamic>
      >(
        key: 'pool_params',
        parse: (v) => osmosis_gamm_v1beta1_balancer_pool.PoolParams.fromJson(v),
        acceptCamelCase: true,
      ),
      poolAssets:
          (json.valueEnsureAsList<dynamic>(
                'pool_assets',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_gamm_v1beta1_balancer_pool.PoolAsset,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => osmosis_gamm_v1beta1_balancer_pool
                          .PoolAsset.fromJson(v),
                ),
              )
              .toList(),
      futurePoolGovernor: json.valueAsString<String?>(
        'future_pool_governor',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateBalancerPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBalancerPool(
      sender: decode.getString<String?>(1),
      poolParams: decode
          .messageTo<osmosis_gamm_v1beta1_balancer_pool.PoolParams?>(
            2,
            (b) => osmosis_gamm_v1beta1_balancer_pool.PoolParams.deserialize(b),
          ),
      poolAssets:
          decode
              .getListOfBytes(3)
              .map(
                (b) =>
                    osmosis_gamm_v1beta1_balancer_pool.PoolAsset.deserialize(b),
              )
              .toList(),
      futurePoolGovernor: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsBalancerV1beta1MsgCreateBalancerPool;
  @override
  MsgCreateBalancerPoolResponse onServiceResponse(List<int> bytes) {
    return MsgCreateBalancerPoolResponse.deserialize(bytes);
  }

  @override
  MsgCreateBalancerPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBalancerPoolResponse.fromJson(json);
  }
}

/// Returns the poolID
class MsgCreateBalancerPoolResponse extends CosmosProtoMessage {
  final BigInt? poolId;

  const MsgCreateBalancerPoolResponse({this.poolId});

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

  factory MsgCreateBalancerPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateBalancerPoolResponse(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateBalancerPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBalancerPoolResponse(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsBalancerV1beta1MsgCreateBalancerPoolResponse;
}
