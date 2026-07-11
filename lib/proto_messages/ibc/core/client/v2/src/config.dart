import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Config is a **per-client** configuration struct that sets which relayers are allowed to relay v2 IBC messages
/// for a given client.
/// If it is set, then only relayers in the allow list can send v2 messages
/// If it is not set, then the client allows permissionless relaying of v2 messages
class Config extends CosmosProtoMessage {
  /// allowed_relayers defines the set of allowed relayers for IBC V2 protocol for the given client
  final List<String> allowedRelayers;

  const Config({this.allowedRelayers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [allowedRelayers];

  @override
  Map<String, dynamic> toJson() {
    return {'allowed_relayers': allowedRelayers.map((e) => e).toList()};
  }

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      allowedRelayers:
          (json.valueEnsureAsList<dynamic>(
            'allowed_relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Config.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Config(allowedRelayers: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2Config;
}
