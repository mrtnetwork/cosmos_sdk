import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/insurance/v1beta1/src/insurance.dart"
    as injective_insurance_v1beta1_insurance;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/insurance/v1beta1/src/genesis.dart"
    as injective_insurance_v1beta1_genesis;
import "package:cosmos_sdk/proto_messages/injective/common/vouchers/v1/src/vouchers.dart"
    as injective_common_vouchers_v1_vouchers;

/// QueryInsuranceParamsRequest is the request type for the Query/InsuranceParams
/// RPC method.
class QueryInsuranceParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInsuranceParamsResponse> {
  const QueryInsuranceParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/params",
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

  factory QueryInsuranceParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryInsuranceParamsRequest();
  }

  factory QueryInsuranceParamsRequest.deserialize(List<int> bytes) {
    return QueryInsuranceParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryInsuranceParamsRequest;
  @override
  QueryInsuranceParamsResponse onQueryResponse(List<int> bytes) {
    return QueryInsuranceParamsResponse.deserialize(bytes);
  }

  @override
  QueryInsuranceParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInsuranceParamsResponse.fromJson(json);
  }
}

/// QueryInsuranceParamsRequest is the response type for the
/// Query/InsuranceParams RPC method.
class QueryInsuranceParamsResponse extends CosmosProtoMessage {
  final injective_insurance_v1beta1_insurance.Params? params;

  const QueryInsuranceParamsResponse({this.params});

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

