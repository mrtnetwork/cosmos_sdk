import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/bank.dart"
    as cosmos_bank_v1beta1_bank;

/// QueryBalanceRequest is the request type for the Query/Balance RPC method.
class QueryBalanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalanceResponse> {
  /// address is the address to query balances for.
  final String? address;

  /// denom is the coin denom to query balances for.
  final String? denom;

  const QueryBalanceRequest({this.address, this.denom});

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
          path: "/cosmos/bank/v1beta1/balances/{address}/by_denom",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'denom': denom};
  }

  factory QueryBalanceRequest.fromJson(Map<String, dynamic> json) {
    return QueryBalanceRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceRequest(
      address: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryBalanceRequest;
  @override
  QueryBalanceResponse onQueryResponse(List<int> bytes) {
    return QueryBalanceResponse.deserialize(bytes);
  }

  @override
  QueryBalanceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBalanceResponse.fromJson(json);
  }
}

/// QueryBalanceResponse is the response type for the Query/Balance RPC method.
class QueryBalanceResponse extends CosmosProtoMessage {
  /// balance is the balance of the coin.
  final cosmos_base_v1beta1_coin.Coin? balance;

  const QueryBalanceResponse({this.balance});

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
  List<Object?> get protoValues => [balance];

  @override
  Map<String, dynamic> toJson() {
    return {'balance': balance?.toJson()};
  }

