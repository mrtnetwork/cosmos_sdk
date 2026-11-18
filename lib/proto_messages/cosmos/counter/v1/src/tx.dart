import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgIncreaseCounter defines a count Msg service counter.
class MsgIncreaseCounter extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgIncreaseCountResponse>,
        ICosmosProtoAminoMessage {
  /// signer is the address that controls the module (defaults to x/gov unless overwritten).
  final String? signer;

  /// count is the number of times to increment the counter.
  final BigInt? count;

  const MsgIncreaseCounter({this.signer, this.count});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/increase_counter",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, count];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'signer': signer, 'count': config.encodeBigint(count)};
  }

  factory MsgIncreaseCounter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgIncreaseCounter(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      count: json.valueAsBigInt<BigInt?>(
        'count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgIncreaseCounter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgIncreaseCounter(
      signer: decode.getString<String?>(1),
      count: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCounterV1MsgIncreaseCounter;
  @override
  MsgIncreaseCountResponse onServiceResponse(List<int> bytes) {
    return MsgIncreaseCountResponse.deserialize(bytes);
  }

  @override
  MsgIncreaseCountResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgIncreaseCountResponse.fromJson(json);
  }
}

/// MsgIncreaseCountResponse is the Msg/Counter response type.
class MsgIncreaseCountResponse extends CosmosProtoMessage {
  /// new_count is the number of times the counter was incremented.
  final BigInt? newCount;

  const MsgIncreaseCountResponse({this.newCount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [newCount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'new_count': config.encodeBigint(newCount)};
  }

  factory MsgIncreaseCountResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgIncreaseCountResponse(
      newCount: json.valueAsBigInt<BigInt?>(
        'new_count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgIncreaseCountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgIncreaseCountResponse(newCount: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCounterV1MsgIncreaseCountResponse;
}
