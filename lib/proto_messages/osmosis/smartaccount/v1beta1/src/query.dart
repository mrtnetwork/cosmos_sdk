import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/smartaccount/v1beta1/src/params.dart"
    as osmosis_smartaccount_v1beta1_params;
import "package:cosmos_sdk/proto_messages/osmosis/smartaccount/v1beta1/src/models.dart"
    as osmosis_smartaccount_v1beta1_models;

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
          path: "/osmosis/smartaccount/params",
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
      DefaultCosmosProtoTypeUrl.osmosisSmartaccountV1beta1QueryParamsRequest;
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
  final osmosis_smartaccount_v1beta1_params.Params? params;

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
      params: json.valueTo<osmosis_smartaccount_v1beta1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => osmosis_smartaccount_v1beta1_params.Params.fromJson(
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
      params: decode.messageTo<osmosis_smartaccount_v1beta1_params.Params?>(
        1,
        (b) => osmosis_smartaccount_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSmartaccountV1beta1QueryParamsResponse;
}

/// MsgGetAuthenticatorsRequest defines the Msg/GetAuthenticators request type.
class GetAuthenticatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetAuthenticatorsResponse> {
  final String? account;

  const GetAuthenticatorsRequest({this.account});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/smartaccount/authenticators/{account}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'account': account};
  }

  factory GetAuthenticatorsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetAuthenticatorsRequest(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetAuthenticatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetAuthenticatorsRequest(account: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1GetAuthenticatorsRequest;
  @override
  GetAuthenticatorsResponse onQueryResponse(List<int> bytes) {
    return GetAuthenticatorsResponse.deserialize(bytes);
  }

  @override
  GetAuthenticatorsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetAuthenticatorsResponse.fromJson(json);
  }
}

/// MsgGetAuthenticatorsResponse defines the Msg/GetAuthenticators response type.
class GetAuthenticatorsResponse extends CosmosProtoMessage {
  final List<osmosis_smartaccount_v1beta1_models.AccountAuthenticator>
  accountAuthenticators;

  const GetAuthenticatorsResponse({this.accountAuthenticators = const []});

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
  List<Object?> get protoValues => [accountAuthenticators];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account_authenticators':
          accountAuthenticators.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory GetAuthenticatorsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetAuthenticatorsResponse(
      accountAuthenticators:
          (json.valueEnsureAsList<dynamic>(
                'account_authenticators',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_smartaccount_v1beta1_models.AccountAuthenticator,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_smartaccount_v1beta1_models
                          .AccountAuthenticator.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory GetAuthenticatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetAuthenticatorsResponse(
      accountAuthenticators:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_smartaccount_v1beta1_models
                    .AccountAuthenticator.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1GetAuthenticatorsResponse;
}

/// MsgGetAuthenticatorRequest defines the Msg/GetAuthenticator request type.
class GetAuthenticatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetAuthenticatorResponse> {
  final String? account;

  final BigInt? authenticatorId;

  const GetAuthenticatorRequest({this.account, this.authenticatorId});

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
              "/osmosis/smartaccount/authenticator/{account}/{authenticator_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [account, authenticatorId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account': account,
      'authenticator_id': config.encodeBigint(authenticatorId),
    };
  }

  factory GetAuthenticatorRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetAuthenticatorRequest(
      account: json.valueAsString<String?>(
        'account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      authenticatorId: json.valueAsBigInt<BigInt?>(
        'authenticator_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetAuthenticatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetAuthenticatorRequest(
      account: decode.getString<String?>(1),
      authenticatorId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1GetAuthenticatorRequest;
  @override
  GetAuthenticatorResponse onQueryResponse(List<int> bytes) {
    return GetAuthenticatorResponse.deserialize(bytes);
  }

  @override
  GetAuthenticatorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetAuthenticatorResponse.fromJson(json);
  }
}

/// MsgGetAuthenticatorResponse defines the Msg/GetAuthenticator response type.
class GetAuthenticatorResponse extends CosmosProtoMessage {
  final osmosis_smartaccount_v1beta1_models.AccountAuthenticator?
  accountAuthenticator;

  const GetAuthenticatorResponse({this.accountAuthenticator});

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
  List<Object?> get protoValues => [accountAuthenticator];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account_authenticator': config.encodeMessage(accountAuthenticator),
    };
  }

  factory GetAuthenticatorResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GetAuthenticatorResponse(
      accountAuthenticator: json.valueTo<
        osmosis_smartaccount_v1beta1_models.AccountAuthenticator?,
        Object
      >(
        key: 'account_authenticator',
        parse:
            (v) => osmosis_smartaccount_v1beta1_models
                .AccountAuthenticator.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory GetAuthenticatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetAuthenticatorResponse(
      accountAuthenticator: decode
          .messageTo<osmosis_smartaccount_v1beta1_models.AccountAuthenticator?>(
            1,
            (b) => osmosis_smartaccount_v1beta1_models
                .AccountAuthenticator.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1GetAuthenticatorResponse;
}
