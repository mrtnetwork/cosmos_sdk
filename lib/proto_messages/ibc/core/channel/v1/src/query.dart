import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/channel/v1/src/channel.dart"
    as ibc_core_channel_v1_channel;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// QueryChannelRequest is the request type for the Query/Channel RPC method
class QueryChannelRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryChannelResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  const QueryChannelRequest({this.portId, this.channelId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory QueryChannelRequest.fromJson(Map<String, dynamic> json) {
    return QueryChannelRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryChannelRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryChannelRequest;
  @override
  QueryChannelResponse onQueryResponse(List<int> bytes) {
    return QueryChannelResponse.deserialize(bytes);
  }

  @override
  QueryChannelResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryChannelResponse.fromJson(json);
  }
}

/// QueryChannelResponse is the response type for the Query/Channel RPC method.
/// Besides the Channel end, it includes a proof and the height from which the
/// proof was retrieved.
class QueryChannelResponse extends CosmosProtoMessage {
  /// channel associated with the request identifiers
  final ibc_core_channel_v1_channel.Channel? channel;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryChannelResponse({this.channel, this.proof, this.proofHeight});

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
  List<Object?> get protoValues => [channel, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'channel': channel?.toJson(),
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

  factory QueryChannelResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelResponse(
      channel: json
          .valueTo<ibc_core_channel_v1_channel.Channel?, Map<String, dynamic>>(
            key: 'channel',
            parse: (v) => ibc_core_channel_v1_channel.Channel.fromJson(v),
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

  factory QueryChannelResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelResponse(
      channel: decode.messageTo<ibc_core_channel_v1_channel.Channel?>(
        1,
        (b) => ibc_core_channel_v1_channel.Channel.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryChannelResponse;
}

/// QueryChannelsRequest is the request type for the Query/Channels RPC method
class QueryChannelsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryChannelsResponse> {
  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryChannelsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/channel/v1/channels",
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

  factory QueryChannelsRequest.fromJson(Map<String, dynamic> json) {
    return QueryChannelsRequest(
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

  factory QueryChannelsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelsRequest(
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryChannelsRequest;
  @override
  QueryChannelsResponse onQueryResponse(List<int> bytes) {
    return QueryChannelsResponse.deserialize(bytes);
  }

  @override
  QueryChannelsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryChannelsResponse.fromJson(json);
  }
}

/// QueryChannelsResponse is the response type for the Query/Channels RPC method.
class QueryChannelsResponse extends CosmosProtoMessage {
  /// list of stored channels of the chain.
  final List<ibc_core_channel_v1_channel.IdentifiedChannel> channels;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// query block height
  final ibc_core_client_v1_client.Height? height;

  const QueryChannelsResponse({
    this.channels = const [],
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
  List<Object?> get protoValues => [channels, pagination, height];

  @override
  Map<String, dynamic> toJson() {
    return {
      'channels': channels.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'height': height?.toJson(),
    };
  }

  factory QueryChannelsResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelsResponse(
      channels:
          (json.valueEnsureAsList<dynamic>('channels', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v1_channel.IdentifiedChannel,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_channel_v1_channel
                          .IdentifiedChannel.fromJson(v),
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

  factory QueryChannelsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelsResponse(
      channels:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_channel_v1_channel
                    .IdentifiedChannel.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryChannelsResponse;
}

/// QueryConnectionChannelsRequest is the request type for the
/// Query/QueryConnectionChannels RPC method
class QueryConnectionChannelsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConnectionChannelsResponse> {
  /// connection unique identifier
  final String? connection;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryConnectionChannelsRequest({this.connection, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/core/channel/v1/connections/{connection}/channels",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [connection, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'connection': connection, 'pagination': pagination?.toJson()};
  }

  factory QueryConnectionChannelsRequest.fromJson(Map<String, dynamic> json) {
    return QueryConnectionChannelsRequest(
      connection: json.valueAsString<String?>(
        'connection',
        acceptCamelCase: true,
      ),
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

  factory QueryConnectionChannelsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionChannelsRequest(
      connection: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryConnectionChannelsRequest;
  @override
  QueryConnectionChannelsResponse onQueryResponse(List<int> bytes) {
    return QueryConnectionChannelsResponse.deserialize(bytes);
  }

  @override
  QueryConnectionChannelsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryConnectionChannelsResponse.fromJson(json);
  }
}

/// QueryConnectionChannelsResponse is the Response type for the
/// Query/QueryConnectionChannels RPC method
class QueryConnectionChannelsResponse extends CosmosProtoMessage {
  /// list of channels associated with a connection.
  final List<ibc_core_channel_v1_channel.IdentifiedChannel> channels;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// query block height
  final ibc_core_client_v1_client.Height? height;

  const QueryConnectionChannelsResponse({
    this.channels = const [],
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
  List<Object?> get protoValues => [channels, pagination, height];

  @override
  Map<String, dynamic> toJson() {
    return {
      'channels': channels.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'height': height?.toJson(),
    };
  }

  factory QueryConnectionChannelsResponse.fromJson(Map<String, dynamic> json) {
    return QueryConnectionChannelsResponse(
      channels:
          (json.valueEnsureAsList<dynamic>('channels', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v1_channel.IdentifiedChannel,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_core_channel_v1_channel
                          .IdentifiedChannel.fromJson(v),
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

  factory QueryConnectionChannelsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConnectionChannelsResponse(
      channels:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_channel_v1_channel
                    .IdentifiedChannel.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryConnectionChannelsResponse;
}

/// QueryChannelClientStateRequest is the request type for the Query/ClientState
/// RPC method
class QueryChannelClientStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryChannelClientStateResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  const QueryChannelClientStateRequest({this.portId, this.channelId});

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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/client_state",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory QueryChannelClientStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryChannelClientStateRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryChannelClientStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelClientStateRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryChannelClientStateRequest;
  @override
  QueryChannelClientStateResponse onQueryResponse(List<int> bytes) {
    return QueryChannelClientStateResponse.deserialize(bytes);
  }

  @override
  QueryChannelClientStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryChannelClientStateResponse.fromJson(json);
  }
}

/// QueryChannelClientStateResponse is the Response type for the
/// Query/QueryChannelClientState RPC method
class QueryChannelClientStateResponse extends CosmosProtoMessage {
  /// client state associated with the channel
  final ibc_core_client_v1_client.IdentifiedClientState? identifiedClientState;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryChannelClientStateResponse({
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

  factory QueryChannelClientStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelClientStateResponse(
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

  factory QueryChannelClientStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelClientStateResponse(
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryChannelClientStateResponse;
}

/// QueryChannelConsensusStateRequest is the request type for the
/// Query/ConsensusState RPC method
class QueryChannelConsensusStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryChannelConsensusStateResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// revision number of the consensus state
  final BigInt? revisionNumber;

  /// revision height of the consensus state
  final BigInt? revisionHeight;

  const QueryChannelConsensusStateRequest({
    this.portId,
    this.channelId,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/consensus_state/revision/{revision_number}/height/{revision_height}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    channelId,
    revisionNumber,
    revisionHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'revision_number': revisionNumber?.toString(),
      'revision_height': revisionHeight?.toString(),
    };
  }

  factory QueryChannelConsensusStateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryChannelConsensusStateRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
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

  factory QueryChannelConsensusStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelConsensusStateRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      revisionNumber: decode.getBigInt<BigInt?>(3),
      revisionHeight: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreChannelV1QueryChannelConsensusStateRequest;
  @override
  QueryChannelConsensusStateResponse onQueryResponse(List<int> bytes) {
    return QueryChannelConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryChannelConsensusStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryChannelConsensusStateResponse.fromJson(json);
  }
}

/// QueryChannelClientStateResponse is the Response type for the
/// Query/QueryChannelClientState RPC method
class QueryChannelConsensusStateResponse extends CosmosProtoMessage {
  /// consensus state associated with the channel
  final google_protobuf_any.Any? consensusState;

  /// client ID associated with the consensus state
  final String? clientId;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryChannelConsensusStateResponse({
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

  factory QueryChannelConsensusStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryChannelConsensusStateResponse(
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

  factory QueryChannelConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelConsensusStateResponse(
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
          .ibcCoreChannelV1QueryChannelConsensusStateResponse;
}

/// QueryPacketCommitmentRequest is the request type for the
/// Query/PacketCommitment RPC method
class QueryPacketCommitmentRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketCommitmentResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// packet sequence
  final BigInt? sequence;

  const QueryPacketCommitmentRequest({
    this.portId,
    this.channelId,
    this.sequence,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_commitments/{sequence}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'sequence': sequence?.toString(),
    };
  }

  factory QueryPacketCommitmentRequest.fromJson(Map<String, dynamic> json) {
    return QueryPacketCommitmentRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory QueryPacketCommitmentRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      sequence: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryPacketCommitmentRequest;
  @override
  QueryPacketCommitmentResponse onQueryResponse(List<int> bytes) {
    return QueryPacketCommitmentResponse.deserialize(bytes);
  }

  @override
  QueryPacketCommitmentResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPacketCommitmentResponse.fromJson(json);
  }
}

/// QueryPacketCommitmentResponse defines the client query response for a packet
/// which also includes a proof and the height from which the proof was
/// retrieved
class QueryPacketCommitmentResponse extends CosmosProtoMessage {
  /// packet associated with the request fields
  final List<int>? commitment;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryPacketCommitmentResponse({
    this.commitment,
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
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [commitment, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'commitment': switch (commitment) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
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

  factory QueryPacketCommitmentResponse.fromJson(Map<String, dynamic> json) {
    return QueryPacketCommitmentResponse(
      commitment: json.valueAsBytes<List<int>?>(
        'commitment',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryPacketCommitmentResponse;
}

/// QueryPacketCommitmentsRequest is the request type for the
/// Query/QueryPacketCommitments RPC method
class QueryPacketCommitmentsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketCommitmentsResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryPacketCommitmentsRequest({
    this.portId,
    this.channelId,
    this.pagination,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_commitments",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryPacketCommitmentsRequest.fromJson(Map<String, dynamic> json) {
    return QueryPacketCommitmentsRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
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

  factory QueryPacketCommitmentsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentsRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            3,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryPacketCommitmentsRequest;
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

/// QueryPacketCommitmentsResponse is the request type for the
/// Query/QueryPacketCommitments RPC method
class QueryPacketCommitmentsResponse extends CosmosProtoMessage {
  final List<ibc_core_channel_v1_channel.PacketState> commitments;

  /// pagination response
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// query block height
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
  Map<String, dynamic> toJson() {
    return {
      'commitments': commitments.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'height': height?.toJson(),
    };
  }

  factory QueryPacketCommitmentsResponse.fromJson(Map<String, dynamic> json) {
    return QueryPacketCommitmentsResponse(
      commitments:
          (json.valueEnsureAsList<dynamic>(
                'commitments',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v1_channel.PacketState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          ibc_core_channel_v1_channel.PacketState.fromJson(v),
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

  factory QueryPacketCommitmentsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketCommitmentsResponse(
      commitments:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_channel_v1_channel.PacketState.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryPacketCommitmentsResponse;
}

/// QueryPacketReceiptRequest is the request type for the
/// Query/PacketReceipt RPC method
class QueryPacketReceiptRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketReceiptResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// packet sequence
  final BigInt? sequence;

  const QueryPacketReceiptRequest({this.portId, this.channelId, this.sequence});

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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_receipts/{sequence}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'sequence': sequence?.toString(),
    };
  }

  factory QueryPacketReceiptRequest.fromJson(Map<String, dynamic> json) {
    return QueryPacketReceiptRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory QueryPacketReceiptRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketReceiptRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      sequence: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryPacketReceiptRequest;
  @override
  QueryPacketReceiptResponse onQueryResponse(List<int> bytes) {
    return QueryPacketReceiptResponse.deserialize(bytes);
  }

  @override
  QueryPacketReceiptResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPacketReceiptResponse.fromJson(json);
  }
}

/// QueryPacketReceiptResponse defines the client query response for a packet
/// receipt which also includes a proof, and the height from which the proof was
/// retrieved
class QueryPacketReceiptResponse extends CosmosProtoMessage {
  /// success flag for if receipt exists
  final bool? received;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryPacketReceiptResponse({
    this.received,
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
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [received, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'received': received,
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

  factory QueryPacketReceiptResponse.fromJson(Map<String, dynamic> json) {
    return QueryPacketReceiptResponse(
      received: json.valueAsBool<bool?>('received', acceptCamelCase: true),
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryPacketReceiptResponse;
}

/// QueryPacketAcknowledgementRequest is the request type for the
/// Query/PacketAcknowledgement RPC method
class QueryPacketAcknowledgementRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketAcknowledgementResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// packet sequence
  final BigInt? sequence;

  const QueryPacketAcknowledgementRequest({
    this.portId,
    this.channelId,
    this.sequence,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_acks/{sequence}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'sequence': sequence?.toString(),
    };
  }

  factory QueryPacketAcknowledgementRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketAcknowledgementRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory QueryPacketAcknowledgementRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      sequence: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreChannelV1QueryPacketAcknowledgementRequest;
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

/// QueryPacketAcknowledgementResponse defines the client query response for a
/// packet which also includes a proof and the height from which the
/// proof was retrieved
class QueryPacketAcknowledgementResponse extends CosmosProtoMessage {
  /// packet associated with the request fields
  final List<int>? acknowledgement;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryPacketAcknowledgementResponse({
    this.acknowledgement,
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
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [acknowledgement, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'acknowledgement': switch (acknowledgement) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
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

  factory QueryPacketAcknowledgementResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketAcknowledgementResponse(
      acknowledgement: json.valueAsBytes<List<int>?>(
        'acknowledgement',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
          .ibcCoreChannelV1QueryPacketAcknowledgementResponse;
}

/// QueryPacketAcknowledgementsRequest is the request type for the
/// Query/QueryPacketCommitments RPC method
class QueryPacketAcknowledgementsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPacketAcknowledgementsResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// pagination request
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  /// list of packet sequences
  final List<BigInt> packetCommitmentSequences;

  const QueryPacketAcknowledgementsRequest({
    this.portId,
    this.channelId,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_acknowledgements",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    channelId,
    pagination,
    packetCommitmentSequences,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'pagination': pagination?.toJson(),
      'packet_commitment_sequences':
          packetCommitmentSequences.map((e) => e.toString()).toList(),
    };
  }

  factory QueryPacketAcknowledgementsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketAcknowledgementsRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
      packetCommitmentSequences:
          (json.valueEnsureAsList<dynamic>(
            'packet_commitment_sequences',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryPacketAcknowledgementsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementsRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            3,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
      packetCommitmentSequences: decode.getListOrEmpty<BigInt>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcCoreChannelV1QueryPacketAcknowledgementsRequest;
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
  final List<ibc_core_channel_v1_channel.PacketState> acknowledgements;

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
  Map<String, dynamic> toJson() {
    return {
      'acknowledgements': acknowledgements.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'height': height?.toJson(),
    };
  }

  factory QueryPacketAcknowledgementsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPacketAcknowledgementsResponse(
      acknowledgements:
          (json.valueEnsureAsList<dynamic>(
                'acknowledgements',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_core_channel_v1_channel.PacketState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          ibc_core_channel_v1_channel.PacketState.fromJson(v),
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

  factory QueryPacketAcknowledgementsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPacketAcknowledgementsResponse(
      acknowledgements:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_core_channel_v1_channel.PacketState.deserialize(b),
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
          .ibcCoreChannelV1QueryPacketAcknowledgementsResponse;
}

/// QueryUnreceivedPacketsRequest is the request type for the
/// Query/UnreceivedPackets RPC method
class QueryUnreceivedPacketsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnreceivedPacketsResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// list of packet sequences
  final List<BigInt> packetCommitmentSequences;

  const QueryUnreceivedPacketsRequest({
    this.portId,
    this.channelId,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_commitments/{packet_commitment_sequences}/unreceived_packets",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    channelId,
    packetCommitmentSequences,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'packet_commitment_sequences':
          packetCommitmentSequences.map((e) => e.toString()).toList(),
    };
  }

  factory QueryUnreceivedPacketsRequest.fromJson(Map<String, dynamic> json) {
    return QueryUnreceivedPacketsRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      packetCommitmentSequences:
          (json.valueEnsureAsList<dynamic>(
            'packet_commitment_sequences',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryUnreceivedPacketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnreceivedPacketsRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      packetCommitmentSequences: decode.getListOrEmpty<BigInt>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryUnreceivedPacketsRequest;
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

/// QueryUnreceivedPacketsResponse is the response type for the
/// Query/UnreceivedPacketCommitments RPC method
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
  Map<String, dynamic> toJson() {
    return {
      'sequences': sequences.map((e) => e.toString()).toList(),
      'height': height?.toJson(),
    };
  }

  factory QueryUnreceivedPacketsResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnreceivedPacketsResponse(
      sequences:
          (json.valueEnsureAsList<dynamic>(
            'sequences',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      height: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryUnreceivedPacketsResponse;
}

/// QueryUnreceivedAcks is the request type for the
/// Query/UnreceivedAcks RPC method
class QueryUnreceivedAcksRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnreceivedAcksResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// list of acknowledgement sequences
  final List<BigInt> packetAckSequences;

  const QueryUnreceivedAcksRequest({
    this.portId,
    this.channelId,
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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/packet_commitments/{packet_ack_sequences}/unreceived_acks",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, packetAckSequences];

  @override
  Map<String, dynamic> toJson() {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'packet_ack_sequences':
          packetAckSequences.map((e) => e.toString()).toList(),
    };
  }

  factory QueryUnreceivedAcksRequest.fromJson(Map<String, dynamic> json) {
    return QueryUnreceivedAcksRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      packetAckSequences:
          (json.valueEnsureAsList<dynamic>(
            'packet_ack_sequences',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory QueryUnreceivedAcksRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnreceivedAcksRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      packetAckSequences: decode.getListOrEmpty<BigInt>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryUnreceivedAcksRequest;
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
  Map<String, dynamic> toJson() {
    return {
      'sequences': sequences.map((e) => e.toString()).toList(),
      'height': height?.toJson(),
    };
  }

  factory QueryUnreceivedAcksResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnreceivedAcksResponse(
      sequences:
          (json.valueEnsureAsList<dynamic>(
            'sequences',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      height: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryUnreceivedAcksResponse;
}

/// QueryNextSequenceReceiveRequest is the request type for the
/// Query/QueryNextSequenceReceiveRequest RPC method
class QueryNextSequenceReceiveRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNextSequenceReceiveResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  const QueryNextSequenceReceiveRequest({this.portId, this.channelId});

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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/next_sequence",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory QueryNextSequenceReceiveRequest.fromJson(Map<String, dynamic> json) {
    return QueryNextSequenceReceiveRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryNextSequenceReceiveRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextSequenceReceiveRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryNextSequenceReceiveRequest;
  @override
  QueryNextSequenceReceiveResponse onQueryResponse(List<int> bytes) {
    return QueryNextSequenceReceiveResponse.deserialize(bytes);
  }

  @override
  QueryNextSequenceReceiveResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryNextSequenceReceiveResponse.fromJson(json);
  }
}

/// QuerySequenceResponse is the response type for the
/// Query/QueryNextSequenceReceiveResponse RPC method
class QueryNextSequenceReceiveResponse extends CosmosProtoMessage {
  /// next sequence receive number
  final BigInt? nextSequenceReceive;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryNextSequenceReceiveResponse({
    this.nextSequenceReceive,
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
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nextSequenceReceive, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'next_sequence_receive': nextSequenceReceive?.toString(),
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

  factory QueryNextSequenceReceiveResponse.fromJson(Map<String, dynamic> json) {
    return QueryNextSequenceReceiveResponse(
      nextSequenceReceive: json.valueAsBigInt<BigInt?>(
        'next_sequence_receive',
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

  factory QueryNextSequenceReceiveResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextSequenceReceiveResponse(
      nextSequenceReceive: decode.getBigInt<BigInt?>(1),
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
          .ibcCoreChannelV1QueryNextSequenceReceiveResponse;
}

/// QueryNextSequenceSendRequest is the request type for the
/// Query/QueryNextSequenceSend RPC method
class QueryNextSequenceSendRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNextSequenceSendResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  const QueryNextSequenceSendRequest({this.portId, this.channelId});

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
              "/ibc/core/channel/v1/channels/{channel_id}/ports/{port_id}/next_sequence_send",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId];

  @override
  Map<String, dynamic> toJson() {
    return {'port_id': portId, 'channel_id': channelId};
  }

  factory QueryNextSequenceSendRequest.fromJson(Map<String, dynamic> json) {
    return QueryNextSequenceSendRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryNextSequenceSendRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextSequenceSendRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryNextSequenceSendRequest;
  @override
  QueryNextSequenceSendResponse onQueryResponse(List<int> bytes) {
    return QueryNextSequenceSendResponse.deserialize(bytes);
  }

  @override
  QueryNextSequenceSendResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNextSequenceSendResponse.fromJson(json);
  }
}

/// QueryNextSequenceSendResponse is the request type for the
/// Query/QueryNextSequenceSend RPC method
class QueryNextSequenceSendResponse extends CosmosProtoMessage {
  /// next sequence send number
  final BigInt? nextSequenceSend;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final ibc_core_client_v1_client.Height? proofHeight;

  const QueryNextSequenceSendResponse({
    this.nextSequenceSend,
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
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nextSequenceSend, proof, proofHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'next_sequence_send': nextSequenceSend?.toString(),
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

  factory QueryNextSequenceSendResponse.fromJson(Map<String, dynamic> json) {
    return QueryNextSequenceSendResponse(
      nextSequenceSend: json.valueAsBigInt<BigInt?>(
        'next_sequence_send',
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
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1QueryNextSequenceSendResponse;
}
