import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/market.dart"
    as injective_exchange_v2_market;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/proposal.dart"
    as injective_exchange_v2_proposal;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/exchange.dart"
    as injective_exchange_v2_exchange;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/exchange/v2/src/order.dart"
    as injective_exchange_v2_order;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;

class MsgUpdateSpotMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateSpotMarketResponse>,
        ICosmosProtoAminoMessage {
  /// current admin address of the associated market
  final String? admin;

  /// id of the market to be updated
  final String? marketId;

  /// (optional) updated ticker value
  final String? newTicker;

  /// (optional) updated min price tick size value (in human readable format)
  final String? newMinPriceTickSize;

  /// (optional) updated min quantity tick size value (in human readable format)
  final String? newMinQuantityTickSize;

  /// (optional) updated min notional (in human readable format)
  final String? newMinNotional;

  const MsgUpdateSpotMarket({
    this.admin,
    this.marketId,
    this.newTicker,
    this.newMinPriceTickSize,
    this.newMinQuantityTickSize,
    this.newMinNotional,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgUpdateSpotMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    marketId,
    newTicker,
    newMinPriceTickSize,
    newMinQuantityTickSize,
    newMinNotional,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'market_id': marketId,
      'new_ticker': newTicker,
      'new_min_price_tick_size': newMinPriceTickSize,
      'new_min_quantity_tick_size': newMinQuantityTickSize,
      'new_min_notional': newMinNotional,
    };
  }

  factory MsgUpdateSpotMarket.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSpotMarket(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      newTicker: json.valueAsString<String?>(
        'new_ticker',
        acceptCamelCase: true,
      ),
      newMinPriceTickSize: json.valueAsString<String?>(
        'new_min_price_tick_size',
        acceptCamelCase: true,
      ),
      newMinQuantityTickSize: json.valueAsString<String?>(
        'new_min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      newMinNotional: json.valueAsString<String?>(
        'new_min_notional',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateSpotMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSpotMarket(
      admin: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      newTicker: decode.getString<String?>(3),
      newMinPriceTickSize: decode.getString<String?>(4),
      newMinQuantityTickSize: decode.getString<String?>(5),
      newMinNotional: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgUpdateSpotMarket;
  @override
  MsgUpdateSpotMarketResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateSpotMarketResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSpotMarketResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateSpotMarketResponse.fromJson(json);
  }
}

class MsgUpdateSpotMarketResponse extends CosmosProtoMessage {
  const MsgUpdateSpotMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateSpotMarketResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSpotMarketResponse();
  }

  factory MsgUpdateSpotMarketResponse.deserialize(List<int> bytes) {
    return MsgUpdateSpotMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgUpdateSpotMarketResponse;
}

class MsgUpdateDerivativeMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateDerivativeMarketResponse>,
        ICosmosProtoAminoMessage {
  /// current admin address of the associated market
  final String? admin;

  /// id of the market to be updated
  final String? marketId;

  /// (optional) updated value for ticker
  final String? newTicker;

  /// (optional) updated value for min_price_tick_size (in human readable format)
  final String? newMinPriceTickSize;

  /// (optional) updated value min_quantity_tick_size (in human readable format)
  final String? newMinQuantityTickSize;

  /// (optional) updated min notional (in human readable format)
  final String? newMinNotional;

  /// (optional) updated value for initial_margin_ratio
  final String? newInitialMarginRatio;

  /// (optional) updated value for maintenance_margin_ratio
  final String? newMaintenanceMarginRatio;

  /// (optional) updated value for reduce_margin_ratio
  final String? newReduceMarginRatio;

  /// (optional) updated value for open_notional_cap
  final injective_exchange_v2_market.OpenNotionalCap? newOpenNotionalCap;

  /// (optional) tri-state toggle for cross-margin eligibility. Direct message
  /// updates are exchange-admin-only and may set either ELIGIBLE or INELIGIBLE.
  /// UNSPECIFIED is a no-op (preserves current value).
  final injective_exchange_v2_proposal.CrossMarginEligibility?
  crossMarginEligibility;

  const MsgUpdateDerivativeMarket({
    this.admin,
    this.marketId,
    this.newTicker,
    this.newMinPriceTickSize,
    this.newMinQuantityTickSize,
    this.newMinNotional,
    this.newInitialMarginRatio,
    this.newMaintenanceMarginRatio,
    this.newReduceMarginRatio,
    this.newOpenNotionalCap,
    this.crossMarginEligibility,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgUpdateDerivativeMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.enumType(11),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    marketId,
    newTicker,
    newMinPriceTickSize,
    newMinQuantityTickSize,
    newMinNotional,
    newInitialMarginRatio,
    newMaintenanceMarginRatio,
    newReduceMarginRatio,
    newOpenNotionalCap,
    crossMarginEligibility,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'market_id': marketId,
      'new_ticker': newTicker,
      'new_min_price_tick_size': newMinPriceTickSize,
      'new_min_quantity_tick_size': newMinQuantityTickSize,
      'new_min_notional': newMinNotional,
      'new_initial_margin_ratio': newInitialMarginRatio,
      'new_maintenance_margin_ratio': newMaintenanceMarginRatio,
      'new_reduce_margin_ratio': newReduceMarginRatio,
      'new_open_notional_cap': newOpenNotionalCap?.toJson(),
      'cross_margin_eligibility': crossMarginEligibility?.protoName,
    };
  }

  factory MsgUpdateDerivativeMarket.fromJson(Map<String, dynamic> json) {
    return MsgUpdateDerivativeMarket(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      newTicker: json.valueAsString<String?>(
        'new_ticker',
        acceptCamelCase: true,
      ),
      newMinPriceTickSize: json.valueAsString<String?>(
        'new_min_price_tick_size',
        acceptCamelCase: true,
      ),
      newMinQuantityTickSize: json.valueAsString<String?>(
        'new_min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      newMinNotional: json.valueAsString<String?>(
        'new_min_notional',
        acceptCamelCase: true,
      ),
      newInitialMarginRatio: json.valueAsString<String?>(
        'new_initial_margin_ratio',
        acceptCamelCase: true,
      ),
      newMaintenanceMarginRatio: json.valueAsString<String?>(
        'new_maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
      newReduceMarginRatio: json.valueAsString<String?>(
        'new_reduce_margin_ratio',
        acceptCamelCase: true,
      ),
      newOpenNotionalCap: json.valueTo<
        injective_exchange_v2_market.OpenNotionalCap?,
        Map<String, dynamic>
      >(
        key: 'new_open_notional_cap',
        parse: (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
      crossMarginEligibility: json.valueTo<
        injective_exchange_v2_proposal.CrossMarginEligibility?,
        Object?
      >(
        key: 'cross_margin_eligibility',
        parse:
            (v) =>
                injective_exchange_v2_proposal.CrossMarginEligibility.from(v),
      ),
    );
  }

  factory MsgUpdateDerivativeMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateDerivativeMarket(
      admin: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      newTicker: decode.getString<String?>(3),
      newMinPriceTickSize: decode.getString<String?>(4),
      newMinQuantityTickSize: decode.getString<String?>(5),
      newMinNotional: decode.getString<String?>(6),
      newInitialMarginRatio: decode.getString<String?>(7),
      newMaintenanceMarginRatio: decode.getString<String?>(8),
      newReduceMarginRatio: decode.getString<String?>(9),
      newOpenNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            10,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      crossMarginEligibility: decode
          .getEnum<injective_exchange_v2_proposal.CrossMarginEligibility?>(
            11,
            injective_exchange_v2_proposal.CrossMarginEligibility.values,
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgUpdateDerivativeMarket;
  @override
  MsgUpdateDerivativeMarketResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateDerivativeMarketResponse.deserialize(bytes);
  }

  @override
  MsgUpdateDerivativeMarketResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateDerivativeMarketResponse.fromJson(json);
  }
}

class MsgUpdateDerivativeMarketResponse extends CosmosProtoMessage {
  const MsgUpdateDerivativeMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateDerivativeMarketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateDerivativeMarketResponse();
  }

  factory MsgUpdateDerivativeMarketResponse.deserialize(List<int> bytes) {
    return MsgUpdateDerivativeMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgUpdateDerivativeMarketResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the exchange parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_exchange_v2_exchange.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgUpdateParams",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<
        injective_exchange_v2_exchange.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_exchange_v2_exchange.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_exchange_v2_exchange.Params?>(
        2,
        (b) => injective_exchange_v2_exchange.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgUpdateParamsResponse;
}

/// MsgDeposit defines a SDK message for transferring coins from the sender's
/// bank balance into the subaccount's exchange deposits
class MsgDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// (Optional) the subaccount ID to deposit funds into. If empty, the coin
  /// will be deposited to the sender's default subaccount address.
  final String? subaccountId;

  /// the amount of the deposit (in chain format)
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgDeposit({this.sender, this.subaccountId, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "exchange/MsgDeposit"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgDeposit.fromJson(Map<String, dynamic> json) {
    return MsgDeposit(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeposit(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgDeposit;
  @override
  MsgDepositResponse onServiceResponse(List<int> bytes) {
    return MsgDepositResponse.deserialize(bytes);
  }

  @override
  MsgDepositResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDepositResponse.fromJson(json);
  }
}

/// MsgDepositResponse defines the Msg/Deposit response type.
class MsgDepositResponse extends CosmosProtoMessage {
  const MsgDepositResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDepositResponse.fromJson(Map<String, dynamic> json) {
    return MsgDepositResponse();
  }

  factory MsgDepositResponse.deserialize(List<int> bytes) {
    return MsgDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgDepositResponse;
}

/// MsgWithdraw defines a SDK message for withdrawing coins from a subaccount's
/// deposits to the user's bank balance
class MsgWithdraw extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID to withdraw funds from
  final String? subaccountId;

  /// the amount of the withdrawal (in chain format)
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgWithdraw({this.sender, this.subaccountId, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "exchange/MsgWithdraw"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgWithdraw.fromJson(Map<String, dynamic> json) {
    return MsgWithdraw(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgWithdraw.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdraw(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgWithdraw;
  @override
  MsgWithdrawResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgWithdrawResponse.fromJson(json);
  }
}

/// MsgWithdraw defines the Msg/Withdraw response type.
class MsgWithdrawResponse extends CosmosProtoMessage {
  const MsgWithdrawResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgWithdrawResponse.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawResponse();
  }

  factory MsgWithdrawResponse.deserialize(List<int> bytes) {
    return MsgWithdrawResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgWithdrawResponse;
}

/// MsgUpdateSubaccountRiskProfile defines a SDK message for updating a
/// subaccount's risk profile (e.g. opting into cross-margin).
class MsgUpdateSubaccountRiskProfile extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateSubaccountRiskProfileResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID to update the risk profile for
  final String? subaccountId;

  /// the requested risk profile (subject to eligibility & safety gates)
  final injective_exchange_v2_exchange.SubaccountRiskProfile? riskProfile;

  const MsgUpdateSubaccountRiskProfile({
    this.sender,
    this.subaccountId,
    this.riskProfile,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgUpdateSubaccountRiskProfile",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, riskProfile];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'risk_profile': riskProfile?.toJson(),
    };
  }

  factory MsgUpdateSubaccountRiskProfile.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSubaccountRiskProfile(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      riskProfile: json.valueTo<
        injective_exchange_v2_exchange.SubaccountRiskProfile?,
        Map<String, dynamic>
      >(
        key: 'risk_profile',
        parse:
            (v) => injective_exchange_v2_exchange
                .SubaccountRiskProfile.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateSubaccountRiskProfile.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSubaccountRiskProfile(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      riskProfile: decode
          .messageTo<injective_exchange_v2_exchange.SubaccountRiskProfile?>(
            3,
            (b) => injective_exchange_v2_exchange
                .SubaccountRiskProfile.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgUpdateSubaccountRiskProfile;
  @override
  MsgUpdateSubaccountRiskProfileResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateSubaccountRiskProfileResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSubaccountRiskProfileResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateSubaccountRiskProfileResponse.fromJson(json);
  }
}

/// MsgUpdateSubaccountRiskProfileResponse defines the
/// Msg/UpdateSubaccountRiskProfile response type.
class MsgUpdateSubaccountRiskProfileResponse extends CosmosProtoMessage {
  const MsgUpdateSubaccountRiskProfileResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateSubaccountRiskProfileResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateSubaccountRiskProfileResponse();
  }

  factory MsgUpdateSubaccountRiskProfileResponse.deserialize(List<int> bytes) {
    return MsgUpdateSubaccountRiskProfileResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgUpdateSubaccountRiskProfileResponse;
}

/// MsgCreateSpotLimitOrder defines a SDK message for creating a new spot limit
/// order.
class MsgCreateSpotLimitOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateSpotLimitOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the order details
  final injective_exchange_v2_order.SpotOrder? order;

  const MsgCreateSpotLimitOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateSpotLimitOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateSpotLimitOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotLimitOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.SpotOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.SpotOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateSpotLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotLimitOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.SpotOrder?>(
        2,
        (b) => injective_exchange_v2_order.SpotOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCreateSpotLimitOrder;
  @override
  MsgCreateSpotLimitOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateSpotLimitOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateSpotLimitOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateSpotLimitOrderResponse.fromJson(json);
  }
}

/// MsgCreateSpotLimitOrderResponse defines the Msg/CreateSpotOrder response
/// type.
class MsgCreateSpotLimitOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final String? cid;

  const MsgCreateSpotLimitOrderResponse({this.orderHash, this.cid});

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
  List<Object?> get protoValues => [orderHash, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'cid': cid};
  }

  factory MsgCreateSpotLimitOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotLimitOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateSpotLimitOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotLimitOrderResponse(
      orderHash: decode.getString<String?>(1),
      cid: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateSpotLimitOrderResponse;
}

/// MsgBatchCreateSpotLimitOrders defines a SDK message for creating a new batch
/// of spot limit orders.
class MsgBatchCreateSpotLimitOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCreateSpotLimitOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<injective_exchange_v2_order.SpotOrder> orders;

  const MsgBatchCreateSpotLimitOrders({this.sender, this.orders = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCreateSpotLimitOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, orders];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCreateSpotLimitOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchCreateSpotLimitOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.SpotOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order.SpotOrder.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCreateSpotLimitOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateSpotLimitOrders(
      sender: decode.getString<String?>(1),
      orders:
          decode
              .getListOfBytes(2)
              .map((b) => injective_exchange_v2_order.SpotOrder.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCreateSpotLimitOrders;
  @override
  MsgBatchCreateSpotLimitOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCreateSpotLimitOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCreateSpotLimitOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateSpotLimitOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCreateSpotLimitOrdersResponse defines the
/// Msg/BatchCreateSpotLimitOrders response type.
class MsgBatchCreateSpotLimitOrdersResponse extends CosmosProtoMessage {
  final List<String> orderHashes;

  final List<String> createdOrdersCids;

  final List<String> failedOrdersCids;

  const MsgBatchCreateSpotLimitOrdersResponse({
    this.orderHashes = const [],
    this.createdOrdersCids = const [],
    this.failedOrdersCids = const [],
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
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderHashes,
    createdOrdersCids,
    failedOrdersCids,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_hashes': orderHashes.map((e) => e).toList(),
      'created_orders_cids': createdOrdersCids.map((e) => e).toList(),
      'failed_orders_cids': failedOrdersCids.map((e) => e).toList(),
    };
  }

  factory MsgBatchCreateSpotLimitOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateSpotLimitOrdersResponse(
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBatchCreateSpotLimitOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateSpotLimitOrdersResponse(
      orderHashes: decode.getListOrEmpty<String>(1),
      createdOrdersCids: decode.getListOrEmpty<String>(2),
      failedOrdersCids: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCreateSpotLimitOrdersResponse;
}

/// MsgInstantSpotMarketLaunch defines a SDK message for creating a new spot
/// market by paying listing fee without governance
class MsgInstantSpotMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantSpotMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// Ticker for the spot market.
  final String? ticker;

  /// type of coin to use as the base currency
  final String? baseDenom;

  /// type of coin to use as the quote currency
  final String? quoteDenom;

  /// min_price_tick_size defines the minimum tick size of the order's price (in
  /// human readable format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity (in human readable format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in human readable format)
  final String? minNotional;

  /// base token decimals
  final int? baseDecimals;

  /// quote token decimals
  final int? quoteDecimals;

  const MsgInstantSpotMarketLaunch({
    this.sender,
    this.ticker,
    this.baseDenom,
    this.quoteDenom,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.baseDecimals,
    this.quoteDecimals,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgInstantSpotMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.uint32(8),
        ProtoFieldConfig.uint32(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    ticker,
    baseDenom,
    quoteDenom,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    baseDecimals,
    quoteDecimals,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'ticker': ticker,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'base_decimals': baseDecimals,
      'quote_decimals': quoteDecimals,
    };
  }

  factory MsgInstantSpotMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgInstantSpotMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      baseDecimals: json.valueAsInt<int?>(
        'base_decimals',
        acceptCamelCase: true,
      ),
      quoteDecimals: json.valueAsInt<int?>(
        'quote_decimals',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgInstantSpotMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantSpotMarketLaunch(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      baseDenom: decode.getString<String?>(3),
      quoteDenom: decode.getString<String?>(4),
      minPriceTickSize: decode.getString<String?>(5),
      minQuantityTickSize: decode.getString<String?>(6),
      minNotional: decode.getString<String?>(7),
      baseDecimals: decode.getInt<int?>(8),
      quoteDecimals: decode.getInt<int?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgInstantSpotMarketLaunch;
  @override
  MsgInstantSpotMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgInstantSpotMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgInstantSpotMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantSpotMarketLaunchResponse.fromJson(json);
  }
}

/// MsgInstantSpotMarketLaunchResponse defines the Msg/InstantSpotMarketLaunch
/// response type.
class MsgInstantSpotMarketLaunchResponse extends CosmosProtoMessage {
  const MsgInstantSpotMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgInstantSpotMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantSpotMarketLaunchResponse();
  }

  factory MsgInstantSpotMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgInstantSpotMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantSpotMarketLaunchResponse;
}

/// MsgInstantPerpetualMarketLaunch defines a SDK message for creating a new
/// perpetual futures market by paying listing fee without governance
class MsgInstantPerpetualMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantPerpetualMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// Ticker for the derivative market.
  final String? ticker;

  /// type of coin to use as the base currency
  final String? quoteDenom;

  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// maker_fee_rate defines the trade fee rate for makers on the perpetual
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the trade fee rate for takers on the perpetual
  /// market
  final String? takerFeeRate;

  /// initial_margin_ratio defines the initial margin ratio for the perpetual
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio for the
  /// perpetual market
  final String? maintenanceMarginRatio;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin (in human readable format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity (in human readable format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in human readable format)
  final String? minNotional;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the cap on the open notional
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  /// cross_margin_eligible marks the market as eligible for cross-margin
  final bool? crossMarginEligible;

  const MsgInstantPerpetualMarketLaunch({
    this.sender,
    this.ticker,
    this.quoteDenom,
    this.oracleBase,
    this.oracleQuote,
    this.oracleScaleFactor,
    this.oracleType,
    this.makerFeeRate,
    this.takerFeeRate,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.reduceMarginRatio,
    this.openNotionalCap,
    this.crossMarginEligible,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgInstantPerpetualMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.uint32(6),
        ProtoFieldConfig.enumType(7),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.message(16, options: const []),
        ProtoFieldConfig.bool(17),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    ticker,
    quoteDenom,
    oracleBase,
    oracleQuote,
    oracleScaleFactor,
    oracleType,
    makerFeeRate,
    takerFeeRate,
    initialMarginRatio,
    maintenanceMarginRatio,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    reduceMarginRatio,
    openNotionalCap,
    crossMarginEligible,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'ticker': ticker,
      'quote_denom': quoteDenom,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_scale_factor': oracleScaleFactor,
      'oracle_type': oracleType?.protoName,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': openNotionalCap?.toJson(),
      'cross_margin_eligible': crossMarginEligible,
    };
  }

  factory MsgInstantPerpetualMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgInstantPerpetualMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        acceptCamelCase: true,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        acceptCamelCase: true,
      ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        acceptCamelCase: true,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        acceptCamelCase: true,
      ),
      openNotionalCap: json.valueTo<
        injective_exchange_v2_market.OpenNotionalCap?,
        Map<String, dynamic>
      >(
        key: 'open_notional_cap',
        parse: (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
      crossMarginEligible: json.valueAsBool<bool?>(
        'cross_margin_eligible',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgInstantPerpetualMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantPerpetualMarketLaunch(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      oracleBase: decode.getString<String?>(4),
      oracleQuote: decode.getString<String?>(5),
      oracleScaleFactor: decode.getInt<int?>(6),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        7,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      makerFeeRate: decode.getString<String?>(8),
      takerFeeRate: decode.getString<String?>(9),
      initialMarginRatio: decode.getString<String?>(10),
      maintenanceMarginRatio: decode.getString<String?>(11),
      minPriceTickSize: decode.getString<String?>(12),
      minQuantityTickSize: decode.getString<String?>(13),
      minNotional: decode.getString<String?>(14),
      reduceMarginRatio: decode.getString<String?>(15),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            16,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      crossMarginEligible: decode.getBool<bool?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantPerpetualMarketLaunch;
  @override
  MsgInstantPerpetualMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgInstantPerpetualMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgInstantPerpetualMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantPerpetualMarketLaunchResponse.fromJson(json);
  }
}

/// MsgInstantPerpetualMarketLaunchResponse defines the
/// Msg/InstantPerpetualMarketLaunchResponse response type.
class MsgInstantPerpetualMarketLaunchResponse extends CosmosProtoMessage {
  const MsgInstantPerpetualMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgInstantPerpetualMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantPerpetualMarketLaunchResponse();
  }

  factory MsgInstantPerpetualMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgInstantPerpetualMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantPerpetualMarketLaunchResponse;
}

/// MsgInstantBinaryOptionsMarketLaunch defines a SDK message for creating a new
/// perpetual futures market by paying listing fee without governance
class MsgInstantBinaryOptionsMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantBinaryOptionsMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// Ticker for the derivative contract.
  final String? ticker;

  /// Oracle symbol
  final String? oracleSymbol;

  /// Oracle Provider
  final String? oracleProvider;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// maker_fee_rate defines the trade fee rate for makers on the perpetual
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the trade fee rate for takers on the perpetual
  /// market
  final String? takerFeeRate;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// admin of the market
  final String? admin;

  /// Address of the quote currency denomination for the binary options contract
  final String? quoteDenom;

  /// min_price_tick_size defines the minimum tick size that the price and margin
  /// required for orders in the market (in human readable format)
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the quantity
  /// required for orders in the market (in human readable format)
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market (in human readable format)
  final String? minNotional;

  /// open_notional_cap defines the cap on the open notional
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  const MsgInstantBinaryOptionsMarketLaunch({
    this.sender,
    this.ticker,
    this.oracleSymbol,
    this.oracleProvider,
    this.oracleType,
    this.oracleScaleFactor,
    this.makerFeeRate,
    this.takerFeeRate,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.admin,
    this.quoteDenom,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.openNotionalCap,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgInstantBinaryOptionsMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.enumType(5),
        ProtoFieldConfig.uint32(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.message(16, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    ticker,
    oracleSymbol,
    oracleProvider,
    oracleType,
    oracleScaleFactor,
    makerFeeRate,
    takerFeeRate,
    expirationTimestamp,
    settlementTimestamp,
    admin,
    quoteDenom,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    openNotionalCap,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'ticker': ticker,
      'oracle_symbol': oracleSymbol,
      'oracle_provider': oracleProvider,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'settlement_timestamp': settlementTimestamp?.toString(),
      'admin': admin,
      'quote_denom': quoteDenom,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'open_notional_cap': openNotionalCap?.toJson(),
    };
  }

  factory MsgInstantBinaryOptionsMarketLaunch.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantBinaryOptionsMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      oracleSymbol: json.valueAsString<String?>(
        'oracle_symbol',
        acceptCamelCase: true,
      ),
      oracleProvider: json.valueAsString<String?>(
        'oracle_provider',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        acceptCamelCase: true,
      ),
      settlementTimestamp: json.valueAsBigInt<BigInt?>(
        'settlement_timestamp',
        acceptCamelCase: true,
      ),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      openNotionalCap: json.valueTo<
        injective_exchange_v2_market.OpenNotionalCap?,
        Map<String, dynamic>
      >(
        key: 'open_notional_cap',
        parse: (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgInstantBinaryOptionsMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantBinaryOptionsMarketLaunch(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      oracleSymbol: decode.getString<String?>(3),
      oracleProvider: decode.getString<String?>(4),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        5,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(6),
      makerFeeRate: decode.getString<String?>(7),
      takerFeeRate: decode.getString<String?>(8),
      expirationTimestamp: decode.getBigInt<BigInt?>(9),
      settlementTimestamp: decode.getBigInt<BigInt?>(10),
      admin: decode.getString<String?>(11),
      quoteDenom: decode.getString<String?>(12),
      minPriceTickSize: decode.getString<String?>(13),
      minQuantityTickSize: decode.getString<String?>(14),
      minNotional: decode.getString<String?>(15),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            16,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantBinaryOptionsMarketLaunch;
  @override
  MsgInstantBinaryOptionsMarketLaunchResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgInstantBinaryOptionsMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse.fromJson(json);
  }
}

/// MsgInstantBinaryOptionsMarketLaunchResponse defines the
/// Msg/InstantBinaryOptionsMarketLaunchResponse response type.
class MsgInstantBinaryOptionsMarketLaunchResponse extends CosmosProtoMessage {
  const MsgInstantBinaryOptionsMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgInstantBinaryOptionsMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse();
  }

  factory MsgInstantBinaryOptionsMarketLaunchResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgInstantBinaryOptionsMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantBinaryOptionsMarketLaunchResponse;
}

/// MsgInstantExpiryFuturesMarketLaunch defines a SDK message for creating a new
/// expiry futures market by paying listing fee without governance
class MsgInstantExpiryFuturesMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInstantExpiryFuturesMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// Ticker for the derivative market.
  final String? ticker;

  /// type of coin to use as the quote currency
  final String? quoteDenom;

  /// Oracle base currency
  final String? oracleBase;

  /// Oracle quote currency
  final String? oracleQuote;

  /// Oracle type
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Scale factor for oracle prices.
  final int? oracleScaleFactor;

  /// Expiration time of the market
  final BigInt? expiry;

  /// maker_fee_rate defines the trade fee rate for makers on the expiry futures
  /// market
  final String? makerFeeRate;

  /// taker_fee_rate defines the trade fee rate for takers on the expiry futures
  /// market
  final String? takerFeeRate;

  /// initial_margin_ratio defines the initial margin ratio for the derivative
  /// market
  final String? initialMarginRatio;

  /// maintenance_margin_ratio defines the maintenance margin ratio for the
  /// derivative market
  final String? maintenanceMarginRatio;

  /// min_price_tick_size defines the minimum tick size of the order's price and
  /// margin
  final String? minPriceTickSize;

  /// min_quantity_tick_size defines the minimum tick size of the order's
  /// quantity
  final String? minQuantityTickSize;

  /// min_notional defines the minimum notional (in quote asset) required for
  /// orders in the market
  final String? minNotional;

  /// reduce_margin_ratio defines the ratio of the margin that is reduced
  final String? reduceMarginRatio;

  /// open_notional_cap defines the cap on the open notional
  final injective_exchange_v2_market.OpenNotionalCap? openNotionalCap;

  /// cross_margin_eligible marks the market as eligible for cross-margin
  final bool? crossMarginEligible;

  const MsgInstantExpiryFuturesMarketLaunch({
    this.sender,
    this.ticker,
    this.quoteDenom,
    this.oracleBase,
    this.oracleQuote,
    this.oracleType,
    this.oracleScaleFactor,
    this.expiry,
    this.makerFeeRate,
    this.takerFeeRate,
    this.initialMarginRatio,
    this.maintenanceMarginRatio,
    this.minPriceTickSize,
    this.minQuantityTickSize,
    this.minNotional,
    this.reduceMarginRatio,
    this.openNotionalCap,
    this.crossMarginEligible,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgInstantExpiryFuturesMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.enumType(6),
        ProtoFieldConfig.uint32(7),
        ProtoFieldConfig.int64(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.message(17, options: const []),
        ProtoFieldConfig.bool(18),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    ticker,
    quoteDenom,
    oracleBase,
    oracleQuote,
    oracleType,
    oracleScaleFactor,
    expiry,
    makerFeeRate,
    takerFeeRate,
    initialMarginRatio,
    maintenanceMarginRatio,
    minPriceTickSize,
    minQuantityTickSize,
    minNotional,
    reduceMarginRatio,
    openNotionalCap,
    crossMarginEligible,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'ticker': ticker,
      'quote_denom': quoteDenom,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_type': oracleType?.protoName,
      'oracle_scale_factor': oracleScaleFactor,
      'expiry': expiry?.toString(),
      'maker_fee_rate': makerFeeRate,
      'taker_fee_rate': takerFeeRate,
      'initial_margin_ratio': initialMarginRatio,
      'maintenance_margin_ratio': maintenanceMarginRatio,
      'min_price_tick_size': minPriceTickSize,
      'min_quantity_tick_size': minQuantityTickSize,
      'min_notional': minNotional,
      'reduce_margin_ratio': reduceMarginRatio,
      'open_notional_cap': openNotionalCap?.toJson(),
      'cross_margin_eligible': crossMarginEligible,
    };
  }

  factory MsgInstantExpiryFuturesMarketLaunch.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantExpiryFuturesMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      ticker: json.valueAsString<String?>('ticker', acceptCamelCase: true),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      oracleBase: json.valueAsString<String?>(
        'oracle_base',
        acceptCamelCase: true,
      ),
      oracleQuote: json.valueAsString<String?>(
        'oracle_quote',
        acceptCamelCase: true,
      ),
      oracleType: json
          .valueTo<injective_oracle_v1beta1_oracle.OracleType?, Object?>(
            key: 'oracle_type',
            parse: (v) => injective_oracle_v1beta1_oracle.OracleType.from(v),
          ),
      oracleScaleFactor: json.valueAsInt<int?>(
        'oracle_scale_factor',
        acceptCamelCase: true,
      ),
      expiry: json.valueAsBigInt<BigInt?>('expiry', acceptCamelCase: true),
      makerFeeRate: json.valueAsString<String?>(
        'maker_fee_rate',
        acceptCamelCase: true,
      ),
      takerFeeRate: json.valueAsString<String?>(
        'taker_fee_rate',
        acceptCamelCase: true,
      ),
      initialMarginRatio: json.valueAsString<String?>(
        'initial_margin_ratio',
        acceptCamelCase: true,
      ),
      maintenanceMarginRatio: json.valueAsString<String?>(
        'maintenance_margin_ratio',
        acceptCamelCase: true,
      ),
      minPriceTickSize: json.valueAsString<String?>(
        'min_price_tick_size',
        acceptCamelCase: true,
      ),
      minQuantityTickSize: json.valueAsString<String?>(
        'min_quantity_tick_size',
        acceptCamelCase: true,
      ),
      minNotional: json.valueAsString<String?>(
        'min_notional',
        acceptCamelCase: true,
      ),
      reduceMarginRatio: json.valueAsString<String?>(
        'reduce_margin_ratio',
        acceptCamelCase: true,
      ),
      openNotionalCap: json.valueTo<
        injective_exchange_v2_market.OpenNotionalCap?,
        Map<String, dynamic>
      >(
        key: 'open_notional_cap',
        parse: (v) => injective_exchange_v2_market.OpenNotionalCap.fromJson(v),
        acceptCamelCase: true,
      ),
      crossMarginEligible: json.valueAsBool<bool?>(
        'cross_margin_eligible',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgInstantExpiryFuturesMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInstantExpiryFuturesMarketLaunch(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      oracleBase: decode.getString<String?>(4),
      oracleQuote: decode.getString<String?>(5),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        6,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      oracleScaleFactor: decode.getInt<int?>(7),
      expiry: decode.getBigInt<BigInt?>(8),
      makerFeeRate: decode.getString<String?>(9),
      takerFeeRate: decode.getString<String?>(10),
      initialMarginRatio: decode.getString<String?>(11),
      maintenanceMarginRatio: decode.getString<String?>(12),
      minPriceTickSize: decode.getString<String?>(13),
      minQuantityTickSize: decode.getString<String?>(14),
      minNotional: decode.getString<String?>(15),
      reduceMarginRatio: decode.getString<String?>(16),
      openNotionalCap: decode
          .messageTo<injective_exchange_v2_market.OpenNotionalCap?>(
            17,
            (b) => injective_exchange_v2_market.OpenNotionalCap.deserialize(b),
          ),
      crossMarginEligible: decode.getBool<bool?>(18),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantExpiryFuturesMarketLaunch;
  @override
  MsgInstantExpiryFuturesMarketLaunchResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgInstantExpiryFuturesMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgInstantExpiryFuturesMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantExpiryFuturesMarketLaunchResponse.fromJson(json);
  }
}

/// MsgInstantExpiryFuturesMarketLaunchResponse defines the
/// Msg/InstantExpiryFuturesMarketLaunch response type.
class MsgInstantExpiryFuturesMarketLaunchResponse extends CosmosProtoMessage {
  const MsgInstantExpiryFuturesMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgInstantExpiryFuturesMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInstantExpiryFuturesMarketLaunchResponse();
  }

  factory MsgInstantExpiryFuturesMarketLaunchResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgInstantExpiryFuturesMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgInstantExpiryFuturesMarketLaunchResponse;
}

/// MsgCreateSpotMarketOrder defines a SDK message for creating a new spot market
/// order.
class MsgCreateSpotMarketOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateSpotMarketOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the order details
  final injective_exchange_v2_order.SpotOrder? order;

  const MsgCreateSpotMarketOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateSpotMarketOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateSpotMarketOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotMarketOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.SpotOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.SpotOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateSpotMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotMarketOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.SpotOrder?>(
        2,
        (b) => injective_exchange_v2_order.SpotOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCreateSpotMarketOrder;
  @override
  MsgCreateSpotMarketOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateSpotMarketOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateSpotMarketOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateSpotMarketOrderResponse.fromJson(json);
  }
}

/// MsgCreateSpotMarketOrderResponse defines the Msg/CreateSpotMarketLimitOrder
/// response type.
class MsgCreateSpotMarketOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final SpotMarketOrderResults? results;

  final String? cid;

  const MsgCreateSpotMarketOrderResponse({
    this.orderHash,
    this.results,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, results, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'results': results?.toJson(), 'cid': cid};
  }

  factory MsgCreateSpotMarketOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateSpotMarketOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      results: json.valueTo<SpotMarketOrderResults?, Map<String, dynamic>>(
        key: 'results',
        parse: (v) => SpotMarketOrderResults.fromJson(v),
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateSpotMarketOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateSpotMarketOrderResponse(
      orderHash: decode.getString<String?>(1),
      results: decode.messageTo<SpotMarketOrderResults?>(
        2,
        (b) => SpotMarketOrderResults.deserialize(b),
      ),
      cid: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateSpotMarketOrderResponse;
}

class SpotMarketOrderResults extends CosmosProtoMessage {
  final String? quantity;

  final String? price;

  final String? fee;

  const SpotMarketOrderResults({this.quantity, this.price, this.fee});

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
  List<Object?> get protoValues => [quantity, price, fee];

  @override
  Map<String, dynamic> toJson() {
    return {'quantity': quantity, 'price': price, 'fee': fee};
  }

  factory SpotMarketOrderResults.fromJson(Map<String, dynamic> json) {
    return SpotMarketOrderResults(
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      fee: json.valueAsString<String?>('fee', acceptCamelCase: true),
    );
  }

  factory SpotMarketOrderResults.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SpotMarketOrderResults(
      quantity: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
      fee: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2SpotMarketOrderResults;
}

/// A Cosmos-SDK MsgCreateDerivativeLimitOrder
class MsgCreateDerivativeLimitOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateDerivativeLimitOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the order details
  final injective_exchange_v2_order.DerivativeOrder? order;

  const MsgCreateDerivativeLimitOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateDerivativeLimitOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateDerivativeLimitOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateDerivativeLimitOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateDerivativeLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeLimitOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.DerivativeOrder?>(
        2,
        (b) => injective_exchange_v2_order.DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateDerivativeLimitOrder;
  @override
  MsgCreateDerivativeLimitOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateDerivativeLimitOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateDerivativeLimitOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeLimitOrderResponse.fromJson(json);
  }
}

/// MsgCreateDerivativeLimitOrderResponse defines the
/// Msg/CreateDerivativeMarketOrder response type.
class MsgCreateDerivativeLimitOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final String? cid;

  const MsgCreateDerivativeLimitOrderResponse({this.orderHash, this.cid});

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
  List<Object?> get protoValues => [orderHash, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'cid': cid};
  }

  factory MsgCreateDerivativeLimitOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeLimitOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateDerivativeLimitOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeLimitOrderResponse(
      orderHash: decode.getString<String?>(1),
      cid: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateDerivativeLimitOrderResponse;
}

/// A Cosmos-SDK MsgCreateBinaryOptionsLimitOrder
class MsgCreateBinaryOptionsLimitOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateBinaryOptionsLimitOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the order details
  final injective_exchange_v2_order.DerivativeOrder? order;

  const MsgCreateBinaryOptionsLimitOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateBinaryOptionsLimitOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateBinaryOptionsLimitOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateBinaryOptionsLimitOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateBinaryOptionsLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsLimitOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.DerivativeOrder?>(
        2,
        (b) => injective_exchange_v2_order.DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateBinaryOptionsLimitOrder;
  @override
  MsgCreateBinaryOptionsLimitOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateBinaryOptionsLimitOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateBinaryOptionsLimitOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsLimitOrderResponse.fromJson(json);
  }
}

/// MsgCreateBinaryOptionsLimitOrderResponse defines the
/// Msg/CreateBinaryOptionsLimitOrder response type.
class MsgCreateBinaryOptionsLimitOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final String? cid;

  const MsgCreateBinaryOptionsLimitOrderResponse({this.orderHash, this.cid});

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
  List<Object?> get protoValues => [orderHash, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'cid': cid};
  }

  factory MsgCreateBinaryOptionsLimitOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsLimitOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateBinaryOptionsLimitOrderResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsLimitOrderResponse(
      orderHash: decode.getString<String?>(1),
      cid: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateBinaryOptionsLimitOrderResponse;
}

/// A Cosmos-SDK MsgBatchCreateDerivativeLimitOrders
class MsgBatchCreateDerivativeLimitOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCreateDerivativeLimitOrdersResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the orders to create
  final List<injective_exchange_v2_order.DerivativeOrder> orders;

  const MsgBatchCreateDerivativeLimitOrders({
    this.sender,
    this.orders = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCreateDerivativeLimitOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, orders];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'orders': orders.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCreateDerivativeLimitOrders.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateDerivativeLimitOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      orders:
          (json.valueEnsureAsList<dynamic>('orders', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCreateDerivativeLimitOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateDerivativeLimitOrders(
      sender: decode.getString<String?>(1),
      orders:
          decode
              .getListOfBytes(2)
              .map(
                (b) =>
                    injective_exchange_v2_order.DerivativeOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCreateDerivativeLimitOrders;
  @override
  MsgBatchCreateDerivativeLimitOrdersResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgBatchCreateDerivativeLimitOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCreateDerivativeLimitOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateDerivativeLimitOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCreateDerivativeLimitOrdersResponse defines the
/// Msg/BatchCreateDerivativeLimitOrders response type.
class MsgBatchCreateDerivativeLimitOrdersResponse extends CosmosProtoMessage {
  final List<String> orderHashes;

  final List<String> createdOrdersCids;

  final List<String> failedOrdersCids;

  const MsgBatchCreateDerivativeLimitOrdersResponse({
    this.orderHashes = const [],
    this.createdOrdersCids = const [],
    this.failedOrdersCids = const [],
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
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    orderHashes,
    createdOrdersCids,
    failedOrdersCids,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_hashes': orderHashes.map((e) => e).toList(),
      'created_orders_cids': createdOrdersCids.map((e) => e).toList(),
      'failed_orders_cids': failedOrdersCids.map((e) => e).toList(),
    };
  }

  factory MsgBatchCreateDerivativeLimitOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCreateDerivativeLimitOrdersResponse(
      orderHashes:
          (json.valueEnsureAsList<dynamic>(
            'order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBatchCreateDerivativeLimitOrdersResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCreateDerivativeLimitOrdersResponse(
      orderHashes: decode.getListOrEmpty<String>(1),
      createdOrdersCids: decode.getListOrEmpty<String>(2),
      failedOrdersCids: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCreateDerivativeLimitOrdersResponse;
}

/// MsgCancelSpotOrder defines the Msg/CancelSpotOrder response type.
class MsgCancelSpotOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelSpotOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash (optional)
  final String? orderHash;

  /// the client order ID (optional)
  final String? cid;

  const MsgCancelSpotOrder({
    this.sender,
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelSpotOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    subaccountId,
    orderHash,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'cid': cid,
    };
  }

  factory MsgCancelSpotOrder.fromJson(Map<String, dynamic> json) {
    return MsgCancelSpotOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCancelSpotOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelSpotOrder(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      subaccountId: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      cid: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCancelSpotOrder;
  @override
  MsgCancelSpotOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCancelSpotOrderResponse.deserialize(bytes);
  }

  @override
  MsgCancelSpotOrderResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCancelSpotOrderResponse.fromJson(json);
  }
}

/// MsgCancelSpotOrderResponse defines the Msg/CancelSpotOrder response type.
class MsgCancelSpotOrderResponse extends CosmosProtoMessage {
  const MsgCancelSpotOrderResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelSpotOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelSpotOrderResponse();
  }

  factory MsgCancelSpotOrderResponse.deserialize(List<int> bytes) {
    return MsgCancelSpotOrderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCancelSpotOrderResponse;
}

/// MsgBatchCancelSpotOrders defines the Msg/BatchCancelSpotOrders response type.
class MsgBatchCancelSpotOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCancelSpotOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<OrderData> data;

  const MsgBatchCancelSpotOrders({this.sender, this.data = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCancelSpotOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, data];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'data': data.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCancelSpotOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchCancelSpotOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCancelSpotOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelSpotOrders(
      sender: decode.getString<String?>(1),
      data:
          decode
              .getListOfBytes(2)
              .map((b) => OrderData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBatchCancelSpotOrders;
  @override
  MsgBatchCancelSpotOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCancelSpotOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCancelSpotOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelSpotOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCancelSpotOrdersResponse defines the Msg/BatchCancelSpotOrders
/// response type.
class MsgBatchCancelSpotOrdersResponse extends CosmosProtoMessage {
  final List<bool> success;

  const MsgBatchCancelSpotOrdersResponse({this.success = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bool,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success.map((e) => e).toList()};
  }

  factory MsgBatchCancelSpotOrdersResponse.fromJson(Map<String, dynamic> json) {
    return MsgBatchCancelSpotOrdersResponse(
      success:
          (json.valueEnsureAsList<dynamic>(
            'success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory MsgBatchCancelSpotOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelSpotOrdersResponse(
      success: decode.getListOrEmpty<bool>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCancelSpotOrdersResponse;
}

/// MsgBatchCancelBinaryOptionsOrders defines the
/// Msg/BatchCancelBinaryOptionsOrders response type.
class MsgBatchCancelBinaryOptionsOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCancelBinaryOptionsOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<OrderData> data;

  const MsgBatchCancelBinaryOptionsOrders({this.sender, this.data = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCancelBinaryOptionsOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, data];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'data': data.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCancelBinaryOptionsOrders.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelBinaryOptionsOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCancelBinaryOptionsOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelBinaryOptionsOrders(
      sender: decode.getString<String?>(1),
      data:
          decode
              .getListOfBytes(2)
              .map((b) => OrderData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCancelBinaryOptionsOrders;
  @override
  MsgBatchCancelBinaryOptionsOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCancelBinaryOptionsOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCancelBinaryOptionsOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelBinaryOptionsOrdersResponse.fromJson(json);
  }
}

/// BatchCancelBinaryOptionsOrdersResponse defines the
/// Msg/BatchCancelBinaryOptionsOrders response type.
class MsgBatchCancelBinaryOptionsOrdersResponse extends CosmosProtoMessage {
  final List<bool> success;

  const MsgBatchCancelBinaryOptionsOrdersResponse({this.success = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bool,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success.map((e) => e).toList()};
  }

  factory MsgBatchCancelBinaryOptionsOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelBinaryOptionsOrdersResponse(
      success:
          (json.valueEnsureAsList<dynamic>(
            'success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory MsgBatchCancelBinaryOptionsOrdersResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelBinaryOptionsOrdersResponse(
      success: decode.getListOrEmpty<bool>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCancelBinaryOptionsOrdersResponse;
}

/// MsgBatchUpdateOrders defines the Msg/BatchUpdateOrders response type.
class MsgBatchUpdateOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchUpdateOrdersResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// subaccount_id only used for the spot_market_ids_to_cancel_all and
  /// derivative_market_ids_to_cancel_all (optional)
  final String? subaccountId;

  /// the market IDs to cancel all spot orders for (optional)
  final List<String> spotMarketIdsToCancelAll;

  /// the market IDs to cancel all derivative orders for (optional)
  final List<String> derivativeMarketIdsToCancelAll;

  /// the spot orders to cancel
  final List<OrderData> spotOrdersToCancel;

  /// the derivative orders to cancel
  final List<OrderData> derivativeOrdersToCancel;

  /// the spot orders to create
  final List<injective_exchange_v2_order.SpotOrder> spotOrdersToCreate;

  /// the derivative orders to create
  final List<injective_exchange_v2_order.DerivativeOrder>
  derivativeOrdersToCreate;

  /// the binary options orders to cancel
  final List<OrderData> binaryOptionsOrdersToCancel;

  /// the market IDs to cancel all binary options orders for (optional)
  final List<String> binaryOptionsMarketIdsToCancelAll;

  /// the binary options orders to create
  final List<injective_exchange_v2_order.DerivativeOrder>
  binaryOptionsOrdersToCreate;

  /// the spot market orders to create
  final List<injective_exchange_v2_order.SpotOrder> spotMarketOrdersToCreate;

  /// the derivative market orders to create
  final List<injective_exchange_v2_order.DerivativeOrder>
  derivativeMarketOrdersToCreate;

  /// the binary options market orders to create
  final List<injective_exchange_v2_order.DerivativeOrder>
  binaryOptionsMarketOrdersToCreate;

  const MsgBatchUpdateOrders({
    this.sender,
    this.subaccountId,
    this.spotMarketIdsToCancelAll = const [],
    this.derivativeMarketIdsToCancelAll = const [],
    this.spotOrdersToCancel = const [],
    this.derivativeOrdersToCancel = const [],
    this.spotOrdersToCreate = const [],
    this.derivativeOrdersToCreate = const [],
    this.binaryOptionsOrdersToCancel = const [],
    this.binaryOptionsMarketIdsToCancelAll = const [],
    this.binaryOptionsOrdersToCreate = const [],
    this.spotMarketOrdersToCreate = const [],
    this.derivativeMarketOrdersToCreate = const [],
    this.binaryOptionsMarketOrdersToCreate = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchUpdateOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 14,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    subaccountId,
    spotMarketIdsToCancelAll,
    derivativeMarketIdsToCancelAll,
    spotOrdersToCancel,
    derivativeOrdersToCancel,
    spotOrdersToCreate,
    derivativeOrdersToCreate,
    binaryOptionsOrdersToCancel,
    binaryOptionsMarketIdsToCancelAll,
    binaryOptionsOrdersToCreate,
    spotMarketOrdersToCreate,
    derivativeMarketOrdersToCreate,
    binaryOptionsMarketOrdersToCreate,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'spot_market_ids_to_cancel_all':
          spotMarketIdsToCancelAll.map((e) => e).toList(),
      'derivative_market_ids_to_cancel_all':
          derivativeMarketIdsToCancelAll.map((e) => e).toList(),
      'spot_orders_to_cancel':
          spotOrdersToCancel.map((e) => e.toJson()).toList(),
      'derivative_orders_to_cancel':
          derivativeOrdersToCancel.map((e) => e.toJson()).toList(),
      'spot_orders_to_create':
          spotOrdersToCreate.map((e) => e.toJson()).toList(),
      'derivative_orders_to_create':
          derivativeOrdersToCreate.map((e) => e.toJson()).toList(),
      'binary_options_orders_to_cancel':
          binaryOptionsOrdersToCancel.map((e) => e.toJson()).toList(),
      'binary_options_market_ids_to_cancel_all':
          binaryOptionsMarketIdsToCancelAll.map((e) => e).toList(),
      'binary_options_orders_to_create':
          binaryOptionsOrdersToCreate.map((e) => e.toJson()).toList(),
      'spot_market_orders_to_create':
          spotMarketOrdersToCreate.map((e) => e.toJson()).toList(),
      'derivative_market_orders_to_create':
          derivativeMarketOrdersToCreate.map((e) => e.toJson()).toList(),
      'binary_options_market_orders_to_create':
          binaryOptionsMarketOrdersToCreate.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgBatchUpdateOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchUpdateOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      spotMarketIdsToCancelAll:
          (json.valueEnsureAsList<dynamic>(
            'spot_market_ids_to_cancel_all',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeMarketIdsToCancelAll:
          (json.valueEnsureAsList<dynamic>(
            'derivative_market_ids_to_cancel_all',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotOrdersToCancel:
          (json.valueEnsureAsList<dynamic>(
                'spot_orders_to_cancel',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
      derivativeOrdersToCancel:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orders_to_cancel',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
      spotOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'spot_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.SpotOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order.SpotOrder.fromJson(v),
                ),
              )
              .toList(),
      derivativeOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'derivative_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsOrdersToCancel:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_orders_to_cancel',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsMarketIdsToCancelAll:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_market_ids_to_cancel_all',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      binaryOptionsOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
      spotMarketOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'spot_market_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.SpotOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order.SpotOrder.fromJson(v),
                ),
              )
              .toList(),
      derivativeMarketOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'derivative_market_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
      binaryOptionsMarketOrdersToCreate:
          (json.valueEnsureAsList<dynamic>(
                'binary_options_market_orders_to_create',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_order.DerivativeOrder,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_order
                          .DerivativeOrder.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchUpdateOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchUpdateOrders(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      spotMarketIdsToCancelAll: decode.getListOrEmpty<String>(3),
      derivativeMarketIdsToCancelAll: decode.getListOrEmpty<String>(4),
      spotOrdersToCancel:
          decode
              .getListOfBytes(5)
              .map((b) => OrderData.deserialize(b))
              .toList(),
      derivativeOrdersToCancel:
          decode
              .getListOfBytes(6)
              .map((b) => OrderData.deserialize(b))
              .toList(),
      spotOrdersToCreate:
          decode
              .getListOfBytes(7)
              .map((b) => injective_exchange_v2_order.SpotOrder.deserialize(b))
              .toList(),
      derivativeOrdersToCreate:
          decode
              .getListOfBytes(8)
              .map(
                (b) =>
                    injective_exchange_v2_order.DerivativeOrder.deserialize(b),
              )
              .toList(),
      binaryOptionsOrdersToCancel:
          decode
              .getListOfBytes(9)
              .map((b) => OrderData.deserialize(b))
              .toList(),
      binaryOptionsMarketIdsToCancelAll: decode.getListOrEmpty<String>(10),
      binaryOptionsOrdersToCreate:
          decode
              .getListOfBytes(11)
              .map(
                (b) =>
                    injective_exchange_v2_order.DerivativeOrder.deserialize(b),
              )
              .toList(),
      spotMarketOrdersToCreate:
          decode
              .getListOfBytes(12)
              .map((b) => injective_exchange_v2_order.SpotOrder.deserialize(b))
              .toList(),
      derivativeMarketOrdersToCreate:
          decode
              .getListOfBytes(13)
              .map(
                (b) =>
                    injective_exchange_v2_order.DerivativeOrder.deserialize(b),
              )
              .toList(),
      binaryOptionsMarketOrdersToCreate:
          decode
              .getListOfBytes(14)
              .map(
                (b) =>
                    injective_exchange_v2_order.DerivativeOrder.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBatchUpdateOrders;
  @override
  MsgBatchUpdateOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchUpdateOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchUpdateOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchUpdateOrdersResponse.fromJson(json);
  }
}

/// MsgBatchUpdateOrdersResponse defines the Msg/BatchUpdateOrders response type.
class MsgBatchUpdateOrdersResponse extends CosmosProtoMessage {
  final List<bool> spotCancelSuccess;

  final List<bool> derivativeCancelSuccess;

  final List<String> spotOrderHashes;

  final List<String> derivativeOrderHashes;

  final List<bool> binaryOptionsCancelSuccess;

  final List<String> binaryOptionsOrderHashes;

  final List<String> createdSpotOrdersCids;

  final List<String> failedSpotOrdersCids;

  final List<String> createdDerivativeOrdersCids;

  final List<String> failedDerivativeOrdersCids;

  final List<String> createdBinaryOptionsOrdersCids;

  final List<String> failedBinaryOptionsOrdersCids;

  final List<String> spotMarketOrderHashes;

  final List<String> createdSpotMarketOrdersCids;

  final List<String> failedSpotMarketOrdersCids;

  final List<String> derivativeMarketOrderHashes;

  final List<String> createdDerivativeMarketOrdersCids;

  final List<String> failedDerivativeMarketOrdersCids;

  final List<String> binaryOptionsMarketOrderHashes;

  final List<String> createdBinaryOptionsMarketOrdersCids;

  final List<String> failedBinaryOptionsMarketOrdersCids;

  const MsgBatchUpdateOrdersResponse({
    this.spotCancelSuccess = const [],
    this.derivativeCancelSuccess = const [],
    this.spotOrderHashes = const [],
    this.derivativeOrderHashes = const [],
    this.binaryOptionsCancelSuccess = const [],
    this.binaryOptionsOrderHashes = const [],
    this.createdSpotOrdersCids = const [],
    this.failedSpotOrdersCids = const [],
    this.createdDerivativeOrdersCids = const [],
    this.failedDerivativeOrdersCids = const [],
    this.createdBinaryOptionsOrdersCids = const [],
    this.failedBinaryOptionsOrdersCids = const [],
    this.spotMarketOrderHashes = const [],
    this.createdSpotMarketOrdersCids = const [],
    this.failedSpotMarketOrdersCids = const [],
    this.derivativeMarketOrderHashes = const [],
    this.createdDerivativeMarketOrdersCids = const [],
    this.failedDerivativeMarketOrdersCids = const [],
    this.binaryOptionsMarketOrderHashes = const [],
    this.createdBinaryOptionsMarketOrdersCids = const [],
    this.failedBinaryOptionsMarketOrdersCids = const [],
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
          elementType: ProtoFieldType.bool,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bool,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.bool,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 14,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 15,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 16,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 17,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 18,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 19,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 20,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 21,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    spotCancelSuccess,
    derivativeCancelSuccess,
    spotOrderHashes,
    derivativeOrderHashes,
    binaryOptionsCancelSuccess,
    binaryOptionsOrderHashes,
    createdSpotOrdersCids,
    failedSpotOrdersCids,
    createdDerivativeOrdersCids,
    failedDerivativeOrdersCids,
    createdBinaryOptionsOrdersCids,
    failedBinaryOptionsOrdersCids,
    spotMarketOrderHashes,
    createdSpotMarketOrdersCids,
    failedSpotMarketOrdersCids,
    derivativeMarketOrderHashes,
    createdDerivativeMarketOrdersCids,
    failedDerivativeMarketOrdersCids,
    binaryOptionsMarketOrderHashes,
    createdBinaryOptionsMarketOrdersCids,
    failedBinaryOptionsMarketOrdersCids,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'spot_cancel_success': spotCancelSuccess.map((e) => e).toList(),
      'derivative_cancel_success':
          derivativeCancelSuccess.map((e) => e).toList(),
      'spot_order_hashes': spotOrderHashes.map((e) => e).toList(),
      'derivative_order_hashes': derivativeOrderHashes.map((e) => e).toList(),
      'binary_options_cancel_success':
          binaryOptionsCancelSuccess.map((e) => e).toList(),
      'binary_options_order_hashes':
          binaryOptionsOrderHashes.map((e) => e).toList(),
      'created_spot_orders_cids': createdSpotOrdersCids.map((e) => e).toList(),
      'failed_spot_orders_cids': failedSpotOrdersCids.map((e) => e).toList(),
      'created_derivative_orders_cids':
          createdDerivativeOrdersCids.map((e) => e).toList(),
      'failed_derivative_orders_cids':
          failedDerivativeOrdersCids.map((e) => e).toList(),
      'created_binary_options_orders_cids':
          createdBinaryOptionsOrdersCids.map((e) => e).toList(),
      'failed_binary_options_orders_cids':
          failedBinaryOptionsOrdersCids.map((e) => e).toList(),
      'spot_market_order_hashes': spotMarketOrderHashes.map((e) => e).toList(),
      'created_spot_market_orders_cids':
          createdSpotMarketOrdersCids.map((e) => e).toList(),
      'failed_spot_market_orders_cids':
          failedSpotMarketOrdersCids.map((e) => e).toList(),
      'derivative_market_order_hashes':
          derivativeMarketOrderHashes.map((e) => e).toList(),
      'created_derivative_market_orders_cids':
          createdDerivativeMarketOrdersCids.map((e) => e).toList(),
      'failed_derivative_market_orders_cids':
          failedDerivativeMarketOrdersCids.map((e) => e).toList(),
      'binary_options_market_order_hashes':
          binaryOptionsMarketOrderHashes.map((e) => e).toList(),
      'created_binary_options_market_orders_cids':
          createdBinaryOptionsMarketOrdersCids.map((e) => e).toList(),
      'failed_binary_options_market_orders_cids':
          failedBinaryOptionsMarketOrdersCids.map((e) => e).toList(),
    };
  }

  factory MsgBatchUpdateOrdersResponse.fromJson(Map<String, dynamic> json) {
    return MsgBatchUpdateOrdersResponse(
      spotCancelSuccess:
          (json.valueEnsureAsList<dynamic>(
            'spot_cancel_success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
      derivativeCancelSuccess:
          (json.valueEnsureAsList<dynamic>(
            'derivative_cancel_success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
      spotOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'spot_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'derivative_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      binaryOptionsCancelSuccess:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_cancel_success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
      binaryOptionsOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdSpotOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_spot_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedSpotOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_spot_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdDerivativeOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_derivative_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedDerivativeOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_derivative_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdBinaryOptionsOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_binary_options_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedBinaryOptionsOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_binary_options_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      spotMarketOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'spot_market_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdSpotMarketOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_spot_market_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedSpotMarketOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_spot_market_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      derivativeMarketOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'derivative_market_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdDerivativeMarketOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_derivative_market_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedDerivativeMarketOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_derivative_market_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      binaryOptionsMarketOrderHashes:
          (json.valueEnsureAsList<dynamic>(
            'binary_options_market_order_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      createdBinaryOptionsMarketOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'created_binary_options_market_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      failedBinaryOptionsMarketOrdersCids:
          (json.valueEnsureAsList<dynamic>(
            'failed_binary_options_market_orders_cids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBatchUpdateOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchUpdateOrdersResponse(
      spotCancelSuccess: decode.getListOrEmpty<bool>(1),
      derivativeCancelSuccess: decode.getListOrEmpty<bool>(2),
      spotOrderHashes: decode.getListOrEmpty<String>(3),
      derivativeOrderHashes: decode.getListOrEmpty<String>(4),
      binaryOptionsCancelSuccess: decode.getListOrEmpty<bool>(5),
      binaryOptionsOrderHashes: decode.getListOrEmpty<String>(6),
      createdSpotOrdersCids: decode.getListOrEmpty<String>(7),
      failedSpotOrdersCids: decode.getListOrEmpty<String>(8),
      createdDerivativeOrdersCids: decode.getListOrEmpty<String>(9),
      failedDerivativeOrdersCids: decode.getListOrEmpty<String>(10),
      createdBinaryOptionsOrdersCids: decode.getListOrEmpty<String>(11),
      failedBinaryOptionsOrdersCids: decode.getListOrEmpty<String>(12),
      spotMarketOrderHashes: decode.getListOrEmpty<String>(13),
      createdSpotMarketOrdersCids: decode.getListOrEmpty<String>(14),
      failedSpotMarketOrdersCids: decode.getListOrEmpty<String>(15),
      derivativeMarketOrderHashes: decode.getListOrEmpty<String>(16),
      createdDerivativeMarketOrdersCids: decode.getListOrEmpty<String>(17),
      failedDerivativeMarketOrdersCids: decode.getListOrEmpty<String>(18),
      binaryOptionsMarketOrderHashes: decode.getListOrEmpty<String>(19),
      createdBinaryOptionsMarketOrdersCids: decode.getListOrEmpty<String>(20),
      failedBinaryOptionsMarketOrdersCids: decode.getListOrEmpty<String>(21),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBatchUpdateOrdersResponse;
}

/// A Cosmos-SDK MsgCreateDerivativeMarketOrder
class MsgCreateDerivativeMarketOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateDerivativeMarketOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the order details
  final injective_exchange_v2_order.DerivativeOrder? order;

  const MsgCreateDerivativeMarketOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateDerivativeMarketOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateDerivativeMarketOrder.fromJson(Map<String, dynamic> json) {
    return MsgCreateDerivativeMarketOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateDerivativeMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeMarketOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.DerivativeOrder?>(
        2,
        (b) => injective_exchange_v2_order.DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateDerivativeMarketOrder;
  @override
  MsgCreateDerivativeMarketOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateDerivativeMarketOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateDerivativeMarketOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeMarketOrderResponse.fromJson(json);
  }
}

/// MsgCreateDerivativeMarketOrderResponse defines the
/// Msg/CreateDerivativeMarketOrder response type.
class MsgCreateDerivativeMarketOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final DerivativeMarketOrderResults? results;

  final String? cid;

  const MsgCreateDerivativeMarketOrderResponse({
    this.orderHash,
    this.results,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, results, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'results': results?.toJson(), 'cid': cid};
  }

  factory MsgCreateDerivativeMarketOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateDerivativeMarketOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      results: json
          .valueTo<DerivativeMarketOrderResults?, Map<String, dynamic>>(
            key: 'results',
            parse: (v) => DerivativeMarketOrderResults.fromJson(v),
            acceptCamelCase: true,
          ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateDerivativeMarketOrderResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateDerivativeMarketOrderResponse(
      orderHash: decode.getString<String?>(1),
      results: decode.messageTo<DerivativeMarketOrderResults?>(
        2,
        (b) => DerivativeMarketOrderResults.deserialize(b),
      ),
      cid: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateDerivativeMarketOrderResponse;
}

class DerivativeMarketOrderResults extends CosmosProtoMessage {
  final String? quantity;

  final String? price;

  final String? fee;

  final injective_exchange_v2_exchange.PositionDelta? positionDelta;

  final String? payout;

  const DerivativeMarketOrderResults({
    this.quantity,
    this.price,
    this.fee,
    this.positionDelta,
    this.payout,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    quantity,
    price,
    fee,
    positionDelta,
    payout,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'price': price,
      'fee': fee,
      'position_delta': positionDelta?.toJson(),
      'payout': payout,
    };
  }

  factory DerivativeMarketOrderResults.fromJson(Map<String, dynamic> json) {
    return DerivativeMarketOrderResults(
      quantity: json.valueAsString<String?>('quantity', acceptCamelCase: true),
      price: json.valueAsString<String?>('price', acceptCamelCase: true),
      fee: json.valueAsString<String?>('fee', acceptCamelCase: true),
      positionDelta: json.valueTo<
        injective_exchange_v2_exchange.PositionDelta?,
        Map<String, dynamic>
      >(
        key: 'position_delta',
        parse: (v) => injective_exchange_v2_exchange.PositionDelta.fromJson(v),
        acceptCamelCase: true,
      ),
      payout: json.valueAsString<String?>('payout', acceptCamelCase: true),
    );
  }

  factory DerivativeMarketOrderResults.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DerivativeMarketOrderResults(
      quantity: decode.getString<String?>(1),
      price: decode.getString<String?>(2),
      fee: decode.getString<String?>(3),
      positionDelta: decode
          .messageTo<injective_exchange_v2_exchange.PositionDelta?>(
            4,
            (b) => injective_exchange_v2_exchange.PositionDelta.deserialize(b),
          ),
      payout: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2DerivativeMarketOrderResults;
}

/// A Cosmos-SDK MsgCreateBinaryOptionsMarketOrder
class MsgCreateBinaryOptionsMarketOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateBinaryOptionsMarketOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the order details
  final injective_exchange_v2_order.DerivativeOrder? order;

  const MsgCreateBinaryOptionsMarketOrder({this.sender, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCreateBinaryOptionsMarketOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, order];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'order': order?.toJson()};
  }

  factory MsgCreateBinaryOptionsMarketOrder.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsMarketOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateBinaryOptionsMarketOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsMarketOrder(
      sender: decode.getString<String?>(1),
      order: decode.messageTo<injective_exchange_v2_order.DerivativeOrder?>(
        2,
        (b) => injective_exchange_v2_order.DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateBinaryOptionsMarketOrder;
  @override
  MsgCreateBinaryOptionsMarketOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCreateBinaryOptionsMarketOrderResponse.deserialize(bytes);
  }

  @override
  MsgCreateBinaryOptionsMarketOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsMarketOrderResponse.fromJson(json);
  }
}

/// MsgCreateBinaryOptionsMarketOrderResponse defines the
/// Msg/CreateBinaryOptionsMarketOrder response type.
class MsgCreateBinaryOptionsMarketOrderResponse extends CosmosProtoMessage {
  final String? orderHash;

  final DerivativeMarketOrderResults? results;

  final String? cid;

  const MsgCreateBinaryOptionsMarketOrderResponse({
    this.orderHash,
    this.results,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [orderHash, results, cid];

  @override
  Map<String, dynamic> toJson() {
    return {'order_hash': orderHash, 'results': results?.toJson(), 'cid': cid};
  }

  factory MsgCreateBinaryOptionsMarketOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateBinaryOptionsMarketOrderResponse(
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      results: json
          .valueTo<DerivativeMarketOrderResults?, Map<String, dynamic>>(
            key: 'results',
            parse: (v) => DerivativeMarketOrderResults.fromJson(v),
            acceptCamelCase: true,
          ),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCreateBinaryOptionsMarketOrderResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateBinaryOptionsMarketOrderResponse(
      orderHash: decode.getString<String?>(1),
      results: decode.messageTo<DerivativeMarketOrderResults?>(
        2,
        (b) => DerivativeMarketOrderResults.deserialize(b),
      ),
      cid: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCreateBinaryOptionsMarketOrderResponse;
}

/// MsgCancelDerivativeOrder defines the Msg/CancelDerivativeOrder response type.
class MsgCancelDerivativeOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelDerivativeOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash (optional)
  final String? orderHash;

  /// the order mask (bitwise combination of OrderMask enum values) (optional)
  final int? orderMask;

  /// the client order ID (optional)
  final String? cid;

  const MsgCancelDerivativeOrder({
    this.sender,
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.orderMask,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelDerivativeOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int32(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    subaccountId,
    orderHash,
    orderMask,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'order_mask': orderMask,
      'cid': cid,
    };
  }

  factory MsgCancelDerivativeOrder.fromJson(Map<String, dynamic> json) {
    return MsgCancelDerivativeOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      orderMask: json.valueAsInt<int?>('order_mask', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCancelDerivativeOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelDerivativeOrder(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      subaccountId: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      orderMask: decode.getInt<int?>(5),
      cid: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCancelDerivativeOrder;
  @override
  MsgCancelDerivativeOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCancelDerivativeOrderResponse.deserialize(bytes);
  }

  @override
  MsgCancelDerivativeOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelDerivativeOrderResponse.fromJson(json);
  }
}

/// MsgCancelDerivativeOrderResponse defines the
/// Msg/CancelDerivativeOrderResponse response type.
class MsgCancelDerivativeOrderResponse extends CosmosProtoMessage {
  const MsgCancelDerivativeOrderResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelDerivativeOrderResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelDerivativeOrderResponse();
  }

  factory MsgCancelDerivativeOrderResponse.deserialize(List<int> bytes) {
    return MsgCancelDerivativeOrderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCancelDerivativeOrderResponse;
}

/// MsgCancelBinaryOptionsOrder defines the Msg/CancelBinaryOptionsOrder response
/// type.
class MsgCancelBinaryOptionsOrder extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelBinaryOptionsOrderResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash (optional)
  final String? orderHash;

  /// the order mask (bitwise combination of OrderMask enum values) (optional)
  final int? orderMask;

  /// the client order ID (optional)
  final String? cid;

  const MsgCancelBinaryOptionsOrder({
    this.sender,
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.orderMask,
    this.cid,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelBinaryOptionsOrder",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.int32(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    subaccountId,
    orderHash,
    orderMask,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'order_mask': orderMask,
      'cid': cid,
    };
  }

  factory MsgCancelBinaryOptionsOrder.fromJson(Map<String, dynamic> json) {
    return MsgCancelBinaryOptionsOrder(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      orderMask: json.valueAsInt<int?>('order_mask', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory MsgCancelBinaryOptionsOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelBinaryOptionsOrder(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      subaccountId: decode.getString<String?>(3),
      orderHash: decode.getString<String?>(4),
      orderMask: decode.getInt<int?>(5),
      cid: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCancelBinaryOptionsOrder;
  @override
  MsgCancelBinaryOptionsOrderResponse onServiceResponse(List<int> bytes) {
    return MsgCancelBinaryOptionsOrderResponse.deserialize(bytes);
  }

  @override
  MsgCancelBinaryOptionsOrderResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelBinaryOptionsOrderResponse.fromJson(json);
  }
}

/// MsgCancelBinaryOptionsOrderResponse defines the
/// Msg/CancelBinaryOptionsOrderResponse response type.
class MsgCancelBinaryOptionsOrderResponse extends CosmosProtoMessage {
  const MsgCancelBinaryOptionsOrderResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelBinaryOptionsOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelBinaryOptionsOrderResponse();
  }

  factory MsgCancelBinaryOptionsOrderResponse.deserialize(List<int> bytes) {
    return MsgCancelBinaryOptionsOrderResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCancelBinaryOptionsOrderResponse;
}

class OrderData extends CosmosProtoMessage {
  /// the market ID
  final String? marketId;

  /// the subaccount ID
  final String? subaccountId;

  /// the order hash (optional - either the order_hash or the cid should be
  /// provided)
  final String? orderHash;

  /// the order mask (bitwise combination of OrderMask enum values)
  final int? orderMask;

  /// the client order ID (optional - either the order_hash or the cid should be
  /// provided)
  final String? cid;

  const OrderData({
    this.marketId,
    this.subaccountId,
    this.orderHash,
    this.orderMask,
    this.cid,
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
        ProtoFieldConfig.int32(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    marketId,
    subaccountId,
    orderHash,
    orderMask,
    cid,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'market_id': marketId,
      'subaccount_id': subaccountId,
      'order_hash': orderHash,
      'order_mask': orderMask,
      'cid': cid,
    };
  }

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      orderHash: json.valueAsString<String?>(
        'order_hash',
        acceptCamelCase: true,
      ),
      orderMask: json.valueAsInt<int?>('order_mask', acceptCamelCase: true),
      cid: json.valueAsString<String?>('cid', acceptCamelCase: true),
    );
  }

  factory OrderData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OrderData(
      marketId: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      orderHash: decode.getString<String?>(3),
      orderMask: decode.getInt<int?>(4),
      cid: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2OrderData;
}

/// MsgBatchCancelDerivativeOrders defines the Msg/CancelDerivativeOrders
/// response type.
class MsgBatchCancelDerivativeOrders extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCancelDerivativeOrdersResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<OrderData> data;

  const MsgBatchCancelDerivativeOrders({this.sender, this.data = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCancelDerivativeOrders",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, data];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'data': data.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchCancelDerivativeOrders.fromJson(Map<String, dynamic> json) {
    return MsgBatchCancelDerivativeOrders(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      data:
          (json.valueEnsureAsList<dynamic>('data', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<OrderData, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => OrderData.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgBatchCancelDerivativeOrders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelDerivativeOrders(
      sender: decode.getString<String?>(1),
      data:
          decode
              .getListOfBytes(2)
              .map((b) => OrderData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCancelDerivativeOrders;
  @override
  MsgBatchCancelDerivativeOrdersResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCancelDerivativeOrdersResponse.deserialize(bytes);
  }

  @override
  MsgBatchCancelDerivativeOrdersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelDerivativeOrdersResponse.fromJson(json);
  }
}

/// MsgBatchCancelDerivativeOrdersResponse defines the
/// Msg/CancelDerivativeOrderResponse response type.
class MsgBatchCancelDerivativeOrdersResponse extends CosmosProtoMessage {
  final List<bool> success;

  const MsgBatchCancelDerivativeOrdersResponse({this.success = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bool,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success.map((e) => e).toList()};
  }

  factory MsgBatchCancelDerivativeOrdersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCancelDerivativeOrdersResponse(
      success:
          (json.valueEnsureAsList<dynamic>(
            'success',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory MsgBatchCancelDerivativeOrdersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCancelDerivativeOrdersResponse(
      success: decode.getListOrEmpty<bool>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCancelDerivativeOrdersResponse;
}

/// A Cosmos-SDK MsgSubaccountTransfer
class MsgSubaccountTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubaccountTransferResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the source subaccount ID
  final String? sourceSubaccountId;

  /// the destination subaccount ID
  final String? destinationSubaccountId;

  /// the amount to transfer (in chain format)
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgSubaccountTransfer({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgSubaccountTransfer",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgSubaccountTransfer.fromJson(Map<String, dynamic> json) {
    return MsgSubaccountTransfer(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSubaccountTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubaccountTransfer(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgSubaccountTransfer;
  @override
  MsgSubaccountTransferResponse onServiceResponse(List<int> bytes) {
    return MsgSubaccountTransferResponse.deserialize(bytes);
  }

  @override
  MsgSubaccountTransferResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSubaccountTransferResponse.fromJson(json);
  }
}

/// MsgSubaccountTransferResponse defines the Msg/SubaccountTransfer response
/// type.
class MsgSubaccountTransferResponse extends CosmosProtoMessage {
  const MsgSubaccountTransferResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSubaccountTransferResponse.fromJson(Map<String, dynamic> json) {
    return MsgSubaccountTransferResponse();
  }

  factory MsgSubaccountTransferResponse.deserialize(List<int> bytes) {
    return MsgSubaccountTransferResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgSubaccountTransferResponse;
}

/// A Cosmos-SDK MsgExternalTransfer
class MsgExternalTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExternalTransferResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the source subaccount ID
  final String? sourceSubaccountId;

  /// the destination subaccount ID
  final String? destinationSubaccountId;

  /// the amount to transfer (in chain format)
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgExternalTransfer({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgExternalTransfer",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgExternalTransfer.fromJson(Map<String, dynamic> json) {
    return MsgExternalTransfer(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgExternalTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExternalTransfer(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgExternalTransfer;
  @override
  MsgExternalTransferResponse onServiceResponse(List<int> bytes) {
    return MsgExternalTransferResponse.deserialize(bytes);
  }

  @override
  MsgExternalTransferResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExternalTransferResponse.fromJson(json);
  }
}

/// MsgExternalTransferResponse defines the Msg/ExternalTransfer response type.
class MsgExternalTransferResponse extends CosmosProtoMessage {
  const MsgExternalTransferResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgExternalTransferResponse.fromJson(Map<String, dynamic> json) {
    return MsgExternalTransferResponse();
  }

  factory MsgExternalTransferResponse.deserialize(List<int> bytes) {
    return MsgExternalTransferResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgExternalTransferResponse;
}

/// A Cosmos-SDK MsgLiquidatePosition
class MsgLiquidatePosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLiquidatePositionResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID the position belongs to
  final String? subaccountId;

  /// the position's market ID
  final String? marketId;

  /// optional order to provide for liquidation
  final injective_exchange_v2_order.DerivativeOrder? order;

  const MsgLiquidatePosition({
    this.sender,
    this.subaccountId,
    this.marketId,
    this.order,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgLiquidatePosition",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, marketId, order];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'order': order?.toJson(),
    };
  }

  factory MsgLiquidatePosition.fromJson(Map<String, dynamic> json) {
    return MsgLiquidatePosition(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLiquidatePosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLiquidatePosition(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      order: decode.messageTo<injective_exchange_v2_order.DerivativeOrder?>(
        4,
        (b) => injective_exchange_v2_order.DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgLiquidatePosition;
  @override
  MsgLiquidatePositionResponse onServiceResponse(List<int> bytes) {
    return MsgLiquidatePositionResponse.deserialize(bytes);
  }

  @override
  MsgLiquidatePositionResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgLiquidatePositionResponse.fromJson(json);
  }
}

/// MsgLiquidatePositionResponse defines the Msg/LiquidatePosition response type.
class MsgLiquidatePositionResponse extends CosmosProtoMessage {
  const MsgLiquidatePositionResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgLiquidatePositionResponse.fromJson(Map<String, dynamic> json) {
    return MsgLiquidatePositionResponse();
  }

  factory MsgLiquidatePositionResponse.deserialize(List<int> bytes) {
    return MsgLiquidatePositionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgLiquidatePositionResponse;
}

/// LiquidatePositionData contains per-position liquidation input fields.
class LiquidatePositionData extends CosmosProtoMessage {
  /// the subaccount ID the position belongs to
  final String? subaccountId;

  /// the position's market ID
  final String? marketId;

  /// optional order to provide for liquidation
  final injective_exchange_v2_order.DerivativeOrder? order;

  const LiquidatePositionData({this.subaccountId, this.marketId, this.order});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId, order];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'order': order?.toJson(),
    };
  }

  factory LiquidatePositionData.fromJson(Map<String, dynamic> json) {
    return LiquidatePositionData(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      order: json.valueTo<
        injective_exchange_v2_order.DerivativeOrder?,
        Map<String, dynamic>
      >(
        key: 'order',
        parse: (v) => injective_exchange_v2_order.DerivativeOrder.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory LiquidatePositionData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidatePositionData(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      order: decode.messageTo<injective_exchange_v2_order.DerivativeOrder?>(
        3,
        (b) => injective_exchange_v2_order.DerivativeOrder.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2LiquidatePositionData;
}

/// A Cosmos-SDK MsgBatchLiquidatePositions
class MsgBatchLiquidatePositions extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchLiquidatePositionsResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the positions to liquidate
  final List<LiquidatePositionData> liquidations;

  const MsgBatchLiquidatePositions({this.sender, this.liquidations = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchLiquidatePositions",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, liquidations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'liquidations': liquidations.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgBatchLiquidatePositions.fromJson(Map<String, dynamic> json) {
    return MsgBatchLiquidatePositions(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      liquidations:
          (json.valueEnsureAsList<dynamic>(
                'liquidations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  LiquidatePositionData,
                  Map<String, dynamic>
                >(value: e, parse: (v) => LiquidatePositionData.fromJson(v)),
              )
              .toList(),
    );
  }

  factory MsgBatchLiquidatePositions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchLiquidatePositions(
      sender: decode.getString<String?>(1),
      liquidations:
          decode
              .getListOfBytes(2)
              .map((b) => LiquidatePositionData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBatchLiquidatePositions;
  @override
  MsgBatchLiquidatePositionsResponse onServiceResponse(List<int> bytes) {
    return MsgBatchLiquidatePositionsResponse.deserialize(bytes);
  }

  @override
  MsgBatchLiquidatePositionsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchLiquidatePositionsResponse.fromJson(json);
  }
}

/// LiquidatePositionResult contains the liquidation outcome for an item.
class LiquidatePositionResult extends CosmosProtoMessage {
  /// the subaccount ID the position belongs to
  final String? subaccountId;

  /// the position's market ID
  final String? marketId;

  /// whether the liquidation succeeded
  final bool? success;

  /// failure reason when success is false
  final String? error;

  const LiquidatePositionResult({
    this.subaccountId,
    this.marketId,
    this.success,
    this.error,
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
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subaccountId, marketId, success, error];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'success': success,
      'error': error,
    };
  }

  factory LiquidatePositionResult.fromJson(Map<String, dynamic> json) {
    return LiquidatePositionResult(
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      success: json.valueAsBool<bool?>('success', acceptCamelCase: true),
      error: json.valueAsString<String?>('error', acceptCamelCase: true),
    );
  }

  factory LiquidatePositionResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LiquidatePositionResult(
      subaccountId: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      success: decode.getBool<bool?>(3),
      error: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2LiquidatePositionResult;
}

/// MsgBatchLiquidatePositionsResponse defines the
/// Msg/BatchLiquidatePositions response type.
class MsgBatchLiquidatePositionsResponse extends CosmosProtoMessage {
  final List<LiquidatePositionResult> results;

  const MsgBatchLiquidatePositionsResponse({this.results = const []});

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
  List<Object?> get protoValues => [results];

  @override
  Map<String, dynamic> toJson() {
    return {'results': results.map((e) => e.toJson()).toList()};
  }

  factory MsgBatchLiquidatePositionsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchLiquidatePositionsResponse(
      results:
          (json.valueEnsureAsList<dynamic>('results', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  LiquidatePositionResult,
                  Map<String, dynamic>
                >(value: e, parse: (v) => LiquidatePositionResult.fromJson(v)),
              )
              .toList(),
    );
  }

  factory MsgBatchLiquidatePositionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchLiquidatePositionsResponse(
      results:
          decode
              .getListOfBytes(1)
              .map((b) => LiquidatePositionResult.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchLiquidatePositionsResponse;
}

/// A Cosmos-SDK MsgOffsetPosition
class MsgOffsetPosition extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgOffsetPositionResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? subaccountId;

  final String? marketId;

  final List<String> offsettingSubaccountIds;

  const MsgOffsetPosition({
    this.sender,
    this.subaccountId,
    this.marketId,
    this.offsettingSubaccountIds = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgOffsetPosition",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    subaccountId,
    marketId,
    offsettingSubaccountIds,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'market_id': marketId,
      'offsetting_subaccount_ids':
          offsettingSubaccountIds.map((e) => e).toList(),
    };
  }

  factory MsgOffsetPosition.fromJson(Map<String, dynamic> json) {
    return MsgOffsetPosition(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      offsettingSubaccountIds:
          (json.valueEnsureAsList<dynamic>(
            'offsetting_subaccount_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgOffsetPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgOffsetPosition(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
      offsettingSubaccountIds: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgOffsetPosition;
  @override
  MsgOffsetPositionResponse onServiceResponse(List<int> bytes) {
    return MsgOffsetPositionResponse.deserialize(bytes);
  }

  @override
  MsgOffsetPositionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgOffsetPositionResponse.fromJson(json);
  }
}

/// MsgOffsetPositionResponse defines the Msg/OffsetPosition
/// response type.
class MsgOffsetPositionResponse extends CosmosProtoMessage {
  const MsgOffsetPositionResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgOffsetPositionResponse.fromJson(Map<String, dynamic> json) {
    return MsgOffsetPositionResponse();
  }

  factory MsgOffsetPositionResponse.deserialize(List<int> bytes) {
    return MsgOffsetPositionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgOffsetPositionResponse;
}

/// A Cosmos-SDK MsgEmergencySettleMarket
class MsgEmergencySettleMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgEmergencySettleMarketResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID
  final String? subaccountId;

  /// the market ID
  final String? marketId;

  const MsgEmergencySettleMarket({
    this.sender,
    this.subaccountId,
    this.marketId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgEmergencySettleMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, marketId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'market_id': marketId,
    };
  }

  factory MsgEmergencySettleMarket.fromJson(Map<String, dynamic> json) {
    return MsgEmergencySettleMarket(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
    );
  }

  factory MsgEmergencySettleMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEmergencySettleMarket(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      marketId: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgEmergencySettleMarket;
  @override
  MsgEmergencySettleMarketResponse onServiceResponse(List<int> bytes) {
    return MsgEmergencySettleMarketResponse.deserialize(bytes);
  }

  @override
  MsgEmergencySettleMarketResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgEmergencySettleMarketResponse.fromJson(json);
  }
}

/// MsgEmergencySettleMarketResponse defines the Msg/EmergencySettleMarket
/// response type.
class MsgEmergencySettleMarketResponse extends CosmosProtoMessage {
  const MsgEmergencySettleMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgEmergencySettleMarketResponse.fromJson(Map<String, dynamic> json) {
    return MsgEmergencySettleMarketResponse();
  }

  factory MsgEmergencySettleMarketResponse.deserialize(List<int> bytes) {
    return MsgEmergencySettleMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgEmergencySettleMarketResponse;
}

/// A Cosmos-SDK MsgIncreasePositionMargin
class MsgIncreasePositionMargin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgIncreasePositionMarginResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID sending the funds
  final String? sourceSubaccountId;

  /// the subaccount ID the position belongs to
  final String? destinationSubaccountId;

  /// the market ID
  final String? marketId;

  /// amount defines the amount of margin to add to the position (in human
  /// readable format)
  final String? amount;

  const MsgIncreasePositionMargin({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.marketId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgIncreasePositionMargin",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    marketId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'market_id': marketId,
      'amount': amount,
    };
  }

  factory MsgIncreasePositionMargin.fromJson(Map<String, dynamic> json) {
    return MsgIncreasePositionMargin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory MsgIncreasePositionMargin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgIncreasePositionMargin(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      marketId: decode.getString<String?>(4),
      amount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgIncreasePositionMargin;
  @override
  MsgIncreasePositionMarginResponse onServiceResponse(List<int> bytes) {
    return MsgIncreasePositionMarginResponse.deserialize(bytes);
  }

  @override
  MsgIncreasePositionMarginResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgIncreasePositionMarginResponse.fromJson(json);
  }
}

/// MsgIncreasePositionMarginResponse defines the Msg/IncreasePositionMargin
/// response type.
class MsgIncreasePositionMarginResponse extends CosmosProtoMessage {
  const MsgIncreasePositionMarginResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgIncreasePositionMarginResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgIncreasePositionMarginResponse();
  }

  factory MsgIncreasePositionMarginResponse.deserialize(List<int> bytes) {
    return MsgIncreasePositionMarginResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgIncreasePositionMarginResponse;
}

/// A Cosmos-SDK MsgIncreasePositionMargin
/// A Cosmos-SDK MsgDecreasePositionMargin
class MsgDecreasePositionMargin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDecreasePositionMarginResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the subaccount ID the position belongs to
  final String? sourceSubaccountId;

  /// the destination subaccount ID
  final String? destinationSubaccountId;

  /// the market ID
  final String? marketId;

  /// amount defines the amount of margin to withdraw from the position (in human
  /// readable format)
  final String? amount;

  const MsgDecreasePositionMargin({
    this.sender,
    this.sourceSubaccountId,
    this.destinationSubaccountId,
    this.marketId,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgDecreasePositionMargin",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    sourceSubaccountId,
    destinationSubaccountId,
    marketId,
    amount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'source_subaccount_id': sourceSubaccountId,
      'destination_subaccount_id': destinationSubaccountId,
      'market_id': marketId,
      'amount': amount,
    };
  }

  factory MsgDecreasePositionMargin.fromJson(Map<String, dynamic> json) {
    return MsgDecreasePositionMargin(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sourceSubaccountId: json.valueAsString<String?>(
        'source_subaccount_id',
        acceptCamelCase: true,
      ),
      destinationSubaccountId: json.valueAsString<String?>(
        'destination_subaccount_id',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory MsgDecreasePositionMargin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDecreasePositionMargin(
      sender: decode.getString<String?>(1),
      sourceSubaccountId: decode.getString<String?>(2),
      destinationSubaccountId: decode.getString<String?>(3),
      marketId: decode.getString<String?>(4),
      amount: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgDecreasePositionMargin;
  @override
  MsgDecreasePositionMarginResponse onServiceResponse(List<int> bytes) {
    return MsgDecreasePositionMarginResponse.deserialize(bytes);
  }

  @override
  MsgDecreasePositionMarginResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDecreasePositionMarginResponse.fromJson(json);
  }
}

/// MsgDecreasePositionMarginResponse defines the Msg/MsgDecreasePositionMargin
/// response type.
class MsgDecreasePositionMarginResponse extends CosmosProtoMessage {
  const MsgDecreasePositionMarginResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDecreasePositionMarginResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgDecreasePositionMarginResponse();
  }

  factory MsgDecreasePositionMarginResponse.deserialize(List<int> bytes) {
    return MsgDecreasePositionMarginResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgDecreasePositionMarginResponse;
}

/// MsgPrivilegedExecuteContract defines the Msg/Exec message type
class MsgPrivilegedExecuteContract extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPrivilegedExecuteContractResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// funds defines the user's bank coins used to fund the execution (e.g.
  /// 100inj).
  final String? funds;

  /// contract_address defines the contract address to execute
  final String? contractAddress;

  /// data defines the call data used when executing the contract
  final String? data;

  const MsgPrivilegedExecuteContract({
    this.sender,
    this.funds,
    this.contractAddress,
    this.data,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgPrivilegedExecuteContract",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, funds, contractAddress, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'funds': funds,
      'contract_address': contractAddress,
      'data': data,
    };
  }

  factory MsgPrivilegedExecuteContract.fromJson(Map<String, dynamic> json) {
    return MsgPrivilegedExecuteContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      funds: json.valueAsString<String?>('funds', acceptCamelCase: true),
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
    );
  }

  factory MsgPrivilegedExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPrivilegedExecuteContract(
      sender: decode.getString<String?>(1),
      funds: decode.getString<String?>(2),
      contractAddress: decode.getString<String?>(3),
      data: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgPrivilegedExecuteContract;
  @override
  MsgPrivilegedExecuteContractResponse onServiceResponse(List<int> bytes) {
    return MsgPrivilegedExecuteContractResponse.deserialize(bytes);
  }

  @override
  MsgPrivilegedExecuteContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgPrivilegedExecuteContractResponse.fromJson(json);
  }
}

/// MsgPrivilegedExecuteContractResponse defines the Msg/Exec response type.
class MsgPrivilegedExecuteContractResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> fundsDiff;

  const MsgPrivilegedExecuteContractResponse({this.fundsDiff = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
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
  List<Object?> get protoValues => [fundsDiff];

  @override
  Map<String, dynamic> toJson() {
    return {'funds_diff': fundsDiff.map((e) => e.toJson()).toList()};
  }

  factory MsgPrivilegedExecuteContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgPrivilegedExecuteContractResponse(
      fundsDiff:
          (json.valueEnsureAsList<dynamic>('funds_diff', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgPrivilegedExecuteContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPrivilegedExecuteContractResponse(
      fundsDiff:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgPrivilegedExecuteContractResponse;
}

/// A Cosmos-SDK MsgRewardsOptOut
class MsgRewardsOptOut extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRewardsOptOutResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  const MsgRewardsOptOut({this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgRewardsOptOut",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender};
  }

  factory MsgRewardsOptOut.fromJson(Map<String, dynamic> json) {
    return MsgRewardsOptOut(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgRewardsOptOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRewardsOptOut(sender: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgRewardsOptOut;
  @override
  MsgRewardsOptOutResponse onServiceResponse(List<int> bytes) {
    return MsgRewardsOptOutResponse.deserialize(bytes);
  }

  @override
  MsgRewardsOptOutResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRewardsOptOutResponse.fromJson(json);
  }
}

/// MsgRewardsOptOutResponse defines the Msg/RewardsOptOut response type.
class MsgRewardsOptOutResponse extends CosmosProtoMessage {
  const MsgRewardsOptOutResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRewardsOptOutResponse.fromJson(Map<String, dynamic> json) {
    return MsgRewardsOptOutResponse();
  }

  factory MsgRewardsOptOutResponse.deserialize(List<int> bytes) {
    return MsgRewardsOptOutResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgRewardsOptOutResponse;
}

/// MsgAdminUpdateBinaryOptionsMarket is used by the market Admin to operate the
/// market
class MsgAdminUpdateBinaryOptionsMarket extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAdminUpdateBinaryOptionsMarketResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The market ID
  final String? marketId;

  /// new price at which market will be settled
  final String? settlementPrice;

  /// expiration timestamp
  final BigInt? expirationTimestamp;

  /// expiration timestamp
  final BigInt? settlementTimestamp;

  /// Status of the market
  final injective_exchange_v2_market.MarketStatus? status;

  const MsgAdminUpdateBinaryOptionsMarket({
    this.sender,
    this.marketId,
    this.settlementPrice,
    this.expirationTimestamp,
    this.settlementTimestamp,
    this.status,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgAdminUpdateBinaryOptionsMarket",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.enumType(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    marketId,
    settlementPrice,
    expirationTimestamp,
    settlementTimestamp,
    status,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'settlement_price': settlementPrice,
      'expiration_timestamp': expirationTimestamp?.toString(),
      'settlement_timestamp': settlementTimestamp?.toString(),
      'status': status?.protoName,
    };
  }

  factory MsgAdminUpdateBinaryOptionsMarket.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdminUpdateBinaryOptionsMarket(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      settlementPrice: json.valueAsString<String?>(
        'settlement_price',
        acceptCamelCase: true,
      ),
      expirationTimestamp: json.valueAsBigInt<BigInt?>(
        'expiration_timestamp',
        acceptCamelCase: true,
      ),
      settlementTimestamp: json.valueAsBigInt<BigInt?>(
        'settlement_timestamp',
        acceptCamelCase: true,
      ),
      status: json.valueTo<injective_exchange_v2_market.MarketStatus?, Object?>(
        key: 'status',
        parse: (v) => injective_exchange_v2_market.MarketStatus.from(v),
      ),
    );
  }

  factory MsgAdminUpdateBinaryOptionsMarket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAdminUpdateBinaryOptionsMarket(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      settlementPrice: decode.getString<String?>(3),
      expirationTimestamp: decode.getBigInt<BigInt?>(4),
      settlementTimestamp: decode.getBigInt<BigInt?>(5),
      status: decode.getEnum<injective_exchange_v2_market.MarketStatus?>(
        6,
        injective_exchange_v2_market.MarketStatus.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgAdminUpdateBinaryOptionsMarket;
  @override
  MsgAdminUpdateBinaryOptionsMarketResponse onServiceResponse(List<int> bytes) {
    return MsgAdminUpdateBinaryOptionsMarketResponse.deserialize(bytes);
  }

  @override
  MsgAdminUpdateBinaryOptionsMarketResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdminUpdateBinaryOptionsMarketResponse.fromJson(json);
  }
}

/// MsgAdminUpdateBinaryOptionsMarketResponse is the response for
/// AdminUpdateBinaryOptionsMarket rpc method
class MsgAdminUpdateBinaryOptionsMarketResponse extends CosmosProtoMessage {
  const MsgAdminUpdateBinaryOptionsMarketResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgAdminUpdateBinaryOptionsMarketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAdminUpdateBinaryOptionsMarketResponse();
  }

  factory MsgAdminUpdateBinaryOptionsMarketResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgAdminUpdateBinaryOptionsMarketResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgAdminUpdateBinaryOptionsMarketResponse;
}

/// MsgAuthorizeStakeGrants grants stakes to grantees.
class MsgAuthorizeStakeGrants extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAuthorizeStakeGrantsResponse>,
        ICosmosProtoAminoMessage {
  /// Injective address of the stake granter
  final String? sender;

  /// list of stake grants to authorize (mandatory)
  final List<injective_exchange_v2_exchange.GrantAuthorization> grants;

  const MsgAuthorizeStakeGrants({this.sender, this.grants = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgAuthorizeStakeGrants",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, grants];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'grants': grants.map((e) => e.toJson()).toList()};
  }

  factory MsgAuthorizeStakeGrants.fromJson(Map<String, dynamic> json) {
    return MsgAuthorizeStakeGrants(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      grants:
          (json.valueEnsureAsList<dynamic>('grants', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_exchange_v2_exchange.GrantAuthorization,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_exchange_v2_exchange
                          .GrantAuthorization.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgAuthorizeStakeGrants.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAuthorizeStakeGrants(
      sender: decode.getString<String?>(1),
      grants:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_exchange_v2_exchange
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgAuthorizeStakeGrants;
  @override
  MsgAuthorizeStakeGrantsResponse onServiceResponse(List<int> bytes) {
    return MsgAuthorizeStakeGrantsResponse.deserialize(bytes);
  }

  @override
  MsgAuthorizeStakeGrantsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAuthorizeStakeGrantsResponse.fromJson(json);
  }
}

class MsgAuthorizeStakeGrantsResponse extends CosmosProtoMessage {
  const MsgAuthorizeStakeGrantsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgAuthorizeStakeGrantsResponse.fromJson(Map<String, dynamic> json) {
    return MsgAuthorizeStakeGrantsResponse();
  }

  factory MsgAuthorizeStakeGrantsResponse.deserialize(List<int> bytes) {
    return MsgAuthorizeStakeGrantsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgAuthorizeStakeGrantsResponse;
}

/// MsgActivateStakeGrant allows a grantee to activate a stake grant.
class MsgActivateStakeGrant extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgActivateStakeGrantResponse>,
        ICosmosProtoAminoMessage {
  /// Injective address of the stake grantee
  final String? sender;

  /// Injective address of the stake granter
  final String? granter;

  const MsgActivateStakeGrant({this.sender, this.granter});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgActivateStakeGrant",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, granter];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'granter': granter};
  }

  factory MsgActivateStakeGrant.fromJson(Map<String, dynamic> json) {
    return MsgActivateStakeGrant(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
    );
  }

  factory MsgActivateStakeGrant.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgActivateStakeGrant(
      sender: decode.getString<String?>(1),
      granter: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgActivateStakeGrant;
  @override
  MsgActivateStakeGrantResponse onServiceResponse(List<int> bytes) {
    return MsgActivateStakeGrantResponse.deserialize(bytes);
  }

  @override
  MsgActivateStakeGrantResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgActivateStakeGrantResponse.fromJson(json);
  }
}

class MsgActivateStakeGrantResponse extends CosmosProtoMessage {
  const MsgActivateStakeGrantResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgActivateStakeGrantResponse.fromJson(Map<String, dynamic> json) {
    return MsgActivateStakeGrantResponse();
  }

  factory MsgActivateStakeGrantResponse.deserialize(List<int> bytes) {
    return MsgActivateStakeGrantResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgActivateStakeGrantResponse;
}

class MsgBatchExchangeModification extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchExchangeModificationResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.BatchExchangeModificationProposal?
  proposal;

  const MsgBatchExchangeModification({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchExchangeModification",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgBatchExchangeModification.fromJson(Map<String, dynamic> json) {
    return MsgBatchExchangeModification(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.BatchExchangeModificationProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .BatchExchangeModificationProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgBatchExchangeModification.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchExchangeModification(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.BatchExchangeModificationProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .BatchExchangeModificationProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBatchExchangeModification;
  @override
  MsgBatchExchangeModificationResponse onServiceResponse(List<int> bytes) {
    return MsgBatchExchangeModificationResponse.deserialize(bytes);
  }

  @override
  MsgBatchExchangeModificationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchExchangeModificationResponse.fromJson(json);
  }
}

class MsgBatchExchangeModificationResponse extends CosmosProtoMessage {
  const MsgBatchExchangeModificationResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgBatchExchangeModificationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchExchangeModificationResponse();
  }

  factory MsgBatchExchangeModificationResponse.deserialize(List<int> bytes) {
    return MsgBatchExchangeModificationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchExchangeModificationResponse;
}

class MsgSpotMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSpotMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.SpotMarketLaunchProposal? proposal;

  const MsgSpotMarketLaunch({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgSpotMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgSpotMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgSpotMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.SpotMarketLaunchProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .SpotMarketLaunchProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSpotMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSpotMarketLaunch(
      sender: decode.getString<String?>(1),
      proposal: decode
          .messageTo<injective_exchange_v2_proposal.SpotMarketLaunchProposal?>(
            2,
            (b) => injective_exchange_v2_proposal
                .SpotMarketLaunchProposal.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgSpotMarketLaunch;
  @override
  MsgSpotMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgSpotMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgSpotMarketLaunchResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSpotMarketLaunchResponse.fromJson(json);
  }
}

class MsgSpotMarketLaunchResponse extends CosmosProtoMessage {
  const MsgSpotMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSpotMarketLaunchResponse.fromJson(Map<String, dynamic> json) {
    return MsgSpotMarketLaunchResponse();
  }

  factory MsgSpotMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgSpotMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgSpotMarketLaunchResponse;
}

class MsgPerpetualMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPerpetualMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.PerpetualMarketLaunchProposal? proposal;

  const MsgPerpetualMarketLaunch({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgPerpetualMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgPerpetualMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgPerpetualMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.PerpetualMarketLaunchProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .PerpetualMarketLaunchProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgPerpetualMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPerpetualMarketLaunch(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.PerpetualMarketLaunchProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .PerpetualMarketLaunchProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgPerpetualMarketLaunch;
  @override
  MsgPerpetualMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgPerpetualMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgPerpetualMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgPerpetualMarketLaunchResponse.fromJson(json);
  }
}

class MsgPerpetualMarketLaunchResponse extends CosmosProtoMessage {
  const MsgPerpetualMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgPerpetualMarketLaunchResponse.fromJson(Map<String, dynamic> json) {
    return MsgPerpetualMarketLaunchResponse();
  }

  factory MsgPerpetualMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgPerpetualMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgPerpetualMarketLaunchResponse;
}

class MsgExpiryFuturesMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExpiryFuturesMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.ExpiryFuturesMarketLaunchProposal?
  proposal;

  const MsgExpiryFuturesMarketLaunch({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgExpiryFuturesMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgExpiryFuturesMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgExpiryFuturesMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.ExpiryFuturesMarketLaunchProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .ExpiryFuturesMarketLaunchProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExpiryFuturesMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExpiryFuturesMarketLaunch(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.ExpiryFuturesMarketLaunchProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .ExpiryFuturesMarketLaunchProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgExpiryFuturesMarketLaunch;
  @override
  MsgExpiryFuturesMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgExpiryFuturesMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgExpiryFuturesMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgExpiryFuturesMarketLaunchResponse.fromJson(json);
  }
}

class MsgExpiryFuturesMarketLaunchResponse extends CosmosProtoMessage {
  const MsgExpiryFuturesMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgExpiryFuturesMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgExpiryFuturesMarketLaunchResponse();
  }

  factory MsgExpiryFuturesMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgExpiryFuturesMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgExpiryFuturesMarketLaunchResponse;
}

class MsgBinaryOptionsMarketLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBinaryOptionsMarketLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.BinaryOptionsMarketLaunchProposal?
  proposal;

  const MsgBinaryOptionsMarketLaunch({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBinaryOptionsMarketLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgBinaryOptionsMarketLaunch.fromJson(Map<String, dynamic> json) {
    return MsgBinaryOptionsMarketLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.BinaryOptionsMarketLaunchProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .BinaryOptionsMarketLaunchProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgBinaryOptionsMarketLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBinaryOptionsMarketLaunch(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.BinaryOptionsMarketLaunchProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .BinaryOptionsMarketLaunchProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBinaryOptionsMarketLaunch;
  @override
  MsgBinaryOptionsMarketLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgBinaryOptionsMarketLaunchResponse.deserialize(bytes);
  }

  @override
  MsgBinaryOptionsMarketLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBinaryOptionsMarketLaunchResponse.fromJson(json);
  }
}

class MsgBinaryOptionsMarketLaunchResponse extends CosmosProtoMessage {
  const MsgBinaryOptionsMarketLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgBinaryOptionsMarketLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBinaryOptionsMarketLaunchResponse();
  }

  factory MsgBinaryOptionsMarketLaunchResponse.deserialize(List<int> bytes) {
    return MsgBinaryOptionsMarketLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBinaryOptionsMarketLaunchResponse;
}

class MsgBatchCommunityPoolSpend extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBatchCommunityPoolSpendResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.BatchCommunityPoolSpendProposal?
  proposal;

  const MsgBatchCommunityPoolSpend({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBatchCommunityPoolSpend",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgBatchCommunityPoolSpend.fromJson(Map<String, dynamic> json) {
    return MsgBatchCommunityPoolSpend(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.BatchCommunityPoolSpendProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .BatchCommunityPoolSpendProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgBatchCommunityPoolSpend.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBatchCommunityPoolSpend(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.BatchCommunityPoolSpendProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .BatchCommunityPoolSpendProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgBatchCommunityPoolSpend;
  @override
  MsgBatchCommunityPoolSpendResponse onServiceResponse(List<int> bytes) {
    return MsgBatchCommunityPoolSpendResponse.deserialize(bytes);
  }

  @override
  MsgBatchCommunityPoolSpendResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCommunityPoolSpendResponse.fromJson(json);
  }
}

class MsgBatchCommunityPoolSpendResponse extends CosmosProtoMessage {
  const MsgBatchCommunityPoolSpendResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgBatchCommunityPoolSpendResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBatchCommunityPoolSpendResponse();
  }

  factory MsgBatchCommunityPoolSpendResponse.deserialize(List<int> bytes) {
    return MsgBatchCommunityPoolSpendResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBatchCommunityPoolSpendResponse;
}

class MsgSpotMarketParamUpdate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSpotMarketParamUpdateResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.SpotMarketParamUpdateProposal? proposal;

  const MsgSpotMarketParamUpdate({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgSpotMarketParamUpdate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgSpotMarketParamUpdate.fromJson(Map<String, dynamic> json) {
    return MsgSpotMarketParamUpdate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.SpotMarketParamUpdateProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .SpotMarketParamUpdateProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSpotMarketParamUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSpotMarketParamUpdate(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.SpotMarketParamUpdateProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .SpotMarketParamUpdateProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgSpotMarketParamUpdate;
  @override
  MsgSpotMarketParamUpdateResponse onServiceResponse(List<int> bytes) {
    return MsgSpotMarketParamUpdateResponse.deserialize(bytes);
  }

  @override
  MsgSpotMarketParamUpdateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSpotMarketParamUpdateResponse.fromJson(json);
  }
}

class MsgSpotMarketParamUpdateResponse extends CosmosProtoMessage {
  const MsgSpotMarketParamUpdateResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSpotMarketParamUpdateResponse.fromJson(Map<String, dynamic> json) {
    return MsgSpotMarketParamUpdateResponse();
  }

  factory MsgSpotMarketParamUpdateResponse.deserialize(List<int> bytes) {
    return MsgSpotMarketParamUpdateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgSpotMarketParamUpdateResponse;
}

class MsgDerivativeMarketParamUpdate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDerivativeMarketParamUpdateResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.DerivativeMarketParamUpdateProposal?
  proposal;

  const MsgDerivativeMarketParamUpdate({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgDerivativeMarketParamUpdate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgDerivativeMarketParamUpdate.fromJson(Map<String, dynamic> json) {
    return MsgDerivativeMarketParamUpdate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.DerivativeMarketParamUpdateProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .DerivativeMarketParamUpdateProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDerivativeMarketParamUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDerivativeMarketParamUpdate(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.DerivativeMarketParamUpdateProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .DerivativeMarketParamUpdateProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgDerivativeMarketParamUpdate;
  @override
  MsgDerivativeMarketParamUpdateResponse onServiceResponse(List<int> bytes) {
    return MsgDerivativeMarketParamUpdateResponse.deserialize(bytes);
  }

  @override
  MsgDerivativeMarketParamUpdateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDerivativeMarketParamUpdateResponse.fromJson(json);
  }
}

class MsgDerivativeMarketParamUpdateResponse extends CosmosProtoMessage {
  const MsgDerivativeMarketParamUpdateResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDerivativeMarketParamUpdateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgDerivativeMarketParamUpdateResponse();
  }

  factory MsgDerivativeMarketParamUpdateResponse.deserialize(List<int> bytes) {
    return MsgDerivativeMarketParamUpdateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgDerivativeMarketParamUpdateResponse;
}

class MsgBinaryOptionsMarketParamUpdate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBinaryOptionsMarketParamUpdateResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.BinaryOptionsMarketParamUpdateProposal?
  proposal;

  const MsgBinaryOptionsMarketParamUpdate({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgBinaryOptionsMarketParamUpdate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgBinaryOptionsMarketParamUpdate.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBinaryOptionsMarketParamUpdate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.BinaryOptionsMarketParamUpdateProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .BinaryOptionsMarketParamUpdateProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgBinaryOptionsMarketParamUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBinaryOptionsMarketParamUpdate(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.BinaryOptionsMarketParamUpdateProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .BinaryOptionsMarketParamUpdateProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBinaryOptionsMarketParamUpdate;
  @override
  MsgBinaryOptionsMarketParamUpdateResponse onServiceResponse(List<int> bytes) {
    return MsgBinaryOptionsMarketParamUpdateResponse.deserialize(bytes);
  }

  @override
  MsgBinaryOptionsMarketParamUpdateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBinaryOptionsMarketParamUpdateResponse.fromJson(json);
  }
}

class MsgBinaryOptionsMarketParamUpdateResponse extends CosmosProtoMessage {
  const MsgBinaryOptionsMarketParamUpdateResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgBinaryOptionsMarketParamUpdateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBinaryOptionsMarketParamUpdateResponse();
  }

  factory MsgBinaryOptionsMarketParamUpdateResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgBinaryOptionsMarketParamUpdateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgBinaryOptionsMarketParamUpdateResponse;
}

class MsgMarketForcedSettlement extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgMarketForcedSettlementResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.MarketForcedSettlementProposal? proposal;

  const MsgMarketForcedSettlement({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgMarketForcedSettlement",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgMarketForcedSettlement.fromJson(Map<String, dynamic> json) {
    return MsgMarketForcedSettlement(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.MarketForcedSettlementProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .MarketForcedSettlementProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgMarketForcedSettlement.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMarketForcedSettlement(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.MarketForcedSettlementProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .MarketForcedSettlementProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgMarketForcedSettlement;
  @override
  MsgMarketForcedSettlementResponse onServiceResponse(List<int> bytes) {
    return MsgMarketForcedSettlementResponse.deserialize(bytes);
  }

  @override
  MsgMarketForcedSettlementResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgMarketForcedSettlementResponse.fromJson(json);
  }
}

class MsgMarketForcedSettlementResponse extends CosmosProtoMessage {
  const MsgMarketForcedSettlementResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgMarketForcedSettlementResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgMarketForcedSettlementResponse();
  }

  factory MsgMarketForcedSettlementResponse.deserialize(List<int> bytes) {
    return MsgMarketForcedSettlementResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgMarketForcedSettlementResponse;
}

class MsgTradingRewardCampaignLaunch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgTradingRewardCampaignLaunchResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.TradingRewardCampaignLaunchProposal?
  proposal;

  const MsgTradingRewardCampaignLaunch({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgTradingRewardCampaignLaunch",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgTradingRewardCampaignLaunch.fromJson(Map<String, dynamic> json) {
    return MsgTradingRewardCampaignLaunch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.TradingRewardCampaignLaunchProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .TradingRewardCampaignLaunchProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgTradingRewardCampaignLaunch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTradingRewardCampaignLaunch(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.TradingRewardCampaignLaunchProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .TradingRewardCampaignLaunchProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgTradingRewardCampaignLaunch;
  @override
  MsgTradingRewardCampaignLaunchResponse onServiceResponse(List<int> bytes) {
    return MsgTradingRewardCampaignLaunchResponse.deserialize(bytes);
  }

  @override
  MsgTradingRewardCampaignLaunchResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardCampaignLaunchResponse.fromJson(json);
  }
}

class MsgTradingRewardCampaignLaunchResponse extends CosmosProtoMessage {
  const MsgTradingRewardCampaignLaunchResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgTradingRewardCampaignLaunchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardCampaignLaunchResponse();
  }

  factory MsgTradingRewardCampaignLaunchResponse.deserialize(List<int> bytes) {
    return MsgTradingRewardCampaignLaunchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgTradingRewardCampaignLaunchResponse;
}

class MsgExchangeEnable extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExchangeEnableResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.ExchangeEnableProposal? proposal;

  const MsgExchangeEnable({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgExchangeEnable",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgExchangeEnable.fromJson(Map<String, dynamic> json) {
    return MsgExchangeEnable(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.ExchangeEnableProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .ExchangeEnableProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExchangeEnable.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExchangeEnable(
      sender: decode.getString<String?>(1),
      proposal: decode
          .messageTo<injective_exchange_v2_proposal.ExchangeEnableProposal?>(
            2,
            (b) => injective_exchange_v2_proposal
                .ExchangeEnableProposal.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgExchangeEnable;
  @override
  MsgExchangeEnableResponse onServiceResponse(List<int> bytes) {
    return MsgExchangeEnableResponse.deserialize(bytes);
  }

  @override
  MsgExchangeEnableResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExchangeEnableResponse.fromJson(json);
  }
}

class MsgExchangeEnableResponse extends CosmosProtoMessage {
  const MsgExchangeEnableResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgExchangeEnableResponse.fromJson(Map<String, dynamic> json) {
    return MsgExchangeEnableResponse();
  }

  factory MsgExchangeEnableResponse.deserialize(List<int> bytes) {
    return MsgExchangeEnableResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgExchangeEnableResponse;
}

class MsgTradingRewardCampaignUpdate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgTradingRewardCampaignUpdateResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.TradingRewardCampaignUpdateProposal?
  proposal;

  const MsgTradingRewardCampaignUpdate({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgTradingRewardCampaignUpdate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgTradingRewardCampaignUpdate.fromJson(Map<String, dynamic> json) {
    return MsgTradingRewardCampaignUpdate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.TradingRewardCampaignUpdateProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .TradingRewardCampaignUpdateProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgTradingRewardCampaignUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTradingRewardCampaignUpdate(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.TradingRewardCampaignUpdateProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .TradingRewardCampaignUpdateProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgTradingRewardCampaignUpdate;
  @override
  MsgTradingRewardCampaignUpdateResponse onServiceResponse(List<int> bytes) {
    return MsgTradingRewardCampaignUpdateResponse.deserialize(bytes);
  }

  @override
  MsgTradingRewardCampaignUpdateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardCampaignUpdateResponse.fromJson(json);
  }
}

class MsgTradingRewardCampaignUpdateResponse extends CosmosProtoMessage {
  const MsgTradingRewardCampaignUpdateResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgTradingRewardCampaignUpdateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardCampaignUpdateResponse();
  }

  factory MsgTradingRewardCampaignUpdateResponse.deserialize(List<int> bytes) {
    return MsgTradingRewardCampaignUpdateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgTradingRewardCampaignUpdateResponse;
}

class MsgTradingRewardPendingPointsUpdate extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgTradingRewardPendingPointsUpdateResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.TradingRewardPendingPointsUpdateProposal?
  proposal;

  const MsgTradingRewardPendingPointsUpdate({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgTradingRewardPendingPointsUpdate",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgTradingRewardPendingPointsUpdate.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardPendingPointsUpdate(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.TradingRewardPendingPointsUpdateProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .TradingRewardPendingPointsUpdateProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgTradingRewardPendingPointsUpdate.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTradingRewardPendingPointsUpdate(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.TradingRewardPendingPointsUpdateProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .TradingRewardPendingPointsUpdateProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgTradingRewardPendingPointsUpdate;
  @override
  MsgTradingRewardPendingPointsUpdateResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgTradingRewardPendingPointsUpdateResponse.deserialize(bytes);
  }

  @override
  MsgTradingRewardPendingPointsUpdateResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardPendingPointsUpdateResponse.fromJson(json);
  }
}

class MsgTradingRewardPendingPointsUpdateResponse extends CosmosProtoMessage {
  const MsgTradingRewardPendingPointsUpdateResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgTradingRewardPendingPointsUpdateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgTradingRewardPendingPointsUpdateResponse();
  }

  factory MsgTradingRewardPendingPointsUpdateResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgTradingRewardPendingPointsUpdateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgTradingRewardPendingPointsUpdateResponse;
}

class MsgFeeDiscount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFeeDiscountResponse>,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.FeeDiscountProposal? proposal;

  const MsgFeeDiscount({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "exchange/MsgFeeDiscount"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgFeeDiscount.fromJson(Map<String, dynamic> json) {
    return MsgFeeDiscount(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.FeeDiscountProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) =>
                injective_exchange_v2_proposal.FeeDiscountProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgFeeDiscount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFeeDiscount(
      sender: decode.getString<String?>(1),
      proposal: decode
          .messageTo<injective_exchange_v2_proposal.FeeDiscountProposal?>(
            2,
            (b) => injective_exchange_v2_proposal
                .FeeDiscountProposal.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgFeeDiscount;
  @override
  MsgFeeDiscountResponse onServiceResponse(List<int> bytes) {
    return MsgFeeDiscountResponse.deserialize(bytes);
  }

  @override
  MsgFeeDiscountResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgFeeDiscountResponse.fromJson(json);
  }
}

class MsgFeeDiscountResponse extends CosmosProtoMessage {
  const MsgFeeDiscountResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgFeeDiscountResponse.fromJson(Map<String, dynamic> json) {
    return MsgFeeDiscountResponse();
  }

  factory MsgFeeDiscountResponse.deserialize(List<int> bytes) {
    return MsgFeeDiscountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgFeeDiscountResponse;
}

class MsgAtomicMarketOrderFeeMultiplierSchedule extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgAtomicMarketOrderFeeMultiplierScheduleResponse
        >,
        ICosmosProtoAminoMessage {
  /// message sender, that is also the TX signer
  final String? sender;

  final injective_exchange_v2_proposal.AtomicMarketOrderFeeMultiplierScheduleProposal?
  proposal;

  const MsgAtomicMarketOrderFeeMultiplierSchedule({this.sender, this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgAtomicMarketOrderFeeMultiplierSchedule",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal': proposal?.toJson()};
  }

  factory MsgAtomicMarketOrderFeeMultiplierSchedule.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAtomicMarketOrderFeeMultiplierSchedule(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposal: json.valueTo<
        injective_exchange_v2_proposal.AtomicMarketOrderFeeMultiplierScheduleProposal?,
        Map<String, dynamic>
      >(
        key: 'proposal',
        parse:
            (v) => injective_exchange_v2_proposal
                .AtomicMarketOrderFeeMultiplierScheduleProposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgAtomicMarketOrderFeeMultiplierSchedule.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAtomicMarketOrderFeeMultiplierSchedule(
      sender: decode.getString<String?>(1),
      proposal: decode.messageTo<
        injective_exchange_v2_proposal.AtomicMarketOrderFeeMultiplierScheduleProposal?
      >(
        2,
        (b) => injective_exchange_v2_proposal
            .AtomicMarketOrderFeeMultiplierScheduleProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgAtomicMarketOrderFeeMultiplierSchedule;
  @override
  MsgAtomicMarketOrderFeeMultiplierScheduleResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgAtomicMarketOrderFeeMultiplierScheduleResponse.deserialize(bytes);
  }

  @override
  MsgAtomicMarketOrderFeeMultiplierScheduleResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAtomicMarketOrderFeeMultiplierScheduleResponse.fromJson(json);
  }
}

class MsgAtomicMarketOrderFeeMultiplierScheduleResponse
    extends CosmosProtoMessage {
  const MsgAtomicMarketOrderFeeMultiplierScheduleResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgAtomicMarketOrderFeeMultiplierScheduleResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAtomicMarketOrderFeeMultiplierScheduleResponse();
  }

  factory MsgAtomicMarketOrderFeeMultiplierScheduleResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgAtomicMarketOrderFeeMultiplierScheduleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgAtomicMarketOrderFeeMultiplierScheduleResponse;
}

/// MsgCancelPostOnlyMode defines a message for canceling post-only mode
class MsgCancelPostOnlyMode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelPostOnlyModeResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  const MsgCancelPostOnlyMode({this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgCancelPostOnlyMode",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender};
  }

  factory MsgCancelPostOnlyMode.fromJson(Map<String, dynamic> json) {
    return MsgCancelPostOnlyMode(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgCancelPostOnlyMode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelPostOnlyMode(sender: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgCancelPostOnlyMode;
  @override
  MsgCancelPostOnlyModeResponse onServiceResponse(List<int> bytes) {
    return MsgCancelPostOnlyModeResponse.deserialize(bytes);
  }

  @override
  MsgCancelPostOnlyModeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelPostOnlyModeResponse.fromJson(json);
  }
}

/// MsgCancelPostOnlyModeResponse defines the response for MsgCancelPostOnlyMode
class MsgCancelPostOnlyModeResponse extends CosmosProtoMessage {
  const MsgCancelPostOnlyModeResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCancelPostOnlyModeResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelPostOnlyModeResponse();
  }

  factory MsgCancelPostOnlyModeResponse.deserialize(List<int> bytes) {
    return MsgCancelPostOnlyModeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgCancelPostOnlyModeResponse;
}

/// MsgActivatePostOnlyMode defines a message to turn on the post-only mode for a
/// number of blocks
class MsgActivatePostOnlyMode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgActivatePostOnlyModeResponse>,
        ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// the number of blocks to activate post-only mode for
  final int? blocksAmount;

  const MsgActivatePostOnlyMode({this.sender, this.blocksAmount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgActivatePostOnlyMode",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint32(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, blocksAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'blocks_amount': blocksAmount};
  }

  factory MsgActivatePostOnlyMode.fromJson(Map<String, dynamic> json) {
    return MsgActivatePostOnlyMode(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      blocksAmount: json.valueAsInt<int?>(
        'blocks_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgActivatePostOnlyMode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgActivatePostOnlyMode(
      sender: decode.getString<String?>(1),
      blocksAmount: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgActivatePostOnlyMode;
  @override
  MsgActivatePostOnlyModeResponse onServiceResponse(List<int> bytes) {
    return MsgActivatePostOnlyModeResponse.deserialize(bytes);
  }

  @override
  MsgActivatePostOnlyModeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgActivatePostOnlyModeResponse.fromJson(json);
  }
}

/// MsgActivatePostOnlyModeResponse defines the response for
/// MsgActivatePostOnlyMode
class MsgActivatePostOnlyModeResponse extends CosmosProtoMessage {
  const MsgActivatePostOnlyModeResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgActivatePostOnlyModeResponse.fromJson(Map<String, dynamic> json) {
    return MsgActivatePostOnlyModeResponse();
  }

  factory MsgActivatePostOnlyModeResponse.deserialize(List<int> bytes) {
    return MsgActivatePostOnlyModeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgActivatePostOnlyModeResponse;
}

/// MsgLiquidateCrossMarginPool atomically closes all positions in a
/// cross-margin pool, netting surplus from profitable positions against deficits
/// before touching the insurance fund.
class MsgLiquidateCrossMarginPool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLiquidateCrossMarginPoolResponse>,
        ICosmosProtoAminoMessage {
  /// the liquidator's Injective address
  final String? sender;

  /// the cross-margin subaccount to liquidate
  final String? subaccountId;

  /// identifies which cross-margin pool (by quote denom)
  final String? quoteDenom;

  const MsgLiquidateCrossMarginPool({
    this.sender,
    this.subaccountId,
    this.quoteDenom,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "exchange/MsgLiquidateCrossMarginPool",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, subaccountId, quoteDenom];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subaccount_id': subaccountId,
      'quote_denom': quoteDenom,
    };
  }

  factory MsgLiquidateCrossMarginPool.fromJson(Map<String, dynamic> json) {
    return MsgLiquidateCrossMarginPool(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      subaccountId: json.valueAsString<String?>(
        'subaccount_id',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLiquidateCrossMarginPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLiquidateCrossMarginPool(
      sender: decode.getString<String?>(1),
      subaccountId: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveExchangeV2MsgLiquidateCrossMarginPool;
  @override
  MsgLiquidateCrossMarginPoolResponse onServiceResponse(List<int> bytes) {
    return MsgLiquidateCrossMarginPoolResponse.deserialize(bytes);
  }

  @override
  MsgLiquidateCrossMarginPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgLiquidateCrossMarginPoolResponse.fromJson(json);
  }
}

/// MsgLiquidateCrossMarginPoolResponse defines the
/// Msg/LiquidateCrossMarginPool response type.
class MsgLiquidateCrossMarginPoolResponse extends CosmosProtoMessage {
  const MsgLiquidateCrossMarginPoolResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgLiquidateCrossMarginPoolResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgLiquidateCrossMarginPoolResponse();
  }

  factory MsgLiquidateCrossMarginPoolResponse.deserialize(List<int> bytes) {
    return MsgLiquidateCrossMarginPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveExchangeV2MsgLiquidateCrossMarginPoolResponse;
}
