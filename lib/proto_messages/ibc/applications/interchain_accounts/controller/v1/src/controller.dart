import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the set of on-chain interchain accounts parameters.
/// The following parameters may be used to disable the controller submodule.
class Params extends CosmosProtoMessage {
  /// controller_enabled enables or disables the controller submodule.
  final bool? controllerEnabled;

  const Params({this.controllerEnabled});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [controllerEnabled];

  @override
  Map<String, dynamic> toJson() {
    return {'controller_enabled': controllerEnabled};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      controllerEnabled: json.valueAsBool<bool?>(
        'controller_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(controllerEnabled: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1Params;
}
