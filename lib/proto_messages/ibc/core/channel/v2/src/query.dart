import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/ibc/core/channel/v2/src/genesis.dart"
    as ibc_core_channel_v2_genesis;

/// QueryNextSequenceSendRequest is the request type for the Query/QueryNextSequenceSend RPC method
class QueryNextSequenceSendRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNextSequenceSendResponse> {
  /// client unique identifier
  final String? clientId;

  const QueryNextSequenceSendRequest({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/channel/v2/clients/{client_id}/next_sequence_send",
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

  factory QueryNextSequenceSendRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNextSequenceSendRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNextSequenceSendRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextSequenceSendRequest(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryNextSequenceSendRequest;
  @override
  QueryNextSequenceSendResponse onQueryResponse(List<int> bytes) {
    return QueryNextSequenceSendResponse.deserialize(bytes);
  }

  @override
  QueryNextSequenceSendResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNextSequenceSendResponse.fromJson(json);
  }
}

/// QueryNextSequenceSendResponse is the response type for the Query/QueryNextSequenceSend RPC method
class QueryNextSequenceSendResponse extends CosmosProtoMessage {
  /// next sequence send number
  final BigInt? nextSequenceSend;

  /// merkle proof of existence
  final BuBytes? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  QueryNextSequenceSendResponse({
    this.nextSequenceSend,
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
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nextSequenceSend, proof, proofHeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'next_sequence_send': config.encodeBigint(nextSequenceSend),
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory QueryNextSequenceSendResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNextSequenceSendResponse(
      nextSequenceSend: json.valueAsBigInt<BigInt?>(
        'next_sequence_send',
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

  factory QueryNextSequenceSendResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextSequenceSendResponse(
      nextSequenceSend: decode.getBigInt<BigInt?>(1),
      proof: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryNextSequenceSendResponse;
}

/// QueryPacketCommitmentRequest is the request type for the Query/PacketCommitment RPC method.
class QueryPacketCommitmentRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketCommitmentResponse> {
  /// client unique identifier
  final String? clientId;

  /// packet sequence
  final BigInt? sequence;

  const QueryPacketCommitmentRequest({this.clientId, this.sequence});

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
              "/ibc/core/channel/v2/clients/{client_id}/packet_commitments/{sequence}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId, 'sequence': config.encodeBigint(sequence)};
  }

  factory QueryPacketCommitmentRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketCommitmentRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPacketCommitmentRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentRequest(
      clientId: decode.getString<String?>(1),
      sequence: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryPacketCommitmentRequest;
  @override
  QueryPacketCommitmentResponse onQueryResponse(List<int> bytes) {
    return QueryPacketCommitmentResponse.deserialize(bytes);
  }

  @override
  QueryPacketCommitmentResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPacketCommitmentResponse.fromJson(json);
  }
}

/// QueryPacketCommitmentResponse is the response type for the Query/PacketCommitment RPC method.
class QueryPacketCommitmentResponse extends CosmosProtoMessage {
  /// packet associated with the request fields
  final BuBytes? commitment;

  /// merkle proof of existence
  final BuBytes? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  QueryPacketCommitmentResponse({
    List<int>? commitment,
    List<int>? proof,
    this.proofHeight,
  }) : commitment = commitment?.asImmutableBytes,
       proof = proof?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [commitment, proof, proofHeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'commitment': config.encodeBinary(commitment),
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory QueryPacketCommitmentResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketCommitmentResponse(
      commitment: config.decodeBinary<List<int>?>(
        json.valueAs('commitment', normalizeKeyLookup: config.normalizeKeys),
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

  factory QueryPacketCommitmentResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentResponse(
      commitment: decode.getBytes<List<int>?>(1),
      proof: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryPacketCommitmentResponse;
}

/// QueryPacketCommitmentsRequest is the request type for the Query/PacketCommitments RPC method.
class QueryPacketCommitmentsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketCommitmentsResponse> {
  /// client unique identifier
  final String? clientId;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryPacketCommitmentsRequest({this.clientId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/channel/v2/clients/{client_id}/packet_commitments",
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

  factory QueryPacketCommitmentsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketCommitmentsRequest(
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

  factory QueryPacketCommitmentsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentsRequest(
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryPacketCommitmentsRequest;
  @override
  QueryPacketCommitmentsResponse onQueryResponse(List<int> bytes) {
    return QueryPacketCommitmentsResponse.deserialize(bytes);
  }

  @override
  QueryPacketCommitmentsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketCommitmentsResponse.fromJson(json);
  }
}

/// QueryPacketCommitmentResponse is the response type for the Query/PacketCommitment RPC method.
class QueryPacketCommitmentsResponse extends CosmosProtoMessage {
  /// collection of packet commitments for the requested channel identifier.
  final List<ibc_core_channel_v2_genesis.PacketState> commitments;

  /// pagination response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// query block height.
  final ibc_core_client_v1_client.Height? height;

  const QueryPacketCommitmentsResponse({
    this.commitments = const [],
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
  List<Object?> get protoValues => [commitments, pagination, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'commitments': commitments.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
      'height': config.encodeMessage(height),
    };
  }

  factory QueryPacketCommitmentsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketCommitmentsResponse(
      commitments:
          (json.valueEnsureAsList<dynamic>(
                'commitments',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v2_genesis.PacketState,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_channel_v2_genesis.PacketState.fromJson(
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
      height: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPacketCommitmentsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentsResponse(
      commitments:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_channel_v2_genesis.PacketState.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryPacketCommitmentsResponse;
}

/// QueryPacketAcknowledgementRequest is the request type for the Query/PacketAcknowledgement RPC method.
class QueryPacketAcknowledgementRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketAcknowledgementResponse> {
  /// client unique identifier
  final String? clientId;

  /// packet sequence
  final BigInt? sequence;

  const QueryPacketAcknowledgementRequest({this.clientId, this.sequence});

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
              "/ibc/core/channel/v2/clients/{client_id}/packet_acks/{sequence}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId, 'sequence': config.encodeBigint(sequence)};
  }

  factory QueryPacketAcknowledgementRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketAcknowledgementRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPacketAcknowledgementRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementRequest(
      clientId: decode.getString<String?>(1),
      sequence: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreChannelV2QueryPacketAcknowledgementRequest;
  @override
  QueryPacketAcknowledgementResponse onQueryResponse(List<int> bytes) {
    return QueryPacketAcknowledgementResponse.deserialize(bytes);
  }

  @override
  QueryPacketAcknowledgementResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketAcknowledgementResponse.fromJson(json);
  }
}

/// QueryPacketAcknowledgementResponse is the response type for the Query/PacketAcknowledgement RPC method.
class QueryPacketAcknowledgementResponse extends CosmosProtoMessage {
  /// acknowledgement associated with the request fields
  final BuBytes? acknowledgement;

  /// merkle proof of existence
  final BuBytes? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  QueryPacketAcknowledgementResponse({
    List<int>? acknowledgement,
    List<int>? proof,
    this.proofHeight,
  }) : acknowledgement = acknowledgement?.asImmutableBytes,
       proof = proof?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [acknowledgement, proof, proofHeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'acknowledgement': config.encodeBinary(acknowledgement),
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory QueryPacketAcknowledgementResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketAcknowledgementResponse(
      acknowledgement: config.decodeBinary<List<int>?>(
        json.valueAs(
          'acknowledgement',
          normalizeKeyLookup: config.normalizeKeys,
        ),
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

  factory QueryPacketAcknowledgementResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementResponse(
      acknowledgement: decode.getBytes<List<int>?>(1),
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
          .ibcCoreChannelV2QueryPacketAcknowledgementResponse;
}

/// QueryPacketAcknowledgementsRequest is the request type for the
/// Query/QueryPacketCommitments RPC method
class QueryPacketAcknowledgementsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketAcknowledgementsResponse> {
  /// client unique identifier
  final String? clientId;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  /// list of packet sequences
  final List<BigInt> packetCommitmentSequences;

  const QueryPacketAcknowledgementsRequest({
    this.clientId,
    this.pagination,
    this.packetCommitmentSequences = const [],
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
              "/ibc/core/channel/v2/clients/{client_id}/packet_acknowledgements",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    pagination,
    packetCommitmentSequences,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'pagination': config.encodeMessage(pagination),
      'packet_commitment_sequences':
          packetCommitmentSequences.map((e) => config.encodeBigint(e)).toList(),
    };
  }

  factory QueryPacketAcknowledgementsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketAcknowledgementsRequest(
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
      packetCommitmentSequences:
          (json.valueEnsureAsList<dynamic>(
            'packet_commitment_sequences',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryPacketAcknowledgementsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementsRequest(
      clientId: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
      packetCommitmentSequences: decode.getListOrEmpty<BigInt>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreChannelV2QueryPacketAcknowledgementsRequest;
  @override
  QueryPacketAcknowledgementsResponse onQueryResponse(List<int> bytes) {
    return QueryPacketAcknowledgementsResponse.deserialize(bytes);
  }

  @override
  QueryPacketAcknowledgementsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketAcknowledgementsResponse.fromJson(json);
  }
}

/// QueryPacketAcknowledgemetsResponse is the request type for the
/// Query/QueryPacketAcknowledgements RPC method
class QueryPacketAcknowledgementsResponse extends CosmosProtoMessage {
  final List<ibc_core_channel_v2_genesis.PacketState> acknowledgements;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// query block height
  final ibc_core_client_v1_client.Height? height;

  const QueryPacketAcknowledgementsResponse({
    this.acknowledgements = const [],
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
  List<Object?> get protoValues => [acknowledgements, pagination, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'acknowledgements':
          acknowledgements.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
      'height': config.encodeMessage(height),
    };
  }

  factory QueryPacketAcknowledgementsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketAcknowledgementsResponse(
      acknowledgements:
          (json.valueEnsureAsList<dynamic>(
                'acknowledgements',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v2_genesis.PacketState,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_channel_v2_genesis.PacketState.fromJson(
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
      height: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPacketAcknowledgementsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementsResponse(
      acknowledgements:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_channel_v2_genesis.PacketState.deserialize(b),
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
      DefaultCosmosProtoTypeUrl
          .ibcCoreChannelV2QueryPacketAcknowledgementsResponse;
}

/// QueryPacketReceiptRequest is the request type for the Query/PacketReceipt RPC method.
class QueryPacketReceiptRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketReceiptResponse> {
  /// client unique identifier
  final String? clientId;

  /// packet sequence
  final BigInt? sequence;

  const QueryPacketReceiptRequest({this.clientId, this.sequence});

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
              "/ibc/core/channel/v2/clients/{client_id}/packet_receipts/{sequence}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId, 'sequence': config.encodeBigint(sequence)};
  }

  factory QueryPacketReceiptRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketReceiptRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPacketReceiptRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketReceiptRequest(
      clientId: decode.getString<String?>(1),
      sequence: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryPacketReceiptRequest;
  @override
  QueryPacketReceiptResponse onQueryResponse(List<int> bytes) {
    return QueryPacketReceiptResponse.deserialize(bytes);
  }

  @override
  QueryPacketReceiptResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPacketReceiptResponse.fromJson(json);
  }
}

/// QueryPacketReceiptResponse is the response type for the Query/PacketReceipt RPC method.
class QueryPacketReceiptResponse extends CosmosProtoMessage {
  /// success flag for if receipt exists
  final bool? received;

  /// merkle proof of existence or absence
  final BuBytes? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  QueryPacketReceiptResponse({
    this.received,
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
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [received, proof, proofHeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'received': received,
      'proof': config.encodeBinary(proof),
      'proof_height': config.encodeMessage(proofHeight),
    };
  }

  factory QueryPacketReceiptResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPacketReceiptResponse(
      received: json.valueAsBool<bool?>(
        'received',
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

  factory QueryPacketReceiptResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketReceiptResponse(
      received: decode.getBool<bool?>(2),
      proof: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryPacketReceiptResponse;
}

/// QueryUnreceivedPacketsRequest is the request type for the Query/UnreceivedPackets RPC method
class QueryUnreceivedPacketsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnreceivedPacketsResponse> {
  /// client unique identifier
  final String? clientId;

  /// list of packet sequences
  final List<BigInt> sequences;

  const QueryUnreceivedPacketsRequest({
    this.clientId,
    this.sequences = const [],
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
              "/ibc/core/channel/v2/clients/{client_id}/packet_commitments/{sequences}/unreceived_packets",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, sequences];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'sequences': sequences.map((e) => config.encodeBigint(e)).toList(),
    };
  }

  factory QueryUnreceivedPacketsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUnreceivedPacketsRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequences:
          (json.valueEnsureAsList<dynamic>(
            'sequences',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryUnreceivedPacketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnreceivedPacketsRequest(
      clientId: decode.getString<String?>(1),
      sequences: decode.getListOrEmpty<BigInt>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryUnreceivedPacketsRequest;
  @override
  QueryUnreceivedPacketsResponse onQueryResponse(List<int> bytes) {
    return QueryUnreceivedPacketsResponse.deserialize(bytes);
  }

  @override
  QueryUnreceivedPacketsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryUnreceivedPacketsResponse.fromJson(json);
  }
}

/// QueryUnreceivedPacketsResponse is the response type for the Query/UnreceivedPacketCommitments RPC method
class QueryUnreceivedPacketsResponse extends CosmosProtoMessage {
  /// list of unreceived packet sequences
  final List<BigInt> sequences;

  /// query block height
  final ibc_core_client_v1_client.Height? height;

  const QueryUnreceivedPacketsResponse({
    this.sequences = const [],
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
          elementType: ProtoFieldType.uint64,
        ),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sequences, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sequences': sequences.map((e) => config.encodeBigint(e)).toList(),
      'height': config.encodeMessage(height),
    };
  }

  factory QueryUnreceivedPacketsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUnreceivedPacketsResponse(
      sequences:
          (json.valueEnsureAsList<dynamic>(
            'sequences',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      height: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryUnreceivedPacketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnreceivedPacketsResponse(
      sequences: decode.getListOrEmpty<BigInt>(1),
      height: decode.messageTo<ibc_core_client_v1_client.Height?>(
        2,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryUnreceivedPacketsResponse;
}

/// QueryUnreceivedAcks is the request type for the
/// Query/UnreceivedAcks RPC method
class QueryUnreceivedAcksRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnreceivedAcksResponse> {
  /// client unique identifier
  final String? clientId;

  /// list of acknowledgement sequences
  final List<BigInt> packetAckSequences;

  const QueryUnreceivedAcksRequest({
    this.clientId,
    this.packetAckSequences = const [],
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
              "/ibc/core/channel/v2/clients/{client_id}/packet_commitments/{packet_ack_sequences}/unreceived_acks",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, packetAckSequences];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'packet_ack_sequences':
          packetAckSequences.map((e) => config.encodeBigint(e)).toList(),
    };
  }

  factory QueryUnreceivedAcksRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUnreceivedAcksRequest(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      packetAckSequences:
          (json.valueEnsureAsList<dynamic>(
            'packet_ack_sequences',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryUnreceivedAcksRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnreceivedAcksRequest(
      clientId: decode.getString<String?>(1),
      packetAckSequences: decode.getListOrEmpty<BigInt>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryUnreceivedAcksRequest;
  @override
  QueryUnreceivedAcksResponse onQueryResponse(List<int> bytes) {
    return QueryUnreceivedAcksResponse.deserialize(bytes);
  }

  @override
  QueryUnreceivedAcksResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUnreceivedAcksResponse.fromJson(json);
  }
}

/// QueryUnreceivedAcksResponse is the response type for the
/// Query/UnreceivedAcks RPC method
class QueryUnreceivedAcksResponse extends CosmosProtoMessage {
  /// list of unreceived acknowledgement sequences
  final List<BigInt> sequences;

  /// query block height
  final ibc_core_client_v1_client.Height? height;

  const QueryUnreceivedAcksResponse({this.sequences = const [], this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
        ),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sequences, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sequences': sequences.map((e) => config.encodeBigint(e)).toList(),
      'height': config.encodeMessage(height),
    };
  }

  factory QueryUnreceivedAcksResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUnreceivedAcksResponse(
      sequences:
          (json.valueEnsureAsList<dynamic>(
            'sequences',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      height: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryUnreceivedAcksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnreceivedAcksResponse(
      sequences: decode.getListOrEmpty<BigInt>(1),
      height: decode.messageTo<ibc_core_client_v1_client.Height?>(
        2,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2QueryUnreceivedAcksResponse;
}
