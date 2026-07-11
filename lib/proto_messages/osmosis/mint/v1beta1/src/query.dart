import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/mint/v1beta1/src/mint.dart"
    as osmosis_mint_v1beta1_mint;

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
          path: "/osmosis/mint/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryParamsRequest;
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
  final osmosis_mint_v1beta1_mint.Params? params;

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
          .valueTo<osmosis_mint_v1beta1_mint.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => osmosis_mint_v1beta1_mint.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<osmosis_mint_v1beta1_mint.Params?>(
        1,
        (b) => osmosis_mint_v1beta1_mint.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryParamsResponse;
}

/// QueryEpochProvisionsRequest is the request type for the
/// Query/EpochProvisions RPC method.
class QueryEpochProvisionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochProvisionsResponse> {
  const QueryEpochProvisionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/mint/v1beta1/epoch_provisions",
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

  factory QueryEpochProvisionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryEpochProvisionsRequest();
  }

  factory QueryEpochProvisionsRequest.deserialize(List<int> bytes) {
    return QueryEpochProvisionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryEpochProvisionsRequest;
  @override
  QueryEpochProvisionsResponse onQueryResponse(List<int> bytes) {
    return QueryEpochProvisionsResponse.deserialize(bytes);
  }

  @override
  QueryEpochProvisionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEpochProvisionsResponse.fromJson(json);
  }
}

/// QueryEpochProvisionsResponse is the response type for the
/// Query/EpochProvisions RPC method.
class QueryEpochProvisionsResponse extends CosmosProtoMessage {
  /// epoch_provisions is the current minting per epoch provisions value.
  final List<int>? epochProvisions;

  const QueryEpochProvisionsResponse({this.epochProvisions});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [epochProvisions];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch_provisions': switch (epochProvisions) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryEpochProvisionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryEpochProvisionsResponse(
      epochProvisions: json.valueAsBytes<List<int>?>(
        'epoch_provisions',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryEpochProvisionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochProvisionsResponse(
      epochProvisions: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryEpochProvisionsResponse;
}

/// QueryInflationRequest is the request type for the Query/Inflation RPC method.
class QueryInflationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInflationResponse> {
  const QueryInflationRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/mint/v1beta1/inflation",
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

  factory QueryInflationRequest.fromJson(Map<String, dynamic> json) {
    return QueryInflationRequest();
  }

  factory QueryInflationRequest.deserialize(List<int> bytes) {
    return QueryInflationRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryInflationRequest;
  @override
  QueryInflationResponse onQueryResponse(List<int> bytes) {
    return QueryInflationResponse.deserialize(bytes);
  }

  @override
  QueryInflationResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInflationResponse.fromJson(json);
  }
}

/// QueryInflationResponse is the response type for the Query/Inflation RPC
/// method.
class QueryInflationResponse extends CosmosProtoMessage {
  /// inflation is the current minting inflation value.
  final List<int>? inflation;

  const QueryInflationResponse({this.inflation});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [inflation];

  @override
  Map<String, dynamic> toJson() {
    return {
      'inflation': switch (inflation) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryInflationResponse.fromJson(Map<String, dynamic> json) {
    return QueryInflationResponse(
      inflation: json.valueAsBytes<List<int>?>(
        'inflation',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryInflationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInflationResponse(inflation: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisMintV1beta1QueryInflationResponse;
}
