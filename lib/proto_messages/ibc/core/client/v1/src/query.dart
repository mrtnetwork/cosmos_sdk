import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/ibc/core/commitment/v2/src/commitment.dart"
    as ibc_core_commitment_v2_commitment;

/// QueryClientStateRequest is the request type for the Query/ClientState RPC
/// method
class QueryClientStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClientStateResponse> {
  /// client state unique identifier
  final String? clientId;

  const QueryClientStateRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/client_states/{client_id}",
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

  factory QueryClientStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryClientStateRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
    );
  }

  factory QueryClientStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientStateRequest(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientStateRequest;
  @override
  QueryClientStateResponse onQueryResponse(List<int> bytes) {
    return QueryClientStateResponse.deserialize(bytes);
  }

  @override
  QueryClientStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClientStateResponse.fromJson(json);
  }
}

/// QueryClientStateResponse is the response type for the Query/ClientState RPC
/// method. Besides the client state, it includes a proof and the height from
/// which the proof was retrieved.
class QueryClientStateResponse extends CosmosProtoMessage {
  /// client state associated with the request identifier
  final google_protobuf_any.Any? clientState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryClientStateResponse({
    this.clientState,
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
  List<Object?> get protoValues => [clientState, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_state': clientState?.toJson(),
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

  factory QueryClientStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientStateResponse(
      clientState: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'client_state',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
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

  factory QueryClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientStateResponse(
      clientState: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientStateResponse;
}

/// QueryClientStatesRequest is the request type for the Query/ClientStates RPC
/// method
class QueryClientStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClientStatesResponse> {
  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryClientStatesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/client_states",
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

  factory QueryClientStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryClientStatesRequest(
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

  factory QueryClientStatesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientStatesRequest(
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
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientStatesRequest;
  @override
  QueryClientStatesResponse onQueryResponse(List<int> bytes) {
    return QueryClientStatesResponse.deserialize(bytes);
  }

  @override
  QueryClientStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClientStatesResponse.fromJson(json);
  }
}

/// QueryClientStatesResponse is the response type for the Query/ClientStates RPC
/// method.
class QueryClientStatesResponse extends CosmosProtoMessage {
  /// list of stored ClientStates of the chain.
  final List<ibc_core_client_v1_client.IdentifiedClientState> clientStates;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryClientStatesResponse({
    this.clientStates = const [],
    this.pagination,
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientStates, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_states': clientStates.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryClientStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientStatesResponse(
      clientStates:
          (json.valueEnsureAsList<dynamic>(
                'client_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_client_v1_client.IdentifiedClientState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_client_v1_client
                          .IdentifiedClientState.fromJson(v),
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
    );
  }

  factory QueryClientStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientStatesResponse(
      clientStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_client_v1_client
                    .IdentifiedClientState.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientStatesResponse;
}

/// QueryConsensusStateRequest is the request type for the Query/ConsensusState
/// RPC method. Besides the consensus state, it includes a proof and the height
/// from which the proof was retrieved.
class QueryConsensusStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConsensusStateResponse> {
  /// client identifier
  final String? clientId;

  /// consensus state revision number
  final BigInt? revisionNumber;

  /// consensus state revision height
  final BigInt? revisionHeight;

  /// latest_height overrides the height field and queries the latest stored
  /// ConsensusState
  final bool? latestHeight;

  const QueryConsensusStateRequest({
    this.clientId,
    this.revisionNumber,
    this.revisionHeight,
    this.latestHeight,
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
              "/ibc/core/client/v1/consensus_states/{client_id}/revision/{revision_number}/height/{revision_height}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    revisionNumber,
    revisionHeight,
    latestHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'revision_number': revisionNumber?.toString(),
      'revision_height': revisionHeight?.toString(),
      'latest_height': latestHeight,
    };
  }

  factory QueryConsensusStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryConsensusStateRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      revisionNumber: json.valueAsBigInt<BigInt?>(
        'revision_number',
        acceptCamelCase: true,
      ),
      revisionHeight: json.valueAsBigInt<BigInt?>(
        'revision_height',
        acceptCamelCase: true,
      ),
      latestHeight: json.valueAsBool<bool?>(
        'latest_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConsensusStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConsensusStateRequest(
      clientId: decode.getString<String?>(1),
      revisionNumber: decode.getBigInt<BigInt?>(2),
      revisionHeight: decode.getBigInt<BigInt?>(3),
      latestHeight: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryConsensusStateRequest;
  @override
  QueryConsensusStateResponse onQueryResponse(List<int> bytes) {
    return QueryConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryConsensusStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConsensusStateResponse.fromJson(json);
  }
}

/// QueryConsensusStateResponse is the response type for the Query/ConsensusState
/// RPC method
class QueryConsensusStateResponse extends CosmosProtoMessage {
  /// consensus state associated with the client identifier at the given height
  final google_protobuf_any.Any? consensusState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryConsensusStateResponse({
    this.consensusState,
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
  List<Object?> get protoValues => [consensusState, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'consensus_state': consensusState?.toJson(),
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

  factory QueryConsensusStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryConsensusStateResponse(
      consensusState: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'consensus_state',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
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

  factory QueryConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConsensusStateResponse(
      consensusState: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryConsensusStateResponse;
}

/// QueryConsensusStatesRequest is the request type for the Query/ConsensusStates
/// RPC method.
class QueryConsensusStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConsensusStatesResponse> {
  /// client identifier
  final String? clientId;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryConsensusStatesRequest({this.clientId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/consensus_states/{client_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'client_id': clientId, 'pagination': pagination?.toJson()};
  }

  factory QueryConsensusStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryConsensusStatesRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
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

  factory QueryConsensusStatesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConsensusStatesRequest(
      clientId: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryConsensusStatesRequest;
  @override
  QueryConsensusStatesResponse onQueryResponse(List<int> bytes) {
    return QueryConsensusStatesResponse.deserialize(bytes);
  }

  @override
  QueryConsensusStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConsensusStatesResponse.fromJson(json);
  }
}

/// QueryConsensusStatesResponse is the response type for the
/// Query/ConsensusStates RPC method
class QueryConsensusStatesResponse extends CosmosProtoMessage {
  /// consensus states associated with the identifier
  final List<ibc_core_client_v1_client.ConsensusStateWithHeight>
  consensusStates;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryConsensusStatesResponse({
    this.consensusStates = const [],
    this.pagination,
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [consensusStates, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'consensus_states': consensusStates.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryConsensusStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryConsensusStatesResponse(
      consensusStates:
          (json.valueEnsureAsList<dynamic>(
                'consensus_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_client_v1_client.ConsensusStateWithHeight,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_client_v1_client
                          .ConsensusStateWithHeight.fromJson(v),
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
    );
  }

  factory QueryConsensusStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConsensusStatesResponse(
      consensusStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_client_v1_client
                    .ConsensusStateWithHeight.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryConsensusStatesResponse;
}

/// QueryConsensusStateHeightsRequest is the request type for Query/ConsensusStateHeights
/// RPC method.
class QueryConsensusStateHeightsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConsensusStateHeightsResponse> {
  /// client identifier
  final String? clientId;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryConsensusStateHeightsRequest({this.clientId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/consensus_states/{client_id}/heights",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'client_id': clientId, 'pagination': pagination?.toJson()};
  }

  factory QueryConsensusStateHeightsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryConsensusStateHeightsRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
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

  factory QueryConsensusStateHeightsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConsensusStateHeightsRequest(
      clientId: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreClientV1QueryConsensusStateHeightsRequest;
  @override
  QueryConsensusStateHeightsResponse onQueryResponse(List<int> bytes) {
    return QueryConsensusStateHeightsResponse.deserialize(bytes);
  }

  @override
  QueryConsensusStateHeightsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryConsensusStateHeightsResponse.fromJson(json);
  }
}

/// QueryConsensusStateHeightsResponse is the response type for the
/// Query/ConsensusStateHeights RPC method
class QueryConsensusStateHeightsResponse extends CosmosProtoMessage {
  /// consensus state heights
  final List<ibc_core_client_v1_client.Height> consensusStateHeights;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryConsensusStateHeightsResponse({
    this.consensusStateHeights = const [],
    this.pagination,
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [consensusStateHeights, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'consensus_state_heights':
          consensusStateHeights.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryConsensusStateHeightsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryConsensusStateHeightsResponse(
      consensusStateHeights:
          (json.valueEnsureAsList<dynamic>(
                'consensus_state_heights',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_client_v1_client.Height,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
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
    );
  }

  factory QueryConsensusStateHeightsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConsensusStateHeightsResponse(
      consensusStateHeights:
          decode
              .getListOfBytes(1)
              .map((b) => ibc_core_client_v1_client.Height.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreClientV1QueryConsensusStateHeightsResponse;
}

/// QueryClientStatusRequest is the request type for the Query/ClientStatus RPC
/// method
class QueryClientStatusRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClientStatusResponse> {
  /// client unique identifier
  final String? clientId;

  const QueryClientStatusRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/client_status/{client_id}",
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

  factory QueryClientStatusRequest.fromJson(Map<String, dynamic> json) {
    return QueryClientStatusRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
    );
  }

  factory QueryClientStatusRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientStatusRequest(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientStatusRequest;
  @override
  QueryClientStatusResponse onQueryResponse(List<int> bytes) {
    return QueryClientStatusResponse.deserialize(bytes);
  }

  @override
  QueryClientStatusResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClientStatusResponse.fromJson(json);
  }
}

/// QueryClientStatusResponse is the response type for the Query/ClientStatus RPC
/// method. It returns the current status of the IBC client.
class QueryClientStatusResponse extends CosmosProtoMessage {
  final String? status;

  const QueryClientStatusResponse({this.status});

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
  List<Object?> get protoValues => [status];

  @override
  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  factory QueryClientStatusResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientStatusResponse(
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
    );
  }

  factory QueryClientStatusResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientStatusResponse(status: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientStatusResponse;
}

/// QueryClientParamsRequest is the request type for the Query/ClientParams RPC
/// method.
class QueryClientParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClientParamsResponse> {
  const QueryClientParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/params",
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

  factory QueryClientParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryClientParamsRequest();
  }

  factory QueryClientParamsRequest.deserialize(List<int> bytes) {
    return QueryClientParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientParamsRequest;
  @override
  QueryClientParamsResponse onQueryResponse(List<int> bytes) {
    return QueryClientParamsResponse.deserialize(bytes);
  }

  @override
  QueryClientParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClientParamsResponse.fromJson(json);
  }
}

/// QueryClientParamsResponse is the response type for the Query/ClientParams RPC
/// method.
class QueryClientParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final ibc_core_client_v1_client.Params? params;

  const QueryClientParamsResponse({this.params});

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

  factory QueryClientParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientParamsResponse(
      params: json
          .valueTo<ibc_core_client_v1_client.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => ibc_core_client_v1_client.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryClientParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientParamsResponse(
      params: decode.messageTo<ibc_core_client_v1_client.Params?>(
        1,
        (b) => ibc_core_client_v1_client.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientParamsResponse;
}

/// QueryClientCreatorRequest is the request type for the Query/ClientCreator RPC
/// method.
class QueryClientCreatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClientCreatorResponse> {
  /// client unique identifier
  final String? clientId;

  const QueryClientCreatorRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/client_creator/{client_id}",
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

  factory QueryClientCreatorRequest.fromJson(Map<String, dynamic> json) {
    return QueryClientCreatorRequest(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
    );
  }

  factory QueryClientCreatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientCreatorRequest(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientCreatorRequest;
  @override
  QueryClientCreatorResponse onQueryResponse(List<int> bytes) {
    return QueryClientCreatorResponse.deserialize(bytes);
  }

  @override
  QueryClientCreatorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClientCreatorResponse.fromJson(json);
  }
}

/// QueryClientCreatorResponse is the response type for the Query/ClientCreator RPC
/// method.
class QueryClientCreatorResponse extends CosmosProtoMessage {
  /// creator of the client
  final String? creator;

  const QueryClientCreatorResponse({this.creator});

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
  List<Object?> get protoValues => [creator];

  @override
  Map<String, dynamic> toJson() {
    return {'creator': creator};
  }

  factory QueryClientCreatorResponse.fromJson(Map<String, dynamic> json) {
    return QueryClientCreatorResponse(
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
    );
  }

  factory QueryClientCreatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClientCreatorResponse(creator: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryClientCreatorResponse;
}

/// QueryUpgradedClientStateRequest is the request type for the
/// Query/UpgradedClientState RPC method
class QueryUpgradedClientStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUpgradedClientStateResponse> {
  const QueryUpgradedClientStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/upgraded_client_states",
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

  factory QueryUpgradedClientStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryUpgradedClientStateRequest();
  }

  factory QueryUpgradedClientStateRequest.deserialize(List<int> bytes) {
    return QueryUpgradedClientStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryUpgradedClientStateRequest;
  @override
  QueryUpgradedClientStateResponse onQueryResponse(List<int> bytes) {
    return QueryUpgradedClientStateResponse.deserialize(bytes);
  }

  @override
  QueryUpgradedClientStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedClientStateResponse.fromJson(json);
  }
}

/// QueryUpgradedClientStateResponse is the response type for the
/// Query/UpgradedClientState RPC method.
class QueryUpgradedClientStateResponse extends CosmosProtoMessage {
  /// client state associated with the request identifier
  final google_protobuf_any.Any? upgradedClientState;

  const QueryUpgradedClientStateResponse({this.upgradedClientState});

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
  List<Object?> get protoValues => [upgradedClientState];

  @override
  Map<String, dynamic> toJson() {
    return {'upgraded_client_state': upgradedClientState?.toJson()};
  }

  factory QueryUpgradedClientStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradedClientStateResponse(
      upgradedClientState: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'upgraded_client_state',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryUpgradedClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradedClientStateResponse(
      upgradedClientState: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryUpgradedClientStateResponse;
}

/// QueryUpgradedConsensusStateRequest is the request type for the
/// Query/UpgradedConsensusState RPC method
class QueryUpgradedConsensusStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUpgradedConsensusStateResponse> {
  const QueryUpgradedConsensusStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/client/v1/upgraded_consensus_states",
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

  factory QueryUpgradedConsensusStateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateRequest();
  }

  factory QueryUpgradedConsensusStateRequest.deserialize(List<int> bytes) {
    return QueryUpgradedConsensusStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreClientV1QueryUpgradedConsensusStateRequest;
  @override
  QueryUpgradedConsensusStateResponse onQueryResponse(List<int> bytes) {
    return QueryUpgradedConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryUpgradedConsensusStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateResponse.fromJson(json);
  }
}

/// QueryUpgradedConsensusStateResponse is the response type for the
/// Query/UpgradedConsensusState RPC method.
class QueryUpgradedConsensusStateResponse extends CosmosProtoMessage {
  /// Consensus state associated with the request identifier
  final google_protobuf_any.Any? upgradedConsensusState;

  const QueryUpgradedConsensusStateResponse({this.upgradedConsensusState});

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
  List<Object?> get protoValues => [upgradedConsensusState];

  @override
  Map<String, dynamic> toJson() {
    return {'upgraded_consensus_state': upgradedConsensusState?.toJson()};
  }

  factory QueryUpgradedConsensusStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'upgraded_consensus_state',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryUpgradedConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreClientV1QueryUpgradedConsensusStateResponse;
}

/// QueryVerifyMembershipRequest is the request type for the Query/VerifyMembership RPC method
class QueryVerifyMembershipRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVerifyMembershipResponse> {
  /// client unique identifier.
  final String? clientId;

  /// the proof to be verified by the client.
  final List<int>? proof;

  /// the height of the commitment root at which the proof is verified.
  final ibc_core_client_v1_client.Height? proofHeight;

  /// reserved: deprecated field.
  /// the value which is proven.
  final List<int>? value;

  /// optional time delay
  final BigInt? timeDelay;

  /// optional block delay
  final BigInt? blockDelay;

  /// the commitment key path.
  final ibc_core_commitment_v2_commitment.MerklePath? merklePath;

  const QueryVerifyMembershipRequest({
    this.clientId,
    this.proof,
    this.proofHeight,
    this.value,
    this.timeDelay,
    this.blockDelay,
    this.merklePath,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/ibc/core/client/v1/verify_membership",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.message(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    proof,
    proofHeight,
    value,
    timeDelay,
    blockDelay,
    merklePath,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'proof': switch (proof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_height': proofHeight?.toJson(),
      'value': switch (value) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'time_delay': timeDelay?.toString(),
      'block_delay': blockDelay?.toString(),
      'merkle_path': merklePath?.toJson(),
    };
  }

  factory QueryVerifyMembershipRequest.fromJson(Map<String, dynamic> json) {
    return QueryVerifyMembershipRequest(
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
      value: json.valueAsBytes<List<int>?>(
        'value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      timeDelay: json.valueAsBigInt<BigInt?>(
        'time_delay',
        acceptCamelCase: true,
      ),
      blockDelay: json.valueAsBigInt<BigInt?>(
        'block_delay',
        acceptCamelCase: true,
      ),
      merklePath: json.valueTo<
        ibc_core_commitment_v2_commitment.MerklePath?,
        Map<String, dynamic>
      >(
        key: 'merkle_path',
        parse: (v) => ibc_core_commitment_v2_commitment.MerklePath.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVerifyMembershipRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVerifyMembershipRequest(
      clientId: decode.getString<String?>(1),
      proof: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      value: decode.getBytes<List<int>?>(5),
      timeDelay: decode.getBigInt<BigInt?>(6),
      blockDelay: decode.getBigInt<BigInt?>(7),
      merklePath: decode
          .messageTo<ibc_core_commitment_v2_commitment.MerklePath?>(
            8,
            (b) => ibc_core_commitment_v2_commitment.MerklePath.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryVerifyMembershipRequest;
  @override
  QueryVerifyMembershipResponse onQueryResponse(List<int> bytes) {
    return QueryVerifyMembershipResponse.deserialize(bytes);
  }

  @override
  QueryVerifyMembershipResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVerifyMembershipResponse.fromJson(json);
  }
}

/// QueryVerifyMembershipResponse is the response type for the Query/VerifyMembership RPC method
class QueryVerifyMembershipResponse extends CosmosProtoMessage {
  /// boolean indicating success or failure of proof verification.
  final bool? success;

  const QueryVerifyMembershipResponse({this.success});

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
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success};
  }

  factory QueryVerifyMembershipResponse.fromJson(Map<String, dynamic> json) {
    return QueryVerifyMembershipResponse(
      success: json.valueAsBool<bool?>('success', acceptCamelCase: true),
    );
  }

  factory QueryVerifyMembershipResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVerifyMembershipResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1QueryVerifyMembershipResponse;
}
