import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/opinit/ophost/v1/src/types.dart"
    as opinit_ophost_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryBridgeRequest is request type for Query/Bridge RPC method.
class QueryBridgeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBridgeResponse> {
  final BigInt? bridgeId;

  const QueryBridgeRequest({this.bridgeId});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString()};
  }

  factory QueryBridgeRequest.fromJson(Map<String, dynamic> json) {
    return QueryBridgeRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
    );
  }

  factory QueryBridgeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBridgeRequest(bridgeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryBridgeRequest;
  @override
  QueryBridgeResponse onQueryResponse(List<int> bytes) {
    return QueryBridgeResponse.deserialize(bytes);
  }

  @override
  QueryBridgeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBridgeResponse.fromJson(json);
  }
}

/// QueryBridgeResponse is response type for the Query/Bridge RPC method
class QueryBridgeResponse extends CosmosProtoMessage {
  final BigInt? bridgeId;

  final String? bridgeAddr;

  final opinit_ophost_v1_types.BridgeConfig? bridgeConfig;

  const QueryBridgeResponse({
    this.bridgeId,
    this.bridgeAddr,
    this.bridgeConfig,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, bridgeAddr, bridgeConfig];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'bridge_addr': bridgeAddr,
      'bridge_config': bridgeConfig?.toJson(),
    };
  }

  factory QueryBridgeResponse.fromJson(Map<String, dynamic> json) {
    return QueryBridgeResponse(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      bridgeAddr: json.valueAsString<String?>(
        'bridge_addr',
        acceptCamelCase: true,
      ),
      bridgeConfig: json
          .valueTo<opinit_ophost_v1_types.BridgeConfig?, Map<String, dynamic>>(
            key: 'bridge_config',
            parse: (v) => opinit_ophost_v1_types.BridgeConfig.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryBridgeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBridgeResponse(
      bridgeId: decode.getBigInt<BigInt?>(1),
      bridgeAddr: decode.getString<String?>(2),
      bridgeConfig: decode.messageTo<opinit_ophost_v1_types.BridgeConfig?>(
        3,
        (b) => opinit_ophost_v1_types.BridgeConfig.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryBridgeResponse;
}

/// QueryBridgesRequest is request type for Query/Bridges RPC method.
class QueryBridgesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBridgesResponse> {
  /// pagination defines the pagination in the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryBridgesRequest({this.pagination});

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
          path: "/opinit/ophost/v1/bridges",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryBridgesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBridgesRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBridgesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBridgesRequest(
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryBridgesRequest;
  @override
  QueryBridgesResponse onQueryResponse(List<int> bytes) {
    return QueryBridgesResponse.deserialize(bytes);
  }

  @override
  QueryBridgesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBridgesResponse.fromJson(json);
  }
}

/// QueryBridgesResponse is response type for the Query/Bridges RPC method
class QueryBridgesResponse extends CosmosProtoMessage {
  final List<QueryBridgeResponse> bridges;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryBridgesResponse({this.bridges = const [], this.pagination});

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
  List<Object?> get protoValues => [bridges, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridges': bridges.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryBridgesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBridgesResponse(
      bridges:
          (json.valueEnsureAsList<dynamic>('bridges', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  QueryBridgeResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryBridgeResponse.fromJson(v)),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBridgesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBridgesResponse(
      bridges:
          decode
              .getListOfBytes(1)
              .map((b) => QueryBridgeResponse.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryBridgesResponse;
}

/// QueryTokenPairByL1DenomRequest is response type for the Query/TokenPairByL1Denom RPC method
class QueryTokenPairByL1DenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairByL1DenomResponse> {
  final BigInt? bridgeId;

  final String? l1Denom;

  const QueryTokenPairByL1DenomRequest({this.bridgeId, this.l1Denom});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/token_pairs/by_l1_denom",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, l1Denom];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString(), 'l1_denom': l1Denom};
  }

  factory QueryTokenPairByL1DenomRequest.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairByL1DenomRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      l1Denom: json.valueAsString<String?>('l1_denom', acceptCamelCase: true),
    );
  }

  factory QueryTokenPairByL1DenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByL1DenomRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      l1Denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryTokenPairByL1DenomRequest;
  @override
  QueryTokenPairByL1DenomResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairByL1DenomResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairByL1DenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTokenPairByL1DenomResponse.fromJson(json);
  }
}

/// QueryTokenPairByL1DenomResponse is response type for the Query/TokenPairByL1Denom RPC method
class QueryTokenPairByL1DenomResponse extends CosmosProtoMessage {
  final opinit_ophost_v1_types.TokenPair? tokenPair;

  const QueryTokenPairByL1DenomResponse({this.tokenPair});

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
  List<Object?> get protoValues => [tokenPair];

  @override
  Map<String, dynamic> toJson() {
    return {'token_pair': tokenPair?.toJson()};
  }

  factory QueryTokenPairByL1DenomResponse.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairByL1DenomResponse(
      tokenPair: json
          .valueTo<opinit_ophost_v1_types.TokenPair?, Map<String, dynamic>>(
            key: 'token_pair',
            parse: (v) => opinit_ophost_v1_types.TokenPair.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryTokenPairByL1DenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByL1DenomResponse(
      tokenPair: decode.messageTo<opinit_ophost_v1_types.TokenPair?>(
        1,
        (b) => opinit_ophost_v1_types.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryTokenPairByL1DenomResponse;
}

/// QueryTokenPairByL2DenomRequest is response type for the Query/TokenPairByL2Denom RPC method
class QueryTokenPairByL2DenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairByL2DenomResponse> {
  final BigInt? bridgeId;

  final String? l2Denom;

  const QueryTokenPairByL2DenomRequest({this.bridgeId, this.l2Denom});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/token_pairs/by_l2_denom",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, l2Denom];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString(), 'l2_denom': l2Denom};
  }

  factory QueryTokenPairByL2DenomRequest.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairByL2DenomRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      l2Denom: json.valueAsString<String?>('l2_denom', acceptCamelCase: true),
    );
  }

  factory QueryTokenPairByL2DenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByL2DenomRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      l2Denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryTokenPairByL2DenomRequest;
  @override
  QueryTokenPairByL2DenomResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairByL2DenomResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairByL2DenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTokenPairByL2DenomResponse.fromJson(json);
  }
}

/// QueryTokenPairByL2DenomResponse is response type for the Query/TokenPairByL2Denom RPC method
class QueryTokenPairByL2DenomResponse extends CosmosProtoMessage {
  final opinit_ophost_v1_types.TokenPair? tokenPair;

  const QueryTokenPairByL2DenomResponse({this.tokenPair});

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
  List<Object?> get protoValues => [tokenPair];

  @override
  Map<String, dynamic> toJson() {
    return {'token_pair': tokenPair?.toJson()};
  }

  factory QueryTokenPairByL2DenomResponse.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairByL2DenomResponse(
      tokenPair: json
          .valueTo<opinit_ophost_v1_types.TokenPair?, Map<String, dynamic>>(
            key: 'token_pair',
            parse: (v) => opinit_ophost_v1_types.TokenPair.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryTokenPairByL2DenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairByL2DenomResponse(
      tokenPair: decode.messageTo<opinit_ophost_v1_types.TokenPair?>(
        1,
        (b) => opinit_ophost_v1_types.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryTokenPairByL2DenomResponse;
}

/// QueryTokenPairsRequest is response type for the Query/TokenPairs RPC method
class QueryTokenPairsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTokenPairsResponse> {
  final BigInt? bridgeId;

  /// pagination defines the pagination in the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryTokenPairsRequest({this.bridgeId, this.pagination});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/token_pairs",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryTokenPairsRequest.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairsRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTokenPairsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairsRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryTokenPairsRequest;
  @override
  QueryTokenPairsResponse onQueryResponse(List<int> bytes) {
    return QueryTokenPairsResponse.deserialize(bytes);
  }

  @override
  QueryTokenPairsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTokenPairsResponse.fromJson(json);
  }
}

/// QueryTokenPairsResponse is response type for the Query/TokenPairs RPC method
class QueryTokenPairsResponse extends CosmosProtoMessage {
  final List<opinit_ophost_v1_types.TokenPair> tokenPairs;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryTokenPairsResponse({this.tokenPairs = const [], this.pagination});

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
  List<Object?> get protoValues => [tokenPairs, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'token_pairs': tokenPairs.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryTokenPairsResponse.fromJson(Map<String, dynamic> json) {
    return QueryTokenPairsResponse(
      tokenPairs:
          (json.valueEnsureAsList<dynamic>(
                'token_pairs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  opinit_ophost_v1_types.TokenPair,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => opinit_ophost_v1_types.TokenPair.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTokenPairsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTokenPairsResponse(
      tokenPairs:
          decode
              .getListOfBytes(1)
              .map((b) => opinit_ophost_v1_types.TokenPair.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryTokenPairsResponse;
}

/// QueryLastFinalizedOutputRequest is request type for the Query/LastFinalizedOutput RPC method.
class QueryLastFinalizedOutputRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLastFinalizedOutputResponse> {
  final BigInt? bridgeId;

  const QueryLastFinalizedOutputRequest({this.bridgeId});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/last_finalized_output",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString()};
  }

  factory QueryLastFinalizedOutputRequest.fromJson(Map<String, dynamic> json) {
    return QueryLastFinalizedOutputRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
    );
  }

  factory QueryLastFinalizedOutputRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastFinalizedOutputRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryLastFinalizedOutputRequest;
  @override
  QueryLastFinalizedOutputResponse onQueryResponse(List<int> bytes) {
    return QueryLastFinalizedOutputResponse.deserialize(bytes);
  }

  @override
  QueryLastFinalizedOutputResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLastFinalizedOutputResponse.fromJson(json);
  }
}

/// QueryLastFinalizedOutputResponse is response type for the Query/LastFinalizedOutput RPC method
class QueryLastFinalizedOutputResponse extends CosmosProtoMessage {
  final BigInt? outputIndex;

  final opinit_ophost_v1_types.Output? outputProposal;

  const QueryLastFinalizedOutputResponse({
    this.outputIndex,
    this.outputProposal,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [outputIndex, outputProposal];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_index': outputIndex?.toString(),
      'output_proposal': outputProposal?.toJson(),
    };
  }

  factory QueryLastFinalizedOutputResponse.fromJson(Map<String, dynamic> json) {
    return QueryLastFinalizedOutputResponse(
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      outputProposal: json
          .valueTo<opinit_ophost_v1_types.Output?, Map<String, dynamic>>(
            key: 'output_proposal',
            parse: (v) => opinit_ophost_v1_types.Output.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryLastFinalizedOutputResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLastFinalizedOutputResponse(
      outputIndex: decode.getBigInt<BigInt?>(1),
      outputProposal: decode.messageTo<opinit_ophost_v1_types.Output?>(
        2,
        (b) => opinit_ophost_v1_types.Output.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryLastFinalizedOutputResponse;
}

/// QueryOutputProposalRequest is response type for the Query/OutputProposal RPC method
class QueryOutputProposalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutputProposalResponse> {
  final BigInt? bridgeId;

  final BigInt? outputIndex;

  const QueryOutputProposalRequest({this.bridgeId, this.outputIndex});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/outputs/{output_index}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, outputIndex];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'output_index': outputIndex?.toString(),
    };
  }

  factory QueryOutputProposalRequest.fromJson(Map<String, dynamic> json) {
    return QueryOutputProposalRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOutputProposalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutputProposalRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      outputIndex: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryOutputProposalRequest;
  @override
  QueryOutputProposalResponse onQueryResponse(List<int> bytes) {
    return QueryOutputProposalResponse.deserialize(bytes);
  }

  @override
  QueryOutputProposalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOutputProposalResponse.fromJson(json);
  }
}

/// QueryOutputProposalResponse is response type for the Query/OutputProposal RPC method
class QueryOutputProposalResponse extends CosmosProtoMessage {
  final BigInt? bridgeId;

  final BigInt? outputIndex;

  final opinit_ophost_v1_types.Output? outputProposal;

  const QueryOutputProposalResponse({
    this.bridgeId,
    this.outputIndex,
    this.outputProposal,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, outputIndex, outputProposal];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'output_index': outputIndex?.toString(),
      'output_proposal': outputProposal?.toJson(),
    };
  }

  factory QueryOutputProposalResponse.fromJson(Map<String, dynamic> json) {
    return QueryOutputProposalResponse(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      outputIndex: json.valueAsBigInt<BigInt?>(
        'output_index',
        acceptCamelCase: true,
      ),
      outputProposal: json
          .valueTo<opinit_ophost_v1_types.Output?, Map<String, dynamic>>(
            key: 'output_proposal',
            parse: (v) => opinit_ophost_v1_types.Output.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryOutputProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutputProposalResponse(
      bridgeId: decode.getBigInt<BigInt?>(1),
      outputIndex: decode.getBigInt<BigInt?>(2),
      outputProposal: decode.messageTo<opinit_ophost_v1_types.Output?>(
        3,
        (b) => opinit_ophost_v1_types.Output.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryOutputProposalResponse;
}

/// QueryOutputProposalsRequest is response type for the Query/OutputProposals RPC method
class QueryOutputProposalsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutputProposalsResponse> {
  final BigInt? bridgeId;

  /// pagination defines the pagination in the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryOutputProposalsRequest({this.bridgeId, this.pagination});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/outputs",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryOutputProposalsRequest.fromJson(Map<String, dynamic> json) {
    return QueryOutputProposalsRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOutputProposalsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutputProposalsRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryOutputProposalsRequest;
  @override
  QueryOutputProposalsResponse onQueryResponse(List<int> bytes) {
    return QueryOutputProposalsResponse.deserialize(bytes);
  }

  @override
  QueryOutputProposalsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOutputProposalsResponse.fromJson(json);
  }
}

/// QueryOutputProposalsResponse is response type for the Query/OutputProposals RPC method
class QueryOutputProposalsResponse extends CosmosProtoMessage {
  final List<QueryOutputProposalResponse> outputProposals;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryOutputProposalsResponse({
    this.outputProposals = const [],
    this.pagination,
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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [outputProposals, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'output_proposals': outputProposals.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryOutputProposalsResponse.fromJson(Map<String, dynamic> json) {
    return QueryOutputProposalsResponse(
      outputProposals:
          (json.valueEnsureAsList<dynamic>(
                'output_proposals',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryOutputProposalResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryOutputProposalResponse.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOutputProposalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutputProposalsResponse(
      outputProposals:
          decode
              .getListOfBytes(1)
              .map((b) => QueryOutputProposalResponse.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryOutputProposalsResponse;
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
          path: "/opinit/ophost/v1/params",
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryParamsRequest;
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
  final opinit_ophost_v1_types.Params? params;

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
          .valueTo<opinit_ophost_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => opinit_ophost_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<opinit_ophost_v1_types.Params?>(
        1,
        (b) => opinit_ophost_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryParamsResponse;
}

/// QueryClaimedRequest is request type for the Query/Claimed RPC method.
class QueryClaimedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClaimedResponse> {
  final BigInt? bridgeId;

  final List<int>? withdrawalHash;

  const QueryClaimedRequest({this.bridgeId, this.withdrawalHash});

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
          path:
              "/opinit/ophost/v1/bridges/{bridge_id}/withdrawals/claimed/by_hash",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, withdrawalHash];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'withdrawal_hash': switch (withdrawalHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryClaimedRequest.fromJson(Map<String, dynamic> json) {
    return QueryClaimedRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      withdrawalHash: json.valueAsBytes<List<int>?>(
        'withdrawal_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryClaimedRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimedRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      withdrawalHash: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryClaimedRequest;
  @override
  QueryClaimedResponse onQueryResponse(List<int> bytes) {
    return QueryClaimedResponse.deserialize(bytes);
  }

  @override
  QueryClaimedResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClaimedResponse.fromJson(json);
  }
}

/// QueryClaimedResponse is response type for the Query/Claimed RPC method
class QueryClaimedResponse extends CosmosProtoMessage {
  final bool? claimed;

  const QueryClaimedResponse({this.claimed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [claimed];

  @override
  Map<String, dynamic> toJson() {
    return {'claimed': claimed};
  }

  factory QueryClaimedResponse.fromJson(Map<String, dynamic> json) {
    return QueryClaimedResponse(
      claimed: json.valueAsBool<bool?>('claimed', acceptCamelCase: true),
    );
  }

  factory QueryClaimedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimedResponse(claimed: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryClaimedResponse;
}

/// QueryNextL1SequenceRequest is request type for the Query/NextL1Sequence RPC method.
class QueryNextL1SequenceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNextL1SequenceResponse> {
  final BigInt? bridgeId;

  const QueryNextL1SequenceRequest({this.bridgeId});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/next_l1_sequence",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString()};
  }

  factory QueryNextL1SequenceRequest.fromJson(Map<String, dynamic> json) {
    return QueryNextL1SequenceRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
    );
  }

  factory QueryNextL1SequenceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNextL1SequenceRequest(bridgeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryNextL1SequenceRequest;
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
  Map<String, dynamic> toJson() {
    return {'next_l1_sequence': nextL1Sequence?.toString()};
  }

  factory QueryNextL1SequenceResponse.fromJson(Map<String, dynamic> json) {
    return QueryNextL1SequenceResponse(
      nextL1Sequence: json.valueAsBigInt<BigInt?>(
        'next_l1_sequence',
        acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryNextL1SequenceResponse;
}

/// QueryBatchInfosRequest is request type for Query/BatchInfos RPC method.
class QueryBatchInfosRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBatchInfosResponse> {
  final BigInt? bridgeId;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryBatchInfosRequest({this.bridgeId, this.pagination});

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
          path: "/opinit/ophost/v1/bridges/{bridge_id}/batch_infos",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridge_id': bridgeId?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryBatchInfosRequest.fromJson(Map<String, dynamic> json) {
    return QueryBatchInfosRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBatchInfosRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchInfosRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryBatchInfosRequest;
  @override
  QueryBatchInfosResponse onQueryResponse(List<int> bytes) {
    return QueryBatchInfosResponse.deserialize(bytes);
  }

  @override
  QueryBatchInfosResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBatchInfosResponse.fromJson(json);
  }
}

/// QueryBatchInfosResponse is response type for Query/BatchInfos RPC method.
class QueryBatchInfosResponse extends CosmosProtoMessage {
  final List<opinit_ophost_v1_types.BatchInfoWithOutput> batchInfos;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryBatchInfosResponse({this.batchInfos = const [], this.pagination});

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
  List<Object?> get protoValues => [batchInfos, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'batch_infos': batchInfos.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryBatchInfosResponse.fromJson(Map<String, dynamic> json) {
    return QueryBatchInfosResponse(
      batchInfos:
          (json.valueEnsureAsList<dynamic>(
                'batch_infos',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  opinit_ophost_v1_types.BatchInfoWithOutput,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => opinit_ophost_v1_types
                          .BatchInfoWithOutput.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBatchInfosResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBatchInfosResponse(
      batchInfos:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    opinit_ophost_v1_types.BatchInfoWithOutput.deserialize(b),
              )
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
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryBatchInfosResponse;
}

/// QueryMigrationInfoRequest is request type for Query/MigrationInfo RPC method.
class QueryMigrationInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMigrationInfoResponse> {
  final BigInt? bridgeId;

  final String? l1Denom;

  const QueryMigrationInfoRequest({this.bridgeId, this.l1Denom});

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
          path:
              "/opinit/ophost/v1/bridges/{bridge_id}/migration_info/by_l1_denom",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bridgeId, l1Denom];

  @override
  Map<String, dynamic> toJson() {
    return {'bridge_id': bridgeId?.toString(), 'l1_denom': l1Denom};
  }

  factory QueryMigrationInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryMigrationInfoRequest(
      bridgeId: json.valueAsBigInt<BigInt?>('bridge_id', acceptCamelCase: true),
      l1Denom: json.valueAsString<String?>('l1_denom', acceptCamelCase: true),
    );
  }

  factory QueryMigrationInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMigrationInfoRequest(
      bridgeId: decode.getBigInt<BigInt?>(1),
      l1Denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryMigrationInfoRequest;
  @override
  QueryMigrationInfoResponse onQueryResponse(List<int> bytes) {
    return QueryMigrationInfoResponse.deserialize(bytes);
  }

  @override
  QueryMigrationInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMigrationInfoResponse.fromJson(json);
  }
}

/// QueryMigrationInfoResponse is response type for Query/MigrationInfo RPC method.
class QueryMigrationInfoResponse extends CosmosProtoMessage {
  final opinit_ophost_v1_types.MigrationInfo? migrationInfo;

  const QueryMigrationInfoResponse({this.migrationInfo});

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
  List<Object?> get protoValues => [migrationInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'migration_info': migrationInfo?.toJson()};
  }

  factory QueryMigrationInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryMigrationInfoResponse(
      migrationInfo: json
          .valueTo<opinit_ophost_v1_types.MigrationInfo?, Map<String, dynamic>>(
            key: 'migration_info',
            parse: (v) => opinit_ophost_v1_types.MigrationInfo.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryMigrationInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMigrationInfoResponse(
      migrationInfo: decode.messageTo<opinit_ophost_v1_types.MigrationInfo?>(
        1,
        (b) => opinit_ophost_v1_types.MigrationInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryMigrationInfoResponse;
}

/// QueryOraclePriceHashRequest is request type for Query/OraclePriceHash RPC method.
class QueryOraclePriceHashRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOraclePriceHashResponse> {
  const QueryOraclePriceHashRequest();

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
          path: "/opinit/ophost/v1/oracle_price_hash",
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

  factory QueryOraclePriceHashRequest.fromJson(Map<String, dynamic> json) {
    return QueryOraclePriceHashRequest();
  }

  factory QueryOraclePriceHashRequest.deserialize(List<int> bytes) {
    return QueryOraclePriceHashRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryOraclePriceHashRequest;
  @override
  QueryOraclePriceHashResponse onQueryResponse(List<int> bytes) {
    return QueryOraclePriceHashResponse.deserialize(bytes);
  }

  @override
  QueryOraclePriceHashResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOraclePriceHashResponse.fromJson(json);
  }
}

/// QueryOraclePriceHashResponse is response type for Query/OraclePriceHash RPC method.
class QueryOraclePriceHashResponse extends CosmosProtoMessage {
  final opinit_ophost_v1_types.OraclePriceHash? oraclePriceHash;

  const QueryOraclePriceHashResponse({this.oraclePriceHash});

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
  List<Object?> get protoValues => [oraclePriceHash];

  @override
  Map<String, dynamic> toJson() {
    return {'oracle_price_hash': oraclePriceHash?.toJson()};
  }

  factory QueryOraclePriceHashResponse.fromJson(Map<String, dynamic> json) {
    return QueryOraclePriceHashResponse(
      oraclePriceHash: json.valueTo<
        opinit_ophost_v1_types.OraclePriceHash?,
        Map<String, dynamic>
      >(
        key: 'oracle_price_hash',
        parse: (v) => opinit_ophost_v1_types.OraclePriceHash.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryOraclePriceHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePriceHashResponse(
      oraclePriceHash: decode
          .messageTo<opinit_ophost_v1_types.OraclePriceHash?>(
            1,
            (b) => opinit_ophost_v1_types.OraclePriceHash.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOphostV1QueryOraclePriceHashResponse;
}
