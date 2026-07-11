import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/slashing/v1beta1/src/slashing.dart"
    as cosmos_slashing_v1beta1_slashing;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryParamsRequest is the request type for the Query/Params RPC method
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
          path: "/cosmos/slashing/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method
class QueryParamsResponse extends CosmosProtoMessage {
  final cosmos_slashing_v1beta1_slashing.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
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
        cosmos_slashing_v1beta1_slashing.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => cosmos_slashing_v1beta1_slashing.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<cosmos_slashing_v1beta1_slashing.Params?>(
        1,
        (b) => cosmos_slashing_v1beta1_slashing.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1QueryParamsResponse;
}

/// QuerySigningInfoRequest is the request type for the Query/SigningInfo RPC
/// method
class QuerySigningInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySigningInfoResponse> {
  /// cons_address is the address to query signing info of
  final String? consAddress;

  const QuerySigningInfoRequest({this.consAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/slashing/v1beta1/signing_infos/{cons_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [consAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'cons_address': consAddress};
  }

  factory QuerySigningInfoRequest.fromJson(Map<String, dynamic> json) {
    return QuerySigningInfoRequest(
      consAddress: json.valueAsString<String?>(
        'cons_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySigningInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySigningInfoRequest(consAddress: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1QuerySigningInfoRequest;
  @override
  QuerySigningInfoResponse onQueryResponse(List<int> bytes) {
    return QuerySigningInfoResponse.deserialize(bytes);
  }

  @override
  QuerySigningInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySigningInfoResponse.fromJson(json);
  }
}

/// QuerySigningInfoResponse is the response type for the Query/SigningInfo RPC
/// method
class QuerySigningInfoResponse extends CosmosProtoMessage {
  /// val_signing_info is the signing info of requested val cons address
  final cosmos_slashing_v1beta1_slashing.ValidatorSigningInfo? valSigningInfo;

  const QuerySigningInfoResponse({this.valSigningInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [valSigningInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'val_signing_info': valSigningInfo?.toJson()};
  }

  factory QuerySigningInfoResponse.fromJson(Map<String, dynamic> json) {
    return QuerySigningInfoResponse(
      valSigningInfo: json.valueTo<
        cosmos_slashing_v1beta1_slashing.ValidatorSigningInfo?,
        Map<String, dynamic>
      >(
        key: 'val_signing_info',
        parse:
            (v) => cosmos_slashing_v1beta1_slashing
                .ValidatorSigningInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySigningInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySigningInfoResponse(
      valSigningInfo: decode
          .messageTo<cosmos_slashing_v1beta1_slashing.ValidatorSigningInfo?>(
            1,
            (b) => cosmos_slashing_v1beta1_slashing
                .ValidatorSigningInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1QuerySigningInfoResponse;
}

/// QuerySigningInfosRequest is the request type for the Query/SigningInfos RPC
/// method
class QuerySigningInfosRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySigningInfosResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QuerySigningInfosRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/slashing/v1beta1/signing_infos",
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

  factory QuerySigningInfosRequest.fromJson(Map<String, dynamic> json) {
    return QuerySigningInfosRequest(
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

  factory QuerySigningInfosRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySigningInfosRequest(
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
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1QuerySigningInfosRequest;
  @override
  QuerySigningInfosResponse onQueryResponse(List<int> bytes) {
    return QuerySigningInfosResponse.deserialize(bytes);
  }

  @override
  QuerySigningInfosResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySigningInfosResponse.fromJson(json);
  }
}

/// QuerySigningInfosResponse is the response type for the Query/SigningInfos RPC
/// method
class QuerySigningInfosResponse extends CosmosProtoMessage {
  /// info is the signing info of all validators
  final List<cosmos_slashing_v1beta1_slashing.ValidatorSigningInfo> info;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QuerySigningInfosResponse({this.info = const [], this.pagination});

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [info, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'info': info.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QuerySigningInfosResponse.fromJson(Map<String, dynamic> json) {
    return QuerySigningInfosResponse(
      info:
          (json.valueEnsureAsList<dynamic>('info', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_slashing_v1beta1_slashing.ValidatorSigningInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_slashing_v1beta1_slashing
                          .ValidatorSigningInfo.fromJson(v),
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

  factory QuerySigningInfosResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySigningInfosResponse(
      info:
          decode
              .getListOfBytes(1)
              .map(
                (b) => cosmos_slashing_v1beta1_slashing
                    .ValidatorSigningInfo.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1QuerySigningInfosResponse;
}
