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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId};
  }

  factory QueryClientStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientStateRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  final BuBytes? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  QueryClientStateResponse({
    this.clientState,
    List<int>? proof,
    this.proofHeight,
  }) : proof = proof?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_state': config.encodeMessage(clientState),
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory QueryClientStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientStateResponse(
      clientState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'client_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proof: config.decodeBinary<List<int>?>(
        json.valueAs('proof', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryClientStatesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientStatesRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_states':
          clientStates.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryClientStatesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientStatesResponse(
      clientStates:
          (json.valueEnsureAsList<dynamic>(
                'client_states',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_client_v1_client.IdentifiedClientState,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_client_v1_client
                          .IdentifiedClientState.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'revision_number': config.encodeBigint(revisionNumber),
      'revision_height': config.encodeBigint(revisionHeight),
      'latest_height': latestHeight,
    };
  }

  factory QueryConsensusStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConsensusStateRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      revisionNumber: json.valueAsBigInt<BigInt?>(
        'revision_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      revisionHeight: json.valueAsBigInt<BigInt?>(
        'revision_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      latestHeight: json.valueAsBool<bool?>(
        'latest_height',
        normalizeKeyLookup: config.normalizeKeys,
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
  final BuBytes? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  QueryConsensusStateResponse({
    this.consensusState,
    List<int>? proof,
    this.proofHeight,
  }) : proof = proof?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'consensus_state': config.encodeMessage(consensusState),
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory QueryConsensusStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConsensusStateResponse(
      consensusState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'consensus_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proof: config.decodeBinary<List<int>?>(
        json.valueAs('proof', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryConsensusStatesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConsensusStatesRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'consensus_states':
          consensusStates.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryConsensusStatesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConsensusStatesResponse(
      consensusStates:
          (json.valueEnsureAsList<dynamic>(
                'consensus_states',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_client_v1_client.ConsensusStateWithHeight,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_client_v1_client
                          .ConsensusStateWithHeight.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryConsensusStateHeightsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConsensusStateHeightsRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'consensus_state_heights':
          consensusStateHeights.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryConsensusStateHeightsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConsensusStateHeightsResponse(
      consensusStateHeights:
          (json.valueEnsureAsList<dynamic>(
                'consensus_state_heights',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_client_v1_client.Height,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_client_v1_client.Height.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId};
  }

  factory QueryClientStatusRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientStatusRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'status': status};
  }

  factory QueryClientStatusResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientStatusResponse(
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryClientParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryClientParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientParamsResponse(
      params: json.valueTo<ibc_core_client_v1_client.Params?, Object>(
        key: 'params',
        parse:
            (v) => ibc_core_client_v1_client.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId};
  }

  factory QueryClientCreatorRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientCreatorRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'creator': creator};
  }

  factory QueryClientCreatorResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryClientCreatorResponse(
      creator: json.valueAsString<String?>(
        'creator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryUpgradedClientStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'upgraded_client_state': config.encodeMessage(upgradedClientState)};
  }

  factory QueryUpgradedClientStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUpgradedClientStateResponse(
      upgradedClientState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'upgraded_client_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryUpgradedConsensusStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'upgraded_consensus_state': config.encodeMessage(upgradedConsensusState),
    };
  }

  factory QueryUpgradedConsensusStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'upgraded_consensus_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
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
  final BuBytes? proof;

  /// the height of the commitment root at which the proof is verified.
  final ibc_core_client_v1_client.Height? proofHeight;

  /// reserved: deprecated field.
  /// the value which is proven.
  final BuBytes? value;

  /// optional time delay
  final BigInt? timeDelay;

  /// optional block delay
  final BigInt? blockDelay;

  /// the commitment key path.
  final ibc_core_commitment_v2_commitment.MerklePath? merklePath;

  QueryVerifyMembershipRequest({
    this.clientId,
    List<int>? proof,
    this.proofHeight,
    List<int>? value,
    this.timeDelay,
    this.blockDelay,
    this.merklePath,
  }) : proof = proof?.asImmutableBytes,
       value = value?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
      'value': config.encodeBinary(value),
      'time_delay': config.encodeBigint(timeDelay),
      'block_delay': config.encodeBigint(blockDelay),
      'merkle_path': config.encodeMessage(merklePath),
    };
  }

  factory QueryVerifyMembershipRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryVerifyMembershipRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proof: config.decodeBinary<List<int>?>(
        json.valueAs('proof', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
      ),
      timeDelay: json.valueAsBigInt<BigInt?>(
        'time_delay',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockDelay: json.valueAsBigInt<BigInt?>(
        'block_delay',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      merklePath: json
          .valueTo<ibc_core_commitment_v2_commitment.MerklePath?, Object>(
            key: 'merkle_path',
            parse:
                (v) => ibc_core_commitment_v2_commitment.MerklePath.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'success': success};
  }

  factory QueryVerifyMembershipResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryVerifyMembershipResponse(
      success: json.valueAsBool<bool?>(
        'success',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