  factory QueryBalanceResponse.fromJson(Map<String, dynamic> json) {
    return QueryBalanceResponse(
      balance: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'balance',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceResponse(
      balance: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryBalanceResponse;
}

/// QueryBalanceRequest is the request type for the Query/AllBalances RPC method.
class QueryAllBalancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllBalancesResponse> {
  /// address is the address to query balances for.
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  /// resolve_denom is the flag to resolve the denom into a human-readable form from the metadata.
  final bool? resolveDenom;

  const QueryAllBalancesRequest({
    this.address,
    this.pagination,
    this.resolveDenom,
  });

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
          path: "/cosmos/bank/v1beta1/balances/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.bool(
          3,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50.0",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, pagination, resolveDenom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'pagination': pagination?.toJson(),
      'resolve_denom': resolveDenom,
    };
  }

  factory QueryAllBalancesRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllBalancesRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
      resolveDenom: json.valueAsBool<bool?>(
        'resolve_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAllBalancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllBalancesRequest(
      address: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
      resolveDenom: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryAllBalancesRequest;
  @override
  QueryAllBalancesResponse onQueryResponse(List<int> bytes) {
    return QueryAllBalancesResponse.deserialize(bytes);
  }

  @override
  QueryAllBalancesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllBalancesResponse.fromJson(json);
  }
}

/// QueryAllBalancesResponse is the response type for the Query/AllBalances RPC
/// method.
class QueryAllBalancesResponse extends CosmosProtoMessage {
  /// balances is the balances of all the coins.
  final List<cosmos_base_v1beta1_coin.Coin> balances;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllBalancesResponse({this.balances = const [], this.pagination});

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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balances, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'balances': balances.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllBalancesResponse(
      balances:
          (json.valueEnsureAsList<dynamic>('balances', acceptCamelCase: true))
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

  factory QueryAllBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllBalancesResponse(
      balances:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryAllBalancesResponse;
}

/// QuerySpendableBalancesRequest defines the gRPC request structure for querying
/// an account's spendable balances.
class QuerySpendableBalancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpendableBalancesResponse> {
  /// address is the address to query spendable balances for.
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QuerySpendableBalancesRequest({this.address, this.pagination});

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
          path: "/cosmos/bank/v1beta1/spendable_balances/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'pagination': pagination?.toJson()};
  }

  factory QuerySpendableBalancesRequest.fromJson(Map<String, dynamic> json) {
    return QuerySpendableBalancesRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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

  factory QuerySpendableBalancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpendableBalancesRequest(
      address: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QuerySpendableBalancesRequest;
  @override
  QuerySpendableBalancesResponse onQueryResponse(List<int> bytes) {
    return QuerySpendableBalancesResponse.deserialize(bytes);
  }

  @override
  QuerySpendableBalancesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySpendableBalancesResponse.fromJson(json);
  }
}

/// QuerySpendableBalancesResponse defines the gRPC response structure for querying
/// an account's spendable balances.
class QuerySpendableBalancesResponse extends CosmosProtoMessage {
  /// balances is the spendable balances of all the coins.
  final List<cosmos_base_v1beta1_coin.Coin> balances;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QuerySpendableBalancesResponse({
    this.balances = const [],
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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balances, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'balances': balances.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QuerySpendableBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QuerySpendableBalancesResponse(
      balances:
          (json.valueEnsureAsList<dynamic>('balances', acceptCamelCase: true))
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

  factory QuerySpendableBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpendableBalancesResponse(
      balances:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QuerySpendableBalancesResponse;
}

/// QuerySpendableBalanceByDenomRequest defines the gRPC request structure for
/// querying an account's spendable balance for a specific denom.
class QuerySpendableBalanceByDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySpendableBalanceByDenomResponse> {
  /// address is the address to query balances for.
  final String? address;

  /// denom is the coin denom to query balances for.
  final String? denom;

  const QuerySpendableBalanceByDenomRequest({this.address, this.denom});

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
          path: "/cosmos/bank/v1beta1/spendable_balances/{address}/by_denom",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'denom': denom};
  }

  factory QuerySpendableBalanceByDenomRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySpendableBalanceByDenomRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QuerySpendableBalanceByDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpendableBalanceByDenomRequest(
      address: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBankV1beta1QuerySpendableBalanceByDenomRequest;
  @override
  QuerySpendableBalanceByDenomResponse onQueryResponse(List<int> bytes) {
    return QuerySpendableBalanceByDenomResponse.deserialize(bytes);
  }

  @override
  QuerySpendableBalanceByDenomResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySpendableBalanceByDenomResponse.fromJson(json);
  }
}

/// QuerySpendableBalanceByDenomResponse defines the gRPC response structure for
/// querying an account's spendable balance for a specific denom.
class QuerySpendableBalanceByDenomResponse extends CosmosProtoMessage {
  /// balance is the balance of the coin.
  final cosmos_base_v1beta1_coin.Coin? balance;

  const QuerySpendableBalanceByDenomResponse({this.balance});

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
  List<Object?> get protoValues => [balance];

  @override
  Map<String, dynamic> toJson() {
    return {'balance': balance?.toJson()};
  }

  factory QuerySpendableBalanceByDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuerySpendableBalanceByDenomResponse(
      balance: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'balance',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QuerySpendableBalanceByDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySpendableBalanceByDenomResponse(
      balance: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBankV1beta1QuerySpendableBalanceByDenomResponse;
}

/// QueryTotalSupplyRequest is the request type for the Query/TotalSupply RPC
/// method.
class QueryTotalSupplyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalSupplyResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryTotalSupplyRequest({this.pagination});

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
          path: "/cosmos/bank/v1beta1/supply",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryTotalSupplyRequest.fromJson(Map<String, dynamic> json) {
    return QueryTotalSupplyRequest(
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

  factory QueryTotalSupplyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalSupplyRequest(
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryTotalSupplyRequest;
  @override
  QueryTotalSupplyResponse onQueryResponse(List<int> bytes) {
    return QueryTotalSupplyResponse.deserialize(bytes);
  }

  @override
  QueryTotalSupplyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTotalSupplyResponse.fromJson(json);
  }
}

/// QueryTotalSupplyResponse is the response type for the Query/TotalSupply RPC
/// method
class QueryTotalSupplyResponse extends CosmosProtoMessage {
  /// supply is the supply of the coins
  final List<cosmos_base_v1beta1_coin.Coin> supply;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryTotalSupplyResponse({this.supply = const [], this.pagination});

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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.message(
          2,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [supply, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'supply': supply.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryTotalSupplyResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalSupplyResponse(
      supply:
          (json.valueEnsureAsList<dynamic>('supply', acceptCamelCase: true))
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

  factory QueryTotalSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalSupplyResponse(
      supply:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryTotalSupplyResponse;
}

/// QuerySupplyOfRequest is the request type for the Query/SupplyOf RPC method.
class QuerySupplyOfRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySupplyOfResponse> {
  /// denom is the coin denom to query balances for.
  final String? denom;

  const QuerySupplyOfRequest({this.denom});

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
          path: "/cosmos/bank/v1beta1/supply/by_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QuerySupplyOfRequest.fromJson(Map<String, dynamic> json) {
    return QuerySupplyOfRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QuerySupplyOfRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySupplyOfRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QuerySupplyOfRequest;
  @override
  QuerySupplyOfResponse onQueryResponse(List<int> bytes) {
    return QuerySupplyOfResponse.deserialize(bytes);
  }

  @override
  QuerySupplyOfResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySupplyOfResponse.fromJson(json);
  }
}

/// QuerySupplyOfResponse is the response type for the Query/SupplyOf RPC method.
class QuerySupplyOfResponse extends CosmosProtoMessage {
  /// amount is the supply of the coin.
  final cosmos_base_v1beta1_coin.Coin? amount;

  const QuerySupplyOfResponse({this.amount});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toJson()};
  }

  factory QuerySupplyOfResponse.fromJson(Map<String, dynamic> json) {
    return QuerySupplyOfResponse(
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QuerySupplyOfResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySupplyOfResponse(
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QuerySupplyOfResponse;
}

/// QueryParamsRequest defines the request type for querying x/bank parameters.
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
          path: "/cosmos/bank/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse defines the response type for querying x/bank parameters.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params provides the parameters of the bank module.
  final cosmos_bank_v1beta1_bank.Params? params;

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
          .valueTo<cosmos_bank_v1beta1_bank.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmos_bank_v1beta1_bank.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<cosmos_bank_v1beta1_bank.Params?>(
        1,
        (b) => cosmos_bank_v1beta1_bank.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryParamsResponse;
}

/// QueryDenomsMetadataRequest is the request type for the Query/DenomsMetadata RPC method.
class QueryDenomsMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomsMetadataResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDenomsMetadataRequest({this.pagination});

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
          path: "/cosmos/bank/v1beta1/denoms_metadata",
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

  factory QueryDenomsMetadataRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomsMetadataRequest(
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

  factory QueryDenomsMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomsMetadataRequest(
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomsMetadataRequest;
  @override
  QueryDenomsMetadataResponse onQueryResponse(List<int> bytes) {
    return QueryDenomsMetadataResponse.deserialize(bytes);
  }

  @override
  QueryDenomsMetadataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomsMetadataResponse.fromJson(json);
  }
}

/// QueryDenomsMetadataResponse is the response type for the Query/DenomsMetadata RPC
/// method.
class QueryDenomsMetadataResponse extends CosmosProtoMessage {
  /// metadata provides the client information for all the registered tokens.
  final List<cosmos_bank_v1beta1_bank.Metadata> metadatas;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDenomsMetadataResponse({
    this.metadatas = const [],
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
  List<Object?> get protoValues => [metadatas, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'metadatas': metadatas.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDenomsMetadataResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomsMetadataResponse(
      metadatas:
          (json.valueEnsureAsList<dynamic>('metadatas', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_bank_v1beta1_bank.Metadata,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_bank_v1beta1_bank.Metadata.fromJson(v),
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

  factory QueryDenomsMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomsMetadataResponse(
      metadatas:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_bank_v1beta1_bank.Metadata.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomsMetadataResponse;
}

/// QueryDenomMetadataRequest is the request type for the Query/DenomMetadata RPC method.
class QueryDenomMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomMetadataResponse> {
  /// denom is the coin denom to query the metadata for.
  final String? denom;

  const QueryDenomMetadataRequest({this.denom});

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
          path: "/cosmos/bank/v1beta1/denoms_metadata/{denom=**}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomMetadataRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomMetadataRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMetadataRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomMetadataRequest;
  @override
  QueryDenomMetadataResponse onQueryResponse(List<int> bytes) {
    return QueryDenomMetadataResponse.deserialize(bytes);
  }

  @override
  QueryDenomMetadataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomMetadataResponse.fromJson(json);
  }
}

/// QueryDenomMetadataResponse is the response type for the Query/DenomMetadata RPC
/// method.
class QueryDenomMetadataResponse extends CosmosProtoMessage {
  /// metadata describes and provides all the client information for the requested token.
  final cosmos_bank_v1beta1_bank.Metadata? metadata;

  const QueryDenomMetadataResponse({this.metadata});

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
  List<Object?> get protoValues => [metadata];

  @override
  Map<String, dynamic> toJson() {
    return {'metadata': metadata?.toJson()};
  }

  factory QueryDenomMetadataResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomMetadataResponse(
      metadata: json
          .valueTo<cosmos_bank_v1beta1_bank.Metadata?, Map<String, dynamic>>(
            key: 'metadata',
            parse: (v) => cosmos_bank_v1beta1_bank.Metadata.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryDenomMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMetadataResponse(
      metadata: decode.messageTo<cosmos_bank_v1beta1_bank.Metadata?>(
        1,
        (b) => cosmos_bank_v1beta1_bank.Metadata.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomMetadataResponse;
}

/// QueryDenomMetadataByQueryStringRequest is the request type for the Query/DenomMetadata RPC method.
/// Identical with QueryDenomMetadataRequest but receives denom as query string.
class QueryDenomMetadataByQueryStringRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomMetadataByQueryStringResponse> {
  /// denom is the coin denom to query the metadata for.
  final String? denom;

  const QueryDenomMetadataByQueryStringRequest({this.denom});

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
          path: "/cosmos/bank/v1beta1/denoms_metadata_by_query_string",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomMetadataByQueryStringRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomMetadataByQueryStringRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomMetadataByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMetadataByQueryStringRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBankV1beta1QueryDenomMetadataByQueryStringRequest;
  @override
  QueryDenomMetadataByQueryStringResponse onQueryResponse(List<int> bytes) {
    return QueryDenomMetadataByQueryStringResponse.deserialize(bytes);
  }

  @override
  QueryDenomMetadataByQueryStringResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomMetadataByQueryStringResponse.fromJson(json);
  }
}

/// QueryDenomMetadataByQueryStringResponse is the response type for the Query/DenomMetadata RPC
/// method. Identical with QueryDenomMetadataResponse but receives denom as query string in request.
class QueryDenomMetadataByQueryStringResponse extends CosmosProtoMessage {
  /// metadata describes and provides all the client information for the requested token.
  final cosmos_bank_v1beta1_bank.Metadata? metadata;

  const QueryDenomMetadataByQueryStringResponse({this.metadata});

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
  List<Object?> get protoValues => [metadata];

  @override
  Map<String, dynamic> toJson() {
    return {'metadata': metadata?.toJson()};
  }

  factory QueryDenomMetadataByQueryStringResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomMetadataByQueryStringResponse(
      metadata: json
          .valueTo<cosmos_bank_v1beta1_bank.Metadata?, Map<String, dynamic>>(
            key: 'metadata',
            parse: (v) => cosmos_bank_v1beta1_bank.Metadata.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryDenomMetadataByQueryStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomMetadataByQueryStringResponse(
      metadata: decode.messageTo<cosmos_bank_v1beta1_bank.Metadata?>(
        1,
        (b) => cosmos_bank_v1beta1_bank.Metadata.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBankV1beta1QueryDenomMetadataByQueryStringResponse;
}

/// QueryDenomOwnersRequest defines the request type for the DenomOwners RPC query,
/// which queries for a paginated set of all account holders of a particular
/// denomination.
class QueryDenomOwnersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomOwnersResponse> {
  /// denom defines the coin denomination to query all account holders for.
  final String? denom;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDenomOwnersRequest({this.denom, this.pagination});

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
          path: "/cosmos/bank/v1beta1/denom_owners/{denom=**}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'pagination': pagination?.toJson()};
  }

  factory QueryDenomOwnersRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomOwnersRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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

  factory QueryDenomOwnersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomOwnersRequest(
      denom: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomOwnersRequest;
  @override
  QueryDenomOwnersResponse onQueryResponse(List<int> bytes) {
    return QueryDenomOwnersResponse.deserialize(bytes);
  }

  @override
  QueryDenomOwnersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomOwnersResponse.fromJson(json);
  }
}

/// DenomOwner defines structure representing an account that owns or holds a
/// particular denominated token. It contains the account address and account
/// balance of the denominated token.
class DenomOwner extends CosmosProtoMessage {
  /// address defines the address that owns a particular denomination.
  final String? address;

  /// balance is the balance of the denominated coin for an account.
  final cosmos_base_v1beta1_coin.Coin? balance;

  const DenomOwner({this.address, this.balance});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, balance];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'balance': balance?.toJson()};
  }

  factory DenomOwner.fromJson(Map<String, dynamic> json) {
    return DenomOwner(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      balance: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'balance',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory DenomOwner.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomOwner(
      address: decode.getString<String?>(1),
      balance: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1DenomOwner;
}

/// QueryDenomOwnersResponse defines the RPC response of a DenomOwners RPC query.
class QueryDenomOwnersResponse extends CosmosProtoMessage {
  final List<DenomOwner> denomOwners;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDenomOwnersResponse({
    this.denomOwners = const [],
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
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denomOwners, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom_owners': denomOwners.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDenomOwnersResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomOwnersResponse(
      denomOwners:
          (json.valueEnsureAsList<dynamic>(
                'denom_owners',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<DenomOwner, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DenomOwner.fromJson(v),
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

  factory QueryDenomOwnersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomOwnersResponse(
      denomOwners:
          decode
              .getListOfBytes(1)
              .map((b) => DenomOwner.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomOwnersResponse;
}

/// QueryDenomOwnersByQueryRequest defines the request type for the DenomOwnersByQuery RPC query,
/// which queries for a paginated set of all account holders of a particular
/// denomination.
class QueryDenomOwnersByQueryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomOwnersByQueryResponse> {
  /// denom defines the coin denomination to query all account holders for.
  final String? denom;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDenomOwnersByQueryRequest({this.denom, this.pagination});

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
          path: "/cosmos/bank/v1beta1/denom_owners_by_query",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'pagination': pagination?.toJson()};
  }

  factory QueryDenomOwnersByQueryRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomOwnersByQueryRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
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

  factory QueryDenomOwnersByQueryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomOwnersByQueryRequest(
      denom: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QueryDenomOwnersByQueryRequest;
  @override
  QueryDenomOwnersByQueryResponse onQueryResponse(List<int> bytes) {
    return QueryDenomOwnersByQueryResponse.deserialize(bytes);
  }

  @override
  QueryDenomOwnersByQueryResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDenomOwnersByQueryResponse.fromJson(json);
  }
}

/// QueryDenomOwnersByQueryResponse defines the RPC response of a DenomOwnersByQuery RPC query.
class QueryDenomOwnersByQueryResponse extends CosmosProtoMessage {
  final List<DenomOwner> denomOwners;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDenomOwnersByQueryResponse({
    this.denomOwners = const [],
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
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denomOwners, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom_owners': denomOwners.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDenomOwnersByQueryResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomOwnersByQueryResponse(
      denomOwners:
          (json.valueEnsureAsList<dynamic>(
                'denom_owners',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<DenomOwner, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => DenomOwner.fromJson(v),
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

  factory QueryDenomOwnersByQueryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomOwnersByQueryResponse(
      denomOwners:
          decode
              .getListOfBytes(1)
              .map((b) => DenomOwner.deserialize(b))
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
          .cosmosBankV1beta1QueryDenomOwnersByQueryResponse;
}

/// QuerySendEnabledRequest defines the RPC request for looking up SendEnabled entries.
class QuerySendEnabledRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySendEnabledResponse> {
  /// denoms is the specific denoms you want look up. Leave empty to get all entries.
  final List<String> denoms;

  /// pagination defines an optional pagination for the request. This field is
  /// only read if the denoms field is empty.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QuerySendEnabledRequest({this.denoms = const [], this.pagination});

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
          path: "/cosmos/bank/v1beta1/send_enabled",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.message(99),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denoms, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denoms': denoms.map((e) => e).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QuerySendEnabledRequest.fromJson(Map<String, dynamic> json) {
    return QuerySendEnabledRequest(
      denoms:
          (json.valueEnsureAsList<dynamic>(
            'denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
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

  factory QuerySendEnabledRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySendEnabledRequest(
      denoms: decode.getListOrEmpty<String>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            99,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QuerySendEnabledRequest;
  @override
  QuerySendEnabledResponse onQueryResponse(List<int> bytes) {
    return QuerySendEnabledResponse.deserialize(bytes);
  }

  @override
  QuerySendEnabledResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySendEnabledResponse.fromJson(json);
  }
}

/// QuerySendEnabledResponse defines the RPC response of a SendEnable query.
class QuerySendEnabledResponse extends CosmosProtoMessage {
  final List<cosmos_bank_v1beta1_bank.SendEnabled> sendEnabled;

  /// pagination defines the pagination in the response. This field is only
  /// populated if the denoms field in the request is empty.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QuerySendEnabledResponse({
    this.sendEnabled = const [],
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
        ),
        ProtoFieldConfig.message(99),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sendEnabled, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'send_enabled': sendEnabled.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QuerySendEnabledResponse.fromJson(Map<String, dynamic> json) {
    return QuerySendEnabledResponse(
      sendEnabled:
          (json.valueEnsureAsList<dynamic>(
                'send_enabled',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_bank_v1beta1_bank.SendEnabled,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_bank_v1beta1_bank.SendEnabled.fromJson(v),
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

  factory QuerySendEnabledResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySendEnabledResponse(
      sendEnabled:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_bank_v1beta1_bank.SendEnabled.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        99,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1QuerySendEnabledResponse;
}
