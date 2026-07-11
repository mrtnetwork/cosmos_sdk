import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/app/v1alpha1/src/config.dart"
    as cosmos_app_v1alpha1_config;

/// QueryConfigRequest is the Query/Config request type.
class QueryConfigRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConfigResponse> {
  const QueryConfigRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryConfigRequest.fromJson(Map<String, dynamic> json) {
    return QueryConfigRequest();
  }

  factory QueryConfigRequest.deserialize(List<int> bytes) {
    return QueryConfigRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAppV1alpha1QueryConfigRequest;
  @override
  QueryConfigResponse onQueryResponse(List<int> bytes) {
    return QueryConfigResponse.deserialize(bytes);
  }

  @override
  QueryConfigResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConfigResponse.fromJson(json);
  }
}

/// QueryConfigResponse is the Query/Config response type.
class QueryConfigResponse extends CosmosProtoMessage {
  /// config is the current app config.
  final cosmos_app_v1alpha1_config.Config? config;

  const QueryConfigResponse({this.config});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [config];

  @override
  Map<String, dynamic> toJson() {
    return {'config': config?.toJson()};
  }

  factory QueryConfigResponse.fromJson(Map<String, dynamic> json) {
    return QueryConfigResponse(
      config: json
          .valueTo<cosmos_app_v1alpha1_config.Config?, Map<String, dynamic>>(
            key: 'config',
            parse: (v) => cosmos_app_v1alpha1_config.Config.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryConfigResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConfigResponse(
      config: decode.messageTo<cosmos_app_v1alpha1_config.Config?>(
        1,
        (b) => cosmos_app_v1alpha1_config.Config.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAppV1alpha1QueryConfigResponse;
}
