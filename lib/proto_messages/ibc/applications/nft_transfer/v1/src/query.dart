import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/applications/nft_transfer/v1/src/types.dart"
    as ibc_applications_nft_transfer_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryClassTraceRequest is the request type for the Query/ClassTrace RPC
/// method
class QueryClassTraceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClassTraceResponse> {
  /// hash (in hex format) of the class id trace information.
  final String? hash;

  const QueryClassTraceRequest({this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/nft_transfer/v1/class_traces/{hash}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash};
  }

  factory QueryClassTraceRequest.fromJson(Map<String, dynamic> json) {
    return QueryClassTraceRequest(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryClassTraceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassTraceRequest(hash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassTraceRequest;
  @override
  QueryClassTraceResponse onQueryResponse(List<int> bytes) {
    return QueryClassTraceResponse.deserialize(bytes);
  }

  @override
  QueryClassTraceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClassTraceResponse.fromJson(json);
  }
}

/// QueryClassTraceResponse is the response type for the Query/ClassTrace RPC
/// method.
class QueryClassTraceResponse extends CosmosProtoMessage {
  /// class_trace returns the requested class id trace information.
  final ibc_applications_nft_transfer_v1_types.ClassTrace? classTrace;

  const QueryClassTraceResponse({this.classTrace});

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
  List<Object?> get protoValues => [classTrace];

  @override
  Map<String, dynamic> toJson() {
    return {'class_trace': classTrace?.toJson()};
  }

  factory QueryClassTraceResponse.fromJson(Map<String, dynamic> json) {
    return QueryClassTraceResponse(
      classTrace: json.valueTo<
        ibc_applications_nft_transfer_v1_types.ClassTrace?,
        Map<String, dynamic>
      >(
        key: 'class_trace',
        parse:
            (v) =>
                ibc_applications_nft_transfer_v1_types.ClassTrace.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryClassTraceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassTraceResponse(
      classTrace: decode.messageTo<
        ibc_applications_nft_transfer_v1_types.ClassTrace?
      >(
        1,
        (b) => ibc_applications_nft_transfer_v1_types.ClassTrace.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassTraceResponse;
}

/// QueryClassTracesRequest is the request type for the Query/ClassTraces RPC
/// method
class QueryClassTracesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClassTracesResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryClassTracesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/nft_transfer/v1/class_traces",
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

  factory QueryClassTracesRequest.fromJson(Map<String, dynamic> json) {
    return QueryClassTracesRequest(
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

  factory QueryClassTracesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassTracesRequest(
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
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassTracesRequest;
  @override
  QueryClassTracesResponse onQueryResponse(List<int> bytes) {
    return QueryClassTracesResponse.deserialize(bytes);
  }

  @override
  QueryClassTracesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClassTracesResponse.fromJson(json);
  }
}

/// QueryClassTracesResponse is the response type for the Query/ClassTraces RPC
/// method.
class QueryClassTracesResponse extends CosmosProtoMessage {
  /// class_traces returns all class id traces information.
  final List<ibc_applications_nft_transfer_v1_types.ClassTrace> classTraces;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryClassTracesResponse({
    this.classTraces = const [],
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
  List<Object?> get protoValues => [classTraces, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_traces': classTraces.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryClassTracesResponse.fromJson(Map<String, dynamic> json) {
    return QueryClassTracesResponse(
      classTraces:
          (json.valueEnsureAsList<dynamic>(
                'class_traces',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_applications_nft_transfer_v1_types.ClassTrace,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => ibc_applications_nft_transfer_v1_types
                          .ClassTrace.fromJson(v),
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

  factory QueryClassTracesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassTracesResponse(
      classTraces:
          decode
              .getListOfBytes(1)
              .map(
                (b) => ibc_applications_nft_transfer_v1_types
                    .ClassTrace.deserialize(b),
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
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassTracesResponse;
}

/// QueryClassHashRequest is the request type for the Query/ClassHash RPC
/// method
class QueryClassHashRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClassHashResponse> {
  /// The class id trace ([port_id]/[channel_id])+/[class_id]
  final String? trace;

  const QueryClassHashRequest({this.trace});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/nft_transfer/v1/class_hashes/{trace=**}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [trace];

  @override
  Map<String, dynamic> toJson() {
    return {'trace': trace};
  }

  factory QueryClassHashRequest.fromJson(Map<String, dynamic> json) {
    return QueryClassHashRequest(
      trace: json.valueAsString<String?>('trace', acceptCamelCase: true),
    );
  }

  factory QueryClassHashRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassHashRequest(trace: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassHashRequest;
  @override
  QueryClassHashResponse onQueryResponse(List<int> bytes) {
    return QueryClassHashResponse.deserialize(bytes);
  }

  @override
  QueryClassHashResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClassHashResponse.fromJson(json);
  }
}

/// QueryClassHashResponse is the response type for the Query/ClassHash RPC
/// method.
class QueryClassHashResponse extends CosmosProtoMessage {
  /// hash (in hex format) of the class id trace information.
  final String? hash;

  const QueryClassHashResponse({this.hash});

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
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash};
  }

  factory QueryClassHashResponse.fromJson(Map<String, dynamic> json) {
    return QueryClassHashResponse(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryClassHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassHashResponse(hash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassHashResponse;
}

/// QueryClassDataRequest is the request type for the Query/ClassData RPC
/// method
class QueryClassDataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClassDataResponse> {
  /// hash (in hex format) of the class id trace information.
  final String? hash;

  const QueryClassDataRequest({this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/ibc/apps/nft_transfer/v1/class_data/{hash}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash};
  }

  factory QueryClassDataRequest.fromJson(Map<String, dynamic> json) {
    return QueryClassDataRequest(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory QueryClassDataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassDataRequest(hash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassDataRequest;
  @override
  QueryClassDataResponse onQueryResponse(List<int> bytes) {
    return QueryClassDataResponse.deserialize(bytes);
  }

  @override
  QueryClassDataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClassDataResponse.fromJson(json);
  }
}

/// QueryClassDataResponse is the response type for the Query/ClassData RPC
/// method.
class QueryClassDataResponse extends CosmosProtoMessage {
  /// data returns the requested class id data information.
  final String? data;

  const QueryClassDataResponse({this.data});

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
  List<Object?> get protoValues => [data];

  @override
  Map<String, dynamic> toJson() {
    return {'data': data};
  }

  factory QueryClassDataResponse.fromJson(Map<String, dynamic> json) {
    return QueryClassDataResponse(
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
    );
  }

  factory QueryClassDataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClassDataResponse(data: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryClassDataResponse;
}

/// QueryEscrowAddressRequest is the request type for the EscrowAddress RPC method.
class QueryEscrowAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEscrowAddressResponse> {
  /// unique port identifier
  final String? portId;

  /// unique channel identifier
  final String? channelId;

  const QueryEscrowAddressRequest({this.portId, this.channelId});

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
              "/ibc/apps/nft_transfer/v1/channels/{channel_id=**}/ports/{port_id}/escrow_address",
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

  factory QueryEscrowAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryEscrowAddressRequest(
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEscrowAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEscrowAddressRequest(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryEscrowAddressRequest;
  @override
  QueryEscrowAddressResponse onQueryResponse(List<int> bytes) {
    return QueryEscrowAddressResponse.deserialize(bytes);
  }

  @override
  QueryEscrowAddressResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEscrowAddressResponse.fromJson(json);
  }
}

/// QueryEscrowAddressResponse is the response type of the EscrowAddress RPC method.
class QueryEscrowAddressResponse extends CosmosProtoMessage {
  /// the escrow account address
  final String? escrowAddress;

  const QueryEscrowAddressResponse({this.escrowAddress});

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
  List<Object?> get protoValues => [escrowAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'escrow_address': escrowAddress};
  }

  factory QueryEscrowAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryEscrowAddressResponse(
      escrowAddress: json.valueAsString<String?>(
        'escrow_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEscrowAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEscrowAddressResponse(
      escrowAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1QueryEscrowAddressResponse;
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
          path: "/ibc/apps/nft_transfer/v1/params",
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
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1QueryParamsRequest;
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
  final ibc_applications_nft_transfer_v1_types.Params? params;

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
        ibc_applications_nft_transfer_v1_types.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => ibc_applications_nft_transfer_v1_types.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<ibc_applications_nft_transfer_v1_types.Params?>(
        1,
        (b) => ibc_applications_nft_transfer_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1QueryParamsResponse;
}
