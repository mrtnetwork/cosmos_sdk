import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfevesting/src/params.dart"
    as chain4energy_c4echain_cfevesting_params;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfevesting/src/genesis.dart"
    as chain4energy_c4echain_cfevesting_genesis;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfevesting/src/account_vesting_pool.dart"
    as chain4energy_c4echain_cfevesting_account_vesting_pool;

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
          path: "/c4e/vesting/v1beta1/params",
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
          .chain4energyC4echainCfevestingQueryParamsRequest;
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
  final chain4energy_c4echain_cfevesting_params.Params? params;

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
        chain4energy_c4echain_cfevesting_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) => chain4energy_c4echain_cfevesting_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<chain4energy_c4echain_cfevesting_params.Params?>(
        1,
        (b) => chain4energy_c4echain_cfevesting_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryParamsResponse;
}

class QueryVestingTypeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVestingTypeResponse> {
  const QueryVestingTypeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/vesting/v1beta1/vesting_type",
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

  factory QueryVestingTypeRequest.fromJson(Map<String, dynamic> json) {
    return QueryVestingTypeRequest();
  }

  factory QueryVestingTypeRequest.deserialize(List<int> bytes) {
    return QueryVestingTypeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryVestingTypeRequest;
  @override
  QueryVestingTypeResponse onQueryResponse(List<int> bytes) {
    return QueryVestingTypeResponse.deserialize(bytes);
  }

  @override
  QueryVestingTypeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVestingTypeResponse.fromJson(json);
  }
}

class QueryVestingTypeResponse extends CosmosProtoMessage {
  final List<chain4energy_c4echain_cfevesting_genesis.GenesisVestingType>
  vestingTypes;

