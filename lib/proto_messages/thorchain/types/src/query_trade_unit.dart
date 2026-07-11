import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryTradeUnitRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTradeUnitResponse> {
  final String? asset;

  final String? height;

  const QueryTradeUnitRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/trade/unit/{asset}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [asset, height];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'height': height};
  }

  factory QueryTradeUnitRequest.fromJson(Map<String, dynamic> json) {
    return QueryTradeUnitRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTradeUnitRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeUnitRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeUnitRequest;
  @override
  QueryTradeUnitResponse onQueryResponse(List<int> bytes) {
    return QueryTradeUnitResponse.deserialize(bytes);
  }

  @override
  QueryTradeUnitResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTradeUnitResponse.fromJson(json);
  }
}

class QueryTradeUnitResponse extends CosmosProtoMessage {
  /// trade account asset with \"~\" separator
  final String? asset;

  /// total units of trade asset
  final String? units;

  /// total depth of trade asset
  final String? depth;

  const QueryTradeUnitResponse({this.asset, this.units, this.depth});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asset, units, depth];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'units': units, 'depth': depth};
  }

  factory QueryTradeUnitResponse.fromJson(Map<String, dynamic> json) {
    return QueryTradeUnitResponse(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      units: json.valueAsString<String?>('units', acceptCamelCase: true),
      depth: json.valueAsString<String?>('depth', acceptCamelCase: true),
    );
  }

  factory QueryTradeUnitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeUnitResponse(
      asset: decode.getString<String?>(1),
      units: decode.getString<String?>(2),
      depth: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeUnitResponse;
}

class QueryTradeUnitsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTradeUnitsResponse> {
  final String? height;

  const QueryTradeUnitsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/trade/units",
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

  factory QueryTradeUnitsRequest.fromJson(Map<String, dynamic> json) {
    return QueryTradeUnitsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTradeUnitsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeUnitsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeUnitsRequest;
  @override
  QueryTradeUnitsResponse onQueryResponse(List<int> bytes) {
    return QueryTradeUnitsResponse.deserialize(bytes);
  }

  @override
  QueryTradeUnitsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTradeUnitsResponse.fromJson(json);
  }
}

class QueryTradeUnitsResponse extends CosmosProtoMessage {
  final List<QueryTradeUnitResponse> tradeUnits;

  const QueryTradeUnitsResponse({this.tradeUnits = const []});

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
  List<Object?> get protoValues => [tradeUnits];

  @override
  Map<String, dynamic> toJson() {
    return {'trade_units': tradeUnits.map((e) => e.toJson()).toList()};
  }

  factory QueryTradeUnitsResponse.fromJson(Map<String, dynamic> json) {
    return QueryTradeUnitsResponse(
      tradeUnits:
          (json.valueEnsureAsList<dynamic>(
                'trade_units',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryTradeUnitResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryTradeUnitResponse.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryTradeUnitsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTradeUnitsResponse(
      tradeUnits:
          decode
              .getListOfBytes(1)
              .map((b) => QueryTradeUnitResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTradeUnitsResponse;
}
