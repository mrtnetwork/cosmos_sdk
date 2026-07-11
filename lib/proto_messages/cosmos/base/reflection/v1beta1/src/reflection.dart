import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// ListAllInterfacesRequest is the request type of the ListAllInterfaces RPC.
class ListAllInterfacesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ListAllInterfacesResponse> {
  const ListAllInterfacesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/interfaces",
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

  factory ListAllInterfacesRequest.fromJson(Map<String, dynamic> json) {
    return ListAllInterfacesRequest();
  }

  factory ListAllInterfacesRequest.deserialize(List<int> bytes) {
    return ListAllInterfacesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV1beta1ListAllInterfacesRequest;
  @override
  ListAllInterfacesResponse onQueryResponse(List<int> bytes) {
    return ListAllInterfacesResponse.deserialize(bytes);
  }

  @override
  ListAllInterfacesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ListAllInterfacesResponse.fromJson(json);
  }
}

/// ListAllInterfacesResponse is the response type of the ListAllInterfaces RPC.
class ListAllInterfacesResponse extends CosmosProtoMessage {
  /// interface_names is an array of all the registered interfaces.
  final List<String> interfaceNames;

  const ListAllInterfacesResponse({this.interfaceNames = const []});

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
  List<Object?> get protoValues => [interfaceNames];

  @override
  Map<String, dynamic> toJson() {
    return {'interface_names': interfaceNames.map((e) => e).toList()};
  }

  factory ListAllInterfacesResponse.fromJson(Map<String, dynamic> json) {
    return ListAllInterfacesResponse(
      interfaceNames:
          (json.valueEnsureAsList<dynamic>(
            'interface_names',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ListAllInterfacesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListAllInterfacesResponse(
      interfaceNames: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV1beta1ListAllInterfacesResponse;
}

/// ListImplementationsRequest is the request type of the ListImplementations
/// RPC.
class ListImplementationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ListImplementationsResponse> {
  /// interface_name defines the interface to query the implementations for.
  final String? interfaceName;

  const ListImplementationsRequest({this.interfaceName});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/cosmos/base/reflection/v1beta1/interfaces/{interface_name}/implementations",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [interfaceName];

  @override
  Map<String, dynamic> toJson() {
    return {'interface_name': interfaceName};
  }

  factory ListImplementationsRequest.fromJson(Map<String, dynamic> json) {
    return ListImplementationsRequest(
      interfaceName: json.valueAsString<String?>(
        'interface_name',
        acceptCamelCase: true,
      ),
    );
  }

  factory ListImplementationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListImplementationsRequest(
      interfaceName: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV1beta1ListImplementationsRequest;
  @override
  ListImplementationsResponse onQueryResponse(List<int> bytes) {
    return ListImplementationsResponse.deserialize(bytes);
  }

  @override
  ListImplementationsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ListImplementationsResponse.fromJson(json);
  }
}

/// ListImplementationsResponse is the response type of the ListImplementations
/// RPC.
class ListImplementationsResponse extends CosmosProtoMessage {
  final List<String> implementationMessageNames;

  const ListImplementationsResponse({
    this.implementationMessageNames = const [],
  });

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
  List<Object?> get protoValues => [implementationMessageNames];

  @override
  Map<String, dynamic> toJson() {
    return {
      'implementation_message_names':
          implementationMessageNames.map((e) => e).toList(),
    };
  }

  factory ListImplementationsResponse.fromJson(Map<String, dynamic> json) {
    return ListImplementationsResponse(
      implementationMessageNames:
          (json.valueEnsureAsList<dynamic>(
            'implementation_message_names',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ListImplementationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ListImplementationsResponse(
      implementationMessageNames: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV1beta1ListImplementationsResponse;
}
