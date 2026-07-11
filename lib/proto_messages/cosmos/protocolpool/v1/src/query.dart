import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/protocolpool/v1/src/types.dart"
    as cosmos_protocolpool_v1_types;

/// QueryCommunityPoolRequest is the request type for the Query/CommunityPool RPC
/// method.
class QueryCommunityPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCommunityPoolResponse> {
  const QueryCommunityPoolRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/protocolpool/v1/community_pool",
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

  factory QueryCommunityPoolRequest.fromJson(Map<String, dynamic> json) {
    return QueryCommunityPoolRequest();
  }

  factory QueryCommunityPoolRequest.deserialize(List<int> bytes) {
    return QueryCommunityPoolRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryCommunityPoolRequest;
  @override
  QueryCommunityPoolResponse onQueryResponse(List<int> bytes) {
    return QueryCommunityPoolResponse.deserialize(bytes);
  }

  @override
  QueryCommunityPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCommunityPoolResponse.fromJson(json);
  }
}

/// QueryCommunityPoolResponse is the response type for the Query/CommunityPool
/// RPC method.
class QueryCommunityPoolResponse extends CosmosProtoMessage {
  /// pool defines community pool's coins.
  final List<cosmos_base_v1beta1_coin.Coin> pool;

  const QueryCommunityPoolResponse({this.pool = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pool];

  @override
  Map<String, dynamic> toJson() {
    return {'pool': pool.map((e) => e.toJson()).toList()};
  }

  factory QueryCommunityPoolResponse.fromJson(Map<String, dynamic> json) {
    return QueryCommunityPoolResponse(
      pool:
          (json.valueEnsureAsList<dynamic>('pool', acceptCamelCase: true))
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

  factory QueryCommunityPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCommunityPoolResponse(
      pool:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryCommunityPoolResponse;
}

/// QueryContinuousFundRequest is the request type for the Query/ContinuousFund
/// RPC method.
class QueryContinuousFundRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContinuousFundResponse> {
  /// recipient is the recipient address to query unclaimed budget amount for.
  final String? recipient;

  const QueryContinuousFundRequest({this.recipient});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/protocolpool/v1/continuous_funds/{recipient}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [recipient];

  @override
  Map<String, dynamic> toJson() {
    return {'recipient': recipient};
  }

  factory QueryContinuousFundRequest.fromJson(Map<String, dynamic> json) {
    return QueryContinuousFundRequest(
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryContinuousFundRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContinuousFundRequest(recipient: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryContinuousFundRequest;
  @override
  QueryContinuousFundResponse onQueryResponse(List<int> bytes) {
    return QueryContinuousFundResponse.deserialize(bytes);
  }

  @override
  QueryContinuousFundResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContinuousFundResponse.fromJson(json);
  }
}

/// QueryUnclaimedBudgetResponse is the response type for the Query/ContinuousFund
/// RPC method.
class QueryContinuousFundResponse extends CosmosProtoMessage {
  /// ContinuousFunds is the given continuous fund returned in the query.
  final cosmos_protocolpool_v1_types.ContinuousFund? continuousFund;

  const QueryContinuousFundResponse({this.continuousFund});

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
  List<Object?> get protoValues => [continuousFund];

  @override
  Map<String, dynamic> toJson() {
    return {'continuous_fund': continuousFund?.toJson()};
  }

  factory QueryContinuousFundResponse.fromJson(Map<String, dynamic> json) {
    return QueryContinuousFundResponse(
      continuousFund: json.valueTo<
        cosmos_protocolpool_v1_types.ContinuousFund?,
        Map<String, dynamic>
      >(
        key: 'continuous_fund',
        parse: (v) => cosmos_protocolpool_v1_types.ContinuousFund.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryContinuousFundResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContinuousFundResponse(
      continuousFund: decode
          .messageTo<cosmos_protocolpool_v1_types.ContinuousFund?>(
            1,
            (b) => cosmos_protocolpool_v1_types.ContinuousFund.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryContinuousFundResponse;
}

/// QueryContinuousFundRequest is the request type for the Query/ContinuousFunds
/// RPC method.
class QueryContinuousFundsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContinuousFundsResponse> {
  const QueryContinuousFundsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/protocolpool/v1/continuous_funds",
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

  factory QueryContinuousFundsRequest.fromJson(Map<String, dynamic> json) {
    return QueryContinuousFundsRequest();
  }

  factory QueryContinuousFundsRequest.deserialize(List<int> bytes) {
    return QueryContinuousFundsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryContinuousFundsRequest;
  @override
  QueryContinuousFundsResponse onQueryResponse(List<int> bytes) {
    return QueryContinuousFundsResponse.deserialize(bytes);
  }

  @override
  QueryContinuousFundsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContinuousFundsResponse.fromJson(json);
  }
}

/// QueryUnclaimedBudgetResponse is the response type for the Query/ContinuousFunds
/// RPC method.
class QueryContinuousFundsResponse extends CosmosProtoMessage {
  /// ContinuousFunds defines all continuous funds in state.
  final List<cosmos_protocolpool_v1_types.ContinuousFund> continuousFunds;

  const QueryContinuousFundsResponse({this.continuousFunds = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [continuousFunds];

  @override
  Map<String, dynamic> toJson() {
    return {
      'continuous_funds': continuousFunds.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryContinuousFundsResponse.fromJson(Map<String, dynamic> json) {
    return QueryContinuousFundsResponse(
      continuousFunds:
          (json.valueEnsureAsList<dynamic>(
                'continuous_funds',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_protocolpool_v1_types.ContinuousFund,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_protocolpool_v1_types
                          .ContinuousFund.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryContinuousFundsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContinuousFundsResponse(
      continuousFunds:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    cosmos_protocolpool_v1_types.ContinuousFund.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosProtocolpoolV1QueryContinuousFundsResponse;
}

/// QueryParamsRequest is the response type for the Query/Params RPC method.
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
          path: "/cosmos/protocolpool/v1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryParamsRequest;
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
  final cosmos_protocolpool_v1_types.Params? params;

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
          .valueTo<cosmos_protocolpool_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmos_protocolpool_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<cosmos_protocolpool_v1_types.Params?>(
        1,
        (b) => cosmos_protocolpool_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1QueryParamsResponse;
}
