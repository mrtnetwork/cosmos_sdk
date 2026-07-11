import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Config is the config object of the x/auth/tx package.
class Config extends CosmosProtoMessage {
  /// skip_ante_handler defines whether the ante handler registration should be skipped in case an app wants to override
  /// this functionality.
  final bool? skipAnteHandler;

  /// skip_post_handler defines whether the post handler registration should be skipped in case an app wants to override
  /// this functionality.
  final bool? skipPostHandler;

  const Config({this.skipAnteHandler, this.skipPostHandler});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionMap(
          name: "cosmos.app.v1alpha1.module",
          value: {"go_import": "github.com/cosmos/cosmos-sdk/x/auth/tx"},
        ),
      ],
      fields: [ProtoFieldConfig.bool(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [skipAnteHandler, skipPostHandler];

  @override
  Map<String, dynamic> toJson() {
    return {
      'skip_ante_handler': skipAnteHandler,
      'skip_post_handler': skipPostHandler,
    };
  }

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      skipAnteHandler: json.valueAsBool<bool?>(
        'skip_ante_handler',
        acceptCamelCase: true,
      ),
      skipPostHandler: json.valueAsBool<bool?>(
        'skip_post_handler',
        acceptCamelCase: true,
      ),
    );
  }

  factory Config.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Config(
      skipAnteHandler: decode.getBool<bool?>(1),
      skipPostHandler: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxConfigV1Config;
}
