import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/connection/v1/src/connection.dart"
    as ibc_core_connection_v1_connection;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// QueryConnectionRequest is the request type for the Query/Connection RPC
/// method
class QueryConnectionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConnectionResponse> {
  /// connection unique identifier
  final String? connectionId;

  const QueryConnectionRequest({this.connectionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/connection/v1/connections/{connection_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [connectionId];

  @override
  Map<String, dynamic> toJson() {
    return {'connection_id': connectionId};
  }

  factory QueryConnectionRequest.fromJson(Map<String, dynamic> json) {
    return QueryConnectionRequest(
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConnectionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionRequest(connectionId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1QueryConnectionRequest;
  @override
  QueryConnectionResponse onQueryResponse(List<int> bytes) {
    return QueryConnectionResponse.deserialize(bytes);
  }

  @override
  QueryConnectionResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConnectionResponse.fromJson(json);
  }
}

/// QueryConnectionResponse is the response type for the Query/Connection RPC
/// method. Besides the connection end, it includes a proof and the height from
/// which the proof was retrieved.
class QueryConnectionResponse extends CosmosProtoMessage {
  /// connection associated with the request identifier
  final ibc_core_connection_v1_connection.ConnectionEnd? connection;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryConnectionResponse({
    this.connection,
    this.proof,
    this.proofHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [connection, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connection': connection?.toJson(),
      'proof': switch (proof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_height': proofHeight?.toJson(),
    };
  }

  factory QueryConnectionResponse.fromJson(Map<String, dynamic> json) {
    return QueryConnectionResponse(
      connection: json.valueTo<
        ibc_core_connection_v1_connection.ConnectionEnd?,
        Map<String, dynamic>
      >(
        key: 'connection',
        parse:
            (v) => ibc_core_connection_v1_connection.ConnectionEnd.fromJson(v),
        acceptCamelCase: true,
      ),
      proof: json.valueAsBytes<List<int>?>(
        'proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryConnectionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionResponse(
      connection: decode
          .messageTo<ibc_core_connection_v1_connection.ConnectionEnd?>(
            1,
            (b) =>
                ibc_core_connection_v1_connection.ConnectionEnd.deserialize(b),
          ),
      proof: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1QueryConnectionResponse;
}

/// QueryConnectionsRequest is the request type for the Query/Connections RPC
/// method
class QueryConnectionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConnectionsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryConnectionsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/connection/v1/connections",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryConnectionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryConnectionsRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConnectionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1QueryConnectionsRequest;
  @override
  QueryConnectionsResponse onQueryResponse(List<int> bytes) {
    return QueryConnectionsResponse.deserialize(bytes);
  }

  @override
  QueryConnectionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConnectionsResponse.fromJson(json);
  }
}

/// QueryConnectionsResponse is the response type for the Query/Connections RPC
/// method.
class QueryConnectionsResponse extends CosmosProtoMessage {
  /// list of stored connections of the chain.
  final List<ibc_core_connection_v1_connection.IdentifiedConnection>
  connections;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// query block height
  final ibc_core_client_v1_client.Height? height;

  const QueryConnectionsResponse({
    this.connections = const [],
    this.pagination,
    this.height,
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
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [connections, pagination, height];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connections': connections.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'height': height?.toJson(),
    };
  }

  factory QueryConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryConnectionsResponse(
      connections:
          (json.valueEnsureAsList<dynamic>(
                'connections',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_connection_v1_connection.IdentifiedConnection,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_connection_v1_connection
                          .IdentifiedConnection.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
      height: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryConnectionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionsResponse(
      connections:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_connection_v1_connection
                    .IdentifiedConnection.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
      height: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1QueryConnectionsResponse;
}

/// QueryClientConnectionsRequest is the request type for the
/// Query/ClientConnections RPC method
class QueryClientConnectionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClientConnectionsResponse> {
  /// client identifier associated with a connection
  final String? clientId;

  const QueryClientConnectionsRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/connection/v1/client_connections/{client_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId];

  @override
  Map<String, dynamic> toJson() {
    return {'client_id': clientId};
  }

  factory QueryClientConnectionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryClientConnectionsRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
    );
  }

  factory QueryClientConnectionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientConnectionsRequest(
      clientId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryClientConnectionsRequest;
  @override
  QueryClientConnectionsResponse onQueryResponse(List<int> bytes) {
    return QueryClientConnectionsResponse.deserialize(bytes);
  }

  @override
  QueryClientConnectionsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryClientConnectionsResponse.fromJson(json);
  }
}

/// QueryClientConnectionsResponse is the response type for the
/// Query/ClientConnections RPC method
class QueryClientConnectionsResponse extends CosmosProtoMessage {
  /// slice of all the connection paths associated with a client.
  final List<String> connectionPaths;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was generated
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryClientConnectionsResponse({
    this.connectionPaths = const [],
    this.proof,
    this.proofHeight,
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
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [connectionPaths, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connection_paths': connectionPaths.map((e) => e).toList(),
      'proof': switch (proof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_height': proofHeight?.toJson(),
    };
  }

  factory QueryClientConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientConnectionsResponse(
      connectionPaths:
          (json.valueEnsureAsList<dynamic>(
            'connection_paths',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      proof: json.valueAsBytes<List<int>?>(
        'proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryClientConnectionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientConnectionsResponse(
      connectionPaths: decode.getListOrEmpty<String>(1),
      proof: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryClientConnectionsResponse;
}

/// QueryConnectionClientStateRequest is the request type for the
/// Query/ConnectionClientState RPC method
class QueryConnectionClientStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConnectionClientStateResponse> {
  /// connection identifier
  final String? connectionId;

  const QueryConnectionClientStateRequest({this.connectionId});

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
              "/ibc/core/connection/v1/connections/{connection_id}/client_state",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [connectionId];

  @override
  Map<String, dynamic> toJson() {
    return {'connection_id': connectionId};
  }

  factory QueryConnectionClientStateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionClientStateRequest(
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConnectionClientStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionClientStateRequest(
      connectionId: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryConnectionClientStateRequest;
  @override
  QueryConnectionClientStateResponse onQueryResponse(List<int> bytes) {
    return QueryConnectionClientStateResponse.deserialize(bytes);
  }

  @override
  QueryConnectionClientStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionClientStateResponse.fromJson(json);
  }
}

/// QueryConnectionClientStateResponse is the response type for the
/// Query/ConnectionClientState RPC method
class QueryConnectionClientStateResponse extends CosmosProtoMessage {
  /// client state associated with the channel
  final ibc_core_client_v1_client.IdentifiedClientState? identifiedClientState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryConnectionClientStateResponse({
    this.identifiedClientState,
    this.proof,
    this.proofHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [identifiedClientState, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'identified_client_state': identifiedClientState?.toJson(),
      'proof': switch (proof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_height': proofHeight?.toJson(),
    };
  }

  factory QueryConnectionClientStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionClientStateResponse(
      identifiedClientState: json.valueTo<
        ibc_core_client_v1_client.IdentifiedClientState?,
        Map<String, dynamic>
      >(
        key: 'identified_client_state',
        parse:
            (v) => ibc_core_client_v1_client.IdentifiedClientState.fromJson(v),
        acceptCamelCase: true,
      ),
      proof: json.valueAsBytes<List<int>?>(
        'proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryConnectionClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionClientStateResponse(
      identifiedClientState: decode
          .messageTo<ibc_core_client_v1_client.IdentifiedClientState?>(
            1,
            (b) =>
                ibc_core_client_v1_client.IdentifiedClientState.deserialize(b),
          ),
      proof: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryConnectionClientStateResponse;
}

/// QueryConnectionConsensusStateRequest is the request type for the
/// Query/ConnectionConsensusState RPC method
class QueryConnectionConsensusStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConnectionConsensusStateResponse> {
  /// connection identifier
  final String? connectionId;

  final BigInt? revisionNumber;

  final BigInt? revisionHeight;

  const QueryConnectionConsensusStateRequest({
    this.connectionId,
    this.revisionNumber,
    this.revisionHeight,
  });

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
              "/ibc/core/connection/v1/connections/{connection_id}/consensus_state/revision/{revision_number}/height/{revision_height}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    connectionId,
    revisionNumber,
    revisionHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'revision_number': revisionNumber?.toString(),
      'revision_height': revisionHeight?.toString(),
    };
  }

  factory QueryConnectionConsensusStateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionConsensusStateRequest(
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      revisionNumber: json.valueAsBigInt<BigInt?>(
        'revision_number',
        acceptCamelCase: true,
      ),
      revisionHeight: json.valueAsBigInt<BigInt?>(
        'revision_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConnectionConsensusStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionConsensusStateRequest(
      connectionId: decode.getString<String?>(1),
      revisionNumber: decode.getBigInt<BigInt?>(2),
      revisionHeight: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryConnectionConsensusStateRequest;
  @override
  QueryConnectionConsensusStateResponse onQueryResponse(List<int> bytes) {
    return QueryConnectionConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryConnectionConsensusStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionConsensusStateResponse.fromJson(json);
  }
}

/// QueryConnectionConsensusStateResponse is the response type for the
/// Query/ConnectionConsensusState RPC method
class QueryConnectionConsensusStateResponse extends CosmosProtoMessage {
  /// consensus state associated with the channel
  final google_protobuf_any.Any? consensusState;

  /// client ID associated with the consensus state
  final String? clientId;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryConnectionConsensusStateResponse({
    this.consensusState,
    this.clientId,
    this.proof,
    this.proofHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    consensusState,
    clientId,
    proof,
    proofHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'consensus_state': consensusState?.toJson(),
      'client_id': clientId,
      'proof': switch (proof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_height': proofHeight?.toJson(),
    };
  }

  factory QueryConnectionConsensusStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionConsensusStateResponse(
      consensusState: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'consensus_state',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      proof: json.valueAsBytes<List<int>?>(
        'proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'proof_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryConnectionConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionConsensusStateResponse(
      consensusState: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      clientId: decode.getString<String?>(2),
      proof: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryConnectionConsensusStateResponse;
}

/// QueryConnectionParamsRequest is the request type for the Query/ConnectionParams RPC method.
class QueryConnectionParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConnectionParamsResponse> {
  const QueryConnectionParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/connection/v1/params",
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

  factory QueryConnectionParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryConnectionParamsRequest();
  }

  factory QueryConnectionParamsRequest.deserialize(List<int> bytes) {
    return QueryConnectionParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreConnectionV1QueryConnectionParamsRequest;
  @override
  QueryConnectionParamsResponse onQueryResponse(List<int> bytes) {
    return QueryConnectionParamsResponse.deserialize(bytes);
  }

  @override
  QueryConnectionParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConnectionParamsResponse.fromJson(json);
  }
}

/// QueryConnectionParamsResponse is the response type for the Query/ConnectionParams RPC method.
class QueryConnectionParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final ibc_core_connection_v1_connection.Params? params;

  const QueryConnectionParamsResponse({this.params});

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

  factory QueryConnectionParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryConnectionParamsResponse(
      params: json.valueTo<
        ibc_core_connection_v1_connection.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => ibc_core_connection_v1_connection.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConnectionParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionParamsResponse(
      params: decode.messageTo<ibc_core_connection_v1_connection.Params?>(
        1,
        (b) => ibc_core_connection_v1_connection.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreConnectionV1QueryConnectionParamsResponse;
}
