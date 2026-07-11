import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryThornameRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryThornameResponse> {
  final String? name;

  final String? height;

  const QueryThornameRequest({this.name, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/thorname/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, height];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'height': height};
  }

  factory QueryThornameRequest.fromJson(Map<String, dynamic> json) {
    return QueryThornameRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryThornameRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryThornameRequest(
      name: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryThornameRequest;
  @override
  QueryThornameResponse onQueryResponse(List<int> bytes) {
    return QueryThornameResponse.deserialize(bytes);
  }

  @override
  QueryThornameResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryThornameResponse.fromJson(json);
  }
}

class QueryThornameResponse extends CosmosProtoMessage {
  final String? name;

  final BigInt? expireBlockHeight;

  final String? owner;

  final String? preferredAsset;

  /// Amount of RUNE currently needed to trigger a preferred asset swap.
  final String? preferredAssetSwapThresholdRune;

  /// Custom multiplier for the outbound fee threshold for affiliate fee payouts.
  final BigInt? preferredAssetOutboundFeeMultiplier;

  /// Amount of RUNE currently accrued by this thorname in affiliate fees waiting
  /// to be swapped to preferred asset.
  final String? affiliateCollectorRune;

  final List<ThornameAlias> aliases;

  const QueryThornameResponse({
    this.name,
    this.expireBlockHeight,
    this.owner,
    this.preferredAsset,
    this.preferredAssetSwapThresholdRune,
    this.preferredAssetOutboundFeeMultiplier,
    this.affiliateCollectorRune,
    this.aliases = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.int64(8),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    expireBlockHeight,
    owner,
    preferredAsset,
    preferredAssetSwapThresholdRune,
    preferredAssetOutboundFeeMultiplier,
    affiliateCollectorRune,
    aliases,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'expire_block_height': expireBlockHeight?.toString(),
      'owner': owner,
      'preferred_asset': preferredAsset,
      'preferred_asset_swap_threshold_rune': preferredAssetSwapThresholdRune,
      'preferred_asset_outbound_fee_multiplier':
          preferredAssetOutboundFeeMultiplier?.toString(),
      'affiliate_collector_rune': affiliateCollectorRune,
      'aliases': aliases.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryThornameResponse.fromJson(Map<String, dynamic> json) {
    return QueryThornameResponse(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      expireBlockHeight: json.valueAsBigInt<BigInt?>(
        'expire_block_height',
        acceptCamelCase: true,
      ),
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      preferredAsset: json.valueAsString<String?>(
        'preferred_asset',
        acceptCamelCase: true,
      ),
      preferredAssetSwapThresholdRune: json.valueAsString<String?>(
        'preferred_asset_swap_threshold_rune',
        acceptCamelCase: true,
      ),
      preferredAssetOutboundFeeMultiplier: json.valueAsBigInt<BigInt?>(
        'preferred_asset_outbound_fee_multiplier',
        acceptCamelCase: true,
      ),
      affiliateCollectorRune: json.valueAsString<String?>(
        'affiliate_collector_rune',
        acceptCamelCase: true,
      ),
      aliases:
          (json.valueEnsureAsList<dynamic>('aliases', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<ThornameAlias, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ThornameAlias.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryThornameResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryThornameResponse(
      name: decode.getString<String?>(1),
      expireBlockHeight: decode.getBigInt<BigInt?>(2),
      owner: decode.getString<String?>(3),
      preferredAsset: decode.getString<String?>(4),
      preferredAssetSwapThresholdRune: decode.getString<String?>(7),
      preferredAssetOutboundFeeMultiplier: decode.getBigInt<BigInt?>(8),
      affiliateCollectorRune: decode.getString<String?>(5),
      aliases:
          decode
              .getListOfBytes(6)
              .map((b) => ThornameAlias.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryThornameResponse;
}

class ThornameAlias extends CosmosProtoMessage {
  final String? chain;

  final String? address;

  const ThornameAlias({this.chain, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [chain, address];

  @override
  Map<String, dynamic> toJson() {
    return {'chain': chain, 'address': address};
  }

  factory ThornameAlias.fromJson(Map<String, dynamic> json) {
    return ThornameAlias(
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory ThornameAlias.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ThornameAlias(
      chain: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesThornameAlias;
}
