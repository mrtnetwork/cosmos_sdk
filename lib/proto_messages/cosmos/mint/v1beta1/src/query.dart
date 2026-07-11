import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/mint/v1beta1/src/mint.dart"
    as cosmos_mint_v1beta1_mint;

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
          path: "/cosmos/mint/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryParamsRequest;
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
  final cosmos_mint_v1beta1_mint.Params? params;

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
      params: json
          .valueTo<cosmos_mint_v1beta1_mint.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmos_mint_v1beta1_mint.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<cosmos_mint_v1beta1_mint.Params?>(
        1,
        (b) => cosmos_mint_v1beta1_mint.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryParamsResponse;
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
          path: "/cosmos/mint/v1beta1/inflation",
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryInflationRequest;
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
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryInflationResponse;
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
          path: "/cosmos/mint/v1beta1/annual_provisions",
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryAnnualProvisionsRequest;
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
      DefaultCosmosProtoTypeUrl.cosmosMintV1beta1QueryAnnualProvisionsResponse;
}
