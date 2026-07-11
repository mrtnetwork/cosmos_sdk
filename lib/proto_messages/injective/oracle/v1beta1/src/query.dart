import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/genesis.dart"
    as injective_oracle_v1beta1_genesis;

class QueryPythPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPythPriceResponse> {
  final String? priceId;

  const QueryPythPriceRequest({this.priceId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/pyth_price",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [priceId];

  @override
  Map<String, dynamic> toJson() {
    return {'price_id': priceId};
  }

  factory QueryPythPriceRequest.fromJson(Map<String, dynamic> json) {
    return QueryPythPriceRequest(
      priceId: json.valueAsString<String?>('price_id', acceptCamelCase: true),
    );
  }

  factory QueryPythPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPythPriceRequest(priceId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryPythPriceRequest;
  @override
  QueryPythPriceResponse onQueryResponse(List<int> bytes) {
    return QueryPythPriceResponse.deserialize(bytes);
  }

  @override
  QueryPythPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPythPriceResponse.fromJson(json);
  }
}

class QueryPythPriceResponse extends CosmosProtoMessage {
  final injective_oracle_v1beta1_oracle.PythPriceState? priceState;

  const QueryPythPriceResponse({this.priceState});

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
  List<Object?> get protoValues => [priceState];

  @override
  Map<String, dynamic> toJson() {
    return {'price_state': priceState?.toJson()};
  }

  factory QueryPythPriceResponse.fromJson(Map<String, dynamic> json) {
    return QueryPythPriceResponse(
      priceState: json.valueTo<
        injective_oracle_v1beta1_oracle.PythPriceState?,
        Map<String, dynamic>
      >(
        key: 'price_state',
        parse:
            (v) => injective_oracle_v1beta1_oracle.PythPriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryPythPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPythPriceResponse(
      priceState: decode
          .messageTo<injective_oracle_v1beta1_oracle.PythPriceState?>(
            1,
            (b) =>
                injective_oracle_v1beta1_oracle.PythPriceState.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryPythPriceResponse;
}

/// QueryOracleParamsRequest is the request type for the Query/OracleParams RPC
/// method.
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
          path: "/injective/oracle/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryOracleParamsResponse is the response type for the Query/OracleParams RPC
/// method.
class QueryParamsResponse extends CosmosProtoMessage {
  final injective_oracle_v1beta1_oracle.Params? params;

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
      params: json.valueTo<
        injective_oracle_v1beta1_oracle.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_oracle_v1beta1_oracle.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<injective_oracle_v1beta1_oracle.Params?>(
        1,
        (b) => injective_oracle_v1beta1_oracle.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryParamsResponse;
}

/// QueryBandRelayersRequest is the request type for the Query/BandRelayers RPC
/// method.
class QueryBandRelayersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBandRelayersResponse> {
  const QueryBandRelayersRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/band_relayers",
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

  factory QueryBandRelayersRequest.fromJson(Map<String, dynamic> json) {
    return QueryBandRelayersRequest();
  }

  factory QueryBandRelayersRequest.deserialize(List<int> bytes) {
    return QueryBandRelayersRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryBandRelayersRequest;
  @override
  QueryBandRelayersResponse onQueryResponse(List<int> bytes) {
    return QueryBandRelayersResponse.deserialize(bytes);
  }

  @override
  QueryBandRelayersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBandRelayersResponse.fromJson(json);
  }
}

/// QueryBandRelayersResponse is the response type for the Query/BandRelayers RPC
/// method.
class QueryBandRelayersResponse extends CosmosProtoMessage {
  final List<String> relayers;

  const QueryBandRelayersResponse({this.relayers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [relayers];

  @override
  Map<String, dynamic> toJson() {
    return {'relayers': relayers.map((e) => e).toList()};
  }

  factory QueryBandRelayersResponse.fromJson(Map<String, dynamic> json) {
    return QueryBandRelayersResponse(
      relayers:
          (json.valueEnsureAsList<dynamic>(
            'relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryBandRelayersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBandRelayersResponse(
      relayers: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryBandRelayersResponse;
}

/// QueryBandPriceStatesRequest is the request type for the Query/BandPriceStates
/// RPC method.
class QueryBandPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBandPriceStatesResponse> {
  const QueryBandPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/band_price_states",
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

  factory QueryBandPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBandPriceStatesRequest();
  }

  factory QueryBandPriceStatesRequest.deserialize(List<int> bytes) {
    return QueryBandPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryBandPriceStatesRequest;
  @override
  QueryBandPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryBandPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryBandPriceStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBandPriceStatesResponse.fromJson(json);
  }
}

/// QueryBandPriceStatesResponse is the response type for the
/// Query/BandPriceStates RPC method.
class QueryBandPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.BandPriceState> priceStates;

  const QueryBandPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryBandPriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBandPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.BandPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .BandPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryBandPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBandPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .BandPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryBandPriceStatesResponse;
}

/// QueryBandIBCPriceStatesRequest is the request type for the
/// Query/BandIBCPriceStates RPC method.
class QueryBandIBCPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBandIBCPriceStatesResponse> {
  const QueryBandIBCPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/band_ibc_price_states",
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

  factory QueryBandIBCPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBandIBCPriceStatesRequest();
  }

  factory QueryBandIBCPriceStatesRequest.deserialize(List<int> bytes) {
    return QueryBandIBCPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryBandIBCPriceStatesRequest;
  @override
  QueryBandIBCPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryBandIBCPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryBandIBCPriceStatesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBandIBCPriceStatesResponse.fromJson(json);
  }
}

/// QueryBandIBCPriceStatesResponse is the response type for the
/// Query/BandIBCPriceStates RPC method.
class QueryBandIBCPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.BandPriceState> priceStates;

  const QueryBandIBCPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryBandIBCPriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBandIBCPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.BandPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .BandPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryBandIBCPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBandIBCPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .BandPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryBandIBCPriceStatesResponse;
}

/// QueryPriceFeedPriceStatesRequest is the request type for the
/// Query/PriceFeedPriceStates RPC method.
class QueryPriceFeedPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPriceFeedPriceStatesResponse> {
  const QueryPriceFeedPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/pricefeed_price_states",
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

  factory QueryPriceFeedPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryPriceFeedPriceStatesRequest();
  }

  factory QueryPriceFeedPriceStatesRequest.deserialize(List<int> bytes) {
    return QueryPriceFeedPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryPriceFeedPriceStatesRequest;
  @override
  QueryPriceFeedPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryPriceFeedPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryPriceFeedPriceStatesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPriceFeedPriceStatesResponse.fromJson(json);
  }
}

/// QueryPriceFeedPriceStatesResponse is the response type for the
/// Query/PriceFeedPriceStates RPC method.
class QueryPriceFeedPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.PriceFeedState> priceStates;

  const QueryPriceFeedPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryPriceFeedPriceStatesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryPriceFeedPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PriceFeedState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PriceFeedState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryPriceFeedPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPriceFeedPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PriceFeedState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryPriceFeedPriceStatesResponse;
}

/// QueryCoinbasePriceStatesRequest is the request type for the
/// Query/CoinbasePriceStates RPC method.
class QueryCoinbasePriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCoinbasePriceStatesResponse> {
  const QueryCoinbasePriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/coinbase_price_states",
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

  factory QueryCoinbasePriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryCoinbasePriceStatesRequest();
  }

  factory QueryCoinbasePriceStatesRequest.deserialize(List<int> bytes) {
    return QueryCoinbasePriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryCoinbasePriceStatesRequest;
  @override
  QueryCoinbasePriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryCoinbasePriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryCoinbasePriceStatesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCoinbasePriceStatesResponse.fromJson(json);
  }
}

/// QueryCoinbasePriceStatesResponse is the response type for the
/// Query/CoinbasePriceStates RPC method.
class QueryCoinbasePriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.CoinbasePriceState> priceStates;

  const QueryCoinbasePriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryCoinbasePriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryCoinbasePriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.CoinbasePriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .CoinbasePriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryCoinbasePriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCoinbasePriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .CoinbasePriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryCoinbasePriceStatesResponse;
}

/// QueryPythPriceStatesRequest is the request type for the
/// Query/CoinbasePriceStates RPC method.
class QueryPythPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPythPriceStatesResponse> {
  const QueryPythPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/pyth_price_states",
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

  factory QueryPythPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryPythPriceStatesRequest();
  }

  factory QueryPythPriceStatesRequest.deserialize(List<int> bytes) {
    return QueryPythPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryPythPriceStatesRequest;
  @override
  QueryPythPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryPythPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryPythPriceStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPythPriceStatesResponse.fromJson(json);
  }
}

/// QueryPythPriceStatesResponse is the response type for the
/// Query/CoinbasePriceStates RPC method.
class QueryPythPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.PythPriceState> priceStates;

  const QueryPythPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryPythPriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryPythPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PythPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PythPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryPythPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPythPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PythPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryPythPriceStatesResponse;
}

/// QueryPythProPriceStatesRequest is the request type for the
/// Query/PythProPriceStates RPC method.
class QueryPythProPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPythProPriceStatesResponse> {
  const QueryPythProPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/pyth_pro_price_states",
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

  factory QueryPythProPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryPythProPriceStatesRequest();
  }

  factory QueryPythProPriceStatesRequest.deserialize(List<int> bytes) {
    return QueryPythProPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryPythProPriceStatesRequest;
  @override
  QueryPythProPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryPythProPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryPythProPriceStatesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPythProPriceStatesResponse.fromJson(json);
  }
}

/// QueryPythProPriceStatesResponse is the response type for the
/// Query/PythProPriceStates RPC method.
class QueryPythProPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.PythProPriceState> priceStates;

  const QueryPythProPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryPythProPriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryPythProPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PythProPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PythProPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryPythProPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPythProPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PythProPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryPythProPriceStatesResponse;
}

/// QuerySedaFastPriceStatesRequest is the request type for the
/// Query/SedaFastPriceStates RPC method.
class QuerySedaFastPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySedaFastPriceStatesResponse> {
  const QuerySedaFastPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/seda_fast_price_states",
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

  factory QuerySedaFastPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QuerySedaFastPriceStatesRequest();
  }

  factory QuerySedaFastPriceStatesRequest.deserialize(List<int> bytes) {
    return QuerySedaFastPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QuerySedaFastPriceStatesRequest;
  @override
  QuerySedaFastPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QuerySedaFastPriceStatesResponse.deserialize(bytes);
  }

  @override
  QuerySedaFastPriceStatesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySedaFastPriceStatesResponse.fromJson(json);
  }
}

