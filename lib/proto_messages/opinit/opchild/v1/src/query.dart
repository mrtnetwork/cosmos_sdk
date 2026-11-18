import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/opinit/opchild/v1/src/types.dart"
    as opinit_opchild_v1_types;

/// QueryValidatorsRequest is request type for Query/Validators RPC method.
class QueryValidatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryValidatorsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/validators",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryValidatorsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValidatorsRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorsRequest(
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
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryValidatorsRequest;
  @override
  QueryValidatorsResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryValidatorsResponse.fromJson(json);
  }
}

/// QueryValidatorsResponse is response type for the Query/Validators RPC method
class QueryValidatorsResponse extends CosmosProtoMessage {
  /// validators contains all the queried validators.
  final List<opinit_opchild_v1_types.Validator> validators;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryValidatorsResponse({this.validators = const [], this.pagination});

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
  List<Object?> get protoValues => [validators, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'validators': validators.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryValidatorsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValidatorsResponse(
      validators:
          (json.valueEnsureAsList<dynamic>(
                'validators',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  opinit_opchild_v1_types.Validator,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => opinit_opchild_v1_types.Validator.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorsResponse(
      validators:
          decode
              .getListOfBytes(1)
              .map((b) => opinit_opchild_v1_types.Validator.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryValidatorsResponse;
}

/// QueryValidatorRequest is response type for the Query/Validator RPC method
class QueryValidatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorResponse> {
  /// validator_addr defines the validator address to query for.
  final String? validatorAddr;

  const QueryValidatorRequest({this.validatorAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/validator/{validator_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddr];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'validator_addr': validatorAddr};
  }

  factory QueryValidatorRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValidatorRequest(
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValidatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorRequest(validatorAddr: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryValidatorRequest;
  @override
  QueryValidatorResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorResponse.deserialize(bytes);
  }

  @override
  QueryValidatorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryValidatorResponse.fromJson(json);
  }
}

/// QueryValidatorResponse is response type for the Query/Validator RPC method
class QueryValidatorResponse extends CosmosProtoMessage {
  /// validator defines the validator info.
  final opinit_opchild_v1_types.Validator? validator;

  const QueryValidatorResponse({this.validator});

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
  List<Object?> get protoValues => [validator];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'validator': config.encodeMessage(validator)};
  }

  factory QueryValidatorResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValidatorResponse(
      validator: json.valueTo<opinit_opchild_v1_types.Validator?, Object>(
        key: 'validator',
        parse:
            (v) => opinit_opchild_v1_types.Validator.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValidatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorResponse(
      validator: decode.messageTo<opinit_opchild_v1_types.Validator?>(
        1,
        (b) => opinit_opchild_v1_types.Validator.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryValidatorResponse;
}

/// QueryBridgeInfoRequest is request type for the Query/BridgeInfo RPC method.
class QueryBridgeInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBridgeInfoResponse> {
  const QueryBridgeInfoRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/bridge_info",
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

  factory QueryBridgeInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBridgeInfoRequest();
  }

  factory QueryBridgeInfoRequest.deserialize(List<int> bytes) {
    return QueryBridgeInfoRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryBridgeInfoRequest;
  @override
  QueryBridgeInfoResponse onQueryResponse(List<int> bytes) {
    return QueryBridgeInfoResponse.deserialize(bytes);
  }

  @override
  QueryBridgeInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBridgeInfoResponse.fromJson(json);
  }
}

/// QueryBridgeInfoResponse is response type for the Query/BridgeInfo RPC method.
class QueryBridgeInfoResponse extends CosmosProtoMessage {
  /// bridge_info holds all the information about the bridge.
  final opinit_opchild_v1_types.BridgeInfo? bridgeInfo;

  const QueryBridgeInfoResponse({this.bridgeInfo});

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
  List<Object?> get protoValues => [bridgeInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'bridge_info': config.encodeMessage(bridgeInfo)};
  }

  factory QueryBridgeInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBridgeInfoResponse(
      bridgeInfo: json.valueTo<opinit_opchild_v1_types.BridgeInfo?, Object>(
        key: 'bridge_info',
        parse:
            (v) => opinit_opchild_v1_types.BridgeInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBridgeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBridgeInfoResponse(
      bridgeInfo: decode.messageTo<opinit_opchild_v1_types.BridgeInfo?>(
        1,
        (b) => opinit_opchild_v1_types.BridgeInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryBridgeInfoResponse;
}

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
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/params",
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
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryParamsRequest;
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
  final opinit_opchild_v1_types.Params? params;

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
      params: json.valueTo<opinit_opchild_v1_types.Params?, Object>(
        key: 'params',
        parse:
            (v) => opinit_opchild_v1_types.Params.fromJson(
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
      params: decode.messageTo<opinit_opchild_v1_types.Params?>(
        1,
        (b) => opinit_opchild_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryParamsResponse;
}

/// QueryNextL1SequenceRequest is request type for the Query/NextL1Sequence RPC method.
class QueryNextL1SequenceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNextL1SequenceResponse> {
  const QueryNextL1SequenceRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/next_l1_sequence",
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

  factory QueryNextL1SequenceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNextL1SequenceRequest();
  }

  factory QueryNextL1SequenceRequest.deserialize(List<int> bytes) {
    return QueryNextL1SequenceRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryNextL1SequenceRequest;
  @override
  QueryNextL1SequenceResponse onQueryResponse(List<int> bytes) {
    return QueryNextL1SequenceResponse.deserialize(bytes);
  }

  @override
  QueryNextL1SequenceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNextL1SequenceResponse.fromJson(json);
  }
}

/// QueryNextL1SequenceResponse is response type for the Query/NextL1Sequence RPC method.
class QueryNextL1SequenceResponse extends CosmosProtoMessage {
  /// next_l1_sequence holds the next l1 sequence number.
  final BigInt? nextL1Sequence;

  const QueryNextL1SequenceResponse({this.nextL1Sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [nextL1Sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'next_l1_sequence': config.encodeBigint(nextL1Sequence)};
  }

  factory QueryNextL1SequenceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNextL1SequenceResponse(
      nextL1Sequence: json.valueAsBigInt<BigInt?>(
        'next_l1_sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNextL1SequenceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextL1SequenceResponse(
      nextL1Sequence: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryNextL1SequenceResponse;
}

/// QueryNextL2SequenceRequest is request type for the Query/NextL2Sequence RPC method.
class QueryNextL2SequenceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNextL2SequenceResponse> {
  const QueryNextL2SequenceRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/next_l2_sequence",
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

  factory QueryNextL2SequenceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNextL2SequenceRequest();
  }

  factory QueryNextL2SequenceRequest.deserialize(List<int> bytes) {
    return QueryNextL2SequenceRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryNextL2SequenceRequest;
  @override
  QueryNextL2SequenceResponse onQueryResponse(List<int> bytes) {
    return QueryNextL2SequenceResponse.deserialize(bytes);
  }

  @override
  QueryNextL2SequenceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNextL2SequenceResponse.fromJson(json);
  }
}

/// QueryNextL2SequenceResponse is response type for the Query/NextL2Sequence RPC method.
class QueryNextL2SequenceResponse extends CosmosProtoMessage {
  /// next_l2_sequence holds the next l2 sequence number.
  final BigInt? nextL2Sequence;

  const QueryNextL2SequenceResponse({this.nextL2Sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [nextL2Sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'next_l2_sequence': config.encodeBigint(nextL2Sequence)};
  }

  factory QueryNextL2SequenceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNextL2SequenceResponse(
      nextL2Sequence: json.valueAsBigInt<BigInt?>(
        'next_l2_sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNextL2SequenceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextL2SequenceResponse(
      nextL2Sequence: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryNextL2SequenceResponse;
}

/// QueryBaseDenomRequest is request type for the Query/BaseDenom RPC method.
class QueryBaseDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBaseDenomResponse> {
  final String? denom;

  const QueryBaseDenomRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/base_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom};
  }

  factory QueryBaseDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBaseDenomRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBaseDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBaseDenomRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryBaseDenomRequest;
  @override
  QueryBaseDenomResponse onQueryResponse(List<int> bytes) {
    return QueryBaseDenomResponse.deserialize(bytes);
  }

  @override
  QueryBaseDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBaseDenomResponse.fromJson(json);
  }
}

/// QueryBaseDenomResponse is response type for the Query/BaseDenom RPC method.
class QueryBaseDenomResponse extends CosmosProtoMessage {
  final String? baseDenom;

  const QueryBaseDenomResponse({this.baseDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [baseDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'base_denom': baseDenom};
  }

  factory QueryBaseDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBaseDenomResponse(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBaseDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBaseDenomResponse(baseDenom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryBaseDenomResponse;
}

/// QueryMigrationInfoRequest is request type for the Query/MigrationInfo RPC method.
class QueryMigrationInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMigrationInfoResponse> {
  final String? denom;

  const QueryMigrationInfoRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/opinit/opchild/v1/migration_info/by_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom};
  }

  factory QueryMigrationInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMigrationInfoRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMigrationInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMigrationInfoRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryMigrationInfoRequest;
  @override
  QueryMigrationInfoResponse onQueryResponse(List<int> bytes) {
    return QueryMigrationInfoResponse.deserialize(bytes);
  }

  @override
  QueryMigrationInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMigrationInfoResponse.fromJson(json);
  }
}

/// QueryMigrationInfoResponse is response type for the Query/MigrationInfo RPC method.
class QueryMigrationInfoResponse extends CosmosProtoMessage {
  final opinit_opchild_v1_types.MigrationInfo? migrationInfo;

  final String? ibcDenom;

  const QueryMigrationInfoResponse({this.migrationInfo, this.ibcDenom});

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
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [migrationInfo, ibcDenom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'migration_info': config.encodeMessage(migrationInfo),
      'ibc_denom': ibcDenom,
    };
  }

  factory QueryMigrationInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMigrationInfoResponse(
      migrationInfo: json
          .valueTo<opinit_opchild_v1_types.MigrationInfo?, Object>(
            key: 'migration_info',
            parse:
                (v) => opinit_opchild_v1_types.MigrationInfo.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      ibcDenom: json.valueAsString<String?>(
        'ibc_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMigrationInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMigrationInfoResponse(
      migrationInfo: decode.messageTo<opinit_opchild_v1_types.MigrationInfo?>(
        1,
        (b) => opinit_opchild_v1_types.MigrationInfo.deserialize(b),
      ),
      ibcDenom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1QueryMigrationInfoResponse;
}
