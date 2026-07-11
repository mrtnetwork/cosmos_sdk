import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/descriptor.dart"
    as google_protobuf_descriptor;

/// NOTE: file descriptors SHOULD NOT be part of consensus because they
/// include changes to doc commands and module_query_safe should be kept as false.
/// FileDescriptorsRequest is the Query/FileDescriptors request type.
class FileDescriptorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<FileDescriptorsResponse> {
  const FileDescriptorsRequest();

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

  factory FileDescriptorsRequest.fromJson(Map<String, dynamic> json) {
    return FileDescriptorsRequest();
  }

  factory FileDescriptorsRequest.deserialize(List<int> bytes) {
    return FileDescriptorsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosReflectionV1FileDescriptorsRequest;
  @override
  FileDescriptorsResponse onQueryResponse(List<int> bytes) {
    return FileDescriptorsResponse.deserialize(bytes);
  }

  @override
  FileDescriptorsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return FileDescriptorsResponse.fromJson(json);
  }
}

/// FileDescriptorsResponse is the Query/FileDescriptors response type.
class FileDescriptorsResponse extends CosmosProtoMessage {
  /// files is the file descriptors.
  final List<google_protobuf_descriptor.FileDescriptorProto> files;

  const FileDescriptorsResponse({this.files = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [files];

  @override
  Map<String, dynamic> toJson() {
    return {'files': files.map((e) => e.toJson()).toList()};
  }

  factory FileDescriptorsResponse.fromJson(Map<String, dynamic> json) {
    return FileDescriptorsResponse(
      files:
          (json.valueEnsureAsList<dynamic>('files', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_descriptor.FileDescriptorProto,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => google_protobuf_descriptor
                          .FileDescriptorProto.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory FileDescriptorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FileDescriptorsResponse(
      files:
          decode
              .getListOfBytes(1)
              .map(
                (b) => google_protobuf_descriptor
                    .FileDescriptorProto.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosReflectionV1FileDescriptorsResponse;
}
