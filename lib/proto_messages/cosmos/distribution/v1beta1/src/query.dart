import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/distribution/v1beta1/src/distribution.dart"
    as cosmos_distribution_v1beta1_distribution;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
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
          path: "/cosmos/distribution/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1QueryParamsRequest;
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
  final cosmos_distribution_v1beta1_distribution.Params? params;

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
      params: json.valueTo<
        cosmos_distribution_v1beta1_distribution.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode
          .messageTo<cosmos_distribution_v1beta1_distribution.Params?>(
            1,
            (b) =>
                cosmos_distribution_v1beta1_distribution.Params.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosDistributionV1beta1QueryParamsResponse;
}

/// QueryValidatorDistributionInfoRequest is the request type for the Query/ValidatorDistributionInfo RPC method.
class QueryValidatorDistributionInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorDistributionInfoResponse> {
  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  const QueryValidatorDistributionInfoRequest({this.validatorAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/distribution/v1beta1/validators/{validator_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress};
  }

  factory QueryValidatorDistributionInfoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorDistributionInfoRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorDistributionInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorDistributionInfoRequest(
      validatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorDistributionInfoRequest;
  @override
  QueryValidatorDistributionInfoResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorDistributionInfoResponse.deserialize(bytes);
  }

  @override
  QueryValidatorDistributionInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorDistributionInfoResponse.fromJson(json);
  }
}

/// QueryValidatorDistributionInfoResponse is the response type for the Query/ValidatorDistributionInfo RPC method.
class QueryValidatorDistributionInfoResponse extends CosmosProtoMessage {
  /// operator_address defines the validator operator address.
  final String? operatorAddress;

  /// self_bond_rewards defines the self delegations rewards.
  final List<cosmos_base_v1beta1_coin.DecCoin> selfBondRewards;

  /// commission defines the commission the validator received.
  final List<cosmos_base_v1beta1_coin.DecCoin> commission;

