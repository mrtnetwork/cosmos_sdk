import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/ibc/applications/perm/v1/src/types.dart"
    as ibc_applications_perm_v1_types;

/// QueryChannelStatesRequest is the request type for the Query/ChannelStates RPC method.
class QueryChannelStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryChannelStatesResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryChannelStatesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/perm/v1/channel_states",
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

  factory QueryChannelStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryChannelStatesRequest(
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

  factory QueryChannelStatesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelStatesRequest(
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
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1QueryChannelStatesRequest;
  @override
  QueryChannelStatesResponse onQueryResponse(List<int> bytes) {
    return QueryChannelStatesResponse.deserialize(bytes);
  }

  @override
  QueryChannelStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryChannelStatesResponse.fromJson(json);
  }
}

/// QueryChannelStatesResponse is the response type for the Query/ChannelStates RPC method.
class QueryChannelStatesResponse extends CosmosProtoMessage {
  /// channel_states returns all stored ChannelState objects.
  final List<ibc_applications_perm_v1_types.ChannelState> channelStates;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryChannelStatesResponse({
    this.channelStates = const [],
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
  List<Object?> get protoValues => [channelStates, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'channel_states': channelStates.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryChannelStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelStatesResponse(
      channelStates:
          (json.valueEnsureAsList<dynamic>(
                'channel_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_applications_perm_v1_types.ChannelState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_applications_perm_v1_types
                          .ChannelState.fromJson(v),
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

  factory QueryChannelStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelStatesResponse(
      channelStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    ibc_applications_perm_v1_types.ChannelState.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1QueryChannelStatesResponse;
}

/// QueryChannelStateRequest is the request type for the Query/ChannelState RPC method.
class QueryChannelStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryChannelStateResponse> {
  final String? channelId;

  final String? portId;

  const QueryChannelStateRequest({this.channelId, this.portId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/perm/v1/channel_states/{channel_id}/{port_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [channelId, portId];

  @override
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId, 'port_id': portId};
  }

  factory QueryChannelStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryChannelStateRequest(
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
    );
  }

  factory QueryChannelStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelStateRequest(
      channelId: decode.getString<String?>(1),
      portId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1QueryChannelStateRequest;
  @override
  QueryChannelStateResponse onQueryResponse(List<int> bytes) {
    return QueryChannelStateResponse.deserialize(bytes);
  }

  @override
  QueryChannelStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryChannelStateResponse.fromJson(json);
  }
}

/// QueryChannelStateResponse is the response type for the Query/ChannelState RPC method.
class QueryChannelStateResponse extends CosmosProtoMessage {
  /// channel_state returns the stored ChannelState object.
  final ibc_applications_perm_v1_types.ChannelState? channelState;

  const QueryChannelStateResponse({this.channelState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [channelState];

  @override
  Map<String, dynamic> toJson() {
    return {'channel_state': channelState?.toJson()};
  }

  factory QueryChannelStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryChannelStateResponse(
      channelState: json.valueTo<
        ibc_applications_perm_v1_types.ChannelState?,
        Map<String, dynamic>
      >(
        key: 'channel_state',
        parse: (v) => ibc_applications_perm_v1_types.ChannelState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryChannelStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChannelStateResponse(
      channelState: decode
          .messageTo<ibc_applications_perm_v1_types.ChannelState?>(
            1,
            (b) => ibc_applications_perm_v1_types.ChannelState.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1QueryChannelStateResponse;
}
