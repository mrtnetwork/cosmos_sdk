import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class RaAuthenticate extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<RaAuthenticateResponse> {
  final List<int>? sender;

  final List<int>? certificate;

  final String? replaceMachineId;

  const RaAuthenticate({this.sender, this.certificate, this.replaceMachineId});

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
  Map<String, dynamic> toJson() {
    return {
      'sender': switch (sender) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'certificate': switch (certificate) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'replace_machine_id': replaceMachineId,
    };
  }

  factory RaAuthenticate.fromJson(Map<String, dynamic> json) {
    return RaAuthenticate(
      sender: json.valueAsBytes<List<int>?>(
        'sender',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      certificate: json.valueAsBytes<List<int>?>(
        'certificate',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      replaceMachineId: json.valueAsString<String?>(
        'replace_machine_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'data': data, 'events': events};
  }

  factory RaAuthenticateResponse.fromJson(Map<String, dynamic> json) {
    return RaAuthenticateResponse(
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
      events: json.valueAsString<String?>('events', acceptCamelCase: true),
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
  final List<int>? key;

  const Key({this.key});

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
  Map<String, dynamic> toJson() {
    return {
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Key.fromJson(Map<String, dynamic> json) {
    return Key(
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
