import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/autocli/v1/src/options.dart"
    as cosmos_autocli_v1_options;

/// NOTE: autocli options SHOULD NOT be part of consensus and module_query_safe
/// should be kept as false.
/// AppOptionsRequest is the RemoteInfoService/AppOptions request type.
class AppOptionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AppOptionsResponse> {
  const AppOptionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(
          name: "cosmos.query.v1.module_query_safe",
          value: false,
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory AppOptionsRequest.fromJson(Map<String, dynamic> json) {
    return AppOptionsRequest();
  }

  factory AppOptionsRequest.deserialize(List<int> bytes) {
    return AppOptionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1AppOptionsRequest;
  @override
  AppOptionsResponse onQueryResponse(List<int> bytes) {
    return AppOptionsResponse.deserialize(bytes);
  }

  @override
  AppOptionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AppOptionsResponse.fromJson(json);
  }
}

/// AppOptionsResponse is the RemoteInfoService/AppOptions response type.
class AppOptionsResponse extends CosmosProtoMessage {
  /// module_options is a map of module name to autocli module options.
  final Map<String, cosmos_autocli_v1_options.ModuleOptions> moduleOptions;

  const AppOptionsResponse({this.moduleOptions = const {}});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.map(
          fieldNumber: 1,
          keyType: ProtoFieldType.string,
          valueType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [moduleOptions];

  @override
  Map<String, dynamic> toJson() {
    return {
      'module_options': moduleOptions.map((k, v) => MapEntry(k, v.toJson())),
    };
  }

  factory AppOptionsResponse.fromJson(Map<String, dynamic> json) {
    return AppOptionsResponse(
      moduleOptions: (json.valueAsMap<Map<dynamic, dynamic>>(
        'module_options',
        acceptCamelCase: true,
      )).map(
        (k, v) => MapEntry(
          JsonParser.valueAsString<String>(k),
          JsonParser.valueTo<
            cosmos_autocli_v1_options.ModuleOptions,
            Map<String, dynamic>
          >(
            value: v,
            parse: (v) => cosmos_autocli_v1_options.ModuleOptions.fromJson(v),
          ),
        ),
      ),
    );
  }

  factory AppOptionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AppOptionsResponse(
      moduleOptions: decode
          .getMapField<String, cosmos_autocli_v1_options.ModuleOptions>(
            fieldNumber: 1,
            keyMapper: (v) => JsonParser.valueAs<String>(v),
            valueMapper:
                (v) => cosmos_autocli_v1_options.ModuleOptions.deserialize(
                  JsonParser.valueAsBytes<List<int>>(v),
                ),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAutocliV1AppOptionsResponse;
}
