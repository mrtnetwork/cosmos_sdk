import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/initia/mstaking/v1/src/staking.dart"
    as initia_mstaking_v1_staking;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// QueryValidatorsRequest is request type for Query/Validators RPC method.
class QueryValidatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorsResponse> {
  /// status enables to query for validators matching a given status.
  final String? status;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryValidatorsRequest({this.status, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/validators",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [status, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'status': status, 'pagination': pagination?.toJson()};
  }

  factory QueryValidatorsRequest.fromJson(Map<String, dynamic> json) {
    return QueryValidatorsRequest(
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
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

  factory QueryValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorsRequest(
      status: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryValidatorsRequest;
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
  final List<initia_mstaking_v1_staking.Validator> validators;

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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validators, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validators': validators.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorsResponse.fromJson(Map<String, dynamic> json) {
    return QueryValidatorsResponse(
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.Validator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking.Validator.fromJson(v),
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

  factory QueryValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorsResponse(
      validators:
          decode
              .getListOfBytes(1)
              .map((b) => initia_mstaking_v1_staking.Validator.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryValidatorsResponse;
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
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/validators/{validator_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_addr': validatorAddr};
  }

  factory QueryValidatorRequest.fromJson(Map<String, dynamic> json) {
    return QueryValidatorRequest(
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryValidatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorRequest(validatorAddr: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryValidatorRequest;
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
  final initia_mstaking_v1_staking.Validator? validator;

  const QueryValidatorResponse({this.validator});

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
  List<Object?> get protoValues => [validator];

  @override
  Map<String, dynamic> toJson() {
    return {'validator': validator?.toJson()};
  }

  factory QueryValidatorResponse.fromJson(Map<String, dynamic> json) {
    return QueryValidatorResponse(
      validator: json
          .valueTo<initia_mstaking_v1_staking.Validator?, Map<String, dynamic>>(
            key: 'validator',
            parse: (v) => initia_mstaking_v1_staking.Validator.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryValidatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorResponse(
      validator: decode.messageTo<initia_mstaking_v1_staking.Validator?>(
        1,
        (b) => initia_mstaking_v1_staking.Validator.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryValidatorResponse;
}

/// QueryValidatorDelegationsRequest is request type for the
/// Query/ValidatorDelegations RPC method
class QueryValidatorDelegationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorDelegationsResponse> {
  /// validator_addr defines the validator address to query for.
  final String? validatorAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryValidatorDelegationsRequest({this.validatorAddr, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/validators/{validator_addr}/delegations",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddr, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_addr': validatorAddr,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorDelegationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryValidatorDelegationsRequest(
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
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

  factory QueryValidatorDelegationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorDelegationsRequest(
      validatorAddr: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryValidatorDelegationsRequest;
  @override
  QueryValidatorDelegationsResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorDelegationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorDelegationsResponse.fromJson(json);
  }
}

/// QueryValidatorDelegationsResponse is response type for the
/// Query/ValidatorDelegations RPC method
class QueryValidatorDelegationsResponse extends CosmosProtoMessage {
  final List<initia_mstaking_v1_staking.DelegationResponse> delegationResponses;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryValidatorDelegationsResponse({
    this.delegationResponses = const [],
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
  List<Object?> get protoValues => [delegationResponses, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegation_responses':
          delegationResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorDelegationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorDelegationsResponse(
      delegationResponses:
          (json.valueEnsureAsList<dynamic>(
                'delegation_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.DelegationResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking
                          .DelegationResponse.fromJson(v),
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

  factory QueryValidatorDelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorDelegationsResponse(
      delegationResponses:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_mstaking_v1_staking
                    .DelegationResponse.deserialize(b),
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
          .initiaMstakingV1QueryValidatorDelegationsResponse;
}

/// QueryValidatorUnbondingDelegationsRequest is required type for the
/// Query/ValidatorUnbondingDelegations RPC method
class QueryValidatorUnbondingDelegationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorUnbondingDelegationsResponse> {
  /// validator_addr defines the validator address to query for.
  final String? validatorAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryValidatorUnbondingDelegationsRequest({
    this.validatorAddr,
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
              "/initia/mstaking/v1/validators/{validator_addr}/unbonding_delegations",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddr, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_addr': validatorAddr,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorUnbondingDelegationsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorUnbondingDelegationsRequest(
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
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

  factory QueryValidatorUnbondingDelegationsRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorUnbondingDelegationsRequest(
      validatorAddr: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryValidatorUnbondingDelegationsRequest;
  @override
  QueryValidatorUnbondingDelegationsResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorUnbondingDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorUnbondingDelegationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorUnbondingDelegationsResponse.fromJson(json);
  }
}

/// QueryValidatorUnbondingDelegationsResponse is response type for the
/// Query/ValidatorUnbondingDelegations RPC method.
class QueryValidatorUnbondingDelegationsResponse extends CosmosProtoMessage {
  final List<initia_mstaking_v1_staking.UnbondingDelegation> unbondingResponses;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryValidatorUnbondingDelegationsResponse({
    this.unbondingResponses = const [],
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
  List<Object?> get protoValues => [unbondingResponses, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_responses': unbondingResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryValidatorUnbondingDelegationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorUnbondingDelegationsResponse(
      unbondingResponses:
          (json.valueEnsureAsList<dynamic>(
                'unbonding_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.UnbondingDelegation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking
                          .UnbondingDelegation.fromJson(v),
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

  factory QueryValidatorUnbondingDelegationsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorUnbondingDelegationsResponse(
      unbondingResponses:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_mstaking_v1_staking
                    .UnbondingDelegation.deserialize(b),
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
          .initiaMstakingV1QueryValidatorUnbondingDelegationsResponse;
}

/// QueryDelegationRequest is request type for the Query/Delegation RPC method.
class QueryDelegationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegationResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final String? validatorAddr;

  const QueryDelegationRequest({this.delegatorAddr, this.validatorAddr});

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
              "/initia/mstaking/v1/validators/{validator_addr}/delegations/{delegator_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, validatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_addr': delegatorAddr, 'validator_addr': validatorAddr};
  }

  factory QueryDelegationRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegationRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
        acceptCamelCase: true,
      ),
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationRequest(
      delegatorAddr: decode.getString<String?>(1),
      validatorAddr: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryDelegationRequest;
  @override
  QueryDelegationResponse onQueryResponse(List<int> bytes) {
    return QueryDelegationResponse.deserialize(bytes);
  }

  @override
  QueryDelegationResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDelegationResponse.fromJson(json);
  }
}

/// QueryDelegationResponse is response type for the Query/Delegation RPC method.
class QueryDelegationResponse extends CosmosProtoMessage {
  /// delegation_responses defines the delegation info of a delegation.
  final initia_mstaking_v1_staking.DelegationResponse? delegationResponse;

  const QueryDelegationResponse({this.delegationResponse});

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
  List<Object?> get protoValues => [delegationResponse];

  @override
  Map<String, dynamic> toJson() {
    return {'delegation_response': delegationResponse?.toJson()};
  }

  factory QueryDelegationResponse.fromJson(Map<String, dynamic> json) {
    return QueryDelegationResponse(
      delegationResponse: json.valueTo<
        initia_mstaking_v1_staking.DelegationResponse?,
        Map<String, dynamic>
      >(
        key: 'delegation_response',
        parse: (v) => initia_mstaking_v1_staking.DelegationResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegationResponse(
      delegationResponse: decode
          .messageTo<initia_mstaking_v1_staking.DelegationResponse?>(
            1,
            (b) => initia_mstaking_v1_staking.DelegationResponse.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryDelegationResponse;
}

/// QueryUnbondingDelegationRequest is request type for the
/// Query/UnbondingDelegation RPC method.
class QueryUnbondingDelegationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUnbondingDelegationResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final String? validatorAddr;

  const QueryUnbondingDelegationRequest({
    this.delegatorAddr,
    this.validatorAddr,
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
              "/initia/mstaking/v1/validators/{validator_addr}/delegations/{delegator_addr}/unbonding_delegation",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, validatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_addr': delegatorAddr, 'validator_addr': validatorAddr};
  }

  factory QueryUnbondingDelegationRequest.fromJson(Map<String, dynamic> json) {
    return QueryUnbondingDelegationRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
        acceptCamelCase: true,
      ),
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUnbondingDelegationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnbondingDelegationRequest(
      delegatorAddr: decode.getString<String?>(1),
      validatorAddr: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryUnbondingDelegationRequest;
  @override
  QueryUnbondingDelegationResponse onQueryResponse(List<int> bytes) {
    return QueryUnbondingDelegationResponse.deserialize(bytes);
  }

  @override
  QueryUnbondingDelegationResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryUnbondingDelegationResponse.fromJson(json);
  }
}

/// QueryDelegationResponse is response type for the Query/UnbondingDelegation
/// RPC method.
class QueryUnbondingDelegationResponse extends CosmosProtoMessage {
  /// unbond defines the unbonding information of a delegation.
  final initia_mstaking_v1_staking.UnbondingDelegation? unbond;

  const QueryUnbondingDelegationResponse({this.unbond});

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
  List<Object?> get protoValues => [unbond];

  @override
  Map<String, dynamic> toJson() {
    return {'unbond': unbond?.toJson()};
  }

  factory QueryUnbondingDelegationResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnbondingDelegationResponse(
      unbond: json.valueTo<
        initia_mstaking_v1_staking.UnbondingDelegation?,
        Map<String, dynamic>
      >(
        key: 'unbond',
        parse:
            (v) => initia_mstaking_v1_staking.UnbondingDelegation.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUnbondingDelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUnbondingDelegationResponse(
      unbond: decode.messageTo<initia_mstaking_v1_staking.UnbondingDelegation?>(
        1,
        (b) => initia_mstaking_v1_staking.UnbondingDelegation.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryUnbondingDelegationResponse;
}

/// QueryDelegatorDelegationsRequest is request type for the
/// Query/DelegatorDelegations RPC method.
class QueryDelegatorDelegationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorDelegationsResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  /// status enables to query for delegations with validators of a specific bond status (bonded/unbonded/unbonding).
  /// If empty, it queries for all delegations regardless of validator status.
  final String? status;

  const QueryDelegatorDelegationsRequest({
    this.delegatorAddr,
    this.pagination,
    this.status,
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
          path: "/initia/mstaking/v1/delegations/{delegator_addr}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, pagination, status];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_addr': delegatorAddr,
      'pagination': pagination?.toJson(),
      'status': status,
    };
  }

  factory QueryDelegatorDelegationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorDelegationsRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
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
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
    );
  }

  factory QueryDelegatorDelegationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorDelegationsRequest(
      delegatorAddr: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
      status: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryDelegatorDelegationsRequest;
  @override
  QueryDelegatorDelegationsResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorDelegationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorDelegationsResponse.fromJson(json);
  }
}

/// QueryDelegatorDelegationsResponse is response type for the
/// Query/DelegatorDelegations RPC method.
class QueryDelegatorDelegationsResponse extends CosmosProtoMessage {
  /// delegation_responses defines all the delegations' info of a delegator.
  final List<initia_mstaking_v1_staking.DelegationResponse> delegationResponses;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDelegatorDelegationsResponse({
    this.delegationResponses = const [],
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
  List<Object?> get protoValues => [delegationResponses, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegation_responses':
          delegationResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDelegatorDelegationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorDelegationsResponse(
      delegationResponses:
          (json.valueEnsureAsList<dynamic>(
                'delegation_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.DelegationResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking
                          .DelegationResponse.fromJson(v),
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

  factory QueryDelegatorDelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorDelegationsResponse(
      delegationResponses:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_mstaking_v1_staking
                    .DelegationResponse.deserialize(b),
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
          .initiaMstakingV1QueryDelegatorDelegationsResponse;
}

/// QueryDelegatorUnbondingDelegationsRequest is request type for the
/// Query/DelegatorUnbondingDelegations RPC method.
class QueryDelegatorUnbondingDelegationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorUnbondingDelegationsResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDelegatorUnbondingDelegationsRequest({
    this.delegatorAddr,
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
              "/initia/mstaking/v1/delegators/{delegator_addr}/unbonding_delegations",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_addr': delegatorAddr,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDelegatorUnbondingDelegationsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorUnbondingDelegationsRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
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

  factory QueryDelegatorUnbondingDelegationsRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorUnbondingDelegationsRequest(
      delegatorAddr: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryDelegatorUnbondingDelegationsRequest;
  @override
  QueryDelegatorUnbondingDelegationsResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorUnbondingDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorUnbondingDelegationsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorUnbondingDelegationsResponse.fromJson(json);
  }
}

/// QueryUnbondingDelegatorDelegationsResponse is response type for the
/// Query/UnbondingDelegatorDelegations RPC method.
class QueryDelegatorUnbondingDelegationsResponse extends CosmosProtoMessage {
  final List<initia_mstaking_v1_staking.UnbondingDelegation> unbondingResponses;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDelegatorUnbondingDelegationsResponse({
    this.unbondingResponses = const [],
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
  List<Object?> get protoValues => [unbondingResponses, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_responses': unbondingResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDelegatorUnbondingDelegationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorUnbondingDelegationsResponse(
      unbondingResponses:
          (json.valueEnsureAsList<dynamic>(
                'unbonding_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.UnbondingDelegation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking
                          .UnbondingDelegation.fromJson(v),
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

  factory QueryDelegatorUnbondingDelegationsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorUnbondingDelegationsResponse(
      unbondingResponses:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_mstaking_v1_staking
                    .UnbondingDelegation.deserialize(b),
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
          .initiaMstakingV1QueryDelegatorUnbondingDelegationsResponse;
}

/// QueryRedelegationsRequest is request type for the Query/Redelegations RPC
/// method.
class QueryRedelegationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRedelegationsResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// src_validator_addr defines the validator address to redelegate from.
  final String? srcValidatorAddr;

  /// dst_validator_addr defines the validator address to redelegate to.
  final String? dstValidatorAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryRedelegationsRequest({
    this.delegatorAddr,
    this.srcValidatorAddr,
    this.dstValidatorAddr,
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
          path: "/initia/mstaking/v1/delegators/{delegator_addr}/redelegations",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/redelegations",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    delegatorAddr,
    srcValidatorAddr,
    dstValidatorAddr,
    pagination,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_addr': delegatorAddr,
      'src_validator_addr': srcValidatorAddr,
      'dst_validator_addr': dstValidatorAddr,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRedelegationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryRedelegationsRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
        acceptCamelCase: true,
      ),
      srcValidatorAddr: json.valueAsString<String?>(
        'src_validator_addr',
        acceptCamelCase: true,
      ),
      dstValidatorAddr: json.valueAsString<String?>(
        'dst_validator_addr',
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

  factory QueryRedelegationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRedelegationsRequest(
      delegatorAddr: decode.getString<String?>(1),
      srcValidatorAddr: decode.getString<String?>(2),
      dstValidatorAddr: decode.getString<String?>(3),
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
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryRedelegationsRequest;
  @override
  QueryRedelegationsResponse onQueryResponse(List<int> bytes) {
    return QueryRedelegationsResponse.deserialize(bytes);
  }

  @override
  QueryRedelegationsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRedelegationsResponse.fromJson(json);
  }
}

/// QueryRedelegationsResponse is response type for the Query/Redelegations RPC
/// method.
class QueryRedelegationsResponse extends CosmosProtoMessage {
  final List<initia_mstaking_v1_staking.RedelegationResponse>
  redelegationResponses;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryRedelegationsResponse({
    this.redelegationResponses = const [],
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
  List<Object?> get protoValues => [redelegationResponses, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'redelegation_responses':
          redelegationResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRedelegationsResponse.fromJson(Map<String, dynamic> json) {
    return QueryRedelegationsResponse(
      redelegationResponses:
          (json.valueEnsureAsList<dynamic>(
                'redelegation_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.RedelegationResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking
                          .RedelegationResponse.fromJson(v),
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

  factory QueryRedelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRedelegationsResponse(
      redelegationResponses:
          decode
              .getListOfBytes(1)
              .map(
                (b) => initia_mstaking_v1_staking
                    .RedelegationResponse.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryRedelegationsResponse;
}

/// QueryDelegatorValidatorsRequest is request type for the
/// Query/DelegatorValidators RPC method.
class QueryDelegatorValidatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorValidatorsResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDelegatorValidatorsRequest({this.delegatorAddr, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/delegators/{delegator_addr}/validators",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_addr': delegatorAddr,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDelegatorValidatorsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorValidatorsRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
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

  factory QueryDelegatorValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorValidatorsRequest(
      delegatorAddr: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryDelegatorValidatorsRequest;
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

/// QueryDelegatorValidatorsResponse is response type for the
/// Query/DelegatorValidators RPC method.
class QueryDelegatorValidatorsResponse extends CosmosProtoMessage {
  /// validators defines the validators' info of a delegator.
  final List<initia_mstaking_v1_staking.Validator> validators;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDelegatorValidatorsResponse({
    this.validators = const [],
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
  List<Object?> get protoValues => [validators, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validators': validators.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDelegatorValidatorsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorValidatorsResponse(
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  initia_mstaking_v1_staking.Validator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => initia_mstaking_v1_staking.Validator.fromJson(v),
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

  factory QueryDelegatorValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorValidatorsResponse(
      validators:
          decode
              .getListOfBytes(1)
              .map((b) => initia_mstaking_v1_staking.Validator.deserialize(b))
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
          .initiaMstakingV1QueryDelegatorValidatorsResponse;
}

/// QueryDelegatorValidatorRequest is request type for the
/// Query/DelegatorValidator RPC method.
class QueryDelegatorValidatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorValidatorResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final String? validatorAddr;

  const QueryDelegatorValidatorRequest({
    this.delegatorAddr,
    this.validatorAddr,
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
              "/initia/mstaking/v1/delegators/{delegator_addr}/validators/{validator_addr}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, validatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_addr': delegatorAddr, 'validator_addr': validatorAddr};
  }

  factory QueryDelegatorValidatorRequest.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorValidatorRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
        acceptCamelCase: true,
      ),
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegatorValidatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorValidatorRequest(
      delegatorAddr: decode.getString<String?>(1),
      validatorAddr: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryDelegatorValidatorRequest;
  @override
  QueryDelegatorValidatorResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorValidatorResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorValidatorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorValidatorResponse.fromJson(json);
  }
}

/// QueryDelegatorValidatorResponse response type for the
/// Query/DelegatorValidator RPC method.
class QueryDelegatorValidatorResponse extends CosmosProtoMessage {
  /// validator defines the validator info.
  final initia_mstaking_v1_staking.Validator? validator;

  const QueryDelegatorValidatorResponse({this.validator});

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
  List<Object?> get protoValues => [validator];

  @override
  Map<String, dynamic> toJson() {
    return {'validator': validator?.toJson()};
  }

  factory QueryDelegatorValidatorResponse.fromJson(Map<String, dynamic> json) {
    return QueryDelegatorValidatorResponse(
      validator: json
          .valueTo<initia_mstaking_v1_staking.Validator?, Map<String, dynamic>>(
            key: 'validator',
            parse: (v) => initia_mstaking_v1_staking.Validator.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryDelegatorValidatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorValidatorResponse(
      validator: decode.messageTo<initia_mstaking_v1_staking.Validator?>(
        1,
        (b) => initia_mstaking_v1_staking.Validator.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryDelegatorValidatorResponse;
}

/// QueryDelegatorTotalDelegationBalanceRequest is request type for the
/// Query/DelegatorTotalDelegationBalance RPC method.
class QueryDelegatorTotalDelegationBalanceRequest extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<QueryDelegatorTotalDelegationBalanceResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  /// status enables to query for delegations with validators of a specific bond status (bonded/unbonded/unbonding).
  /// If empty, it queries for all delegations regardless of validator status.
  final String? status;

  const QueryDelegatorTotalDelegationBalanceRequest({
    this.delegatorAddr,
    this.status,
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
              "/initia/mstaking/v1/delegators/{delegator_addr}/total_delegation_balance",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr, status];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_addr': delegatorAddr, 'status': status};
  }

  factory QueryDelegatorTotalDelegationBalanceRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorTotalDelegationBalanceRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
        acceptCamelCase: true,
      ),
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
    );
  }

  factory QueryDelegatorTotalDelegationBalanceRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorTotalDelegationBalanceRequest(
      delegatorAddr: decode.getString<String?>(1),
      status: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryDelegatorTotalDelegationBalanceRequest;
  @override
  QueryDelegatorTotalDelegationBalanceResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryDelegatorTotalDelegationBalanceResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorTotalDelegationBalanceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorTotalDelegationBalanceResponse.fromJson(json);
  }
}

/// QueryDelegatorTotalDelegationBalanceResponse is response type for the
/// Query/DelegatorTotalDelegationBalance RPC method.
class QueryDelegatorTotalDelegationBalanceResponse extends CosmosProtoMessage {
  /// balance defines the sum of all the delegations' balance of a delegator.
  final List<cosmos_base_v1beta1_coin.Coin> balance;

  const QueryDelegatorTotalDelegationBalanceResponse({this.balance = const []});

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
  List<Object?> get protoValues => [balance];

  @override
  Map<String, dynamic> toJson() {
    return {'balance': balance.map((e) => e.toJson()).toList()};
  }

  factory QueryDelegatorTotalDelegationBalanceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorTotalDelegationBalanceResponse(
      balance:
          (json.valueEnsureAsList<dynamic>('balance', acceptCamelCase: true))
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

  factory QueryDelegatorTotalDelegationBalanceResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorTotalDelegationBalanceResponse(
      balance:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryDelegatorTotalDelegationBalanceResponse;
}

/// QueryDelegatorTotalUnbondingBalanceRequest is request type for the
/// Query/DelegatorTotalUnbondingBalance RPC method.
class QueryDelegatorTotalUnbondingBalanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDelegatorTotalUnbondingBalanceResponse> {
  /// delegator_addr defines the delegator address to query for.
  final String? delegatorAddr;

  const QueryDelegatorTotalUnbondingBalanceRequest({this.delegatorAddr});

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
              "/initia/mstaking/v1/delegators/{delegator_addr}/total_unbonding_balance",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'delegator_addr': delegatorAddr};
  }

  factory QueryDelegatorTotalUnbondingBalanceRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorTotalUnbondingBalanceRequest(
      delegatorAddr: json.valueAsString<String?>(
        'delegator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDelegatorTotalUnbondingBalanceRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorTotalUnbondingBalanceRequest(
      delegatorAddr: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryDelegatorTotalUnbondingBalanceRequest;
  @override
  QueryDelegatorTotalUnbondingBalanceResponse onQueryResponse(List<int> bytes) {
    return QueryDelegatorTotalUnbondingBalanceResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorTotalUnbondingBalanceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorTotalUnbondingBalanceResponse.fromJson(json);
  }
}

/// QueryDelegatorTotalUnbondingBalanceResponse is response type for the
/// Query/DelegatorTotalUnbondingBalance RPC method.
class QueryDelegatorTotalUnbondingBalanceResponse extends CosmosProtoMessage {
  /// balance defines the sum of all unbonding delegations' balance of a delegator.
  final List<cosmos_base_v1beta1_coin.Coin> balance;

  const QueryDelegatorTotalUnbondingBalanceResponse({this.balance = const []});

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
  List<Object?> get protoValues => [balance];

  @override
  Map<String, dynamic> toJson() {
    return {'balance': balance.map((e) => e.toJson()).toList()};
  }

  factory QueryDelegatorTotalUnbondingBalanceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDelegatorTotalUnbondingBalanceResponse(
      balance:
          (json.valueEnsureAsList<dynamic>('balance', acceptCamelCase: true))
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

  factory QueryDelegatorTotalUnbondingBalanceResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDelegatorTotalUnbondingBalanceResponse(
      balance:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaMstakingV1QueryDelegatorTotalUnbondingBalanceResponse;
}

/// QueryPoolRequest is request type for the Query/Pool RPC method.
class QueryPoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPoolResponse> {
  const QueryPoolRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/pool",
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

  factory QueryPoolRequest.fromJson(Map<String, dynamic> json) {
    return QueryPoolRequest();
  }

  factory QueryPoolRequest.deserialize(List<int> bytes) {
    return QueryPoolRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryPoolRequest;
  @override
  QueryPoolResponse onQueryResponse(List<int> bytes) {
    return QueryPoolResponse.deserialize(bytes);
  }

  @override
  QueryPoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPoolResponse.fromJson(json);
  }
}

/// QueryPoolResponse is response type for the Query/Pool RPC method.
class QueryPoolResponse extends CosmosProtoMessage {
  /// pool defines the pool info.
  final initia_mstaking_v1_staking.Pool? pool;

  const QueryPoolResponse({this.pool});

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
  List<Object?> get protoValues => [pool];

  @override
  Map<String, dynamic> toJson() {
    return {'pool': pool?.toJson()};
  }

  factory QueryPoolResponse.fromJson(Map<String, dynamic> json) {
    return QueryPoolResponse(
      pool: json
          .valueTo<initia_mstaking_v1_staking.Pool?, Map<String, dynamic>>(
            key: 'pool',
            parse: (v) => initia_mstaking_v1_staking.Pool.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryPoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPoolResponse(
      pool: decode.messageTo<initia_mstaking_v1_staking.Pool?>(
        1,
        (b) => initia_mstaking_v1_staking.Pool.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryPoolResponse;
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
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/mstaking/v1/params",
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
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryParamsRequest;
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
  final initia_mstaking_v1_staking.Params? params;

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
          .valueTo<initia_mstaking_v1_staking.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => initia_mstaking_v1_staking.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<initia_mstaking_v1_staking.Params?>(
        1,
        (b) => initia_mstaking_v1_staking.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1QueryParamsResponse;
}
