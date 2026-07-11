import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/ica_account.dart"
    as stride_stakeibc_ica_account;

/// Deprecated, this configuration is no longer needed since swaps
/// are executed off-chain via authz
///
/// Stores pool information needed to execute the swap along a trade route
class TradeConfig extends CosmosProtoMessage {
  /// Currently Osmosis is the only trade chain so this is an osmosis pool id
  final BigInt? poolId;

  /// Spot price in the pool to convert the reward denom to the host denom
  /// output_tokens = swap_price * input tokens
  /// This value may be slightly stale as it is updated by an ICQ
  final String? swapPrice;

  /// unix time in seconds that the price was last updated
  final BigInt? priceUpdateTimestamp;

  /// Threshold defining the percentage of tokens that could be lost in the trade
  /// This captures both the loss from slippage and from a stale price on stride
  /// 0.05 means the output from the trade can be no less than a 5% deviation
  /// from the current value
  final String? maxAllowedSwapLossRate;

  /// min and max set boundaries of reward denom on trade chain we will swap
  /// min also decides when reward token transfers are worth it (transfer fees)
  final String? minSwapAmount;

  final String? maxSwapAmount;

  const TradeConfig({
    this.poolId,
    this.swapPrice,
    this.priceUpdateTimestamp,
    this.maxAllowedSwapLossRate,
    this.minSwapAmount,
    this.maxSwapAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    poolId,
    swapPrice,
    priceUpdateTimestamp,
    maxAllowedSwapLossRate,
    minSwapAmount,
    maxSwapAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pool_id': poolId?.toString(),
      'swap_price': swapPrice,
      'price_update_timestamp': priceUpdateTimestamp?.toString(),
      'max_allowed_swap_loss_rate': maxAllowedSwapLossRate,
      'min_swap_amount': minSwapAmount,
      'max_swap_amount': maxSwapAmount,
    };
  }