  factory QueryInsuranceParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryInsuranceParamsResponse(
      params: json.valueTo<
        injective_insurance_v1beta1_insurance.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_insurance_v1beta1_insurance.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInsuranceParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInsuranceParamsResponse(
      params: decode.messageTo<injective_insurance_v1beta1_insurance.Params?>(
        1,
        (b) => injective_insurance_v1beta1_insurance.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryInsuranceParamsResponse;
}

/// QueryInsuranceFundRequest is the request type for the Query/InsuranceFunds
/// RPC method.
class QueryInsuranceFundRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInsuranceFundResponse> {
  /// Market ID for the market
  final String? marketId;

  const QueryInsuranceFundRequest({this.marketId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/insurance_fund/{market_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId];

  @override
  Map<String, dynamic> toJson() {
    return {'market_id': marketId};
  }

  factory QueryInsuranceFundRequest.fromJson(Map<String, dynamic> json) {
    return QueryInsuranceFundRequest(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
    );
  }

  factory QueryInsuranceFundRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInsuranceFundRequest(marketId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryInsuranceFundRequest;
  @override
  QueryInsuranceFundResponse onQueryResponse(List<int> bytes) {
    return QueryInsuranceFundResponse.deserialize(bytes);
  }

  @override
  QueryInsuranceFundResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInsuranceFundResponse.fromJson(json);
  }
}

/// QueryInsuranceFundResponse is the response type for the Query/InsuranceFund
/// RPC method.
class QueryInsuranceFundResponse extends CosmosProtoMessage {
  final injective_insurance_v1beta1_insurance.InsuranceFund? fund;

  const QueryInsuranceFundResponse({this.fund});

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
  List<Object?> get protoValues => [fund];

  @override
  Map<String, dynamic> toJson() {
    return {'fund': fund?.toJson()};
  }

  factory QueryInsuranceFundResponse.fromJson(Map<String, dynamic> json) {
    return QueryInsuranceFundResponse(
      fund: json.valueTo<
        injective_insurance_v1beta1_insurance.InsuranceFund?,
        Map<String, dynamic>
      >(
        key: 'fund',
        parse:
            (v) =>
                injective_insurance_v1beta1_insurance.InsuranceFund.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInsuranceFundResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInsuranceFundResponse(
      fund: decode
          .messageTo<injective_insurance_v1beta1_insurance.InsuranceFund?>(
            1,
            (b) => injective_insurance_v1beta1_insurance
                .InsuranceFund.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryInsuranceFundResponse;
}

/// QueryInsuranceFundsRequest is the request type for the Query/InsuranceFunds
/// RPC method.
class QueryInsuranceFundsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInsuranceFundsResponse> {
  const QueryInsuranceFundsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/insurance_funds",
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

  factory QueryInsuranceFundsRequest.fromJson(Map<String, dynamic> json) {
    return QueryInsuranceFundsRequest();
  }

  factory QueryInsuranceFundsRequest.deserialize(List<int> bytes) {
    return QueryInsuranceFundsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryInsuranceFundsRequest;
  @override
  QueryInsuranceFundsResponse onQueryResponse(List<int> bytes) {
    return QueryInsuranceFundsResponse.deserialize(bytes);
  }

  @override
  QueryInsuranceFundsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInsuranceFundsResponse.fromJson(json);
  }
}

/// QueryInsuranceFundsResponse is the response type for the Query/InsuranceFunds
/// RPC method.
class QueryInsuranceFundsResponse extends CosmosProtoMessage {
  final List<injective_insurance_v1beta1_insurance.InsuranceFund> funds;

  const QueryInsuranceFundsResponse({this.funds = const []});

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
  List<Object?> get protoValues => [funds];

  @override
  Map<String, dynamic> toJson() {
    return {'funds': funds.map((e) => e.toJson()).toList()};
  }

  factory QueryInsuranceFundsResponse.fromJson(Map<String, dynamic> json) {
    return QueryInsuranceFundsResponse(
      funds:
          (json.valueEnsureAsList<dynamic>('funds', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_insurance_v1beta1_insurance.InsuranceFund,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_insurance_v1beta1_insurance
                          .InsuranceFund.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryInsuranceFundsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInsuranceFundsResponse(
      funds:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_insurance_v1beta1_insurance
                    .InsuranceFund.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryInsuranceFundsResponse;
}

/// QueryEstimatedRedemptionsRequest is the request type for the
/// Query/EstimatedRedemptions RPC method.
class QueryEstimatedRedemptionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEstimatedRedemptionsResponse> {
  final String? marketId;

  final String? address;

  const QueryEstimatedRedemptionsRequest({this.marketId, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/estimated_redemptions",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, address];

  @override
  Map<String, dynamic> toJson() {
    return {'marketId': marketId, 'address': address};
  }

  factory QueryEstimatedRedemptionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryEstimatedRedemptionsRequest(
      marketId: json.valueAsString<String?>('marketId', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryEstimatedRedemptionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEstimatedRedemptionsRequest(
      marketId: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryEstimatedRedemptionsRequest;
  @override
  QueryEstimatedRedemptionsResponse onQueryResponse(List<int> bytes) {
    return QueryEstimatedRedemptionsResponse.deserialize(bytes);
  }

  @override
  QueryEstimatedRedemptionsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryEstimatedRedemptionsResponse.fromJson(json);
  }
}

/// QueryEstimatedRedemptionsResponse is the response type for the
/// Query/EstimatedRedemptions RPC method.
class QueryEstimatedRedemptionsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const QueryEstimatedRedemptionsResponse({this.amount = const []});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory QueryEstimatedRedemptionsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryEstimatedRedemptionsResponse(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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

  factory QueryEstimatedRedemptionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEstimatedRedemptionsResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryEstimatedRedemptionsResponse;
}

/// QueryPendingRedemptionsRequest is the request type for the
/// Query/PendingRedemptions RPC method.
class QueryPendingRedemptionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPendingRedemptionsResponse> {
  final String? marketId;

  final String? address;

  const QueryPendingRedemptionsRequest({this.marketId, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/pending_redemptions",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [marketId, address];

  @override
  Map<String, dynamic> toJson() {
    return {'marketId': marketId, 'address': address};
  }

  factory QueryPendingRedemptionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryPendingRedemptionsRequest(
      marketId: json.valueAsString<String?>('marketId', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryPendingRedemptionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPendingRedemptionsRequest(
      marketId: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryPendingRedemptionsRequest;
  @override
  QueryPendingRedemptionsResponse onQueryResponse(List<int> bytes) {
    return QueryPendingRedemptionsResponse.deserialize(bytes);
  }

  @override
  QueryPendingRedemptionsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryPendingRedemptionsResponse.fromJson(json);
  }
}

/// QueryPendingRedemptionsResponse is the response type for the
/// Query/PendingRedemptions RPC method.
class QueryPendingRedemptionsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const QueryPendingRedemptionsResponse({this.amount = const []});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory QueryPendingRedemptionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryPendingRedemptionsResponse(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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

  factory QueryPendingRedemptionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPendingRedemptionsResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryPendingRedemptionsResponse;
}

/// QueryModuleStateRequest is the request type for the
/// Query/InsuranceModuleState RPC method.
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
          path: "/injective/insurance/v1beta1/module_state",
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

  factory QueryModuleStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the
/// Query/InsuranceModuleState RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  final injective_insurance_v1beta1_genesis.GenesisState? state;

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
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryModuleStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse(
      state: json.valueTo<
        injective_insurance_v1beta1_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse:
            (v) => injective_insurance_v1beta1_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode
          .messageTo<injective_insurance_v1beta1_genesis.GenesisState?>(
            1,
            (b) =>
                injective_insurance_v1beta1_genesis.GenesisState.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryModuleStateResponse;
}

/// QueryFailedRedemptionsRequest is the request type for the
/// Query/FailedRedemptions RPC method.
class QueryFailedRedemptionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFailedRedemptionsResponse> {
  const QueryFailedRedemptionsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/failed_redemptions",
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

  factory QueryFailedRedemptionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryFailedRedemptionsRequest();
  }

  factory QueryFailedRedemptionsRequest.deserialize(List<int> bytes) {
    return QueryFailedRedemptionsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryFailedRedemptionsRequest;
  @override
  QueryFailedRedemptionsResponse onQueryResponse(List<int> bytes) {
    return QueryFailedRedemptionsResponse.deserialize(bytes);
  }

  @override
  QueryFailedRedemptionsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryFailedRedemptionsResponse.fromJson(json);
  }
}

/// QueryFailedRedemptionsResponse is the response type for the
/// Query/FailedRedemptions RPC method.
class QueryFailedRedemptionsResponse extends CosmosProtoMessage {
  final List<injective_insurance_v1beta1_insurance.FailedRedemptionSchedule>
  schedules;

  const QueryFailedRedemptionsResponse({this.schedules = const []});

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
  List<Object?> get protoValues => [schedules];

  @override
  Map<String, dynamic> toJson() {
    return {'schedules': schedules.map((e) => e.toJson()).toList()};
  }

  factory QueryFailedRedemptionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryFailedRedemptionsResponse(
      schedules:
          (json.valueEnsureAsList<dynamic>('schedules', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_insurance_v1beta1_insurance.FailedRedemptionSchedule,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_insurance_v1beta1_insurance
                          .FailedRedemptionSchedule.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryFailedRedemptionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFailedRedemptionsResponse(
      schedules:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_insurance_v1beta1_insurance
                    .FailedRedemptionSchedule.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1QueryFailedRedemptionsResponse;
}

class QueryVouchersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVouchersResponse> {
  /// denom filter; empty string returns all vouchers
  final String? denom;

  const QueryVouchersRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/vouchers",
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

  factory QueryVouchersRequest.fromJson(Map<String, dynamic> json) {
    return QueryVouchersRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryVouchersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVouchersRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1QueryVouchersRequest;
  @override
  QueryVouchersResponse onQueryResponse(List<int> bytes) {
    return QueryVouchersResponse.deserialize(bytes);
  }

  @override
  QueryVouchersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVouchersResponse.fromJson(json);
  }
}

class QueryVouchersResponse extends CosmosProtoMessage {
  /// List of outstanding vouchers matching the request filter.
  final List<injective_common_vouchers_v1_vouchers.AddressVoucher> vouchers;

  const QueryVouchersResponse({this.vouchers = const []});

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
  List<Object?> get protoValues => [vouchers];

  @override
  Map<String, dynamic> toJson() {
    return {'vouchers': vouchers.map((e) => e.toJson()).toList()};
  }

  factory QueryVouchersResponse.fromJson(Map<String, dynamic> json) {
    return QueryVouchersResponse(
      vouchers:
          (json.valueEnsureAsList<dynamic>('vouchers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_common_vouchers_v1_vouchers.AddressVoucher,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_common_vouchers_v1_vouchers
                          .AddressVoucher.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryVouchersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVouchersResponse(
      vouchers:
          decode
              .getListOfBytes(1)
              .map(
                (b) => injective_common_vouchers_v1_vouchers
                    .AddressVoucher.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1QueryVouchersResponse;
}

class QueryVoucherRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVoucherResponse> {
  /// Required. The token denom to look up.
  final String? denom;

  /// Required. The bech32 address of the voucher holder.
  final String? address;

  const QueryVoucherRequest({this.denom, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/insurance/v1beta1/voucher",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, address];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'address': address};
  }

  factory QueryVoucherRequest.fromJson(Map<String, dynamic> json) {
    return QueryVoucherRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryVoucherRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoucherRequest(
      denom: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1QueryVoucherRequest;
  @override
  QueryVoucherResponse onQueryResponse(List<int> bytes) {
    return QueryVoucherResponse.deserialize(bytes);
  }

  @override
  QueryVoucherResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVoucherResponse.fromJson(json);
  }
}

class QueryVoucherResponse extends CosmosProtoMessage {
  /// The outstanding voucher coin for the requested denom and address.
  final cosmos_base_v1beta1_coin.Coin? voucher;

  const QueryVoucherResponse({this.voucher});

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
  List<Object?> get protoValues => [voucher];

  @override
  Map<String, dynamic> toJson() {
    return {'voucher': voucher?.toJson()};
  }

  factory QueryVoucherResponse.fromJson(Map<String, dynamic> json) {
    return QueryVoucherResponse(
      voucher: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'voucher',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryVoucherResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoucherResponse(
      voucher: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1QueryVoucherResponse;
}
