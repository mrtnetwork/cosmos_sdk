import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class RaAuthenticate extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<RaAuthenticateResponse> {
  final BuBytes? sender;

  final BuBytes? certificate;

  final String? replaceMachineId;

  RaAuthenticate({
    List<int>? sender,
    List<int>? certificate,
    this.replaceMachineId,
  }) : sender = sender?.asImmutableBytes,
       certificate = certificate?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, certificate, replaceMachineId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': config.encodeBinary(sender),
      'certificate': config.encodeBinary(certificate),
      'replace_machine_id': replaceMachineId,
    };
  }

  factory RaAuthenticate.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RaAuthenticate(
      sender: config.decodeBinary<List<int>?>(
        json.valueAs('sender', normalizeKeyLookup: config.normalizeKeys),
      ),
      certificate: config.decodeBinary<List<int>?>(
        json.valueAs('certificate', normalizeKeyLookup: config.normalizeKeys),
      ),
      replaceMachineId: json.valueAsString<String?>(
        'replace_machine_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory RaAuthenticate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RaAuthenticate(
      sender: decode.getBytes<List<int>?>(1),
      certificate: decode.getBytes<List<int>?>(2),
      replaceMachineId: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretRegistrationV1beta1RaAuthenticate;
  @override
  RaAuthenticateResponse onServiceResponse(List<int> bytes) {
    return RaAuthenticateResponse.deserialize(bytes);
  }

  @override
  RaAuthenticateResponse onServiceResponseJson(Map<String, dynamic> json) {
    return RaAuthenticateResponse.fromJson(json);
  }
}

class RaAuthenticateResponse extends CosmosProtoMessage {
  final String? data;

  final String? events;

  const RaAuthenticateResponse({this.data, this.events});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [data, events];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'data': data, 'events': events};
  }

  factory RaAuthenticateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RaAuthenticateResponse(
      data: json.valueAsString<String?>(
        'data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      events: json.valueAsString<String?>(
        'events',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory RaAuthenticateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RaAuthenticateResponse(
      data: decode.getString<String?>(1),
      events: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretRegistrationV1beta1RaAuthenticateResponse;
}

class Key extends CosmosProtoMessage {
  final BuBytes? key;

  Key({List<int>? key}) : key = key?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [key];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'key': config.encodeBinary(key)};
  }

  factory Key.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Key(
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory Key.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Key(key: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretRegistrationV1beta1Key;
}
