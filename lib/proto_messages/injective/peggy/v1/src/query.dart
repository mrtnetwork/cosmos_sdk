import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/params.dart"
    as injective_peggy_v1_params;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/types.dart"
    as injective_peggy_v1_types;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/msgs.dart"
    as injective_peggy_v1_msgs;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/pool.dart"
    as injective_peggy_v1_pool;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/batch.dart"
    as injective_peggy_v1_batch;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/genesis.dart"
    as injective_peggy_v1_genesis;

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
          path: "/peggy/v1/params",
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
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

class QueryParamsResponse extends CosmosProtoMessage {
  final injective_peggy_v1_params.Params? params;

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
      params: json.valueTo<injective_peggy_v1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_peggy_v1_params.Params.fromJson(
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
      params: decode.messageTo<injective_peggy_v1_params.Params?>(
        1,
        (b) => injective_peggy_v1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryParamsResponse;
}

class QueryCurrentValsetRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCurrentValsetResponse> {
  const QueryCurrentValsetRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/valset/current",
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

  factory QueryCurrentValsetRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCurrentValsetRequest();
  }

  factory QueryCurrentValsetRequest.deserialize(List<int> bytes) {
    return QueryCurrentValsetRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryCurrentValsetRequest;
  @override
  QueryCurrentValsetResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentValsetResponse.deserialize(bytes);
  }

  @override
  QueryCurrentValsetResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCurrentValsetResponse.fromJson(json);
  }
}

class QueryCurrentValsetResponse extends CosmosProtoMessage {
  final injective_peggy_v1_types.Valset? valset;

