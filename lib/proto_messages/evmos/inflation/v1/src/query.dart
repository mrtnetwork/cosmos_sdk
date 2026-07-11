import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/evmos/inflation/v1/src/genesis.dart"
    as evmos_inflation_v1_genesis;

/// QueryPeriodRequest is the request type for the Query/Period RPC method.
class QueryPeriodRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPeriodResponse> {
  const QueryPeriodRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/inflation/v1/period",
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

  factory QueryPeriodRequest.fromJson(Map<String, dynamic> json) {
    return QueryPeriodRequest();
  }

  factory QueryPeriodRequest.deserialize(List<int> bytes) {
    return QueryPeriodRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryPeriodRequest;
  @override
  QueryPeriodResponse onQueryResponse(List<int> bytes) {
    return QueryPeriodResponse.deserialize(bytes);
  }

  @override
  QueryPeriodResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPeriodResponse.fromJson(json);
  }
}

/// QueryPeriodResponse is the response type for the Query/Period RPC method.
class QueryPeriodResponse extends CosmosProtoMessage {
  /// period is the current minting per epoch provision value.
  final BigInt? period;

  const QueryPeriodResponse({this.period});

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
  List<Object?> get protoValues => [period];

  @override
  Map<String, dynamic> toJson() {
    return {'period': period?.toString()};
  }

  factory QueryPeriodResponse.fromJson(Map<String, dynamic> json) {
    return QueryPeriodResponse(
      period: json.valueAsBigInt<BigInt?>('period', acceptCamelCase: true),
    );
  }

  factory QueryPeriodResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPeriodResponse(period: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryPeriodResponse;
}

/// QueryEpochMintProvisionRequest is the request type for the
/// Query/EpochMintProvision RPC method.
class QueryEpochMintProvisionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochMintProvisionResponse> {
  const QueryEpochMintProvisionRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/inflation/v1/epoch_mint_provision",
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

  factory QueryEpochMintProvisionRequest.fromJson(Map<String, dynamic> json) {
    return QueryEpochMintProvisionRequest();
  }

  factory QueryEpochMintProvisionRequest.deserialize(List<int> bytes) {
    return QueryEpochMintProvisionRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryEpochMintProvisionRequest;
  @override
  QueryEpochMintProvisionResponse onQueryResponse(List<int> bytes) {
    return QueryEpochMintProvisionResponse.deserialize(bytes);
  }

  @override
  QueryEpochMintProvisionResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryEpochMintProvisionResponse.fromJson(json);
  }
}

/// QueryEpochMintProvisionResponse is the response type for the
/// Query/EpochMintProvision RPC method.
class QueryEpochMintProvisionResponse extends CosmosProtoMessage {
  /// epoch_mint_provision is the current minting per epoch provision value.
  final cosmos_base_v1beta1_coin.DecCoin? epochMintProvision;

  const QueryEpochMintProvisionResponse({this.epochMintProvision});

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
  List<Object?> get protoValues => [epochMintProvision];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch_mint_provision': epochMintProvision?.toJson()};
  }

