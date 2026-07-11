import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/txfees/v1beta1/src/feetoken.dart"
    as osmosis_txfees_v1beta1_feetoken;

class QueryFeeTokensRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryFeeTokensResponse> {
  const QueryFeeTokensRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/txfees/v1beta1/fee_tokens",
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

  factory QueryFeeTokensRequest.fromJson(Map<String, dynamic> json) {
    return QueryFeeTokensRequest();
  }

  factory QueryFeeTokensRequest.deserialize(List<int> bytes) {
    return QueryFeeTokensRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryFeeTokensRequest;
  @override
  QueryFeeTokensResponse onQueryResponse(List<int> bytes) {
    return QueryFeeTokensResponse.deserialize(bytes);
  }

  @override
  QueryFeeTokensResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryFeeTokensResponse.fromJson(json);
  }
}

class QueryFeeTokensResponse extends CosmosProtoMessage {
  final List<osmosis_txfees_v1beta1_feetoken.FeeToken> feeTokens;

  const QueryFeeTokensResponse({this.feeTokens = const []});

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
  List<Object?> get protoValues => [feeTokens];

  @override
  Map<String, dynamic> toJson() {
    return {'fee_tokens': feeTokens.map((e) => e.toJson()).toList()};
  }

  factory QueryFeeTokensResponse.fromJson(Map<String, dynamic> json) {
    return QueryFeeTokensResponse(
      feeTokens:
          (json.valueEnsureAsList<dynamic>('fee_tokens', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_txfees_v1beta1_feetoken.FeeToken,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          osmosis_txfees_v1beta1_feetoken.FeeToken.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryFeeTokensResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryFeeTokensResponse(
      feeTokens:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_txfees_v1beta1_feetoken.FeeToken.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryFeeTokensResponse;
}

/// QueryDenomSpotPriceRequest defines grpc request structure for querying spot
/// price for the specified tx fee denom
class QueryDenomSpotPriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomSpotPriceResponse> {
  final String? denom;

  const QueryDenomSpotPriceRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/txfees/v1beta1/spot_price_by_denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomSpotPriceRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomSpotPriceRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomSpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomSpotPriceRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryDenomSpotPriceRequest;
  @override
  QueryDenomSpotPriceResponse onQueryResponse(List<int> bytes) {
    return QueryDenomSpotPriceResponse.deserialize(bytes);
  }

  @override
  QueryDenomSpotPriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomSpotPriceResponse.fromJson(json);
  }
}

/// QueryDenomSpotPriceRequest defines grpc response structure for querying spot
/// price for the specified tx fee denom
class QueryDenomSpotPriceResponse extends CosmosProtoMessage {
  final BigInt? poolID;

  final String? spotPrice;

  const QueryDenomSpotPriceResponse({this.poolID, this.spotPrice});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [poolID, spotPrice];

  @override
  Map<String, dynamic> toJson() {
    return {'poolID': poolID?.toString(), 'spot_price': spotPrice};
  }

  factory QueryDenomSpotPriceResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomSpotPriceResponse(
      poolID: json.valueAsBigInt<BigInt?>('poolID', acceptCamelCase: true),
      spotPrice: json.valueAsString<String?>(
        'spot_price',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDenomSpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomSpotPriceResponse(
      poolID: decode.getBigInt<BigInt?>(1),
      spotPrice: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryDenomSpotPriceResponse;
}

class QueryDenomPoolIdRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomPoolIdResponse> {
  final String? denom;

  const QueryDenomPoolIdRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/txfees/v1beta1/denom_pool_id/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomPoolIdRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomPoolIdRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomPoolIdRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomPoolIdRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryDenomPoolIdRequest;
  @override
  QueryDenomPoolIdResponse onQueryResponse(List<int> bytes) {
    return QueryDenomPoolIdResponse.deserialize(bytes);
  }

  @override
  QueryDenomPoolIdResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomPoolIdResponse.fromJson(json);
  }
}

class QueryDenomPoolIdResponse extends CosmosProtoMessage {
  final BigInt? poolID;

  const QueryDenomPoolIdResponse({this.poolID});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [poolID];

  @override
  Map<String, dynamic> toJson() {
    return {'poolID': poolID?.toString()};
  }

  factory QueryDenomPoolIdResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomPoolIdResponse(
      poolID: json.valueAsBigInt<BigInt?>('poolID', acceptCamelCase: true),
    );
  }

  factory QueryDenomPoolIdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomPoolIdResponse(poolID: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryDenomPoolIdResponse;
}

class QueryBaseDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBaseDenomResponse> {
  const QueryBaseDenomRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/txfees/v1beta1/base_denom",
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

  factory QueryBaseDenomRequest.fromJson(Map<String, dynamic> json) {
    return QueryBaseDenomRequest();
  }

  factory QueryBaseDenomRequest.deserialize(List<int> bytes) {
    return QueryBaseDenomRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryBaseDenomRequest;
  @override
  QueryBaseDenomResponse onQueryResponse(List<int> bytes) {
    return QueryBaseDenomResponse.deserialize(bytes);
  }

  @override
  QueryBaseDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBaseDenomResponse.fromJson(json);
  }
}

class QueryBaseDenomResponse extends CosmosProtoMessage {
  final String? baseDenom;

  const QueryBaseDenomResponse({this.baseDenom});

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
  List<Object?> get protoValues => [baseDenom];

  @override
  Map<String, dynamic> toJson() {
    return {'base_denom': baseDenom};
  }

  factory QueryBaseDenomResponse.fromJson(Map<String, dynamic> json) {
    return QueryBaseDenomResponse(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBaseDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBaseDenomResponse(baseDenom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryBaseDenomResponse;
}

class QueryEipBaseFeeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEipBaseFeeResponse> {
  const QueryEipBaseFeeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/txfees/v1beta1/cur_eip_base_fee",
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

  factory QueryEipBaseFeeRequest.fromJson(Map<String, dynamic> json) {
    return QueryEipBaseFeeRequest();
  }

  factory QueryEipBaseFeeRequest.deserialize(List<int> bytes) {
    return QueryEipBaseFeeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryEipBaseFeeRequest;
  @override
  QueryEipBaseFeeResponse onQueryResponse(List<int> bytes) {
    return QueryEipBaseFeeResponse.deserialize(bytes);
  }

  @override
  QueryEipBaseFeeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEipBaseFeeResponse.fromJson(json);
  }
}

class QueryEipBaseFeeResponse extends CosmosProtoMessage {
  final String? baseFee;

  const QueryEipBaseFeeResponse({this.baseFee});

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
  List<Object?> get protoValues => [baseFee];

  @override
  Map<String, dynamic> toJson() {
    return {'base_fee': baseFee};
  }

  factory QueryEipBaseFeeResponse.fromJson(Map<String, dynamic> json) {
    return QueryEipBaseFeeResponse(
      baseFee: json.valueAsString<String?>('base_fee', acceptCamelCase: true),
    );
  }

  factory QueryEipBaseFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEipBaseFeeResponse(baseFee: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1QueryEipBaseFeeResponse;
}
