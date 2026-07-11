import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ===================== MsgCreateConcentratedPool
class MsgCreateConcentratedPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateConcentratedPoolResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? denom0;

  final String? denom1;

  final BigInt? tickSpacing;

  final String? spreadFactor;

  const MsgCreateConcentratedPool({
    this.sender,
    this.denom0,
    this.denom1,
    this.tickSpacing,
    this.spreadFactor,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/create-concentrated-pool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.uint64(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    denom0,
    denom1,
    tickSpacing,
    spreadFactor,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'denom0': denom0,
      'denom1': denom1,
      'tick_spacing': tickSpacing?.toString(),
      'spread_factor': spreadFactor,
    };
  }

  factory MsgCreateConcentratedPool.fromJson(Map<String, dynamic> json) {
    return MsgCreateConcentratedPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom0: json.valueAsString<String?>('denom0', acceptCamelCase: true),
      denom1: json.valueAsString<String?>('denom1', acceptCamelCase: true),
      tickSpacing: json.valueAsBigInt<BigInt?>(
        'tick_spacing',
        acceptCamelCase: true,
      ),
      spreadFactor: json.valueAsString<String?>(
        'spread_factor',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateConcentratedPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateConcentratedPool(
      sender: decode.getString<String?>(1),
      denom0: decode.getString<String?>(2),
      denom1: decode.getString<String?>(3),
      tickSpacing: decode.getBigInt<BigInt?>(4),
      spreadFactor: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityPoolmodelConcentratedV1beta1MsgCreateConcentratedPool;
  @override
  MsgCreateConcentratedPoolResponse onServiceResponse(List<int> bytes) {
    return MsgCreateConcentratedPoolResponse.deserialize(bytes);
  }

  @override
  MsgCreateConcentratedPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateConcentratedPoolResponse.fromJson(json);
  }
}

/// Returns a unique poolID to identify the pool with.
class MsgCreateConcentratedPoolResponse extends CosmosProtoMessage {
  final BigInt? poolId;

  const MsgCreateConcentratedPoolResponse({this.poolId});

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

  factory MsgCreateConcentratedPoolResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateConcentratedPoolResponse(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
    );
  }

  factory MsgCreateConcentratedPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateConcentratedPoolResponse(
      poolId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityPoolmodelConcentratedV1beta1MsgCreateConcentratedPoolResponse;
}
