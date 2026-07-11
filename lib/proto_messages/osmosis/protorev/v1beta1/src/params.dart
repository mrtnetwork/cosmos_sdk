import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the module.
class Params extends CosmosProtoMessage {
  /// Boolean whether the protorev module is enabled.
  final bool? enabled;

  /// The admin account (settings manager) of the protorev module.
  final String? admin;

  const Params({this.enabled, this.admin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [enabled, admin];

  @override
  Map<String, dynamic> toJson() {
    return {'enabled': enabled, 'admin': admin};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      enabled: json.valueAsBool<bool?>('enabled', acceptCamelCase: true),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      enabled: decode.getBool<bool?>(1),
      admin: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1Params;
}
