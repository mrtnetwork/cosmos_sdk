import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfedistributor/src/params.dart"
    as chain4energy_c4echain_cfedistributor_params;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfedistributor/src/sub_distributor.dart"
    as chain4energy_c4echain_cfedistributor_sub_distributor;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

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
          path: "/c4e/distributor/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorQueryParamsRequest;
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
  final chain4energy_c4echain_cfedistributor_params.Params? params;

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
        chain4energy_c4echain_cfedistributor_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) =>
                chain4energy_c4echain_cfedistributor_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode
          .messageTo<chain4energy_c4echain_cfedistributor_params.Params?>(
            1,
            (b) => chain4energy_c4echain_cfedistributor_params
                .Params.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorQueryParamsResponse;
}

class QueryStatesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStatesResponse> {
  const QueryStatesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/distributor/v1beta1/states",
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

  factory QueryStatesRequest.fromJson(Map<String, dynamic> json) {
    return QueryStatesRequest();
  }

  factory QueryStatesRequest.deserialize(List<int> bytes) {
    return QueryStatesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorQueryStatesRequest;
  @override
  QueryStatesResponse onQueryResponse(List<int> bytes) {
    return QueryStatesResponse.deserialize(bytes);
  }

  @override
  QueryStatesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStatesResponse.fromJson(json);
  }
}

class QueryStatesResponse extends CosmosProtoMessage {
  final List<chain4energy_c4echain_cfedistributor_sub_distributor.State> states;

  final List<cosmos_base_v1beta1_coin.Coin> coinsOnDistributorAccount;

  const QueryStatesResponse({
    this.states = const [],
    this.coinsOnDistributorAccount = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [states, coinsOnDistributorAccount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'states': states.map((e) => e.toJson()).toList(),
      'coins_on_distributor_account':
          coinsOnDistributorAccount.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryStatesResponse.fromJson(Map<String, dynamic> json) {
    return QueryStatesResponse(
      states:
          (json.valueEnsureAsList<dynamic>('states', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfedistributor_sub_distributor.State,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          chain4energy_c4echain_cfedistributor_sub_distributor
                              .State.fromJson(v),
                ),
              )
              .toList(),
      coinsOnDistributorAccount:
          (json.valueEnsureAsList<dynamic>(
                'coins_on_distributor_account',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryStatesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStatesResponse(
      states:
          decode
              .getListOfBytes(1)
              .map(
                (b) => chain4energy_c4echain_cfedistributor_sub_distributor
                    .State.deserialize(b),
              )
              .toList(),
      coinsOnDistributorAccount:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorQueryStatesResponse;
}
