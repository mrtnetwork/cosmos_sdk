import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the set of on-chain interchain accounts parameters.
/// The following parameters may be used to disable the host submodule.
class Params extends CosmosProtoMessage {
  /// host_enabled enables or disables the host submodule.
  final bool? hostEnabled;

  /// allow_messages defines a list of sdk message typeURLs allowed to be executed on a host chain.
  final List<String> allowMessages;

  const Params({this.hostEnabled, this.allowMessages = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hostEnabled, allowMessages];

  @override
  Map<String, dynamic> toJson() {
    return {
      'host_enabled': hostEnabled,
      'allow_messages': allowMessages.map((e) => e).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      hostEnabled: json.valueAsBool<bool?>(
        'host_enabled',
        acceptCamelCase: true,
      ),
      allowMessages:
          (json.valueEnsureAsList<dynamic>(
            'allow_messages',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      hostEnabled: decode.getBool<bool?>(1),
      allowMessages: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsInterchainAccountsHostV1Params;
}

/// QueryRequest defines the parameters for a particular query request
/// by an interchain account.
class QueryRequest extends CosmosProtoMessage {
  /// path defines the path of the query request as defined by ADR-021.
  /// https://github.com/cosmos/cosmos-sdk/blob/main/docs/architecture/adr-021-protobuf-query-encoding.md#custom-query-registration-and-routing
  final String? path;

  /// data defines the payload of the query request as defined by ADR-021.
  /// https://github.com/cosmos/cosmos-sdk/blob/main/docs/architecture/adr-021-protobuf-query-encoding.md#custom-query-registration-and-routing
  final List<int>? data;

  const QueryRequest({this.path, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [path, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryRequest.fromJson(Map<String, dynamic> json) {
    return QueryRequest(
      path: json.valueAsString<String?>('path', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRequest(
      path: decode.getString<String?>(1),
      data: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsHostV1QueryRequest;
}