  const QueryValidatorDistributionInfoResponse({
    this.operatorAddress,
    this.selfBondRewards = const [],
    this.commission = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    operatorAddress,
    selfBondRewards,
    commission,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator_address': operatorAddress,
      'self_bond_rewards': selfBondRewards.map((e) => e.toJson()).toList(),
      'commission': commission.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryValidatorDistributionInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorDistributionInfoResponse(
      operatorAddress: json.valueAsString<String?>(
        'operator_address',
        acceptCamelCase: true,
      ),
      selfBondRewards:
          (json.valueEnsureAsList<dynamic>(
                'self_bond_rewards',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
      commission:
          (json.valueEnsureAsList<dynamic>('commission', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryValidatorDistributionInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorDistributionInfoResponse(
      operatorAddress: decode.getString<String?>(1),
      selfBondRewards:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      commission:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorDistributionInfoResponse;
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
              "/cosmos/distribution/v1beta1/validators/{validator_address}/outstanding_rewards",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
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
          .cosmosDistributionV1beta1QueryValidatorOutstandingRewardsRequest;
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
  final cosmos_distribution_v1beta1_distribution.ValidatorOutstandingRewards?
  rewards;

  const QueryValidatorOutstandingRewardsResponse({this.rewards});

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
        cosmos_distribution_v1beta1_distribution.ValidatorOutstandingRewards?,
        Map<String, dynamic>
      >(
        key: 'rewards',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution
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
        cosmos_distribution_v1beta1_distribution.ValidatorOutstandingRewards?
      >(
        1,
        (b) => cosmos_distribution_v1beta1_distribution
            .ValidatorOutstandingRewards.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorOutstandingRewardsResponse;
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
              "/cosmos/distribution/v1beta1/validators/{validator_address}/commission",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
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
          .cosmosDistributionV1beta1QueryValidatorCommissionRequest;
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
  final cosmos_distribution_v1beta1_distribution.ValidatorAccumulatedCommission?
  commission;

  const QueryValidatorCommissionResponse({this.commission});

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
  List<Object?> get protoValues => [commission];

  @override
  Map<String, dynamic> toJson() {
    return {'commission': commission?.toJson()};
  }

  factory QueryValidatorCommissionResponse.fromJson(Map<String, dynamic> json) {
    return QueryValidatorCommissionResponse(
      commission: json.valueTo<
        cosmos_distribution_v1beta1_distribution.ValidatorAccumulatedCommission?,
        Map<String, dynamic>
      >(
        key: 'commission',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution
                .ValidatorAccumulatedCommission.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorCommissionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorCommissionResponse(
      commission: decode.messageTo<
        cosmos_distribution_v1beta1_distribution.ValidatorAccumulatedCommission?
      >(
        1,
        (b) => cosmos_distribution_v1beta1_distribution
            .ValidatorAccumulatedCommission.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorCommissionResponse;
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
              "/cosmos/distribution/v1beta1/validators/{validator_address}/slashes",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
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
          .cosmosDistributionV1beta1QueryValidatorSlashesRequest;
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
  final List<cosmos_distribution_v1beta1_distribution.ValidatorSlashEvent>
  slashes;

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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
                  cosmos_distribution_v1beta1_distribution.ValidatorSlashEvent,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_distribution_v1beta1_distribution
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
                (b) => cosmos_distribution_v1beta1_distribution
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
          .cosmosDistributionV1beta1QueryValidatorSlashesResponse;
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
              "/cosmos/distribution/v1beta1/delegators/{delegator_address}/rewards/{validator_address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
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
          .cosmosDistributionV1beta1QueryDelegationRewardsRequest;
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
  final List<cosmos_base_v1beta1_coin.DecCoin> rewards;

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
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
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegationRewardsResponse;
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
              "/cosmos/distribution/v1beta1/delegators/{delegator_address}/rewards",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
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
          .cosmosDistributionV1beta1QueryDelegationTotalRewardsRequest;
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
  final List<cosmos_distribution_v1beta1_distribution.DelegationDelegatorReward>
  rewards;

  /// total defines the sum of all the rewards.
  final List<cosmos_base_v1beta1_coin.DecCoin> total;

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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
                  cosmos_distribution_v1beta1_distribution.DelegationDelegatorReward,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_distribution_v1beta1_distribution
                          .DelegationDelegatorReward.fromJson(v),
                ),
              )
              .toList(),
      total:
          (json.valueEnsureAsList<dynamic>('total', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
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
                (b) => cosmos_distribution_v1beta1_distribution
                    .DelegationDelegatorReward.deserialize(b),
              )
              .toList(),
      total:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegationTotalRewardsResponse;
}

/// QueryDelegatorValidatorsRequest is the request type for the
/// Query/DelegatorValidators RPC method.
class QueryDelegatorValidatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorValidatorsResponse> {
  /// delegator_address defines the delegator address to query for.
  final String? delegatorAddress;

  const QueryDelegatorValidatorsRequest({this.delegatorAddress});

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
              "/cosmos/distribution/v1beta1/delegators/{delegator_address}/validators",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory QueryDelegatorValidatorsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorValidatorsRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegatorValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorValidatorsRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegatorValidatorsRequest;
  @override
  QueryDelegatorValidatorsResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorValidatorsResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorValidatorsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorValidatorsResponse.fromJson(json);
  }
}

/// QueryDelegatorValidatorsResponse is the response type for the
/// Query/DelegatorValidators RPC method.
class QueryDelegatorValidatorsResponse extends CosmosProtoMessage {
  /// validators defines the validators a delegator is delegating for.
  final List<String> validators;

  const QueryDelegatorValidatorsResponse({this.validators = const []});

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
  List<Object?> get protoValues => [validators];

  @override
  Map<String, dynamic> toJson() {
    return {'validators': validators.map((e) => e).toList()};
  }

  factory QueryDelegatorValidatorsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorValidatorsResponse(
      validators:
          (json.valueEnsureAsList<dynamic>(
            'validators',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryDelegatorValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorValidatorsResponse(
      validators: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegatorValidatorsResponse;
}

/// QueryDelegatorWithdrawAddressRequest is the request type for the
/// Query/DelegatorWithdrawAddress RPC method.
class QueryDelegatorWithdrawAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorWithdrawAddressResponse> {
  /// delegator_address defines the delegator address to query for.
  final String? delegatorAddress;

  const QueryDelegatorWithdrawAddressRequest({this.delegatorAddress});

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
              "/cosmos/distribution/v1beta1/delegators/{delegator_address}/withdraw_address",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_address': delegatorAddress};
  }

  factory QueryDelegatorWithdrawAddressRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorWithdrawAddressRequest(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegatorWithdrawAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorWithdrawAddressRequest(
      delegatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegatorWithdrawAddressRequest;
  @override
  QueryDelegatorWithdrawAddressResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorWithdrawAddressResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorWithdrawAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorWithdrawAddressResponse.fromJson(json);
  }
}

/// QueryDelegatorWithdrawAddressResponse is the response type for the
/// Query/DelegatorWithdrawAddress RPC method.
class QueryDelegatorWithdrawAddressResponse extends CosmosProtoMessage {
  /// withdraw_address defines the delegator address to query for.
  final String? withdrawAddress;

  const QueryDelegatorWithdrawAddressResponse({this.withdrawAddress});

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
  List<Object?> get protoValues => [withdrawAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'withdraw_address': withdrawAddress};
  }

  factory QueryDelegatorWithdrawAddressResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorWithdrawAddressResponse(
      withdrawAddress: json.valueAsString<String?>(
        'withdraw_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegatorWithdrawAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorWithdrawAddressResponse(
      withdrawAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegatorWithdrawAddressResponse;
}

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
          path: "/cosmos/distribution/v1beta1/community_pool",
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
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryCommunityPoolRequest;
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
  final List<cosmos_base_v1beta1_coin.DecCoin> pool;

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
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
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryCommunityPoolResponse;
}

/// QueryValidatorHistoricalRewardsRequest is the request type for the
/// Query/ValidatorHistoricalRewards RPC method.
class QueryValidatorHistoricalRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorHistoricalRewardsResponse> {
  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  /// period defines the period to query historical rewards for.
  final BigInt? period;

  const QueryValidatorHistoricalRewardsRequest({
    this.validatorAddress,
    this.period,
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
              "/cosmos/distribution/v1beta1/validators/{validator_address}/historical_rewards/{period}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress, period];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_address': validatorAddress,
      'period': period?.toString(),
    };
  }

  factory QueryValidatorHistoricalRewardsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorHistoricalRewardsRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      period: json.valueAsBigInt<BigInt?>('period', acceptCamelCase: true),
    );
  }

  factory QueryValidatorHistoricalRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorHistoricalRewardsRequest(
      validatorAddress: decode.getString<String?>(1),
      period: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorHistoricalRewardsRequest;
  @override
  QueryValidatorHistoricalRewardsResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorHistoricalRewardsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorHistoricalRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorHistoricalRewardsResponse.fromJson(json);
  }
}

/// QueryValidatorHistoricalRewardsResponse is the response type for the
/// Query/ValidatorHistoricalRewards RPC method.
class QueryValidatorHistoricalRewardsResponse extends CosmosProtoMessage {
  /// rewards defines the historical rewards of a validator.
  final cosmos_distribution_v1beta1_distribution.ValidatorHistoricalRewards?
  rewards;

  const QueryValidatorHistoricalRewardsResponse({this.rewards});

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
  List<Object?> get protoValues => [rewards];

  @override
  Map<String, dynamic> toJson() {
    return {'rewards': rewards?.toJson()};
  }

  factory QueryValidatorHistoricalRewardsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorHistoricalRewardsResponse(
      rewards: json.valueTo<
        cosmos_distribution_v1beta1_distribution.ValidatorHistoricalRewards?,
        Map<String, dynamic>
      >(
        key: 'rewards',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution
                .ValidatorHistoricalRewards.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorHistoricalRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorHistoricalRewardsResponse(
      rewards: decode.messageTo<
        cosmos_distribution_v1beta1_distribution.ValidatorHistoricalRewards?
      >(
        1,
        (b) => cosmos_distribution_v1beta1_distribution
            .ValidatorHistoricalRewards.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorHistoricalRewardsResponse;
}

/// QueryValidatorCurrentRewardsRequest is the request type for the
/// Query/ValidatorCurrentRewards RPC method.
class QueryValidatorCurrentRewardsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorCurrentRewardsResponse> {
  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  const QueryValidatorCurrentRewardsRequest({this.validatorAddress});

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
              "/cosmos/distribution/v1beta1/validators/{validator_address}/current_rewards",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_address': validatorAddress};
  }

  factory QueryValidatorCurrentRewardsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorCurrentRewardsRequest(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorCurrentRewardsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorCurrentRewardsRequest(
      validatorAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorCurrentRewardsRequest;
  @override
  QueryValidatorCurrentRewardsResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorCurrentRewardsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorCurrentRewardsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorCurrentRewardsResponse.fromJson(json);
  }
}

/// QueryValidatorCurrentRewardsResponse is the response type for the
/// Query/ValidatorCurrentRewards RPC method.
class QueryValidatorCurrentRewardsResponse extends CosmosProtoMessage {
  /// rewards defines the current rewards of a validator.
  final cosmos_distribution_v1beta1_distribution.ValidatorCurrentRewards?
  rewards;

  const QueryValidatorCurrentRewardsResponse({this.rewards});

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
  List<Object?> get protoValues => [rewards];

  @override
  Map<String, dynamic> toJson() {
    return {'rewards': rewards?.toJson()};
  }

  factory QueryValidatorCurrentRewardsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorCurrentRewardsResponse(
      rewards: json.valueTo<
        cosmos_distribution_v1beta1_distribution.ValidatorCurrentRewards?,
        Map<String, dynamic>
      >(
        key: 'rewards',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution
                .ValidatorCurrentRewards.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorCurrentRewardsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorCurrentRewardsResponse(
      rewards: decode.messageTo<
        cosmos_distribution_v1beta1_distribution.ValidatorCurrentRewards?
      >(
        1,
        (b) => cosmos_distribution_v1beta1_distribution
            .ValidatorCurrentRewards.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryValidatorCurrentRewardsResponse;
}

/// QueryDelegatorStartingInfoRequest is the request type for the
/// Query/DelegatorStartingInfo RPC method.
class QueryDelegatorStartingInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorStartingInfoResponse> {
  /// delegator_address defines the delegator address to query for.
  final String? delegatorAddress;

  /// validator_address defines the validator address to query for.
  final String? validatorAddress;

  const QueryDelegatorStartingInfoRequest({
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
              "/cosmos/distribution/v1beta1/delegators/{delegator_address}/starting_info/{validator_address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
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

  factory QueryDelegatorStartingInfoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorStartingInfoRequest(
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

  factory QueryDelegatorStartingInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorStartingInfoRequest(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegatorStartingInfoRequest;
  @override
  QueryDelegatorStartingInfoResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorStartingInfoResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorStartingInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorStartingInfoResponse.fromJson(json);
  }
}

/// QueryDelegatorStartingInfoResponse is the response type for the
/// Query/DelegatorStartingInfo RPC method.
class QueryDelegatorStartingInfoResponse extends CosmosProtoMessage {
  /// starting_info defines the starting info of a delegator.
  final cosmos_distribution_v1beta1_distribution.DelegatorStartingInfo?
  startingInfo;

  const QueryDelegatorStartingInfoResponse({this.startingInfo});

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
  List<Object?> get protoValues => [startingInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'starting_info': startingInfo?.toJson()};
  }

  factory QueryDelegatorStartingInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorStartingInfoResponse(
      startingInfo: json.valueTo<
        cosmos_distribution_v1beta1_distribution.DelegatorStartingInfo?,
        Map<String, dynamic>
      >(
        key: 'starting_info',
        parse:
            (v) => cosmos_distribution_v1beta1_distribution
                .DelegatorStartingInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegatorStartingInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorStartingInfoResponse(
      startingInfo: decode.messageTo<
        cosmos_distribution_v1beta1_distribution.DelegatorStartingInfo?
      >(
        1,
        (b) => cosmos_distribution_v1beta1_distribution
            .DelegatorStartingInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosDistributionV1beta1QueryDelegatorStartingInfoResponse;
}