/// QuerySedaFastPriceStatesResponse is the response type for the
/// Query/SedaFastPriceStates RPC method.
class QuerySedaFastPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.SedaFastPriceState> priceStates;

  const QuerySedaFastPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QuerySedaFastPriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QuerySedaFastPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.SedaFastPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .SedaFastPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QuerySedaFastPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySedaFastPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .SedaFastPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QuerySedaFastPriceStatesResponse;
}

/// QueryStorkPriceStatesRequest is the request type for the
/// Query/StorkPriceStates RPC method.
class QueryStorkPriceStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStorkPriceStatesResponse> {
  const QueryStorkPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/stork_price_states",
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

  factory QueryStorkPriceStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryStorkPriceStatesRequest();
  }

  factory QueryStorkPriceStatesRequest.deserialize(List<int> bytes) {
    return QueryStorkPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryStorkPriceStatesRequest;
  @override
  QueryStorkPriceStatesResponse onQueryResponse(List<int> bytes) {
    return QueryStorkPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryStorkPriceStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStorkPriceStatesResponse.fromJson(json);
  }
}

/// QueryStorkPriceStatesResponse is the response type for the
/// Query/StorkPriceStates RPC method.
class QueryStorkPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.StorkPriceState> priceStates;

  const QueryStorkPriceStatesResponse({this.priceStates = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryStorkPriceStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryStorkPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.StorkPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .StorkPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryStorkPriceStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStorkPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .StorkPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryStorkPriceStatesResponse;
}

/// QueryStorkPublishersRequest is the request type for the
/// Query/StorkPublishers RPC method.
class QueryStorkPublishersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStorkPublishersResponse> {
  const QueryStorkPublishersRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/stork_publishers",
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

  factory QueryStorkPublishersRequest.fromJson(Map<String, dynamic> json) {
    return QueryStorkPublishersRequest();
  }

  factory QueryStorkPublishersRequest.deserialize(List<int> bytes) {
    return QueryStorkPublishersRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryStorkPublishersRequest;
  @override
  QueryStorkPublishersResponse onQueryResponse(List<int> bytes) {
    return QueryStorkPublishersResponse.deserialize(bytes);
  }

  @override
  QueryStorkPublishersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStorkPublishersResponse.fromJson(json);
  }
}

/// QueryStorkPublishersResponse is the response type for the
/// Query/StorkPublishers RPC method.
class QueryStorkPublishersResponse extends CosmosProtoMessage {
  final List<String> publishers;

  const QueryStorkPublishersResponse({this.publishers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [publishers];

  @override
  Map<String, dynamic> toJson() {
    return {'publishers': publishers.map((e) => e).toList()};
  }

  factory QueryStorkPublishersResponse.fromJson(Map<String, dynamic> json) {
    return QueryStorkPublishersResponse(
      publishers:
          (json.valueEnsureAsList<dynamic>(
            'publishers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryStorkPublishersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStorkPublishersResponse(
      publishers: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryStorkPublishersResponse;
}

/// QueryProviderPriceStateRequest is the request type for the
/// Query/ProviderPriceState RPC method.
class QueryProviderPriceStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryProviderPriceStateResponse> {
  final String? provider;

  final String? symbol;

  const QueryProviderPriceStateRequest({this.provider, this.symbol});

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
              "/injective/oracle/v1beta1/provider_price_state/{provider}/{symbol}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [provider, symbol];

  @override
  Map<String, dynamic> toJson() {
    return {'provider': provider, 'symbol': symbol};
  }

  factory QueryProviderPriceStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryProviderPriceStateRequest(
      provider: json.valueAsString<String?>('provider', acceptCamelCase: true),
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
    );
  }

  factory QueryProviderPriceStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProviderPriceStateRequest(
      provider: decode.getString<String?>(1),
      symbol: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryProviderPriceStateRequest;
  @override
  QueryProviderPriceStateResponse onQueryResponse(List<int> bytes) {
    return QueryProviderPriceStateResponse.deserialize(bytes);
  }

  @override
  QueryProviderPriceStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryProviderPriceStateResponse.fromJson(json);
  }
}

/// QueryProviderPriceStatesResponse is the response type for the
/// Query/ProviderPriceStates RPC method.
class QueryProviderPriceStateResponse extends CosmosProtoMessage {
  final injective_oracle_v1beta1_oracle.PriceState? priceState;

  const QueryProviderPriceStateResponse({this.priceState});

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
  List<Object?> get protoValues => [priceState];

  @override
  Map<String, dynamic> toJson() {
    return {'price_state': priceState?.toJson()};
  }

  factory QueryProviderPriceStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryProviderPriceStateResponse(
      priceState: json.valueTo<
        injective_oracle_v1beta1_oracle.PriceState?,
        Map<String, dynamic>
      >(
        key: 'price_state',
        parse: (v) => injective_oracle_v1beta1_oracle.PriceState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryProviderPriceStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProviderPriceStateResponse(
      priceState: decode.messageTo<injective_oracle_v1beta1_oracle.PriceState?>(
        1,
        (b) => injective_oracle_v1beta1_oracle.PriceState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryProviderPriceStateResponse;
}

/// QueryChainlinkDataStreamsPriceStatesRequest is the request type for the
/// Query/ChainlinkDataStreamsPriceStates RPC method.
class QueryChainlinkDataStreamsPriceStatesRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<QueryChainlinkDataStreamsPriceStatesResponse> {
  const QueryChainlinkDataStreamsPriceStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/chainlink_data_stream_price_states",
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

  factory QueryChainlinkDataStreamsPriceStatesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryChainlinkDataStreamsPriceStatesRequest();
  }

  factory QueryChainlinkDataStreamsPriceStatesRequest.deserialize(
    List<int> bytes,
  ) {
    return QueryChainlinkDataStreamsPriceStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryChainlinkDataStreamsPriceStatesRequest;
  @override
  QueryChainlinkDataStreamsPriceStatesResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryChainlinkDataStreamsPriceStatesResponse.deserialize(bytes);
  }

  @override
  QueryChainlinkDataStreamsPriceStatesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryChainlinkDataStreamsPriceStatesResponse.fromJson(json);
  }
}

/// QueryChainlinkDataStreamsPriceStatesResponse is the response type for the
/// Query/ChainlinkDataStreamsPriceStates RPC method.
class QueryChainlinkDataStreamsPriceStatesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.ChainlinkDataStreamsPriceState>
  priceStates;

  const QueryChainlinkDataStreamsPriceStatesResponse({
    this.priceStates = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceStates];

  @override
  Map<String, dynamic> toJson() {
    return {'price_states': priceStates.map((e) => e.toJson()).toList()};
  }

  factory QueryChainlinkDataStreamsPriceStatesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryChainlinkDataStreamsPriceStatesResponse(
      priceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ChainlinkDataStreamsPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ChainlinkDataStreamsPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryChainlinkDataStreamsPriceStatesResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryChainlinkDataStreamsPriceStatesResponse(
      priceStates:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .ChainlinkDataStreamsPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryChainlinkDataStreamsPriceStatesResponse;
}

/// QueryModuleStateRequest is the request type for the Query/OracleModuleState
/// RPC method.
class QueryModuleStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleStateResponse> {
  const QueryModuleStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/module_state",
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

  factory QueryModuleStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the Query/OracleModuleState
/// RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  final injective_oracle_v1beta1_genesis.GenesisState? state;

  const QueryModuleStateResponse({this.state});

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
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryModuleStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse(
      state: json.valueTo<
        injective_oracle_v1beta1_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse: (v) => injective_oracle_v1beta1_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode.messageTo<injective_oracle_v1beta1_genesis.GenesisState?>(
        1,
        (b) => injective_oracle_v1beta1_genesis.GenesisState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryModuleStateResponse;
}

class QueryHistoricalPriceRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryHistoricalPriceRecordsResponse> {
  final injective_oracle_v1beta1_oracle.OracleType? oracle;

  final String? symbolId;

  const QueryHistoricalPriceRecordsRequest({this.oracle, this.symbolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/historical_price_records",
        ),
      ],
      fields: [ProtoFieldConfig.enumType(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [oracle, symbolId];

  @override
  Map<String, dynamic> toJson() {
    return {'oracle': oracle?.protoName, 'symbol_id': symbolId};
  }

  factory QueryHistoricalPriceRecordsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryHistoricalPriceRecordsRequest(
      oracle: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      symbolId: json.valueAsString<String?>('symbol_id', acceptCamelCase: true),
    );
  }

  factory QueryHistoricalPriceRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryHistoricalPriceRecordsRequest(
      oracle: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        1,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      symbolId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryHistoricalPriceRecordsRequest;
  @override
  QueryHistoricalPriceRecordsResponse onQueryResponse(List<int> bytes) {
    return QueryHistoricalPriceRecordsResponse.deserialize(bytes);
  }

  @override
  QueryHistoricalPriceRecordsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryHistoricalPriceRecordsResponse.fromJson(json);
  }
}

class QueryHistoricalPriceRecordsResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.PriceRecords> priceRecords;

  const QueryHistoricalPriceRecordsResponse({this.priceRecords = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [priceRecords];

  @override
  Map<String, dynamic> toJson() {
    return {'price_records': priceRecords.map((e) => e.toJson()).toList()};
  }

  factory QueryHistoricalPriceRecordsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryHistoricalPriceRecordsResponse(
      priceRecords:
          (json.valueEnsureAsList<dynamic>(
                'price_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PriceRecords,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PriceRecords.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryHistoricalPriceRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryHistoricalPriceRecordsResponse(
      priceRecords:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    injective_oracle_v1beta1_oracle.PriceRecords.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryHistoricalPriceRecordsResponse;
}

class OracleHistoryOptions extends CosmosProtoMessage {
  /// MaxAge restricts the oracle price records oldest age in seconds from the
  /// current block time to consider. A value of 0 means use all the records
  /// present on the chain.
  final BigInt? maxAge;

  /// If IncludeRawHistory is true, the raw underlying data used for the
  /// computation is included in the response
  final bool? includeRawHistory;

  /// If IncludeMetadata is true, metadata on the computation is included in the
  /// response
  final bool? includeMetadata;

  const OracleHistoryOptions({
    this.maxAge,
    this.includeRawHistory,
    this.includeMetadata,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [maxAge, includeRawHistory, includeMetadata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'max_age': maxAge?.toString(),
      'include_raw_history': includeRawHistory,
      'include_metadata': includeMetadata,
    };
  }

  factory OracleHistoryOptions.fromJson(Map<String, dynamic> json) {
    return OracleHistoryOptions(
      maxAge: json.valueAsBigInt<BigInt?>('max_age', acceptCamelCase: true),
      includeRawHistory: json.valueAsBool<bool?>(
        'include_raw_history',
        acceptCamelCase: true,
      ),
      includeMetadata: json.valueAsBool<bool?>(
        'include_metadata',
        acceptCamelCase: true,
      ),
    );
  }

  factory OracleHistoryOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OracleHistoryOptions(
      maxAge: decode.getBigInt<BigInt?>(1),
      includeRawHistory: decode.getBool<bool?>(2),
      includeMetadata: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1OracleHistoryOptions;
}

/// QueryOracleVolatilityRequest is the request type for Query/OracleVolatility
/// RPC method.
class QueryOracleVolatilityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOracleVolatilityResponse> {
  final injective_oracle_v1beta1_oracle.OracleInfo? baseInfo;

  final injective_oracle_v1beta1_oracle.OracleInfo? quoteInfo;

  final OracleHistoryOptions? oracleHistoryOptions;

  const QueryOracleVolatilityRequest({
    this.baseInfo,
    this.quoteInfo,
    this.oracleHistoryOptions,
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
          path: "/injective/oracle/v1beta1/volatility",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [baseInfo, quoteInfo, oracleHistoryOptions];

  @override
  Map<String, dynamic> toJson() {
    return {
      'base_info': baseInfo?.toJson(),
      'quote_info': quoteInfo?.toJson(),
      'oracle_history_options': oracleHistoryOptions?.toJson(),
    };
  }

  factory QueryOracleVolatilityRequest.fromJson(Map<String, dynamic> json) {
    return QueryOracleVolatilityRequest(
      baseInfo: json.valueTo<
        injective_oracle_v1beta1_oracle.OracleInfo?,
        Map<String, dynamic>
      >(
        key: 'base_info',
        parse: (v) => injective_oracle_v1beta1_oracle.OracleInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      quoteInfo: json.valueTo<
        injective_oracle_v1beta1_oracle.OracleInfo?,
        Map<String, dynamic>
      >(
        key: 'quote_info',
        parse: (v) => injective_oracle_v1beta1_oracle.OracleInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      oracleHistoryOptions: json
          .valueTo<OracleHistoryOptions?, Map<String, dynamic>>(
            key: 'oracle_history_options',
            parse: (v) => OracleHistoryOptions.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryOracleVolatilityRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleVolatilityRequest(
      baseInfo: decode.messageTo<injective_oracle_v1beta1_oracle.OracleInfo?>(
        1,
        (b) => injective_oracle_v1beta1_oracle.OracleInfo.deserialize(b),
      ),
      quoteInfo: decode.messageTo<injective_oracle_v1beta1_oracle.OracleInfo?>(
        2,
        (b) => injective_oracle_v1beta1_oracle.OracleInfo.deserialize(b),
      ),
      oracleHistoryOptions: decode.messageTo<OracleHistoryOptions?>(
        3,
        (b) => OracleHistoryOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryOracleVolatilityRequest;
  @override
  QueryOracleVolatilityResponse onQueryResponse(List<int> bytes) {
    return QueryOracleVolatilityResponse.deserialize(bytes);
  }

  @override
  QueryOracleVolatilityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOracleVolatilityResponse.fromJson(json);
  }
}

/// QueryOracleVolatilityResponse is the response type for Query/OracleVolatility
/// RPC method.
class QueryOracleVolatilityResponse extends CosmosProtoMessage {
  final String? volatility;

  final injective_oracle_v1beta1_oracle.MetadataStatistics? historyMetadata;

  final List<injective_oracle_v1beta1_oracle.PriceRecord> rawHistory;

  const QueryOracleVolatilityResponse({
    this.volatility,
    this.historyMetadata,
    this.rawHistory = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [volatility, historyMetadata, rawHistory];

  @override
  Map<String, dynamic> toJson() {
    return {
      'volatility': volatility,
      'history_metadata': historyMetadata?.toJson(),
      'raw_history': rawHistory.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryOracleVolatilityResponse.fromJson(Map<String, dynamic> json) {
    return QueryOracleVolatilityResponse(
      volatility: json.valueAsString<String?>(
        'volatility',
        acceptCamelCase: true,
      ),
      historyMetadata: json.valueTo<
        injective_oracle_v1beta1_oracle.MetadataStatistics?,
        Map<String, dynamic>
      >(
        key: 'history_metadata',
        parse:
            (v) =>
                injective_oracle_v1beta1_oracle.MetadataStatistics.fromJson(v),
        acceptCamelCase: true,
      ),
      rawHistory:
          (json.valueEnsureAsList<dynamic>(
                'raw_history',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PriceRecord,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PriceRecord.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryOracleVolatilityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleVolatilityResponse(
      volatility: decode.getString<String?>(1),
      historyMetadata: decode
          .messageTo<injective_oracle_v1beta1_oracle.MetadataStatistics?>(
            2,
            (b) => injective_oracle_v1beta1_oracle
                .MetadataStatistics.deserialize(b),
          ),
      rawHistory:
          decode
              .getListOfBytes(3)
              .map(
                (b) =>
                    injective_oracle_v1beta1_oracle.PriceRecord.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryOracleVolatilityResponse;
}

class QueryOracleProvidersInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOracleProvidersInfoResponse> {
  const QueryOracleProvidersInfoRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/providers",
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

  factory QueryOracleProvidersInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryOracleProvidersInfoRequest();
  }

  factory QueryOracleProvidersInfoRequest.deserialize(List<int> bytes) {
    return QueryOracleProvidersInfoRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryOracleProvidersInfoRequest;
  @override
  QueryOracleProvidersInfoResponse onQueryResponse(List<int> bytes) {
    return QueryOracleProvidersInfoResponse.deserialize(bytes);
  }

  @override
  QueryOracleProvidersInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryOracleProvidersInfoResponse.fromJson(json);
  }
}

class QueryOracleProvidersInfoResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.ProviderInfo> providers;

  const QueryOracleProvidersInfoResponse({this.providers = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [providers];

  @override
  Map<String, dynamic> toJson() {
    return {'providers': providers.map((e) => e.toJson()).toList()};
  }

  factory QueryOracleProvidersInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryOracleProvidersInfoResponse(
      providers:
          (json.valueEnsureAsList<dynamic>('providers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ProviderInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ProviderInfo.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryOracleProvidersInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleProvidersInfoResponse(
      providers:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    injective_oracle_v1beta1_oracle.ProviderInfo.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryOracleProvidersInfoResponse;
}

class QueryOracleProviderPricesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOracleProviderPricesResponse> {
  final String? provider;

  const QueryOracleProviderPricesRequest({this.provider});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/oracle/v1beta1/provider_prices",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [provider];

  @override
  Map<String, dynamic> toJson() {
    return {'provider': provider};
  }

  factory QueryOracleProviderPricesRequest.fromJson(Map<String, dynamic> json) {
    return QueryOracleProviderPricesRequest(
      provider: json.valueAsString<String?>('provider', acceptCamelCase: true),
    );
  }

  factory QueryOracleProviderPricesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleProviderPricesRequest(
      provider: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryOracleProviderPricesRequest;
  @override
  QueryOracleProviderPricesResponse onQueryResponse(List<int> bytes) {
    return QueryOracleProviderPricesResponse.deserialize(bytes);
  }

  @override
  QueryOracleProviderPricesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryOracleProviderPricesResponse.fromJson(json);
  }
}

class QueryOracleProviderPricesResponse extends CosmosProtoMessage {
  final List<injective_oracle_v1beta1_oracle.ProviderState> providerState;

  const QueryOracleProviderPricesResponse({this.providerState = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [providerState];

  @override
  Map<String, dynamic> toJson() {
    return {'providerState': providerState.map((e) => e.toJson()).toList()};
  }

  factory QueryOracleProviderPricesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryOracleProviderPricesResponse(
      providerState:
          (json.valueEnsureAsList<dynamic>(
                'providerState',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ProviderState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ProviderState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryOracleProviderPricesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOracleProviderPricesResponse(
      providerState:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .ProviderState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1QueryOracleProviderPricesResponse;
}

/// ScalingOptions defines optional configuration to avoid precision loss. The
/// oracle result will be returned as base_price * 10^base_decimals / quote_price
/// * 10^quote_decimals
class ScalingOptions extends CosmosProtoMessage {
  final int? baseDecimals;

  final int? quoteDecimals;

  const ScalingOptions({this.baseDecimals, this.quoteDecimals});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.uint32(2)],
    );
  }

  @override
  List<Object?> get protoValues => [baseDecimals, quoteDecimals];

  @override
  Map<String, dynamic> toJson() {
    return {'base_decimals': baseDecimals, 'quote_decimals': quoteDecimals};
  }

  factory ScalingOptions.fromJson(Map<String, dynamic> json) {
    return ScalingOptions(
      baseDecimals: json.valueAsInt<int?>(
        'base_decimals',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
    );
  }

  factory ScalingOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ScalingOptions(
      baseDecimals: decode.getInt<int?>(1),
      quoteDecimals: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1ScalingOptions;
}

/// QueryOraclePriceRequest is the request type for the Query/OraclePrice RPC
/// method.
class QueryOraclePriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOraclePriceResponse> {
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  final String? base;

  final String? quote;

  final ScalingOptions? scalingOptions;

  const QueryOraclePriceRequest({
    this.oracleType,
    this.base,
    this.quote,
    this.scalingOptions,
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
          path: "/injective/oracle/v1beta1/price",
        ),
      ],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [oracleType, base, quote, scalingOptions];

  @override
  Map<String, dynamic> toJson() {
    return {
      'oracle_type': oracleType?.protoName,
      'base': base,
      'quote': quote,
      'scaling_options': scalingOptions?.toJson(),
    };
  }

  factory QueryOraclePriceRequest.fromJson(Map<String, dynamic> json) {
    return QueryOraclePriceRequest(
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      base: json.valueAsString<String?>('base', acceptCamelCase: true),
      quote: json.valueAsString<String?>('quote', acceptCamelCase: true),
      scalingOptions: json.valueTo<ScalingOptions?, Map<String, dynamic>>(
        key: 'scaling_options',
        parse: (v) => ScalingOptions.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOraclePriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePriceRequest(
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        1,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      base: decode.getString<String?>(2),
      quote: decode.getString<String?>(3),
      scalingOptions: decode.messageTo<ScalingOptions?>(
        4,
        (b) => ScalingOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryOraclePriceRequest;
  @override
  QueryOraclePriceResponse onQueryResponse(List<int> bytes) {
    return QueryOraclePriceResponse.deserialize(bytes);
  }

  @override
  QueryOraclePriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOraclePriceResponse.fromJson(json);
  }
}

class PricePairState extends CosmosProtoMessage {
  final String? pairPrice;

  final String? basePrice;

  final String? quotePrice;

  final String? baseCumulativePrice;

  final String? quoteCumulativePrice;

  final BigInt? baseTimestamp;

  final BigInt? quoteTimestamp;

  const PricePairState({
    this.pairPrice,
    this.basePrice,
    this.quotePrice,
    this.baseCumulativePrice,
    this.quoteCumulativePrice,
    this.baseTimestamp,
    this.quoteTimestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.int64(6),
        ProtoFieldConfig.int64(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    pairPrice,
    basePrice,
    quotePrice,
    baseCumulativePrice,
    quoteCumulativePrice,
    baseTimestamp,
    quoteTimestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pair_price': pairPrice,
      'base_price': basePrice,
      'quote_price': quotePrice,
      'base_cumulative_price': baseCumulativePrice,
      'quote_cumulative_price': quoteCumulativePrice,
      'base_timestamp': baseTimestamp?.toString(),
      'quote_timestamp': quoteTimestamp?.toString(),
    };
  }

  factory PricePairState.fromJson(Map<String, dynamic> json) {
    return PricePairState(
      pairPrice: json.valueAsString<String?>(
        'pair_price',
        acceptCamelCase: true,
      ),
      basePrice: json.valueAsString<String?>(
        'base_price',
        acceptCamelCase: true,
      ),
      quotePrice: json.valueAsString<String?>(
        'quote_price',
        acceptCamelCase: true,
      ),
      baseCumulativePrice: json.valueAsString<String?>(
        'base_cumulative_price',
        acceptCamelCase: true,
      ),
      quoteCumulativePrice: json.valueAsString<String?>(
        'quote_cumulative_price',
        acceptCamelCase: true,
      ),
      baseTimestamp: json.valueAsBigInt<BigInt?>(
        'base_timestamp',
        acceptCamelCase: true,
      ),
      quoteTimestamp: json.valueAsBigInt<BigInt?>(
        'quote_timestamp',
        acceptCamelCase: true,
      ),
    );
  }

  factory PricePairState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PricePairState(
      pairPrice: decode.getString<String?>(1),
      basePrice: decode.getString<String?>(2),
      quotePrice: decode.getString<String?>(3),
      baseCumulativePrice: decode.getString<String?>(4),
      quoteCumulativePrice: decode.getString<String?>(5),
      baseTimestamp: decode.getBigInt<BigInt?>(6),
      quoteTimestamp: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1PricePairState;
}

/// QueryOraclePriceResponse is the response type for the Query/OraclePrice RPC
/// method.
class QueryOraclePriceResponse extends CosmosProtoMessage {
  final PricePairState? pricePairState;

  const QueryOraclePriceResponse({this.pricePairState});

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
  List<Object?> get protoValues => [pricePairState];

  @override
  Map<String, dynamic> toJson() {
    return {'price_pair_state': pricePairState?.toJson()};
  }

  factory QueryOraclePriceResponse.fromJson(Map<String, dynamic> json) {
    return QueryOraclePriceResponse(
      pricePairState: json.valueTo<PricePairState?, Map<String, dynamic>>(
        key: 'price_pair_state',
        parse: (v) => PricePairState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOraclePriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePriceResponse(
      pricePairState: decode.messageTo<PricePairState?>(
        1,
        (b) => PricePairState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1QueryOraclePriceResponse;
}
