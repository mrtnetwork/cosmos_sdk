import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_oracle_price.dart"
    as types_type_oracle_price;

/// query single price
class QueryOraclePriceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOraclePriceResponse> {
  final String? height;

  final String? symbol;

  const QueryOraclePriceRequest({this.height, this.symbol});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/oracle/price/{symbol}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, symbol];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'symbol': symbol};
  }

  factory QueryOraclePriceRequest.fromJson(Map<String, dynamic> json) {
    return QueryOraclePriceRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
    );
  }

  factory QueryOraclePriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePriceRequest(
      height: decode.getString<String?>(1),
      symbol: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOraclePriceRequest;
  @override
  QueryOraclePriceResponse onQueryResponse(List<int> bytes) {
    return QueryOraclePriceResponse.deserialize(bytes);
  }

  @override
  QueryOraclePriceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOraclePriceResponse.fromJson(json);
  }
}

class QueryOraclePriceResponse extends CosmosProtoMessage {
  final types_type_oracle_price.OraclePrice? price;

  const QueryOraclePriceResponse({this.price});

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
  List<Object?> get protoValues => [price];

  @override
  Map<String, dynamic> toJson() {
    return {'price': price?.toJson()};
  }

  factory QueryOraclePriceResponse.fromJson(Map<String, dynamic> json) {
    return QueryOraclePriceResponse(
      price: json
          .valueTo<types_type_oracle_price.OraclePrice?, Map<String, dynamic>>(
            key: 'price',
            parse: (v) => types_type_oracle_price.OraclePrice.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryOraclePriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePriceResponse(
      price: decode.messageTo<types_type_oracle_price.OraclePrice?>(
        1,
        (b) => types_type_oracle_price.OraclePrice.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOraclePriceResponse;
}

/// query all prices
class QueryOraclePricesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOraclePricesResponse> {
  final String? height;

  const QueryOraclePricesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/oracle/prices",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryOraclePricesRequest.fromJson(Map<String, dynamic> json) {
    return QueryOraclePricesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryOraclePricesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePricesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOraclePricesRequest;
  @override
  QueryOraclePricesResponse onQueryResponse(List<int> bytes) {
    return QueryOraclePricesResponse.deserialize(bytes);
  }

  @override
  QueryOraclePricesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOraclePricesResponse.fromJson(json);
  }
}

class QueryOraclePricesResponse extends CosmosProtoMessage {
  final List<types_type_oracle_price.OraclePrice> prices;

  const QueryOraclePricesResponse({this.prices = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [prices];

  @override
  Map<String, dynamic> toJson() {
    return {'prices': prices.map((e) => e.toJson()).toList()};
  }

  factory QueryOraclePricesResponse.fromJson(Map<String, dynamic> json) {
    return QueryOraclePricesResponse(
      prices:
          (json.valueEnsureAsList<dynamic>('prices', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_oracle_price.OraclePrice,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => types_type_oracle_price.OraclePrice.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryOraclePricesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOraclePricesResponse(
      prices:
          decode
              .getListOfBytes(1)
              .map((b) => types_type_oracle_price.OraclePrice.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOraclePricesResponse;
}
