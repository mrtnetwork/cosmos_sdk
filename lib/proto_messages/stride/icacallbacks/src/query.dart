import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/icacallbacks/src/params.dart"
    as stride_icacallbacks_params;
import "package:cosmos_sdk/proto_messages/stride/icacallbacks/src/callback_data.dart"
    as stride_icacallbacks_callback_data;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryParamsRequest is request type for the Query/Params RPC method.
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
          path: "/Stride-Labs/stride/icacallbacks/params",
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
      DefaultCosmosProtoTypeUrl.strideIcacallbacksQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final stride_icacallbacks_params.Params? params;

  const QueryParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json
          .valueTo<stride_icacallbacks_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => stride_icacallbacks_params.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stride_icacallbacks_params.Params?>(
        1,
        (b) => stride_icacallbacks_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcacallbacksQueryParamsResponse;
}

class QueryGetCallbackDataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetCallbackDataResponse> {
  final String? callbackKey;

  const QueryGetCallbackDataRequest({this.callbackKey});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/icacallbacks/callback_data/{callback_key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [callbackKey];

  @override
  Map<String, dynamic> toJson() {
    return {'callback_key': callbackKey};
  }

  factory QueryGetCallbackDataRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetCallbackDataRequest(
      callbackKey: json.valueAsString<String?>(
        'callback_key',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetCallbackDataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetCallbackDataRequest(
      callbackKey: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcacallbacksQueryGetCallbackDataRequest;
  @override
  QueryGetCallbackDataResponse onQueryResponse(List<int> bytes) {
    return QueryGetCallbackDataResponse.deserialize(bytes);
  }

  @override
  QueryGetCallbackDataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetCallbackDataResponse.fromJson(json);
  }
}

class QueryGetCallbackDataResponse extends CosmosProtoMessage {
  final stride_icacallbacks_callback_data.CallbackData? callbackData;

  const QueryGetCallbackDataResponse({this.callbackData});

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
  List<Object?> get protoValues => [callbackData];

  @override
  Map<String, dynamic> toJson() {
    return {'callback_data': callbackData?.toJson()};
  }

  factory QueryGetCallbackDataResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetCallbackDataResponse(
      callbackData: json.valueTo<
        stride_icacallbacks_callback_data.CallbackData?,
        Map<String, dynamic>
      >(
        key: 'callback_data',
        parse:
            (v) => stride_icacallbacks_callback_data.CallbackData.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetCallbackDataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetCallbackDataResponse(
      callbackData: decode
          .messageTo<stride_icacallbacks_callback_data.CallbackData?>(
            1,
            (b) =>
                stride_icacallbacks_callback_data.CallbackData.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcacallbacksQueryGetCallbackDataResponse;
}

class QueryAllCallbackDataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllCallbackDataResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllCallbackDataRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/icacallbacks/callback_data",
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

  factory QueryAllCallbackDataRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllCallbackDataRequest(
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

  factory QueryAllCallbackDataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllCallbackDataRequest(
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
      DefaultCosmosProtoTypeUrl.strideIcacallbacksQueryAllCallbackDataRequest;
  @override
  QueryAllCallbackDataResponse onQueryResponse(List<int> bytes) {
    return QueryAllCallbackDataResponse.deserialize(bytes);
  }

  @override
  QueryAllCallbackDataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllCallbackDataResponse.fromJson(json);
  }
}

class QueryAllCallbackDataResponse extends CosmosProtoMessage {
  final List<stride_icacallbacks_callback_data.CallbackData> callbackData;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllCallbackDataResponse({
    this.callbackData = const [],
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
  List<Object?> get protoValues => [callbackData, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'callback_data': callbackData.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllCallbackDataResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllCallbackDataResponse(
      callbackData:
          (json.valueEnsureAsList<dynamic>(
                'callback_data',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_icacallbacks_callback_data.CallbackData,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_icacallbacks_callback_data
                          .CallbackData.fromJson(v),
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

  factory QueryAllCallbackDataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllCallbackDataResponse(
      callbackData:
          decode
              .getListOfBytes(1)
              .map(
                (b) => stride_icacallbacks_callback_data
                    .CallbackData.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.strideIcacallbacksQueryAllCallbackDataResponse;
}
