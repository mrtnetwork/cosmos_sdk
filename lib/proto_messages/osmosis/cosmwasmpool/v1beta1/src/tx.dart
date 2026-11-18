import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ===================== MsgCreateCosmwasmPool
class MsgCreateCosmWasmPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateCosmWasmPoolResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? codeId;

  final BuBytes? instantiateMsg;

  final String? sender;

  MsgCreateCosmWasmPool({this.codeId, List<int>? instantiateMsg, this.sender})
    : instantiateMsg = instantiateMsg?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgCreateCosmWasmPool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeId, instantiateMsg, sender];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'instantiate_msg': config.encodeBinary(instantiateMsg),
      'sender': sender,
    };
  }

  factory MsgCreateCosmWasmPool.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateCosmWasmPool(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      instantiateMsg: config.decodeBinary<List<int>?>(
        json.valueAs(
          'instantiate_msg',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateCosmWasmPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateCosmWasmPool(
      codeId: decode.getBigInt<BigInt?>(1),
      instantiateMsg: decode.getBytes<List<int>?>(2),
      sender: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisCosmwasmpoolV1beta1MsgCreateCosmWasmPool;
  @override
  MsgCreateCosmWasmPoolResponse onServiceResponse(List<int> bytes) {
    return MsgCreateCosmWasmPoolResponse.deserialize(bytes);
  }

  @override
  MsgCreateCosmWasmPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateCosmWasmPoolResponse.fromJson(json);
  }
}

/// Returns a unique poolID to identify the pool with.
class MsgCreateCosmWasmPoolResponse extends CosmosProtoMessage {
  final BigInt? poolId;

  const MsgCreateCosmWasmPoolResponse({this.poolId});

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pool_id': config.encodeBigint(poolId)};
  }

  factory MsgCreateCosmWasmPoolResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateCosmWasmPoolResponse(
      poolId: json.valueAsBigInt<BigInt?>(
        'pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateCosmWasmPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateCosmWasmPoolResponse(poolId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisCosmwasmpoolV1beta1MsgCreateCosmWasmPoolResponse;
}