  factory QueryEpochMintProvisionResponse.fromJson(Map<String, dynamic> json) {
    return QueryEpochMintProvisionResponse(
      epochMintProvision: json
          .valueTo<cosmos_base_v1beta1_coin.DecCoin?, Map<String, dynamic>>(
            key: 'epoch_mint_provision',
            parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryEpochMintProvisionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochMintProvisionResponse(
      epochMintProvision: decode.messageTo<cosmos_base_v1beta1_coin.DecCoin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryEpochMintProvisionResponse;
}

/// QuerySkippedEpochsRequest is the request type for the Query/SkippedEpochs RPC
/// method.
class QuerySkippedEpochsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySkippedEpochsResponse> {
  const QuerySkippedEpochsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/inflation/v1/skipped_epochs",
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

  factory QuerySkippedEpochsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySkippedEpochsRequest();
  }

  factory QuerySkippedEpochsRequest.deserialize(List<int> bytes) {
    return QuerySkippedEpochsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QuerySkippedEpochsRequest;
  @override
  QuerySkippedEpochsResponse onQueryResponse(List<int> bytes) {
    return QuerySkippedEpochsResponse.deserialize(bytes);
  }

  @override
  QuerySkippedEpochsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySkippedEpochsResponse.fromJson(json);
  }
}

/// QuerySkippedEpochsResponse is the response type for the Query/SkippedEpochs
/// RPC method.
class QuerySkippedEpochsResponse extends CosmosProtoMessage {
  /// skipped_epochs is the number of epochs that the inflation module has been disabled.
  final BigInt? skippedEpochs;

  const QuerySkippedEpochsResponse({this.skippedEpochs});

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
  List<Object?> get protoValues => [skippedEpochs];

  @override
  Map<String, dynamic> toJson() {
    return {'skipped_epochs': skippedEpochs?.toString()};
  }

  factory QuerySkippedEpochsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySkippedEpochsResponse(
      skippedEpochs: json.valueAsBigInt<BigInt?>(
        'skipped_epochs',
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySkippedEpochsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySkippedEpochsResponse(
      skippedEpochs: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QuerySkippedEpochsResponse;
}

/// QueryCirculatingSupplyRequest is the request type for the
/// Query/CirculatingSupply RPC method.
class QueryCirculatingSupplyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCirculatingSupplyResponse> {
  const QueryCirculatingSupplyRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/inflation/v1/circulating_supply",
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

  factory QueryCirculatingSupplyRequest.fromJson(Map<String, dynamic> json) {
    return QueryCirculatingSupplyRequest();
  }

  factory QueryCirculatingSupplyRequest.deserialize(List<int> bytes) {
    return QueryCirculatingSupplyRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryCirculatingSupplyRequest;
  @override
  QueryCirculatingSupplyResponse onQueryResponse(List<int> bytes) {
    return QueryCirculatingSupplyResponse.deserialize(bytes);
  }

  @override
  QueryCirculatingSupplyResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCirculatingSupplyResponse.fromJson(json);
  }
}

/// QueryCirculatingSupplyResponse is the response type for the
/// Query/CirculatingSupply RPC method.
class QueryCirculatingSupplyResponse extends CosmosProtoMessage {
  /// circulating_supply is the total amount of coins in circulation
  final cosmos_base_v1beta1_coin.DecCoin? circulatingSupply;

  const QueryCirculatingSupplyResponse({this.circulatingSupply});

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
  List<Object?> get protoValues => [circulatingSupply];

  @override
  Map<String, dynamic> toJson() {
    return {'circulating_supply': circulatingSupply?.toJson()};
  }

  factory QueryCirculatingSupplyResponse.fromJson(Map<String, dynamic> json) {
    return QueryCirculatingSupplyResponse(
      circulatingSupply: json
          .valueTo<cosmos_base_v1beta1_coin.DecCoin?, Map<String, dynamic>>(
            key: 'circulating_supply',
            parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryCirculatingSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCirculatingSupplyResponse(
      circulatingSupply: decode.messageTo<cosmos_base_v1beta1_coin.DecCoin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryCirculatingSupplyResponse;
}

/// QueryInflationRateRequest is the request type for the Query/InflationRate RPC
/// method.
class QueryInflationRateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInflationRateResponse> {
  const QueryInflationRateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/inflation/v1/inflation_rate",
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

  factory QueryInflationRateRequest.fromJson(Map<String, dynamic> json) {
    return QueryInflationRateRequest();
  }

  factory QueryInflationRateRequest.deserialize(List<int> bytes) {
    return QueryInflationRateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryInflationRateRequest;
  @override
  QueryInflationRateResponse onQueryResponse(List<int> bytes) {
    return QueryInflationRateResponse.deserialize(bytes);
  }

  @override
  QueryInflationRateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInflationRateResponse.fromJson(json);
  }
}

/// QueryInflationRateResponse is the response type for the Query/InflationRate
/// RPC method.
class QueryInflationRateResponse extends CosmosProtoMessage {
  /// inflation_rate by which the total supply increases within one period
  final String? inflationRate;

  const QueryInflationRateResponse({this.inflationRate});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [inflationRate];

  @override
  Map<String, dynamic> toJson() {
    return {'inflation_rate': inflationRate};
  }

  factory QueryInflationRateResponse.fromJson(Map<String, dynamic> json) {
    return QueryInflationRateResponse(
      inflationRate: json.valueAsString<String?>(
        'inflation_rate',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInflationRateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInflationRateResponse(
      inflationRate: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryInflationRateResponse;
}

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
          path: "/evmos/inflation/v1/params",
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
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryParamsRequest;
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
  final evmos_inflation_v1_genesis.Params? params;

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
          .valueTo<evmos_inflation_v1_genesis.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => evmos_inflation_v1_genesis.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<evmos_inflation_v1_genesis.Params?>(
        1,
        (b) => evmos_inflation_v1_genesis.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosInflationV1QueryParamsResponse;
}