  factory TradeConfig.fromJson(Map<String, dynamic> json) {
    return TradeConfig(
      poolId: json.valueAsBigInt<BigInt?>('pool_id', acceptCamelCase: true),
      swapPrice: json.valueAsString<String?>(
        'swap_price',
        acceptCamelCase: true,
      ),
      priceUpdateTimestamp: json.valueAsBigInt<BigInt?>(
        'price_update_timestamp',
        acceptCamelCase: true,
      ),
      maxAllowedSwapLossRate: json.valueAsString<String?>(
        'max_allowed_swap_loss_rate',
        acceptCamelCase: true,
      ),
      minSwapAmount: json.valueAsString<String?>(
        'min_swap_amount',
        acceptCamelCase: true,
      ),
      maxSwapAmount: json.valueAsString<String?>(
        'max_swap_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory TradeConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradeConfig(
      poolId: decode.getBigInt<BigInt?>(1),
      swapPrice: decode.getString<String?>(2),
      priceUpdateTimestamp: decode.getBigInt<BigInt?>(3),
      maxAllowedSwapLossRate: decode.getString<String?>(4),
      minSwapAmount: decode.getString<String?>(5),
      maxSwapAmount: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcTradeConfig;
}

/// TradeRoute represents a round trip including info on transfer and how to do
/// the swap. It makes the assumption that the reward token is always foreign to
/// the host so therefore the first two hops are to unwind the ibc denom enroute
/// to the trade chain and the last hop is the return so funds start/end in the
/// withdrawl ICA on hostZone
/// The structure is key'd on reward denom and host denom in their native forms
/// (i.e. reward_denom_on_reward_zone and host_denom_on_host_zone)
class TradeRoute extends CosmosProtoMessage {
  /// ibc denom for the reward on the host zone
  final String? rewardDenomOnHostZone;

  /// should be the native denom for the reward chain
  final String? rewardDenomOnRewardZone;

  /// ibc denom of the reward on the trade chain, input to the swap
  final String? rewardDenomOnTradeZone;

  /// ibc of the host denom on the trade chain, output from the swap
  final String? hostDenomOnTradeZone;

  /// should be the same as the native host denom on the host chain
  final String? hostDenomOnHostZone;

  /// ICAAccount on the host zone with the reward tokens
  /// This is the same as the host zone withdrawal ICA account
  final stride_stakeibc_ica_account.ICAAccount? hostAccount;

  /// ICAAccount on the reward zone that is acts as the intermediate
  /// receiver of the transfer from host zone to trade zone
  final stride_stakeibc_ica_account.ICAAccount? rewardAccount;

  /// ICAAccount responsible for executing the swap of reward
  /// tokens for host tokens
  final stride_stakeibc_ica_account.ICAAccount? tradeAccount;

  /// Channel responsible for the transfer of reward tokens from the host
  /// zone to the reward zone. This is the channel ID on the host zone side
  final String? hostToRewardChannelId;

  /// Channel responsible for the transfer of reward tokens from the reward
  /// zone to the trade zone. This is the channel ID on the reward zone side
  final String? rewardToTradeChannelId;

  /// Channel responsible for the transfer of host tokens from the trade
  /// zone, back to the host zone. This is the channel ID on the trade zone side
  final String? tradeToHostChannelId;

  /// Minimum amount of reward token that must be accumulated before
  /// the tokens are transferred to the trade ICA
  final String? minTransferAmount;

  /// Deprecated, the trades are now executed off-chain via authz
  /// so the trade configuration is no longer needed
  ///
  /// specifies the configuration needed to execute the swap
  /// such as pool_id, slippage, min trade amount, etc.
  final TradeConfig? tradeConfig;

  const TradeRoute({
    this.rewardDenomOnHostZone,
    this.rewardDenomOnRewardZone,
    this.rewardDenomOnTradeZone,
    this.hostDenomOnTradeZone,
    this.hostDenomOnHostZone,
    this.hostAccount,
    this.rewardAccount,
    this.tradeAccount,
    this.hostToRewardChannelId,
    this.rewardToTradeChannelId,
    this.tradeToHostChannelId,
    this.minTransferAmount,
    this.tradeConfig,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.message(
          12,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    rewardDenomOnHostZone,
    rewardDenomOnRewardZone,
    rewardDenomOnTradeZone,
    hostDenomOnTradeZone,
    hostDenomOnHostZone,
    hostAccount,
    rewardAccount,
    tradeAccount,
    hostToRewardChannelId,
    rewardToTradeChannelId,
    tradeToHostChannelId,
    minTransferAmount,
    tradeConfig,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'reward_denom_on_host_zone': rewardDenomOnHostZone,
      'reward_denom_on_reward_zone': rewardDenomOnRewardZone,
      'reward_denom_on_trade_zone': rewardDenomOnTradeZone,
      'host_denom_on_trade_zone': hostDenomOnTradeZone,
      'host_denom_on_host_zone': hostDenomOnHostZone,
      'host_account': hostAccount?.toJson(),
      'reward_account': rewardAccount?.toJson(),
      'trade_account': tradeAccount?.toJson(),
      'host_to_reward_channel_id': hostToRewardChannelId,
      'reward_to_trade_channel_id': rewardToTradeChannelId,
      'trade_to_host_channel_id': tradeToHostChannelId,
      'min_transfer_amount': minTransferAmount,
      'trade_config': tradeConfig?.toJson(),
    };
  }

  factory TradeRoute.fromJson(Map<String, dynamic> json) {
    return TradeRoute(
      rewardDenomOnHostZone: json.valueAsString<String?>(
        'reward_denom_on_host_zone',
        acceptCamelCase: true,
      ),
      rewardDenomOnRewardZone: json.valueAsString<String?>(
        'reward_denom_on_reward_zone',
        acceptCamelCase: true,
      ),
      rewardDenomOnTradeZone: json.valueAsString<String?>(
        'reward_denom_on_trade_zone',
        acceptCamelCase: true,
      ),
      hostDenomOnTradeZone: json.valueAsString<String?>(
        'host_denom_on_trade_zone',
        acceptCamelCase: true,
      ),
      hostDenomOnHostZone: json.valueAsString<String?>(
        'host_denom_on_host_zone',
        acceptCamelCase: true,
      ),
      hostAccount: json.valueTo<
        stride_stakeibc_ica_account.ICAAccount?,
        Map<String, dynamic>
      >(
        key: 'host_account',
        parse: (v) => stride_stakeibc_ica_account.ICAAccount.fromJson(v),
        acceptCamelCase: true,
      ),
      rewardAccount: json.valueTo<
        stride_stakeibc_ica_account.ICAAccount?,
        Map<String, dynamic>
      >(
        key: 'reward_account',
        parse: (v) => stride_stakeibc_ica_account.ICAAccount.fromJson(v),
        acceptCamelCase: true,
      ),
      tradeAccount: json.valueTo<
        stride_stakeibc_ica_account.ICAAccount?,
        Map<String, dynamic>
      >(
        key: 'trade_account',
        parse: (v) => stride_stakeibc_ica_account.ICAAccount.fromJson(v),
        acceptCamelCase: true,
      ),
      hostToRewardChannelId: json.valueAsString<String?>(
        'host_to_reward_channel_id',
        acceptCamelCase: true,
      ),
      rewardToTradeChannelId: json.valueAsString<String?>(
        'reward_to_trade_channel_id',
        acceptCamelCase: true,
      ),
      tradeToHostChannelId: json.valueAsString<String?>(
        'trade_to_host_channel_id',
        acceptCamelCase: true,
      ),
      minTransferAmount: json.valueAsString<String?>(
        'min_transfer_amount',
        acceptCamelCase: true,
      ),
      tradeConfig: json.valueTo<TradeConfig?, Map<String, dynamic>>(
        key: 'trade_config',
        parse: (v) => TradeConfig.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory TradeRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TradeRoute(
      rewardDenomOnHostZone: decode.getString<String?>(1),
      rewardDenomOnRewardZone: decode.getString<String?>(2),
      rewardDenomOnTradeZone: decode.getString<String?>(3),
      hostDenomOnTradeZone: decode.getString<String?>(4),
      hostDenomOnHostZone: decode.getString<String?>(5),
      hostAccount: decode.messageTo<stride_stakeibc_ica_account.ICAAccount?>(
        6,
        (b) => stride_stakeibc_ica_account.ICAAccount.deserialize(b),
      ),
      rewardAccount: decode.messageTo<stride_stakeibc_ica_account.ICAAccount?>(
        7,
        (b) => stride_stakeibc_ica_account.ICAAccount.deserialize(b),
      ),
      tradeAccount: decode.messageTo<stride_stakeibc_ica_account.ICAAccount?>(
        8,
        (b) => stride_stakeibc_ica_account.ICAAccount.deserialize(b),
      ),
      hostToRewardChannelId: decode.getString<String?>(9),
      rewardToTradeChannelId: decode.getString<String?>(10),
      tradeToHostChannelId: decode.getString<String?>(11),
      minTransferAmount: decode.getString<String?>(13),
      tradeConfig: decode.messageTo<TradeConfig?>(
        12,
        (b) => TradeConfig.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcTradeRoute;
}
