import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/reward/v1/src/types.dart"
    as initia_reward_v1_types;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

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
          path: "/initia/reward/v1/params",
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
      DefaultCosmosProtoTypeUrl.initiaRewardV1QueryParamsRequest;
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
  final initia_reward_v1_types.Params? params;

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
          .valueTo<initia_reward_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => initia_reward_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<initia_reward_v1_types.Params?>(
        1,
        (b) => initia_reward_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1QueryParamsResponse;
}

/// QueryAnnualProvisionsRequest is the request type for the
/// Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAnnualProvisionsResponse> {
  const QueryAnnualProvisionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/reward/v1/annual_provisions",
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

  factory QueryAnnualProvisionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAnnualProvisionsRequest();
  }

  factory QueryAnnualProvisionsRequest.deserialize(List<int> bytes) {
    return QueryAnnualProvisionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1QueryAnnualProvisionsRequest;
  @override
  QueryAnnualProvisionsResponse onQueryResponse(List<int> bytes) {
    return QueryAnnualProvisionsResponse.deserialize(bytes);
  }

  @override
  QueryAnnualProvisionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAnnualProvisionsResponse.fromJson(json);
  }
}

/// QueryAnnualProvisionsResponse is the response type for the
/// Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsResponse extends CosmosProtoMessage {
  /// annual_provisions is the current minting annual provisions value.
  final List<int>? annualProvisions;

  const QueryAnnualProvisionsResponse({this.annualProvisions});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [annualProvisions];

  @override
  Map<String, dynamic> toJson() {
    return {
      'annual_provisions': switch (annualProvisions) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryAnnualProvisionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAnnualProvisionsResponse(
      annualProvisions: json.valueAsBytes<List<int>?>(
        'annual_provisions',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryAnnualProvisionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAnnualProvisionsResponse(
      annualProvisions: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1QueryAnnualProvisionsResponse;
}

/// QueryLastDilutionTimestampRequest is the request type for the
/// Query/LastDilutionTimestamp RPC method.
class QueryLastDilutionTimestampRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastDilutionTimestampResponse> {
  const QueryLastDilutionTimestampRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/reward/v1/last_dilution_timestamp",
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

  factory QueryLastDilutionTimestampRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastDilutionTimestampRequest();
  }

  factory QueryLastDilutionTimestampRequest.deserialize(List<int> bytes) {
    return QueryLastDilutionTimestampRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1QueryLastDilutionTimestampRequest;
  @override
  QueryLastDilutionTimestampResponse onQueryResponse(List<int> bytes) {
    return QueryLastDilutionTimestampResponse.deserialize(bytes);
  }

  @override
  QueryLastDilutionTimestampResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastDilutionTimestampResponse.fromJson(json);
  }
}

/// QueryLastDilutionTimestampResponse is the response type for the
/// Query/LastDilutionTimestamp RPC method.
class QueryLastDilutionTimestampResponse extends CosmosProtoMessage {
  /// last_dilution_timestamp is the time when the last release rate dilution occurred.
  final google_protobuf_timestamp.Timestamp? lastDilutionTimestamp;

  const QueryLastDilutionTimestampResponse({this.lastDilutionTimestamp});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(3, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [lastDilutionTimestamp];

  @override
  Map<String, dynamic> toJson() {
    return {'last_dilution_timestamp': lastDilutionTimestamp?.toRfc3339()};
  }

  factory QueryLastDilutionTimestampResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastDilutionTimestampResponse(
      lastDilutionTimestamp: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'last_dilution_timestamp',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryLastDilutionTimestampResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastDilutionTimestampResponse(
      lastDilutionTimestamp: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            3,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaRewardV1QueryLastDilutionTimestampResponse;
}