  const QueryCurrentValsetResponse({this.valset});

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
  List<Object?> get protoValues => [valset];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'valset': config.encodeMessage(valset)};
  }

  factory QueryCurrentValsetResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCurrentValsetResponse(
      valset: json.valueTo<injective_peggy_v1_types.Valset?, Object>(
        key: 'valset',
        parse:
            (v) => injective_peggy_v1_types.Valset.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCurrentValsetResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentValsetResponse(
      valset: decode.messageTo<injective_peggy_v1_types.Valset?>(
        1,
        (b) => injective_peggy_v1_types.Valset.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryCurrentValsetResponse;
}

class QueryValsetRequestRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValsetRequestResponse> {
  final BigInt? nonce;

  const QueryValsetRequestRequest({this.nonce});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/valset",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce)};
  }

  factory QueryValsetRequestRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValsetRequestRequest(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValsetRequestRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValsetRequestRequest(nonce: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryValsetRequestRequest;
  @override
  QueryValsetRequestResponse onQueryResponse(List<int> bytes) {
    return QueryValsetRequestResponse.deserialize(bytes);
  }

  @override
  QueryValsetRequestResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryValsetRequestResponse.fromJson(json);
  }
}

class QueryValsetRequestResponse extends CosmosProtoMessage {
  final injective_peggy_v1_types.Valset? valset;

  const QueryValsetRequestResponse({this.valset});

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
  List<Object?> get protoValues => [valset];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'valset': config.encodeMessage(valset)};
  }

  factory QueryValsetRequestResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValsetRequestResponse(
      valset: json.valueTo<injective_peggy_v1_types.Valset?, Object>(
        key: 'valset',
        parse:
            (v) => injective_peggy_v1_types.Valset.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValsetRequestResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValsetRequestResponse(
      valset: decode.messageTo<injective_peggy_v1_types.Valset?>(
        1,
        (b) => injective_peggy_v1_types.Valset.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryValsetRequestResponse;
}

class QueryValsetConfirmRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValsetConfirmResponse> {
  final BigInt? nonce;

  final String? address;

  const QueryValsetConfirmRequest({this.nonce, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/valset/confirm",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [nonce, address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce), 'address': address};
  }

  factory QueryValsetConfirmRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValsetConfirmRequest(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValsetConfirmRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValsetConfirmRequest(
      nonce: decode.getBigInt<BigInt?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryValsetConfirmRequest;
  @override
  QueryValsetConfirmResponse onQueryResponse(List<int> bytes) {
    return QueryValsetConfirmResponse.deserialize(bytes);
  }

  @override
  QueryValsetConfirmResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryValsetConfirmResponse.fromJson(json);
  }
}

class QueryValsetConfirmResponse extends CosmosProtoMessage {
  final injective_peggy_v1_msgs.MsgValsetConfirm? confirm;

  const QueryValsetConfirmResponse({this.confirm});

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
  List<Object?> get protoValues => [confirm];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'confirm': config.encodeMessage(confirm)};
  }

  factory QueryValsetConfirmResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValsetConfirmResponse(
      confirm: json.valueTo<injective_peggy_v1_msgs.MsgValsetConfirm?, Object>(
        key: 'confirm',
        parse:
            (v) => injective_peggy_v1_msgs.MsgValsetConfirm.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValsetConfirmResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValsetConfirmResponse(
      confirm: decode.messageTo<injective_peggy_v1_msgs.MsgValsetConfirm?>(
        1,
        (b) => injective_peggy_v1_msgs.MsgValsetConfirm.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryValsetConfirmResponse;
}

class QueryValsetConfirmsByNonceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValsetConfirmsByNonceResponse> {
  final BigInt? nonce;

  const QueryValsetConfirmsByNonceRequest({this.nonce});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/confirms/{nonce}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce)};
  }

  factory QueryValsetConfirmsByNonceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValsetConfirmsByNonceRequest(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValsetConfirmsByNonceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValsetConfirmsByNonceRequest(
      nonce: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryValsetConfirmsByNonceRequest;
  @override
  QueryValsetConfirmsByNonceResponse onQueryResponse(List<int> bytes) {
    return QueryValsetConfirmsByNonceResponse.deserialize(bytes);
  }

  @override
  QueryValsetConfirmsByNonceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValsetConfirmsByNonceResponse.fromJson(json);
  }
}

class QueryValsetConfirmsByNonceResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_msgs.MsgValsetConfirm> confirms;

  const QueryValsetConfirmsByNonceResponse({this.confirms = const []});

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
  List<Object?> get protoValues => [confirms];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'confirms': confirms.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryValsetConfirmsByNonceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValsetConfirmsByNonceResponse(
      confirms:
          (json.valueEnsureAsList<dynamic>(
                'confirms',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgValsetConfirm,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_msgs.MsgValsetConfirm.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryValsetConfirmsByNonceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValsetConfirmsByNonceResponse(
      confirms:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_peggy_v1_msgs.MsgValsetConfirm.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryValsetConfirmsByNonceResponse;
}

class QueryLastValsetRequestsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastValsetRequestsResponse> {
  const QueryLastValsetRequestsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/valset/requests",
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

  factory QueryLastValsetRequestsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastValsetRequestsRequest();
  }

  factory QueryLastValsetRequestsRequest.deserialize(List<int> bytes) {
    return QueryLastValsetRequestsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryLastValsetRequestsRequest;
  @override
  QueryLastValsetRequestsResponse onQueryResponse(List<int> bytes) {
    return QueryLastValsetRequestsResponse.deserialize(bytes);
  }

  @override
  QueryLastValsetRequestsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastValsetRequestsResponse.fromJson(json);
  }
}

class QueryLastValsetRequestsResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_types.Valset> valsets;

  const QueryLastValsetRequestsResponse({this.valsets = const []});

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
  List<Object?> get protoValues => [valsets];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'valsets': valsets.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryLastValsetRequestsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastValsetRequestsResponse(
      valsets:
          (json.valueEnsureAsList<dynamic>(
                'valsets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<injective_peggy_v1_types.Valset, Object>(
                      value: e,
                      parse:
                          (v) => injective_peggy_v1_types.Valset.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryLastValsetRequestsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastValsetRequestsResponse(
      valsets:
          decode
              .getListOfBytes(1)
              .map((b) => injective_peggy_v1_types.Valset.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryLastValsetRequestsResponse;
}

class QueryLastPendingValsetRequestByAddrRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastPendingValsetRequestByAddrResponse> {
  final String? address;

  const QueryLastPendingValsetRequestByAddrRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/valset/last",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory QueryLastPendingValsetRequestByAddrRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastPendingValsetRequestByAddrRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLastPendingValsetRequestByAddrRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastPendingValsetRequestByAddrRequest(
      address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryLastPendingValsetRequestByAddrRequest;
  @override
  QueryLastPendingValsetRequestByAddrResponse onQueryResponse(List<int> bytes) {
    return QueryLastPendingValsetRequestByAddrResponse.deserialize(bytes);
  }

  @override
  QueryLastPendingValsetRequestByAddrResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastPendingValsetRequestByAddrResponse.fromJson(json);
  }
}

class QueryLastPendingValsetRequestByAddrResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_types.Valset> valsets;

  const QueryLastPendingValsetRequestByAddrResponse({this.valsets = const []});

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
  List<Object?> get protoValues => [valsets];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'valsets': valsets.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryLastPendingValsetRequestByAddrResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastPendingValsetRequestByAddrResponse(
      valsets:
          (json.valueEnsureAsList<dynamic>(
                'valsets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<injective_peggy_v1_types.Valset, Object>(
                      value: e,
                      parse:
                          (v) => injective_peggy_v1_types.Valset.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory QueryLastPendingValsetRequestByAddrResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastPendingValsetRequestByAddrResponse(
      valsets:
          decode
              .getListOfBytes(1)
              .map((b) => injective_peggy_v1_types.Valset.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryLastPendingValsetRequestByAddrResponse;
}

class QueryBatchFeeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBatchFeeResponse> {
  const QueryBatchFeeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/batchfees",
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

  factory QueryBatchFeeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBatchFeeRequest();
  }

  factory QueryBatchFeeRequest.deserialize(List<int> bytes) {
    return QueryBatchFeeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryBatchFeeRequest;
  @override
  QueryBatchFeeResponse onQueryResponse(List<int> bytes) {
    return QueryBatchFeeResponse.deserialize(bytes);
  }

  @override
  QueryBatchFeeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBatchFeeResponse.fromJson(json);
  }
}

class QueryBatchFeeResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_pool.BatchFees> batchFees;

  const QueryBatchFeeResponse({this.batchFees = const []});

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
  List<Object?> get protoValues => [batchFees];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'batchFees': batchFees.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryBatchFeeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBatchFeeResponse(
      batchFees:
          (json.valueEnsureAsList<dynamic>(
                'batchFees',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_pool.BatchFees,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_pool.BatchFees.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBatchFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchFeeResponse(
      batchFees:
          decode
              .getListOfBytes(1)
              .map((b) => injective_peggy_v1_pool.BatchFees.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryBatchFeeResponse;
}

class QueryLastPendingBatchRequestByAddrRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastPendingBatchRequestByAddrResponse> {
  final String? address;

  const QueryLastPendingBatchRequestByAddrRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/batch/last",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory QueryLastPendingBatchRequestByAddrRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastPendingBatchRequestByAddrRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLastPendingBatchRequestByAddrRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastPendingBatchRequestByAddrRequest(
      address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryLastPendingBatchRequestByAddrRequest;
  @override
  QueryLastPendingBatchRequestByAddrResponse onQueryResponse(List<int> bytes) {
    return QueryLastPendingBatchRequestByAddrResponse.deserialize(bytes);
  }

  @override
  QueryLastPendingBatchRequestByAddrResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastPendingBatchRequestByAddrResponse.fromJson(json);
  }
}

class QueryLastPendingBatchRequestByAddrResponse extends CosmosProtoMessage {
  final injective_peggy_v1_batch.OutgoingTxBatch? batch;

  const QueryLastPendingBatchRequestByAddrResponse({this.batch});

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
  List<Object?> get protoValues => [batch];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'batch': config.encodeMessage(batch)};
  }

  factory QueryLastPendingBatchRequestByAddrResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastPendingBatchRequestByAddrResponse(
      batch: json.valueTo<injective_peggy_v1_batch.OutgoingTxBatch?, Object>(
        key: 'batch',
        parse:
            (v) => injective_peggy_v1_batch.OutgoingTxBatch.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLastPendingBatchRequestByAddrResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastPendingBatchRequestByAddrResponse(
      batch: decode.messageTo<injective_peggy_v1_batch.OutgoingTxBatch?>(
        1,
        (b) => injective_peggy_v1_batch.OutgoingTxBatch.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryLastPendingBatchRequestByAddrResponse;
}

class QueryOutgoingTxBatchesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutgoingTxBatchesResponse> {
  const QueryOutgoingTxBatchesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/batch/outgoingtx",
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

  factory QueryOutgoingTxBatchesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOutgoingTxBatchesRequest();
  }

  factory QueryOutgoingTxBatchesRequest.deserialize(List<int> bytes) {
    return QueryOutgoingTxBatchesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryOutgoingTxBatchesRequest;
  @override
  QueryOutgoingTxBatchesResponse onQueryResponse(List<int> bytes) {
    return QueryOutgoingTxBatchesResponse.deserialize(bytes);
  }

  @override
  QueryOutgoingTxBatchesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryOutgoingTxBatchesResponse.fromJson(json);
  }
}

class QueryOutgoingTxBatchesResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_batch.OutgoingTxBatch> batches;

  const QueryOutgoingTxBatchesResponse({this.batches = const []});

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
  List<Object?> get protoValues => [batches];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'batches': batches.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryOutgoingTxBatchesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryOutgoingTxBatchesResponse(
      batches:
          (json.valueEnsureAsList<dynamic>(
                'batches',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTxBatch,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_batch.OutgoingTxBatch.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryOutgoingTxBatchesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutgoingTxBatchesResponse(
      batches:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_peggy_v1_batch.OutgoingTxBatch.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryOutgoingTxBatchesResponse;
}

class QueryBatchRequestByNonceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBatchRequestByNonceResponse> {
  final BigInt? nonce;

  final String? contractAddress;

  const QueryBatchRequestByNonceRequest({this.nonce, this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/batch",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [nonce, contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'nonce': config.encodeBigint(nonce),
      'contract_address': contractAddress,
    };
  }

  factory QueryBatchRequestByNonceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBatchRequestByNonceRequest(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBatchRequestByNonceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchRequestByNonceRequest(
      nonce: decode.getBigInt<BigInt?>(1),
      contractAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryBatchRequestByNonceRequest;
  @override
  QueryBatchRequestByNonceResponse onQueryResponse(List<int> bytes) {
    return QueryBatchRequestByNonceResponse.deserialize(bytes);
  }

  @override
  QueryBatchRequestByNonceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBatchRequestByNonceResponse.fromJson(json);
  }
}

class QueryBatchRequestByNonceResponse extends CosmosProtoMessage {
  final injective_peggy_v1_batch.OutgoingTxBatch? batch;

  const QueryBatchRequestByNonceResponse({this.batch});

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
  List<Object?> get protoValues => [batch];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'batch': config.encodeMessage(batch)};
  }

  factory QueryBatchRequestByNonceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBatchRequestByNonceResponse(
      batch: json.valueTo<injective_peggy_v1_batch.OutgoingTxBatch?, Object>(
        key: 'batch',
        parse:
            (v) => injective_peggy_v1_batch.OutgoingTxBatch.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBatchRequestByNonceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchRequestByNonceResponse(
      batch: decode.messageTo<injective_peggy_v1_batch.OutgoingTxBatch?>(
        1,
        (b) => injective_peggy_v1_batch.OutgoingTxBatch.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryBatchRequestByNonceResponse;
}

class QueryBatchConfirmsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBatchConfirmsResponse> {
  final BigInt? nonce;

  final String? contractAddress;

  const QueryBatchConfirmsRequest({this.nonce, this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/batch/confirms",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [nonce, contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'nonce': config.encodeBigint(nonce),
      'contract_address': contractAddress,
    };
  }

  factory QueryBatchConfirmsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBatchConfirmsRequest(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBatchConfirmsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchConfirmsRequest(
      nonce: decode.getBigInt<BigInt?>(1),
      contractAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryBatchConfirmsRequest;
  @override
  QueryBatchConfirmsResponse onQueryResponse(List<int> bytes) {
    return QueryBatchConfirmsResponse.deserialize(bytes);
  }

  @override
  QueryBatchConfirmsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBatchConfirmsResponse.fromJson(json);
  }
}

class QueryBatchConfirmsResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_msgs.MsgConfirmBatch> confirms;

  const QueryBatchConfirmsResponse({this.confirms = const []});

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
  List<Object?> get protoValues => [confirms];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'confirms': confirms.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryBatchConfirmsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBatchConfirmsResponse(
      confirms:
          (json.valueEnsureAsList<dynamic>(
                'confirms',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgConfirmBatch,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_msgs.MsgConfirmBatch.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBatchConfirmsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchConfirmsResponse(
      confirms:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_peggy_v1_msgs.MsgConfirmBatch.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryBatchConfirmsResponse;
}

class QueryLastEventByAddrRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastEventByAddrResponse> {
  final String? address;

  const QueryLastEventByAddrRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/oracle/event/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory QueryLastEventByAddrRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastEventByAddrRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLastEventByAddrRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastEventByAddrRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryLastEventByAddrRequest;
  @override
  QueryLastEventByAddrResponse onQueryResponse(List<int> bytes) {
    return QueryLastEventByAddrResponse.deserialize(bytes);
  }

  @override
  QueryLastEventByAddrResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLastEventByAddrResponse.fromJson(json);
  }
}

class QueryLastEventByAddrResponse extends CosmosProtoMessage {
  final injective_peggy_v1_types.LastClaimEvent? lastClaimEvent;

  const QueryLastEventByAddrResponse({this.lastClaimEvent});

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
  List<Object?> get protoValues => [lastClaimEvent];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'last_claim_event': config.encodeMessage(lastClaimEvent)};
  }

  factory QueryLastEventByAddrResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLastEventByAddrResponse(
      lastClaimEvent: json
          .valueTo<injective_peggy_v1_types.LastClaimEvent?, Object>(
            key: 'last_claim_event',
            parse:
                (v) => injective_peggy_v1_types.LastClaimEvent.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryLastEventByAddrResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastEventByAddrResponse(
      lastClaimEvent: decode
          .messageTo<injective_peggy_v1_types.LastClaimEvent?>(
            1,
            (b) => injective_peggy_v1_types.LastClaimEvent.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryLastEventByAddrResponse;
}

class QueryERC20ToDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryERC20ToDenomResponse> {
  final String? erc20;

  const QueryERC20ToDenomRequest({this.erc20});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/cosmos_originated/erc20_to_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [erc20];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'erc20': erc20};
  }

  factory QueryERC20ToDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryERC20ToDenomRequest(
      erc20: json.valueAsString<String?>(
        'erc20',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryERC20ToDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryERC20ToDenomRequest(erc20: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryERC20ToDenomRequest;
  @override
  QueryERC20ToDenomResponse onQueryResponse(List<int> bytes) {
    return QueryERC20ToDenomResponse.deserialize(bytes);
  }

  @override
  QueryERC20ToDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryERC20ToDenomResponse.fromJson(json);
  }
}

class QueryERC20ToDenomResponse extends CosmosProtoMessage {
  final String? denom;

  final bool? cosmosOriginated;

  const QueryERC20ToDenomResponse({this.denom, this.cosmosOriginated});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, cosmosOriginated];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom, 'cosmos_originated': cosmosOriginated};
  }

  factory QueryERC20ToDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryERC20ToDenomResponse(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cosmosOriginated: json.valueAsBool<bool?>(
        'cosmos_originated',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryERC20ToDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryERC20ToDenomResponse(
      denom: decode.getString<String?>(1),
      cosmosOriginated: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryERC20ToDenomResponse;
}

class QueryDenomToERC20Request extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomToERC20Response> {
  final String? denom;

  const QueryDenomToERC20Request({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/cosmos_originated/denom_to_erc20",
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

  factory QueryDenomToERC20Request.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomToERC20Request(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomToERC20Request.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomToERC20Request(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryDenomToERC20Request;
  @override
  QueryDenomToERC20Response onQueryResponse(List<int> bytes) {
    return QueryDenomToERC20Response.deserialize(bytes);
  }

  @override
  QueryDenomToERC20Response onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomToERC20Response.fromJson(json);
  }
}

class QueryDenomToERC20Response extends CosmosProtoMessage {
  final String? erc20;

  final bool? cosmosOriginated;

  const QueryDenomToERC20Response({this.erc20, this.cosmosOriginated});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [erc20, cosmosOriginated];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'erc20': erc20, 'cosmos_originated': cosmosOriginated};
  }

  factory QueryDenomToERC20Response.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomToERC20Response(
      erc20: json.valueAsString<String?>(
        'erc20',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cosmosOriginated: json.valueAsBool<bool?>(
        'cosmos_originated',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomToERC20Response.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomToERC20Response(
      erc20: decode.getString<String?>(1),
      cosmosOriginated: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryDenomToERC20Response;
}

class QueryDelegateKeysByValidatorAddress extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegateKeysByValidatorAddressResponse> {
  final String? validatorAddress;

  const QueryDelegateKeysByValidatorAddress({this.validatorAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/query_delegate_keys_by_validator",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'validator_address': validatorAddress};
  }

  factory QueryDelegateKeysByValidatorAddress.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDelegateKeysByValidatorAddress(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDelegateKeysByValidatorAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegateKeysByValidatorAddress(
      validatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryDelegateKeysByValidatorAddress;
  @override
  QueryDelegateKeysByValidatorAddressResponse onQueryResponse(List<int> bytes) {
    return QueryDelegateKeysByValidatorAddressResponse.deserialize(bytes);
  }

  @override
  QueryDelegateKeysByValidatorAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegateKeysByValidatorAddressResponse.fromJson(json);
  }
}

class QueryDelegateKeysByValidatorAddressResponse extends CosmosProtoMessage {
  final String? ethAddress;

  final String? orchestratorAddress;

  const QueryDelegateKeysByValidatorAddressResponse({
    this.ethAddress,
    this.orchestratorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [ethAddress, orchestratorAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'eth_address': ethAddress,
      'orchestrator_address': orchestratorAddress,
    };
  }

  factory QueryDelegateKeysByValidatorAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDelegateKeysByValidatorAddressResponse(
      ethAddress: json.valueAsString<String?>(
        'eth_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orchestratorAddress: json.valueAsString<String?>(
        'orchestrator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDelegateKeysByValidatorAddressResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegateKeysByValidatorAddressResponse(
      ethAddress: decode.getString<String?>(1),
      orchestratorAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryDelegateKeysByValidatorAddressResponse;
}

class QueryDelegateKeysByEthAddress extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegateKeysByEthAddressResponse> {
  final String? ethAddress;

  const QueryDelegateKeysByEthAddress({this.ethAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/query_delegate_keys_by_eth",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [ethAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'eth_address': ethAddress};
  }

  factory QueryDelegateKeysByEthAddress.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDelegateKeysByEthAddress(
      ethAddress: json.valueAsString<String?>(
        'eth_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDelegateKeysByEthAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegateKeysByEthAddress(
      ethAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryDelegateKeysByEthAddress;
  @override
  QueryDelegateKeysByEthAddressResponse onQueryResponse(List<int> bytes) {
    return QueryDelegateKeysByEthAddressResponse.deserialize(bytes);
  }

  @override
  QueryDelegateKeysByEthAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegateKeysByEthAddressResponse.fromJson(json);
  }
}

class QueryDelegateKeysByEthAddressResponse extends CosmosProtoMessage {
  final String? validatorAddress;

  final String? orchestratorAddress;

  const QueryDelegateKeysByEthAddressResponse({
    this.validatorAddress,
    this.orchestratorAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress, orchestratorAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'validator_address': validatorAddress,
      'orchestrator_address': orchestratorAddress,
    };
  }

  factory QueryDelegateKeysByEthAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDelegateKeysByEthAddressResponse(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      orchestratorAddress: json.valueAsString<String?>(
        'orchestrator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDelegateKeysByEthAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegateKeysByEthAddressResponse(
      validatorAddress: decode.getString<String?>(1),
      orchestratorAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryDelegateKeysByEthAddressResponse;
}

class QueryDelegateKeysByOrchestratorAddress extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryDelegateKeysByOrchestratorAddressResponse
        > {
  final String? orchestratorAddress;

  const QueryDelegateKeysByOrchestratorAddress({this.orchestratorAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/query_delegate_keys_by_orchestrator",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [orchestratorAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'orchestrator_address': orchestratorAddress};
  }

  factory QueryDelegateKeysByOrchestratorAddress.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDelegateKeysByOrchestratorAddress(
      orchestratorAddress: json.valueAsString<String?>(
        'orchestrator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDelegateKeysByOrchestratorAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegateKeysByOrchestratorAddress(
      orchestratorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryDelegateKeysByOrchestratorAddress;
  @override
  QueryDelegateKeysByOrchestratorAddressResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryDelegateKeysByOrchestratorAddressResponse.deserialize(bytes);
  }

  @override
  QueryDelegateKeysByOrchestratorAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegateKeysByOrchestratorAddressResponse.fromJson(json);
  }
}

class QueryDelegateKeysByOrchestratorAddressResponse
    extends CosmosProtoMessage {
  final String? validatorAddress;

  final String? ethAddress;

  const QueryDelegateKeysByOrchestratorAddressResponse({
    this.validatorAddress,
    this.ethAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress, ethAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'validator_address': validatorAddress, 'eth_address': ethAddress};
  }

  factory QueryDelegateKeysByOrchestratorAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDelegateKeysByOrchestratorAddressResponse(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ethAddress: json.valueAsString<String?>(
        'eth_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDelegateKeysByOrchestratorAddressResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegateKeysByOrchestratorAddressResponse(
      validatorAddress: decode.getString<String?>(1),
      ethAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1QueryDelegateKeysByOrchestratorAddressResponse;
}

class QueryPendingSendToEth extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPendingSendToEthResponse> {
  final String? senderAddress;

  const QueryPendingSendToEth({this.senderAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/pending_send_to_eth",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [senderAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sender_address': senderAddress};
  }

  factory QueryPendingSendToEth.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPendingSendToEth(
      senderAddress: json.valueAsString<String?>(
        'sender_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryPendingSendToEth.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPendingSendToEth(senderAddress: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryPendingSendToEth;
  @override
  QueryPendingSendToEthResponse onQueryResponse(List<int> bytes) {
    return QueryPendingSendToEthResponse.deserialize(bytes);
  }

  @override
  QueryPendingSendToEthResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPendingSendToEthResponse.fromJson(json);
  }
}

class QueryPendingSendToEthResponse extends CosmosProtoMessage {
  final List<injective_peggy_v1_batch.OutgoingTransferTx> transfersInBatches;

  final List<injective_peggy_v1_batch.OutgoingTransferTx> unbatchedTransfers;

  const QueryPendingSendToEthResponse({
    this.transfersInBatches = const [],
    this.unbatchedTransfers = const [],
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [transfersInBatches, unbatchedTransfers];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'transfers_in_batches':
          transfersInBatches.map((e) => config.encodeMessage(e)).toList(),
      'unbatched_transfers':
          unbatchedTransfers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryPendingSendToEthResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPendingSendToEthResponse(
      transfersInBatches:
          (json.valueEnsureAsList<dynamic>(
                'transfers_in_batches',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTransferTx,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_batch.OutgoingTransferTx.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
      unbatchedTransfers:
          (json.valueEnsureAsList<dynamic>(
                'unbatched_transfers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTransferTx,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_batch.OutgoingTransferTx.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory QueryPendingSendToEthResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPendingSendToEthResponse(
      transfersInBatches:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    injective_peggy_v1_batch.OutgoingTransferTx.deserialize(b),
              )
              .toList(),
      unbatchedTransfers:
          decode
              .getListOfBytes(2)
              .map(
                (b) =>
                    injective_peggy_v1_batch.OutgoingTransferTx.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryPendingSendToEthResponse;
}

/// QueryModuleStateRequest is the request type for the Query/PeggyModuleState
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
          path: "/peggy/v1/module_state",
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

  factory QueryModuleStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the Query/PeggyModuleState
/// RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  final injective_peggy_v1_genesis.GenesisState? state;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'state': config.encodeMessage(state)};
  }

  factory QueryModuleStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModuleStateResponse(
      state: json.valueTo<injective_peggy_v1_genesis.GenesisState?, Object>(
        key: 'state',
        parse:
            (v) => injective_peggy_v1_genesis.GenesisState.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode.messageTo<injective_peggy_v1_genesis.GenesisState?>(
        1,
        (b) => injective_peggy_v1_genesis.GenesisState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1QueryModuleStateResponse;
}

class MissingNoncesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<MissingNoncesResponse> {
  const MissingNoncesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/peggy/v1/missing_nonces",
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

  factory MissingNoncesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MissingNoncesRequest();
  }

  factory MissingNoncesRequest.deserialize(List<int> bytes) {
    return MissingNoncesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MissingNoncesRequest;
  @override
  MissingNoncesResponse onQueryResponse(List<int> bytes) {
    return MissingNoncesResponse.deserialize(bytes);
  }

  @override
  MissingNoncesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return MissingNoncesResponse.fromJson(json);
  }
}

class MissingNoncesResponse extends CosmosProtoMessage {
  final List<String> operatorAddresses;

  const MissingNoncesResponse({this.operatorAddresses = const []});

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
  List<Object?> get protoValues => [operatorAddresses];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'operator_addresses': operatorAddresses.map((e) => e).toList()};
  }

  factory MissingNoncesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MissingNoncesResponse(
      operatorAddresses:
          (json.valueEnsureAsList<dynamic>(
            'operator_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MissingNoncesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MissingNoncesResponse(
      operatorAddresses: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MissingNoncesResponse;
}
