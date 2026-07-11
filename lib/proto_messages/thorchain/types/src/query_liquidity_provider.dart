import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryLiquidityProviderRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLiquidityProviderResponse> {
  final String? asset;

  final String? address;

  final String? height;

  const QueryLiquidityProviderRequest({this.asset, this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/pool/{asset}/liquidity_provider/{address}",
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
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'address': address, 'height': height};
  }

  factory QueryLiquidityProviderRequest.fromJson(Map<String, dynamic> json) {
    return QueryLiquidityProviderRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryLiquidityProviderRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLiquidityProviderRequest(
      asset: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      height: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLiquidityProviderRequest;
  @override
  QueryLiquidityProviderResponse onQueryResponse(List<int> bytes) {
    return QueryLiquidityProviderResponse.deserialize(bytes);
  }

  @override
  QueryLiquidityProviderResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLiquidityProviderResponse.fromJson(json);
  }
}

/// Can we replace this with LiquidityProvider proto? Check json fields...
class QueryLiquidityProviderResponse extends CosmosProtoMessage {
  final String? asset;

  final String? runeAddress;

  final String? assetAddress;

  final BigInt? lastAddHeight;

  final BigInt? lastWithdrawHeight;

  final String? units;

  final String? pendingRune;

  final String? pendingAsset;

  final String? pendingTxId;

  final String? runeDepositValue;

  final String? assetDepositValue;

  final String? runeRedeemValue;

  final String? assetRedeemValue;

  final String? luviDepositValue;

  final String? luviRedeemValue;

  final String? luviGrowthPct;

  const QueryLiquidityProviderResponse({
    this.asset,
    this.runeAddress,
    this.assetAddress,
    this.lastAddHeight,
    this.lastWithdrawHeight,
    this.units,
    this.pendingRune,
    this.pendingAsset,
    this.pendingTxId,
    this.runeDepositValue,
    this.assetDepositValue,
    this.runeRedeemValue,
    this.assetRedeemValue,
    this.luviDepositValue,
    this.luviRedeemValue,
    this.luviGrowthPct,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.string(14),
        ProtoFieldConfig.string(15),
        ProtoFieldConfig.string(16),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    asset,
    runeAddress,
    assetAddress,
    lastAddHeight,
    lastWithdrawHeight,
    units,
    pendingRune,
    pendingAsset,
    pendingTxId,
    runeDepositValue,
    assetDepositValue,
    runeRedeemValue,
    assetRedeemValue,
    luviDepositValue,
    luviRedeemValue,
    luviGrowthPct,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'rune_address': runeAddress,
      'asset_address': assetAddress,
      'last_add_height': lastAddHeight?.toString(),
      'last_withdraw_height': lastWithdrawHeight?.toString(),
      'units': units,
      'pending_rune': pendingRune,
      'pending_asset': pendingAsset,
      'pending_tx_id': pendingTxId,
      'rune_deposit_value': runeDepositValue,
      'asset_deposit_value': assetDepositValue,
      'rune_redeem_value': runeRedeemValue,
      'asset_redeem_value': assetRedeemValue,
      'luvi_deposit_value': luviDepositValue,
      'luvi_redeem_value': luviRedeemValue,
      'luvi_growth_pct': luviGrowthPct,
    };
  }

  factory QueryLiquidityProviderResponse.fromJson(Map<String, dynamic> json) {
    return QueryLiquidityProviderResponse(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      runeAddress: json.valueAsString<String?>(
        'rune_address',
        acceptCamelCase: true,
      ),
      assetAddress: json.valueAsString<String?>(
        'asset_address',
        acceptCamelCase: true,
      ),
      lastAddHeight: json.valueAsBigInt<BigInt?>(
        'last_add_height',
        acceptCamelCase: true,
      ),
      lastWithdrawHeight: json.valueAsBigInt<BigInt?>(
        'last_withdraw_height',
        acceptCamelCase: true,
      ),
      units: json.valueAsString<String?>('units', acceptCamelCase: true),
      pendingRune: json.valueAsString<String?>(
        'pending_rune',
        acceptCamelCase: true,
      ),
      pendingAsset: json.valueAsString<String?>(
        'pending_asset',
        acceptCamelCase: true,
      ),
      pendingTxId: json.valueAsString<String?>(
        'pending_tx_id',
        acceptCamelCase: true,
      ),
      runeDepositValue: json.valueAsString<String?>(
        'rune_deposit_value',
        acceptCamelCase: true,
      ),
      assetDepositValue: json.valueAsString<String?>(
        'asset_deposit_value',
        acceptCamelCase: true,
      ),
      runeRedeemValue: json.valueAsString<String?>(
        'rune_redeem_value',
        acceptCamelCase: true,
      ),
      assetRedeemValue: json.valueAsString<String?>(
        'asset_redeem_value',
        acceptCamelCase: true,
      ),
      luviDepositValue: json.valueAsString<String?>(
        'luvi_deposit_value',
        acceptCamelCase: true,
      ),
      luviRedeemValue: json.valueAsString<String?>(
        'luvi_redeem_value',
        acceptCamelCase: true,
      ),
      luviGrowthPct: json.valueAsString<String?>(
        'luvi_growth_pct',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryLiquidityProviderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLiquidityProviderResponse(
      asset: decode.getString<String?>(1),
      runeAddress: decode.getString<String?>(2),
      assetAddress: decode.getString<String?>(3),
      lastAddHeight: decode.getBigInt<BigInt?>(4),
      lastWithdrawHeight: decode.getBigInt<BigInt?>(5),
      units: decode.getString<String?>(6),
      pendingRune: decode.getString<String?>(7),
      pendingAsset: decode.getString<String?>(8),
      pendingTxId: decode.getString<String?>(9),
      runeDepositValue: decode.getString<String?>(10),
      assetDepositValue: decode.getString<String?>(11),
      runeRedeemValue: decode.getString<String?>(12),
      assetRedeemValue: decode.getString<String?>(13),
      luviDepositValue: decode.getString<String?>(14),
      luviRedeemValue: decode.getString<String?>(15),
      luviGrowthPct: decode.getString<String?>(16),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLiquidityProviderResponse;
}

class QueryLiquidityProvidersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLiquidityProvidersResponse> {
  final String? asset;

  final String? height;

  const QueryLiquidityProvidersRequest({this.asset, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/pool/{asset}/liquidity_providers",
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

  factory QueryLiquidityProvidersRequest.fromJson(Map<String, dynamic> json) {
    return QueryLiquidityProvidersRequest(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryLiquidityProvidersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLiquidityProvidersRequest(
      asset: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLiquidityProvidersRequest;
  @override
  QueryLiquidityProvidersResponse onQueryResponse(List<int> bytes) {
    return QueryLiquidityProvidersResponse.deserialize(bytes);
  }

  @override
  QueryLiquidityProvidersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLiquidityProvidersResponse.fromJson(json);
  }
}

class QueryLiquidityProvidersResponse extends CosmosProtoMessage {
  final List<QueryLiquidityProviderResponse> liquidityProviders;

  const QueryLiquidityProvidersResponse({this.liquidityProviders = const []});

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
  List<Object?> get protoValues => [liquidityProviders];

  @override
  Map<String, dynamic> toJson() {
    return {
      'liquidity_providers': liquidityProviders.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryLiquidityProvidersResponse.fromJson(Map<String, dynamic> json) {
    return QueryLiquidityProvidersResponse(
      liquidityProviders:
          (json.valueEnsureAsList<dynamic>(
                'liquidity_providers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryLiquidityProviderResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryLiquidityProviderResponse.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryLiquidityProvidersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLiquidityProvidersResponse(
      liquidityProviders:
          decode
              .getListOfBytes(1)
              .map((b) => QueryLiquidityProviderResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryLiquidityProvidersResponse;
}
