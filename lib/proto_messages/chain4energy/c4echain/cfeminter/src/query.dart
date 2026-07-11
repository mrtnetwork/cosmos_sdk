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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<
        chain4energy_c4echain_cfeminter_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => chain4energy_c4echain_cfeminter_params.Params.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'inflation': inflation};
  }

  factory QueryInflationResponse.fromJson(Map<String, dynamic> json) {
    return QueryInflationResponse(
      inflation: json.valueAsString<String?>(
        'inflation',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryStateRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {
      'minter_state': minterState?.toJson(),
      'state_history': stateHistory.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryStateResponse(
      minterState: json.valueTo<
        chain4energy_c4echain_cfeminter_minter.MinterState?,
        Map<String, dynamic>
      >(
        key: 'minter_state',
        parse:
            (v) =>
                chain4energy_c4echain_cfeminter_minter.MinterState.fromJson(v),
        acceptCamelCase: true,
      ),
      stateHistory:
          (json.valueEnsureAsList<dynamic>(
                'state_history',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeminter_minter.MinterState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeminter_minter
                          .MinterState.fromJson(v),
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
