import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Params extends CosmosProtoMessage {
  final List<String> forceUnlockAllowedAddresses;

  const Params({this.forceUnlockAllowedAddresses = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [forceUnlockAllowedAddresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'force_unlock_allowed_addresses':
          forceUnlockAllowedAddresses.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      forceUnlockAllowedAddresses:
          (json.valueEnsureAsList<dynamic>(
            'force_unlock_allowed_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      forceUnlockAllowedAddresses: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisLockupParams;
}
