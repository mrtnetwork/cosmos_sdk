import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class CallbackData extends CosmosProtoMessage {
  final String? callbackKey;

  final String? portId;

  final String? channelId;

  final BigInt? sequence;

  final String? callbackId;

  final List<int>? callbackArgs;

  const CallbackData({
    this.callbackKey,
    this.portId,
    this.channelId,
    this.sequence,
    this.callbackId,
    this.callbackArgs,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'callback_key': callbackKey,
      'port_id': portId,
      'channel_id': channelId,
      'sequence': sequence?.toString(),
      'callback_id': callbackId,
      'callback_args': switch (callbackArgs) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory CallbackData.fromJson(Map<String, dynamic> json) {
    return CallbackData(
      callbackKey: json.valueAsString<String?>(
        'callback_key',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      callbackId: json.valueAsString<String?>(
        'callback_id',
        acceptCamelCase: true,
      ),
      callbackArgs: json.valueAsBytes<List<int>?>(
        'callback_args',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
