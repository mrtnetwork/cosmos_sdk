import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QuerySaverRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySaverResponse> {
  final String? asset;

  final String? address;

  final String? height;

  const QuerySaverRequest({this.asset, this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/pool/{asset}/saver/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asset, address, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'asset': asset, 'address': address, 'height': height};
  }

  factory QuerySaverRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySaverRequest(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySaverRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySaverRequest(
      asset: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      height: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySaverRequest;
  @override
  QuerySaverResponse onQueryResponse(List<int> bytes) {
    return QuerySaverResponse.deserialize(bytes);
  }

  @override
  QuerySaverResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySaverResponse.fromJson(json);
  }
}

class QuerySaverResponse extends CosmosProtoMessage {
  final String? asset;

  final String? assetAddress;

  final BigInt? lastAddHeight;

  final BigInt? lastWithdrawHeight;

  final String? units;

  final String? assetDepositValue;

  final String? assetRedeemValue;

  final String? growthPct;

  const QuerySaverResponse({
    this.asset,
    this.assetAddress,
    this.lastAddHeight,
    this.lastWithdrawHeight,
    this.units,
    this.assetDepositValue,
    this.assetRedeemValue,
    this.growthPct,
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
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    assetAddress,
    lastAddHeight,
    lastWithdrawHeight,
    units,
    assetDepositValue,
    assetRedeemValue,
    growthPct,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'asset': asset,
      'asset_address': assetAddress,
      'last_add_height': config.encodeBigint(lastAddHeight),
      'last_withdraw_height': config.encodeBigint(lastWithdrawHeight),
      'units': units,
      'asset_deposit_value': assetDepositValue,
      'asset_redeem_value': assetRedeemValue,
      'growth_pct': growthPct,
    };
  }

  factory QuerySaverResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySaverResponse(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      assetAddress: json.valueAsString<String?>(
        'asset_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastAddHeight: json.valueAsBigInt<BigInt?>(
        'last_add_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastWithdrawHeight: json.valueAsBigInt<BigInt?>(
        'last_withdraw_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      units: json.valueAsString<String?>(
        'units',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      assetDepositValue: json.valueAsString<String?>(
        'asset_deposit_value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      assetRedeemValue: json.valueAsString<String?>(
        'asset_redeem_value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      growthPct: json.valueAsString<String?>(
        'growth_pct',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySaverResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySaverResponse(
      asset: decode.getString<String?>(1),
      assetAddress: decode.getString<String?>(2),
      lastAddHeight: decode.getBigInt<BigInt?>(3),
      lastWithdrawHeight: decode.getBigInt<BigInt?>(4),
      units: decode.getString<String?>(5),
      assetDepositValue: decode.getString<String?>(6),
      assetRedeemValue: decode.getString<String?>(7),
      growthPct: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySaverResponse;
}

class QuerySaversRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySaversResponse> {
  final String? asset;

  final String? height;

  const QuerySaversRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/pool/{asset}/savers",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [asset, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'asset': asset, 'height': height};
  }

  factory QuerySaversRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySaversRequest(
      asset: json.valueAsString<String?>(
        'asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QuerySaversRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySaversRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySaversRequest;
  @override
  QuerySaversResponse onQueryResponse(List<int> bytes) {
    return QuerySaversResponse.deserialize(bytes);
  }

  @override
  QuerySaversResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySaversResponse.fromJson(json);
  }
}

class QuerySaversResponse extends CosmosProtoMessage {
  final List<QuerySaverResponse> savers;

  const QuerySaversResponse({this.savers = const []});

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
  List<Object?> get protoValues => [savers];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'savers': savers.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QuerySaversResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySaversResponse(
      savers:
          (json.valueEnsureAsList<dynamic>(
                'savers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QuerySaverResponse, Object>(
                  value: e,
                  parse:
                      (v) => QuerySaverResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySaversResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySaversResponse(
      savers:
          decode
              .getListOfBytes(1)
              .map((b) => QuerySaverResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySaversResponse;
}
