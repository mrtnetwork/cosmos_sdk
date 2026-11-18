import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class CallbackData extends CosmosProtoMessage {
  final String? callbackKey;

  final String? portId;

  final String? channelId;

  final BigInt? sequence;

  final String? callbackId;

  final BuBytes? callbackArgs;

  CallbackData({
    this.callbackKey,
    this.portId,
    this.channelId,
    this.sequence,
    this.callbackId,
    List<int>? callbackArgs,
  }) : callbackArgs = callbackArgs?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.bytes(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    callbackKey,
    portId,
    channelId,
    sequence,
    callbackId,
    callbackArgs,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'callback_key': callbackKey,
      'port_id': portId,
      'channel_id': channelId,
      'sequence': config.encodeBigint(sequence),
      'callback_id': callbackId,
      'callback_args': config.encodeBinary(callbackArgs),
    };
  }

  factory CallbackData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CallbackData(
      callbackKey: json.valueAsString<String?>(
        'callback_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      callbackId: json.valueAsString<String?>(
        'callback_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      callbackArgs: config.decodeBinary<List<int>?>(
        json.valueAs('callback_args', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory CallbackData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CallbackData(
      callbackKey: decode.getString<String?>(1),
      portId: decode.getString<String?>(2),
      channelId: decode.getString<String?>(3),
      sequence: decode.getBigInt<BigInt?>(4),
      callbackId: decode.getString<String?>(5),
      callbackArgs: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcacallbacksCallbackData;
}
