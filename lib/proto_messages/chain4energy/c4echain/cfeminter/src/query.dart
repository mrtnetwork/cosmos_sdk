import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeminter/src/params.dart"
    as chain4energy_c4echain_cfeminter_params;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeminter/src/minter.dart"
    as chain4energy_c4echain_cfeminter_minter;

/// this line is used by starport scaffolding # 2
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
          path: "/c4e/minter/v1beta1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterQueryParamsRequest;
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
  final chain4energy_c4echain_cfeminter_params.Params? params;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsResponse(
      params: json
          .valueTo<chain4energy_c4echain_cfeminter_params.Params?, Object>(
            key: 'params',
            parse:
                (v) => chain4energy_c4echain_cfeminter_params.Params.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<chain4energy_c4echain_cfeminter_params.Params?>(
        1,
        (b) => chain4energy_c4echain_cfeminter_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeminterQueryParamsResponse;
}

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
          path: "/c4e/minter/v1beta1/inflation",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryInflationRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryInflationRequest();
  }

  factory QueryInflationRequest.deserialize(List<int> bytes) {
    return QueryInflationRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeminterQueryInflationRequest;
  @override
  QueryInflationResponse onQueryResponse(List<int> bytes) {
    return QueryInflationResponse.deserialize(bytes);
  }

  @override
  QueryInflationResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInflationResponse.fromJson(json);
  }
}

class QueryInflationResponse extends CosmosProtoMessage {
  final String? inflation;

  const QueryInflationResponse({this.inflation});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [inflation];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'inflation': inflation};
  }

  factory QueryInflationResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryInflationResponse(
      inflation: json.valueAsString<String?>(
        'inflation',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryInflationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInflationResponse(inflation: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeminterQueryInflationResponse;
}

class QueryStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStateResponse> {
  const QueryStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/minter/v1beta1/state",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStateRequest();
  }

  factory QueryStateRequest.deserialize(List<int> bytes) {
    return QueryStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterQueryStateRequest;
  @override
  QueryStateResponse onQueryResponse(List<int> bytes) {
    return QueryStateResponse.deserialize(bytes);
  }

  @override
  QueryStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStateResponse.fromJson(json);
  }
}

class QueryStateResponse extends CosmosProtoMessage {
  final chain4energy_c4echain_cfeminter_minter.MinterState? minterState;

  final List<chain4energy_c4echain_cfeminter_minter.MinterState> stateHistory;

  const QueryStateResponse({this.minterState, this.stateHistory = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [minterState, stateHistory];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'minter_state': config.encodeMessage(minterState),
      'state_history':
          stateHistory.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStateResponse(
      minterState: json
          .valueTo<chain4energy_c4echain_cfeminter_minter.MinterState?, Object>(
            key: 'minter_state',
            parse:
                (v) =>
                    chain4energy_c4echain_cfeminter_minter.MinterState.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      stateHistory:
          (json.valueEnsureAsList<dynamic>(
                'state_history',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeminter_minter.MinterState,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeminter_minter
                          .MinterState.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStateResponse(
      minterState: decode
          .messageTo<chain4energy_c4echain_cfeminter_minter.MinterState?>(
            1,
            (b) => chain4energy_c4echain_cfeminter_minter
                .MinterState.deserialize(b),
          ),
      stateHistory:
          decode
              .getListOfBytes(2)
              .map(
                (b) => chain4energy_c4echain_cfeminter_minter
                    .MinterState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterQueryStateResponse;
}
