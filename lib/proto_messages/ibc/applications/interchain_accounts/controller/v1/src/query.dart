import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/applications/interchain_accounts/controller/v1/src/controller.dart"
    as ibc_applications_interchain_accounts_controller_v1_controller;

/// QueryInterchainAccountRequest is the request type for the Query/InterchainAccount RPC method.
class QueryInterchainAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInterchainAccountResponse> {
  final String? owner;

  final String? connectionId;

  const QueryInterchainAccountRequest({this.owner, this.connectionId});

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
              "/ibc/apps/interchain_accounts/controller/v1/owners/{owner}/connections/{connection_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [owner, connectionId];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'connection_id': connectionId};
  }

  factory QueryInterchainAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryInterchainAccountRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInterchainAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInterchainAccountRequest(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1QueryInterchainAccountRequest;
  @override
  QueryInterchainAccountResponse onQueryResponse(List<int> bytes) {
    return QueryInterchainAccountResponse.deserialize(bytes);
  }

  @override
  QueryInterchainAccountResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryInterchainAccountResponse.fromJson(json);
  }
}

/// QueryInterchainAccountResponse the response type for the Query/InterchainAccount RPC method.
class QueryInterchainAccountResponse extends CosmosProtoMessage {
  final String? address;

  const QueryInterchainAccountResponse({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryInterchainAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryInterchainAccountResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryInterchainAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInterchainAccountResponse(
      address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1QueryInterchainAccountResponse;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/interchain_accounts/controller/v1/params",
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

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final ibc_applications_interchain_accounts_controller_v1_controller.Params?
  params;

  const QueryParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<
        ibc_applications_interchain_accounts_controller_v1_controller.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) => ibc_applications_interchain_accounts_controller_v1_controller
                .Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<
        ibc_applications_interchain_accounts_controller_v1_controller.Params?
      >(
        1,
        (b) => ibc_applications_interchain_accounts_controller_v1_controller
            .Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1QueryParamsResponse;
}
