import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/validator.dart"
    as stride_stakeibc_validator;

/// CommunityPoolRebate stores the size of the community pool liquid stake
/// (denominated in stTokens) and the rebate rate as a decimal
class CommunityPoolRebate extends CosmosProtoMessage {
  /// Rebate percentage as a decimal (e.g. 0.2 for 20%)
  final String? rebateRate;

  /// Number of stTokens received from the community pool liquid stake
  final String? liquidStakedStTokenAmount;

  const CommunityPoolRebate({this.rebateRate, this.liquidStakedStTokenAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rebateRate, liquidStakedStTokenAmount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rebate_rate': rebateRate,
      'liquid_staked_st_token_amount': liquidStakedStTokenAmount,
    };
  }

  factory CommunityPoolRebate.fromJson(Map<String, dynamic> json) {
    return CommunityPoolRebate(
      rebateRate: json.valueAsString<String?>(
        'rebate_rate',
        acceptCamelCase: true,
      ),
      liquidStakedStTokenAmount: json.valueAsString<String?>(
        'liquid_staked_st_token_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory CommunityPoolRebate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CommunityPoolRebate(
      rebateRate: decode.getString<String?>(1),
      liquidStakedStTokenAmount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcCommunityPoolRebate;
}

/// Core data structure to track liquid staking zones
class HostZone extends CosmosProtoMessage {
  /// Chain ID of the host zone
  final String? chainId;

  /// Bech32 prefix of host zone's address
  final String? bech32prefix;

  /// ConnectionID from Stride to the host zone (ID is on the stride side)
  final String? connectionId;

  /// Transfer Channel ID from Stride to the host zone (ID is on the stride side)
  final String? transferChannelId;

  /// ibc denom of the host zone's native token on stride
  final String? ibcDenom;

  /// native denom on host zone
  final String? hostDenom;

  /// The unbonding period in days (e.g. 21)
  final BigInt? unbondingPeriod;

  /// List of validators that are delegated to
  final List<stride_stakeibc_validator.Validator> validators;

  /// Address that custodies native tokens during a liquid stake
  final String? depositAddress;

  /// ICA Address on the host zone responsible for collecting rewards
  final String? withdrawalIcaAddress;

  /// ICA Address on the host zone responsible for commission
  final String? feeIcaAddress;

  /// ICA Address on the host zone responsible for staking and unstaking
  final String? delegationIcaAddress;

  /// ICA Address that receives unstaked tokens after they've finished unbonding
  final String? redemptionIcaAddress;

  /// ICA Address that receives tokens from a community pool to liquid stake or
  /// redeem In the case of a liquid stake, the community pool deposits native
  /// tokens In the case of a redemption, the community pool deposits stTokens
  final String? communityPoolDepositIcaAddress;

  /// ICA Address that distributes tokens back to the community pool during a
  /// community pool liquid stake or redeem In the case of a liquid stake, the
  /// return address sends back stTokens In the case of a redemption, the return
  /// address sends back native tokens
  final String? communityPoolReturnIcaAddress;

  /// Module account on Stride that receives native tokens from the deposit ICA
  /// and liquid stakes them
  final String? communityPoolStakeHoldingAddress;

  /// Module account on Stride that receives stTokens from the deposit ICA and
  /// redeems them
  final String? communityPoolRedeemHoldingAddress;

  /// Optional community pool address to send tokens to after a community pool
  /// liquid stake or redemption If this address is empty, the tokens are sent to
  /// the main community pool
  final String? communityPoolTreasuryAddress;

  /// The total delegated balance on the host zone
  final String? totalDelegations;

  /// The redemption rate from the previous epoch
  final String? lastRedemptionRate;

  /// The current redemption rate
  final String? redemptionRate;

  /// The min outer redemption rate bound - controlled only be governance
  /// The min inner bound cannot exceed this bound
  final String? minRedemptionRate;

  /// The max outer redemption rate bound - controlled only be governance
  /// The max inner bound cannot exceed this bound
  final String? maxRedemptionRate;

  /// The min minner redemption rate bound - controlled by the admin
  /// If the redemption rate exceeds this bound, the host zone is halted
  final String? minInnerRedemptionRate;

  /// The max minner redemption rate bound - controlled by the admin
  /// If the redemption rate exceeds this bound, the host zone is halted
  final String? maxInnerRedemptionRate;

  /// The max number of messages that can be sent in a delegation
  /// or undelegation ICA tx
  final BigInt? maxMessagesPerIcaTx;

  /// Indicates whether redemptions are allowed through this module
  final bool? redemptionsEnabled;

  /// An optional fee rebate
  /// If there is no rebate for the host zone, this will be nil
  final CommunityPoolRebate? communityPoolRebate;

  /// A boolean indicating whether the chain has LSM enabled
  final bool? lsmLiquidStakeEnabled;

  /// A boolean indicating whether the chain is currently halted
  /// A host zone is halted if redemption rate bounds are exceeded or it is
  /// deprecated
  final bool? halted;

  /// Indicates if the host zone is deprecated and should no longer handle liquid
  /// stakes. This is only used as documentation - it doesn't affect any
  /// functionality `Halted` is used to stop business logic
  final bool? deprecated;

  const HostZone({
    this.chainId,
    this.bech32prefix,
    this.connectionId,
    this.transferChannelId,
    this.ibcDenom,
    this.hostDenom,
    this.unbondingPeriod,
    this.validators = const [],
    this.depositAddress,
    this.withdrawalIcaAddress,
    this.feeIcaAddress,
    this.delegationIcaAddress,
    this.redemptionIcaAddress,
    this.communityPoolDepositIcaAddress,
    this.communityPoolReturnIcaAddress,
    this.communityPoolStakeHoldingAddress,
    this.communityPoolRedeemHoldingAddress,
    this.communityPoolTreasuryAddress,
    this.totalDelegations,
    this.lastRedemptionRate,
    this.redemptionRate,
    this.minRedemptionRate,
    this.maxRedemptionRate,
    this.minInnerRedemptionRate,
    this.maxInnerRedemptionRate,
    this.maxMessagesPerIcaTx,
    this.redemptionsEnabled,
    this.communityPoolRebate,
    this.lsmLiquidStakeEnabled,
    this.halted,
    this.deprecated,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(17),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.uint64(26),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(18, options: const []),
        ProtoFieldConfig.string(22, options: const []),
        ProtoFieldConfig.string(23, options: const []),
        ProtoFieldConfig.string(24, options: const []),
        ProtoFieldConfig.string(25, options: const []),
        ProtoFieldConfig.string(30, options: const []),
        ProtoFieldConfig.string(31, options: const []),
        ProtoFieldConfig.string(32, options: const []),
        ProtoFieldConfig.string(33, options: const []),
        ProtoFieldConfig.string(35, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(20, options: const []),
        ProtoFieldConfig.string(21, options: const []),
        ProtoFieldConfig.string(28, options: const []),
        ProtoFieldConfig.string(29, options: const []),
        ProtoFieldConfig.uint64(36),
        ProtoFieldConfig.bool(37),
        ProtoFieldConfig.message(34),
        ProtoFieldConfig.bool(27),
        ProtoFieldConfig.bool(19),
        ProtoFieldConfig.bool(38),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chainId,
    bech32prefix,
    connectionId,
    transferChannelId,
    ibcDenom,
    hostDenom,
    unbondingPeriod,
    validators,
    depositAddress,
    withdrawalIcaAddress,
    feeIcaAddress,
    delegationIcaAddress,
    redemptionIcaAddress,
    communityPoolDepositIcaAddress,
    communityPoolReturnIcaAddress,
    communityPoolStakeHoldingAddress,
    communityPoolRedeemHoldingAddress,
    communityPoolTreasuryAddress,
    totalDelegations,
    lastRedemptionRate,
    redemptionRate,
    minRedemptionRate,
    maxRedemptionRate,
    minInnerRedemptionRate,
    maxInnerRedemptionRate,
    maxMessagesPerIcaTx,
    redemptionsEnabled,
    communityPoolRebate,
    lsmLiquidStakeEnabled,
    halted,
    deprecated,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'bech32prefix': bech32prefix,
      'connection_id': connectionId,
      'transfer_channel_id': transferChannelId,
      'ibc_denom': ibcDenom,
      'host_denom': hostDenom,
      'unbonding_period': unbondingPeriod?.toString(),
      'validators': validators.map((e) => e.toJson()).toList(),
      'deposit_address': depositAddress,
      'withdrawal_ica_address': withdrawalIcaAddress,
      'fee_ica_address': feeIcaAddress,
      'delegation_ica_address': delegationIcaAddress,
      'redemption_ica_address': redemptionIcaAddress,
      'community_pool_deposit_ica_address': communityPoolDepositIcaAddress,
      'community_pool_return_ica_address': communityPoolReturnIcaAddress,
      'community_pool_stake_holding_address': communityPoolStakeHoldingAddress,
      'community_pool_redeem_holding_address':
          communityPoolRedeemHoldingAddress,
      'community_pool_treasury_address': communityPoolTreasuryAddress,
      'total_delegations': totalDelegations,
      'last_redemption_rate': lastRedemptionRate,
      'redemption_rate': redemptionRate,
      'min_redemption_rate': minRedemptionRate,
      'max_redemption_rate': maxRedemptionRate,
      'min_inner_redemption_rate': minInnerRedemptionRate,
      'max_inner_redemption_rate': maxInnerRedemptionRate,
      'max_messages_per_ica_tx': maxMessagesPerIcaTx?.toString(),
      'redemptions_enabled': redemptionsEnabled,
      'community_pool_rebate': communityPoolRebate?.toJson(),
      'lsm_liquid_stake_enabled': lsmLiquidStakeEnabled,
      'halted': halted,
      'deprecated': deprecated,
    };
  }

  factory HostZone.fromJson(Map<String, dynamic> json) {
    return HostZone(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      bech32prefix: json.valueAsString<String?>(
        'bech32prefix',
        acceptCamelCase: true,
      ),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      transferChannelId: json.valueAsString<String?>(
        'transfer_channel_id',
        acceptCamelCase: true,
      ),
      ibcDenom: json.valueAsString<String?>('ibc_denom', acceptCamelCase: true),
      hostDenom: json.valueAsString<String?>(
        'host_denom',
        acceptCamelCase: true,
      ),
      unbondingPeriod: json.valueAsBigInt<BigInt?>(
        'unbonding_period',
        acceptCamelCase: true,
      ),
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_validator.Validator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_stakeibc_validator.Validator.fromJson(v),
                ),
              )
              .toList(),
      depositAddress: json.valueAsString<String?>(
        'deposit_address',
        acceptCamelCase: true,
      ),
      withdrawalIcaAddress: json.valueAsString<String?>(
        'withdrawal_ica_address',
        acceptCamelCase: true,
      ),
      feeIcaAddress: json.valueAsString<String?>(
        'fee_ica_address',
        acceptCamelCase: true,
      ),
      delegationIcaAddress: json.valueAsString<String?>(
        'delegation_ica_address',
        acceptCamelCase: true,
      ),
      redemptionIcaAddress: json.valueAsString<String?>(
        'redemption_ica_address',
        acceptCamelCase: true,
      ),
      communityPoolDepositIcaAddress: json.valueAsString<String?>(
        'community_pool_deposit_ica_address',
        acceptCamelCase: true,
      ),
      communityPoolReturnIcaAddress: json.valueAsString<String?>(
        'community_pool_return_ica_address',
        acceptCamelCase: true,
      ),
      communityPoolStakeHoldingAddress: json.valueAsString<String?>(
        'community_pool_stake_holding_address',
        acceptCamelCase: true,
      ),
      communityPoolRedeemHoldingAddress: json.valueAsString<String?>(
        'community_pool_redeem_holding_address',
        acceptCamelCase: true,
      ),
      communityPoolTreasuryAddress: json.valueAsString<String?>(
        'community_pool_treasury_address',
        acceptCamelCase: true,
      ),
      totalDelegations: json.valueAsString<String?>(
        'total_delegations',
        acceptCamelCase: true,
      ),
      lastRedemptionRate: json.valueAsString<String?>(
        'last_redemption_rate',
        acceptCamelCase: true,
      ),
      redemptionRate: json.valueAsString<String?>(
        'redemption_rate',
        acceptCamelCase: true,
      ),
      minRedemptionRate: json.valueAsString<String?>(
        'min_redemption_rate',
        acceptCamelCase: true,
      ),
      maxRedemptionRate: json.valueAsString<String?>(
        'max_redemption_rate',
        acceptCamelCase: true,
      ),
      minInnerRedemptionRate: json.valueAsString<String?>(
        'min_inner_redemption_rate',
        acceptCamelCase: true,
      ),
      maxInnerRedemptionRate: json.valueAsString<String?>(
        'max_inner_redemption_rate',
        acceptCamelCase: true,
      ),
      maxMessagesPerIcaTx: json.valueAsBigInt<BigInt?>(
        'max_messages_per_ica_tx',
        acceptCamelCase: true,
      ),
      redemptionsEnabled: json.valueAsBool<bool?>(
        'redemptions_enabled',
        acceptCamelCase: true,
      ),
      communityPoolRebate: json
          .valueTo<CommunityPoolRebate?, Map<String, dynamic>>(
            key: 'community_pool_rebate',
            parse: (v) => CommunityPoolRebate.fromJson(v),
            acceptCamelCase: true,
          ),
      lsmLiquidStakeEnabled: json.valueAsBool<bool?>(
        'lsm_liquid_stake_enabled',
        acceptCamelCase: true,
      ),
      halted: json.valueAsBool<bool?>('halted', acceptCamelCase: true),
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
    );
  }

  factory HostZone.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return HostZone(
      chainId: decode.getString<String?>(1),
      bech32prefix: decode.getString<String?>(17),
      connectionId: decode.getString<String?>(2),
      transferChannelId: decode.getString<String?>(12),
      ibcDenom: decode.getString<String?>(8),
      hostDenom: decode.getString<String?>(9),
      unbondingPeriod: decode.getBigInt<BigInt?>(26),
      validators:
          decode
              .getListOfBytes(3)
              .map((b) => stride_stakeibc_validator.Validator.deserialize(b))
              .toList(),
      depositAddress: decode.getString<String?>(18),
      withdrawalIcaAddress: decode.getString<String?>(22),
      feeIcaAddress: decode.getString<String?>(23),
      delegationIcaAddress: decode.getString<String?>(24),
      redemptionIcaAddress: decode.getString<String?>(25),
      communityPoolDepositIcaAddress: decode.getString<String?>(30),
      communityPoolReturnIcaAddress: decode.getString<String?>(31),
      communityPoolStakeHoldingAddress: decode.getString<String?>(32),
      communityPoolRedeemHoldingAddress: decode.getString<String?>(33),
      communityPoolTreasuryAddress: decode.getString<String?>(35),
      totalDelegations: decode.getString<String?>(13),
      lastRedemptionRate: decode.getString<String?>(10),
      redemptionRate: decode.getString<String?>(11),
      minRedemptionRate: decode.getString<String?>(20),
      maxRedemptionRate: decode.getString<String?>(21),
      minInnerRedemptionRate: decode.getString<String?>(28),
      maxInnerRedemptionRate: decode.getString<String?>(29),
      maxMessagesPerIcaTx: decode.getBigInt<BigInt?>(36),
      redemptionsEnabled: decode.getBool<bool?>(37),
      communityPoolRebate: decode.messageTo<CommunityPoolRebate?>(
        34,
        (b) => CommunityPoolRebate.deserialize(b),
      ),
      lsmLiquidStakeEnabled: decode.getBool<bool?>(27),
      halted: decode.getBool<bool?>(19),
      deprecated: decode.getBool<bool?>(38),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcHostZone;
}