  const QueryVestingTypeResponse({this.vestingTypes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [vestingTypes];

  @override
  Map<String, dynamic> toJson() {
    return {'vesting_types': vestingTypes.map((e) => e.toJson()).toList()};
  }

  factory QueryVestingTypeResponse.fromJson(Map<String, dynamic> json) {
    return QueryVestingTypeResponse(
      vestingTypes:
          (json.valueEnsureAsList<dynamic>(
                'vesting_types',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfevesting_genesis.GenesisVestingType,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfevesting_genesis
                          .GenesisVestingType.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryVestingTypeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVestingTypeResponse(
      vestingTypes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => chain4energy_c4echain_cfevesting_genesis
                    .GenesisVestingType.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryVestingTypeResponse;
}

class QueryVestingPoolsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVestingPoolsResponse> {
  final String? owner;

  const QueryVestingPoolsRequest({this.owner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/vesting/v1beta1/vesting_pools/{owner}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner};
  }

  factory QueryVestingPoolsRequest.fromJson(Map<String, dynamic> json) {
    return QueryVestingPoolsRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
    );
  }

  factory QueryVestingPoolsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVestingPoolsRequest(owner: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryVestingPoolsRequest;
  @override
  QueryVestingPoolsResponse onQueryResponse(List<int> bytes) {
    return QueryVestingPoolsResponse.deserialize(bytes);
  }

  @override
  QueryVestingPoolsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVestingPoolsResponse.fromJson(json);
  }
}

class QueryVestingPoolsResponse extends CosmosProtoMessage {
  final List<VestingPoolInfo> vestingPools;

  const QueryVestingPoolsResponse({this.vestingPools = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [vestingPools];

  @override
  Map<String, dynamic> toJson() {
    return {'vesting_pools': vestingPools.map((e) => e.toJson()).toList()};
  }

  factory QueryVestingPoolsResponse.fromJson(Map<String, dynamic> json) {
    return QueryVestingPoolsResponse(
      vestingPools:
          (json.valueEnsureAsList<dynamic>(
                'vesting_pools',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<VestingPoolInfo, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => VestingPoolInfo.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory QueryVestingPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVestingPoolsResponse(
      vestingPools:
          decode
              .getListOfBytes(2)
              .map((b) => VestingPoolInfo.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryVestingPoolsResponse;
}

class VestingPoolInfo extends CosmosProtoMessage {
  final String? name;

  final String? vestingType;

  final google_protobuf_timestamp.Timestamp? lockStart;

  final google_protobuf_timestamp.Timestamp? lockEnd;

  final String? withdrawable;

  final cosmos_base_v1beta1_coin.Coin? initiallyLocked;

  final String? currentlyLocked;

  final String? sentAmount;

  final List<
    chain4energy_c4echain_cfevesting_account_vesting_pool.VestingPoolReservation
  >
  reservations;

  const VestingPoolInfo({
    this.name,
    this.vestingType,
    this.lockStart,
    this.lockEnd,
    this.withdrawable,
    this.initiallyLocked,
    this.currentlyLocked,
    this.sentAmount,
    this.reservations = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.message(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    vestingType,
    lockStart,
    lockEnd,
    withdrawable,
    initiallyLocked,
    currentlyLocked,
    sentAmount,
    reservations,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'vesting_type': vestingType,
      'lock_start': lockStart?.toRfc3339(),
      'lock_end': lockEnd?.toRfc3339(),
      'withdrawable': withdrawable,
      'initially_locked': initiallyLocked?.toJson(),
      'currently_locked': currentlyLocked,
      'sent_amount': sentAmount,
      'reservations': reservations.map((e) => e.toJson()).toList(),
    };
  }

  factory VestingPoolInfo.fromJson(Map<String, dynamic> json) {
    return VestingPoolInfo(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      vestingType: json.valueAsString<String?>(
        'vesting_type',
        acceptCamelCase: true,
      ),
      lockStart: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'lock_start',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      lockEnd: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'lock_end',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      withdrawable: json.valueAsString<String?>(
        'withdrawable',
        acceptCamelCase: true,
      ),
      initiallyLocked: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'initially_locked',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      currentlyLocked: json.valueAsString<String?>(
        'currently_locked',
        acceptCamelCase: true,
      ),
      sentAmount: json.valueAsString<String?>(
        'sent_amount',
        acceptCamelCase: true,
      ),
      reservations:
          (json.valueEnsureAsList<dynamic>(
                'reservations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfevesting_account_vesting_pool.VestingPoolReservation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          chain4energy_c4echain_cfevesting_account_vesting_pool
                              .VestingPoolReservation.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory VestingPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VestingPoolInfo(
      name: decode.getString<String?>(1),
      vestingType: decode.getString<String?>(2),
      lockStart: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      lockEnd: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      withdrawable: decode.getString<String?>(5),
      initiallyLocked: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        6,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      currentlyLocked: decode.getString<String?>(7),
      sentAmount: decode.getString<String?>(8),
      reservations:
          decode
              .getListOfBytes(9)
              .map(
                (b) => chain4energy_c4echain_cfevesting_account_vesting_pool
                    .VestingPoolReservation.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfevestingVestingPoolInfo;
}

class QueryVestingsSummaryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVestingsSummaryResponse> {
  const QueryVestingsSummaryRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/vesting/v1beta1/summary",
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

  factory QueryVestingsSummaryRequest.fromJson(Map<String, dynamic> json) {
    return QueryVestingsSummaryRequest();
  }

  factory QueryVestingsSummaryRequest.deserialize(List<int> bytes) {
    return QueryVestingsSummaryRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryVestingsSummaryRequest;
  @override
  QueryVestingsSummaryResponse onQueryResponse(List<int> bytes) {
    return QueryVestingsSummaryResponse.deserialize(bytes);
  }

  @override
  QueryVestingsSummaryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVestingsSummaryResponse.fromJson(json);
  }
}

class QueryVestingsSummaryResponse extends CosmosProtoMessage {
  final String? vestingAllAmount;

  final String? vestingInPoolsAmount;

  final String? vestingInAccountsAmount;

  final String? delegatedVestingAmount;

  const QueryVestingsSummaryResponse({
    this.vestingAllAmount,
    this.vestingInPoolsAmount,
    this.vestingInAccountsAmount,
    this.delegatedVestingAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    vestingAllAmount,
    vestingInPoolsAmount,
    vestingInAccountsAmount,
    delegatedVestingAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'vesting_all_amount': vestingAllAmount,
      'vesting_in_pools_amount': vestingInPoolsAmount,
      'vesting_in_accounts_amount': vestingInAccountsAmount,
      'delegated_vesting_amount': delegatedVestingAmount,
    };
  }

  factory QueryVestingsSummaryResponse.fromJson(Map<String, dynamic> json) {
    return QueryVestingsSummaryResponse(
      vestingAllAmount: json.valueAsString<String?>(
        'vesting_all_amount',
        acceptCamelCase: true,
      ),
      vestingInPoolsAmount: json.valueAsString<String?>(
        'vesting_in_pools_amount',
        acceptCamelCase: true,
      ),
      vestingInAccountsAmount: json.valueAsString<String?>(
        'vesting_in_accounts_amount',
        acceptCamelCase: true,
      ),
      delegatedVestingAmount: json.valueAsString<String?>(
        'delegated_vesting_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVestingsSummaryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVestingsSummaryResponse(
      vestingAllAmount: decode.getString<String?>(1),
      vestingInPoolsAmount: decode.getString<String?>(2),
      vestingInAccountsAmount: decode.getString<String?>(3),
      delegatedVestingAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryVestingsSummaryResponse;
}

/// this line is used by starport scaffolding # 3
class QueryGenesisVestingsSummaryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGenesisVestingsSummaryResponse> {
  const QueryGenesisVestingsSummaryRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/vesting/v1beta1/genesis_summary",
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

  factory QueryGenesisVestingsSummaryRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGenesisVestingsSummaryRequest();
  }

  factory QueryGenesisVestingsSummaryRequest.deserialize(List<int> bytes) {
    return QueryGenesisVestingsSummaryRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryGenesisVestingsSummaryRequest;
  @override
  QueryGenesisVestingsSummaryResponse onQueryResponse(List<int> bytes) {
    return QueryGenesisVestingsSummaryResponse.deserialize(bytes);
  }

  @override
  QueryGenesisVestingsSummaryResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGenesisVestingsSummaryResponse.fromJson(json);
  }
}

class QueryGenesisVestingsSummaryResponse extends CosmosProtoMessage {
  final String? vestingAllAmount;

  final String? vestingInPoolsAmount;

  final String? vestingInAccountsAmount;

  final String? delegatedVestingAmount;

  const QueryGenesisVestingsSummaryResponse({
    this.vestingAllAmount,
    this.vestingInPoolsAmount,
    this.vestingInAccountsAmount,
    this.delegatedVestingAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    vestingAllAmount,
    vestingInPoolsAmount,
    vestingInAccountsAmount,
    delegatedVestingAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'vesting_all_amount': vestingAllAmount,
      'vesting_in_pools_amount': vestingInPoolsAmount,
      'vesting_in_accounts_amount': vestingInAccountsAmount,
      'delegated_vesting_amount': delegatedVestingAmount,
    };
  }

  factory QueryGenesisVestingsSummaryResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGenesisVestingsSummaryResponse(
      vestingAllAmount: json.valueAsString<String?>(
        'vesting_all_amount',
        acceptCamelCase: true,
      ),
      vestingInPoolsAmount: json.valueAsString<String?>(
        'vesting_in_pools_amount',
        acceptCamelCase: true,
      ),
      vestingInAccountsAmount: json.valueAsString<String?>(
        'vesting_in_accounts_amount',
        acceptCamelCase: true,
      ),
      delegatedVestingAmount: json.valueAsString<String?>(
        'delegated_vesting_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGenesisVestingsSummaryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGenesisVestingsSummaryResponse(
      vestingAllAmount: decode.getString<String?>(1),
      vestingInPoolsAmount: decode.getString<String?>(2),
      vestingInAccountsAmount: decode.getString<String?>(3),
      delegatedVestingAmount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingQueryGenesisVestingsSummaryResponse;
}
