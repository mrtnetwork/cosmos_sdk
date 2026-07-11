import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/distribution/v1/src/distribution.dart"
    as initia_distribution_v1_distribution;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

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
          path: "/initia/distribution/v1/params",
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
      DefaultCosmosProtoTypeUrl.initiaDistributionV1QueryParamsRequest;
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
  final initia_distribution_v1_distribution.Params? params;

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
        initia_distribution_v1_distribution.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => initia_distribution_v1_distribution.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<initia_distribution_v1_distribution.Params?>(
        1,
        (b) => initia_distribution_v1_distribution.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaDistributionV1QueryParamsResponse;
}

/// QueryValidatorOutstandingRewardsRequest is the request type for the
/// Query/ValidatorOutstandingRewards RPC method.
class QueryValidatorOutstandingRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorOutstandingRewardsResponse> {
  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  const QueryValidatorOutstandingRewardsRequest({this.validatorAddress});

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
              "/initia/distribution/v1/validators/{validator_address}/outstanding_rewards",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress};
  }

  factory QueryValidatorOutstandingRewardsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorOutstandingRewardsRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorOutstandingRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorOutstandingRewardsRequest(
      validatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryValidatorOutstandingRewardsRequest;
  @override
  QueryValidatorOutstandingRewardsResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorOutstandingRewardsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorOutstandingRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorOutstandingRewardsResponse.fromJson(json);
  }
}

/// QueryValidatorOutstandingRewardsResponse is the response type for the
/// Query/ValidatorOutstandingRewards RPC method.
class QueryValidatorOutstandingRewardsResponse extends CosmosProtoMessage {
  final initia_distribution_v1_distribution.ValidatorOutstandingRewards?
  rewards;

  const QueryValidatorOutstandingRewardsResponse({this.rewards});

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
  List<Object?> get protoValues => [rewards];

  @override
  Map<String, dynamic> toJson() {
    return {'rewards': rewards?.toJson()};
  }

  factory QueryValidatorOutstandingRewardsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorOutstandingRewardsResponse(
      rewards: json.valueTo<
        initia_distribution_v1_distribution.ValidatorOutstandingRewards?,
        Map<String, dynamic>
      >(
        key: 'rewards',
        parse:
            (v) => initia_distribution_v1_distribution
                .ValidatorOutstandingRewards.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorOutstandingRewardsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorOutstandingRewardsResponse(
      rewards: decode.messageTo<
        initia_distribution_v1_distribution.ValidatorOutstandingRewards?
      >(
        1,
        (b) => initia_distribution_v1_distribution
            .ValidatorOutstandingRewards.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryValidatorOutstandingRewardsResponse;
}

/// QueryValidatorCommissionRequest is the request type for the
/// Query/ValidatorCommission RPC method
class QueryValidatorCommissionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorCommissionResponse> {
  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  const QueryValidatorCommissionRequest({this.validatorAddress});

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
              "/initia/distribution/v1/validators/{validator_address}/commission",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress};
  }

  factory QueryValidatorCommissionRequest.fromJson(Map<String, dynamic> json) {
    return QueryValidatorCommissionRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorCommissionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorCommissionRequest(
      validatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryValidatorCommissionRequest;
  @override
  QueryValidatorCommissionResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorCommissionResponse.deserialize(bytes);
  }

  @override
  QueryValidatorCommissionResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorCommissionResponse.fromJson(json);
  }
}

/// QueryValidatorCommissionResponse is the response type for the
/// Query/ValidatorCommission RPC method
class QueryValidatorCommissionResponse extends CosmosProtoMessage {
  /// commission defines the commission the validator received.
  final initia_distribution_v1_distribution.ValidatorAccumulatedCommission?
  commission;

  const QueryValidatorCommissionResponse({this.commission});

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
  List<Object?> get protoValues => [commission];

  @override
  Map<String, dynamic> toJson() {
    return {'commission': commission?.toJson()};
  }

  factory QueryValidatorCommissionResponse.fromJson(Map<String, dynamic> json) {
    return QueryValidatorCommissionResponse(
      commission: json.valueTo<
        initia_distribution_v1_distribution.ValidatorAccumulatedCommission?,
        Map<String, dynamic>
      >(
        key: 'commission',
        parse:
            (v) => initia_distribution_v1_distribution
                .ValidatorAccumulatedCommission.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorCommissionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorCommissionResponse(
      commission: decode.messageTo<
        initia_distribution_v1_distribution.ValidatorAccumulatedCommission?
      >(
        1,
        (b) => initia_distribution_v1_distribution
            .ValidatorAccumulatedCommission.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryValidatorCommissionResponse;
}

/// QueryValidatorSlashesRequest is the request type for the
/// Query/ValidatorSlashes RPC method
class QueryValidatorSlashesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorSlashesResponse> {
  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  /// starting_height defines the optional starting height to query the slashes.
  final BigInt? startingHeight;

  /// starting_height defines the optional ending height to query the slashes.
  final BigInt? endingHeight;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryValidatorSlashesRequest({
    this.validatorAddress,
    this.startingHeight,
    this.endingHeight,
    this.pagination,
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
          path:
              "/initia/distribution/v1/validators/{validator_address}/slashes",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    validatorAddress,
    startingHeight,
    endingHeight,
    pagination,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_address': validatorAddress,
      'starting_height': startingHeight?.toString(),
      'ending_height': endingHeight?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorSlashesRequest.fromJson(Map<String, dynamic> json) {
    return QueryValidatorSlashesRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      startingHeight: json.valueAsBigInt<BigInt?>(
        'starting_height',
        acceptCamelCase: true,
      ),
      endingHeight: json.valueAsBigInt<BigInt?>(
        'ending_height',
        acceptCamelCase: true,
      ),
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

  factory QueryValidatorSlashesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorSlashesRequest(
      validatorAddress: decode.getString<String?>(1),
      startingHeight: decode.getBigInt<BigInt?>(2),
      endingHeight: decode.getBigInt<BigInt?>(3),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            4,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryValidatorSlashesRequest;
  @override
  QueryValidatorSlashesResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorSlashesResponse.deserialize(bytes);
  }

  @override
  QueryValidatorSlashesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryValidatorSlashesResponse.fromJson(json);
  }
}

/// QueryValidatorSlashesResponse is the response type for the
/// Query/ValidatorSlashes RPC method.
class QueryValidatorSlashesResponse extends CosmosProtoMessage {
  /// slashes defines the slashes the validator received.
  final List<initia_distribution_v1_distribution.ValidatorSlashEvent> slashes;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryValidatorSlashesResponse({
    this.slashes = const [],
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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [slashes, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'slashes': slashes.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorSlashesResponse.fromJson(Map<String, dynamic> json) {
    return QueryValidatorSlashesResponse(
      slashes:
          (json.valueEnsureAsList<dynamic>('slashes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  initia_distribution_v1_distribution.ValidatorSlashEvent,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_distribution_v1_distribution
                          .ValidatorSlashEvent.fromJson(v),
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

  factory QueryValidatorSlashesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorSlashesResponse(
      slashes:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_distribution_v1_distribution
                    .ValidatorSlashEvent.deserialize(b),
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
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryValidatorSlashesResponse;
}

/// QueryDelegationRewardsRequest is the request type for the
/// Query/DelegationRewards RPC method.
class QueryDelegationRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegationRewardsResponse> {
  /// delegator_address defines the delegator address to query for.
  final String? delegatorAddress;

  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  const QueryDelegationRewardsRequest({
    this.delegatorAddress,
    this.validatorAddress,
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
          path:
              "/initia/distribution/v1/delegators/{delegator_address}/rewards/{validator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
    };
  }

  factory QueryDelegationRewardsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegationRewardsRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegationRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationRewardsRequest(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryDelegationRewardsRequest;
  @override
  QueryDelegationRewardsResponse onQueryResponse(List<int> bytes) {
    return QueryDelegationRewardsResponse.deserialize(bytes);
  }

  @override
  QueryDelegationRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegationRewardsResponse.fromJson(json);
  }
}

/// QueryDelegationRewardsResponse is the response type for the
/// Query/DelegationRewards RPC method.
class QueryDelegationRewardsResponse extends CosmosProtoMessage {
  /// rewards defines the rewards accrued by a delegation.
  final List<initia_distribution_v1_distribution.DecPool> rewards;

  const QueryDelegationRewardsResponse({this.rewards = const []});

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
  List<Object?> get protoValues => [rewards];

  @override
  Map<String, dynamic> toJson() {
    return {'rewards': rewards.map((e) => e.toJson()).toList()};
  }

  factory QueryDelegationRewardsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDelegationRewardsResponse(
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  initia_distribution_v1_distribution.DecPool,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_distribution_v1_distribution
                          .DecPool.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryDelegationRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationRewardsResponse(
      rewards:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    initia_distribution_v1_distribution.DecPool.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryDelegationRewardsResponse;
}

/// QueryDelegationTotalRewardsRequest is the request type for the
/// Query/DelegationTotalRewards RPC method.
class QueryDelegationTotalRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegationTotalRewardsResponse> {
  /// delegator_address defines the delegator address to query for.
  final String? delegatorAddress;

  const QueryDelegationTotalRewardsRequest({this.delegatorAddress});

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
              "/initia/distribution/v1/delegators/{delegator_address}/rewards",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory QueryDelegationTotalRewardsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegationTotalRewardsRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegationTotalRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationTotalRewardsRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryDelegationTotalRewardsRequest;
  @override
  QueryDelegationTotalRewardsResponse onQueryResponse(List<int> bytes) {
    return QueryDelegationTotalRewardsResponse.deserialize(bytes);
  }

  @override
  QueryDelegationTotalRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegationTotalRewardsResponse.fromJson(json);
  }
}

/// QueryDelegationTotalRewardsResponse is the response type for the
/// Query/DelegationTotalRewards RPC method.
class QueryDelegationTotalRewardsResponse extends CosmosProtoMessage {
  /// rewards defines all the rewards accrued by a delegator.
  final List<initia_distribution_v1_distribution.DelegationDelegatorReward>
  rewards;

  /// total defines the sum of all the rewards.
  final List<initia_distribution_v1_distribution.DecPool> total;

  const QueryDelegationTotalRewardsResponse({
    this.rewards = const [],
    this.total = const [],
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
  List<Object?> get protoValues => [rewards, total];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rewards': rewards.map((e) => e.toJson()).toList(),
      'total': total.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryDelegationTotalRewardsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegationTotalRewardsResponse(
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  initia_distribution_v1_distribution.DelegationDelegatorReward,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_distribution_v1_distribution
                          .DelegationDelegatorReward.fromJson(v),
                ),
              )
              .toList(),
      total:
          (json.valueEnsureAsList<dynamic>('total', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  initia_distribution_v1_distribution.DecPool,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_distribution_v1_distribution
                          .DecPool.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryDelegationTotalRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationTotalRewardsResponse(
      rewards:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_distribution_v1_distribution
                    .DelegationDelegatorReward.deserialize(b),
              )
              .toList(),
      total:
          decode
              .getListOfBytes(2)
              .map(
                (b) =>
                    initia_distribution_v1_distribution.DecPool.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaDistributionV1QueryDelegationTotalRewardsResponse;
}
