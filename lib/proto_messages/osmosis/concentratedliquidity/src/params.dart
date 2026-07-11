import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

class Params extends CosmosProtoMessage {
  /// authorized_tick_spacing is an array of uint64s that represents the tick
  /// spacing values concentrated-liquidity pools can be created with. For
  /// example, an authorized_tick_spacing of [1, 10, 30] allows for pools
  /// to be created with tick spacing of 1, 10, or 30.
  final List<BigInt> authorizedTickSpacing;

  final List<String> authorizedSpreadFactors;

  /// balancer_shares_reward_discount is the rate by which incentives flowing
  /// from CL to Balancer pools will be discounted to encourage LPs to migrate.
  /// e.g. a rate of 0.05 means Balancer LPs get 5% less incentives than full
  /// range CL LPs.
  /// This field can range from (0,1]. If set to 1, it indicates that all
  /// incentives stay at cl pool.
  final String? balancerSharesRewardDiscount;

  /// DEPRECATED: authorized_quote_denoms is a list of quote denoms that can be
  /// used as token1 when creating a pool. We limit the quote assets to a small
  /// set for the purposes of having convenient price increments stemming from
  /// tick to price conversion. These increments are in a human readable
  /// magnitude only for token1 as a quote. For limit orders in the future, this
  /// will be a desirable property in terms of UX as to allow users to set limit
  /// orders at prices in terms of token1 (quote asset) that are easy to reason
  /// about.
  final List<String> authorizedQuoteDenoms;

  final List<google_protobuf_duration.Duration> authorizedUptimes;

  /// is_permissionless_pool_creation_enabled is a boolean that determines if
  /// concentrated liquidity pools can be created via message. At launch,
  /// we consider allowing only governance to create pools, and then later
  /// allowing permissionless pool creation by switching this flag to true
  /// with a governance proposal.
  final bool? isPermissionlessPoolCreationEnabled;

  /// unrestricted_pool_creator_whitelist is a list of addresses that are
  /// allowed to bypass restrictions on permissionless supercharged pool
  /// creation, like pool_creation_enabled, restricted quote assets, no
  /// double creation of pools, etc.
  final List<String> unrestrictedPoolCreatorWhitelist;

  final BigInt? hookGasLimit;

  const Params({
    this.authorizedTickSpacing = const [],
    this.authorizedSpreadFactors = const [],
    this.balancerSharesRewardDiscount,
    this.authorizedQuoteDenoms = const [],
    this.authorizedUptimes = const [],
    this.isPermissionlessPoolCreationEnabled,
    this.unrestrictedPoolCreatorWhitelist = const [],
    this.hookGasLimit,
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
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bool(6, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.uint64(8, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authorizedTickSpacing,
    authorizedSpreadFactors,
    balancerSharesRewardDiscount,
    authorizedQuoteDenoms,
    authorizedUptimes,
    isPermissionlessPoolCreationEnabled,
    unrestrictedPoolCreatorWhitelist,
    hookGasLimit,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authorized_tick_spacing':
          authorizedTickSpacing.map((e) => e.toString()).toList(),
      'authorized_spread_factors':
          authorizedSpreadFactors.map((e) => e).toList(),
      'balancer_shares_reward_discount': balancerSharesRewardDiscount,
      'authorized_quote_denoms': authorizedQuoteDenoms.map((e) => e).toList(),
      'authorized_uptimes':
          authorizedUptimes.map((e) => e.encodeString(asNanos: true)).toList(),
      'is_permissionless_pool_creation_enabled':
          isPermissionlessPoolCreationEnabled,
      'unrestricted_pool_creator_whitelist':
          unrestrictedPoolCreatorWhitelist.map((e) => e).toList(),
      'hook_gas_limit': hookGasLimit?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      authorizedTickSpacing:
          (json.valueEnsureAsList<dynamic>(
            'authorized_tick_spacing',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      authorizedSpreadFactors:
          (json.valueEnsureAsList<dynamic>(
            'authorized_spread_factors',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      balancerSharesRewardDiscount: json.valueAsString<String?>(
        'balancer_shares_reward_discount',
        acceptCamelCase: true,
      ),
      authorizedQuoteDenoms:
          (json.valueEnsureAsList<dynamic>(
            'authorized_quote_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      authorizedUptimes:
          (json.valueEnsureAsList<dynamic>(
                'authorized_uptimes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_duration.Duration,
                  String
                >(
                  value: e,
                  parse: (v) => google_protobuf_duration.Duration.fromString(v),
                ),
              )
              .toList(),
      isPermissionlessPoolCreationEnabled: json.valueAsBool<bool?>(
        'is_permissionless_pool_creation_enabled',
        acceptCamelCase: true,
      ),
      unrestrictedPoolCreatorWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'unrestricted_pool_creator_whitelist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      hookGasLimit: json.valueAsBigInt<BigInt?>(
        'hook_gas_limit',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      authorizedTickSpacing: decode.getListOrEmpty<BigInt>(1),
      authorizedSpreadFactors: decode.getListOrEmpty<String>(2),
      balancerSharesRewardDiscount: decode.getString<String?>(3),
      authorizedQuoteDenoms: decode.getListOrEmpty<String>(4),
      authorizedUptimes:
          decode
              .getListOfBytes(5)
              .map((b) => google_protobuf_duration.Duration.deserialize(b))
              .toList(),
      isPermissionlessPoolCreationEnabled: decode.getBool<bool?>(6),
      unrestrictedPoolCreatorWhitelist: decode.getListOrEmpty<String>(7),
      hookGasLimit: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisConcentratedliquidityParams;
}
