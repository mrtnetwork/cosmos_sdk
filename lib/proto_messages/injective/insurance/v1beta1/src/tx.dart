import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/insurance/v1beta1/src/insurance.dart"
    as injective_insurance_v1beta1_insurance;

/// MsgCreateInsuranceFund a message to create an insurance fund for a derivative
/// market.
class MsgCreateInsuranceFund extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateInsuranceFundResponse>,
        ICosmosProtoAminoMessage {
  /// Creator of the insurance fund.
  final String? sender;

  /// Ticker for the derivative market.
  final String? ticker;

  /// Coin denom to use for the market quote denom
  final String? quoteDenom;

  /// Oracle base currency of the derivative market OR the oracle symbol for the
  /// binary options market.
  final String? oracleBase;

  /// Oracle quote currency of the derivative market OR the oracle provider for
  /// the binary options market.
  final String? oracleQuote;

  /// Oracle type of the binary options or derivative market
  final injective_oracle_v1beta1_oracle.OracleType? oracleType;

  /// Expiration time of the derivative market. Should be -1 for perpetual or -2
  /// for binary options markets.
  final BigInt? expiry;

  /// Initial deposit of the insurance fund
  final cosmos_base_v1beta1_coin.Coin? initialDeposit;

  const MsgCreateInsuranceFund({
    this.sender,
    this.ticker,
    this.quoteDenom,
    this.oracleBase,
    this.oracleQuote,
    this.oracleType,
    this.expiry,
    this.initialDeposit,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "insurance/MsgCreateInsuranceFund",
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
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.message(8, options: const []),
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
    expiry,
    initialDeposit,
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
      'expiry': expiry?.toString(),
      'initial_deposit': initialDeposit?.toJson(),
    };
  }

  factory MsgCreateInsuranceFund.fromJson(Map<String, dynamic> json) {
    return MsgCreateInsuranceFund(
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
      expiry: json.valueAsBigInt<BigInt?>('expiry', acceptCamelCase: true),
      initialDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'initial_deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgCreateInsuranceFund.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateInsuranceFund(
      sender: decode.getString<String?>(1),
      ticker: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      oracleBase: decode.getString<String?>(4),
      oracleQuote: decode.getString<String?>(5),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        6,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      expiry: decode.getBigInt<BigInt?>(7),
      initialDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        8,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1MsgCreateInsuranceFund;
  @override
  MsgCreateInsuranceFundResponse onServiceResponse(List<int> bytes) {
    return MsgCreateInsuranceFundResponse.deserialize(bytes);
  }

  @override
  MsgCreateInsuranceFundResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateInsuranceFundResponse.fromJson(json);
  }
}

class MsgCreateInsuranceFundResponse extends CosmosProtoMessage {
  const MsgCreateInsuranceFundResponse();

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

  factory MsgCreateInsuranceFundResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateInsuranceFundResponse();
  }

  factory MsgCreateInsuranceFundResponse.deserialize(List<int> bytes) {
    return MsgCreateInsuranceFundResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1MsgCreateInsuranceFundResponse;
}

/// MsgUnderwrite defines a message for depositing coins to underwrite an
/// insurance fund
class MsgUnderwrite extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnderwriteResponse>,
        ICosmosProtoAminoMessage {
  /// Address of the underwriter.
  final String? sender;

  /// MarketID of the insurance fund.
  final String? marketId;

  /// Amount of quote_denom to underwrite the insurance fund.
  final cosmos_base_v1beta1_coin.Coin? deposit;

  const MsgUnderwrite({this.sender, this.marketId, this.deposit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "insurance/MsgUnderwrite"),
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
  List<Object?> get protoValues => [sender, marketId, deposit];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'deposit': deposit?.toJson(),
    };
  }

  factory MsgUnderwrite.fromJson(Map<String, dynamic> json) {
    return MsgUnderwrite(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      deposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'deposit',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUnderwrite.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnderwrite(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      deposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1MsgUnderwrite;
  @override
  MsgUnderwriteResponse onServiceResponse(List<int> bytes) {
    return MsgUnderwriteResponse.deserialize(bytes);
  }

  @override
  MsgUnderwriteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUnderwriteResponse.fromJson(json);
  }
}

class MsgUnderwriteResponse extends CosmosProtoMessage {
  const MsgUnderwriteResponse();

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

  factory MsgUnderwriteResponse.fromJson(Map<String, dynamic> json) {
    return MsgUnderwriteResponse();
  }

  factory MsgUnderwriteResponse.deserialize(List<int> bytes) {
    return MsgUnderwriteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1MsgUnderwriteResponse;
}

/// MsgRequestRedemption defines a message for requesting a redemption of the
/// sender's insurance fund tokens
class MsgRequestRedemption extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRequestRedemptionResponse>,
        ICosmosProtoAminoMessage {
  /// Address of the underwriter requesting a redemption.
  final String? sender;

  /// MarketID of the insurance fund.
  final String? marketId;

  /// Insurance fund share token amount to be redeemed.
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgRequestRedemption({this.sender, this.marketId, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "insurance/MsgRequestRedemption",
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
  List<Object?> get protoValues => [sender, marketId, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'market_id': marketId,
      'amount': amount?.toJson(),
    };
  }

  factory MsgRequestRedemption.fromJson(Map<String, dynamic> json) {
    return MsgRequestRedemption(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgRequestRedemption.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRequestRedemption(
      sender: decode.getString<String?>(1),
      marketId: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1MsgRequestRedemption;
  @override
  MsgRequestRedemptionResponse onServiceResponse(List<int> bytes) {
    return MsgRequestRedemptionResponse.deserialize(bytes);
  }

  @override
  MsgRequestRedemptionResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRequestRedemptionResponse.fromJson(json);
  }
}

class MsgRequestRedemptionResponse extends CosmosProtoMessage {
  const MsgRequestRedemptionResponse();

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

  factory MsgRequestRedemptionResponse.fromJson(Map<String, dynamic> json) {
    return MsgRequestRedemptionResponse();
  }

  factory MsgRequestRedemptionResponse.deserialize(List<int> bytes) {
    return MsgRequestRedemptionResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1MsgRequestRedemptionResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the insurance parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_insurance_v1beta1_insurance.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "insurance/MsgUpdateParams",
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
        injective_insurance_v1beta1_insurance.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_insurance_v1beta1_insurance.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_insurance_v1beta1_insurance.Params?>(
        2,
        (b) => injective_insurance_v1beta1_insurance.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1MsgUpdateParamsResponse;
}

/// MsgClaimVoucher defines a message for claiming an outstanding voucher
class MsgClaimVoucher extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimVoucherResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address.
  final String? sender;

  /// The token denom of the voucher to claim.
  final String? denom;

  const MsgClaimVoucher({this.sender, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "insurance/MsgClaimVoucher",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'denom': denom};
  }

  factory MsgClaimVoucher.fromJson(Map<String, dynamic> json) {
    return MsgClaimVoucher(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory MsgClaimVoucher.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimVoucher(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1MsgClaimVoucher;
  @override
  MsgClaimVoucherResponse onServiceResponse(List<int> bytes) {
    return MsgClaimVoucherResponse.deserialize(bytes);
  }

  @override
  MsgClaimVoucherResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimVoucherResponse.fromJson(json);
  }
}

class MsgClaimVoucherResponse extends CosmosProtoMessage {
  const MsgClaimVoucherResponse();

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

  factory MsgClaimVoucherResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimVoucherResponse();
  }

  factory MsgClaimVoucherResponse.deserialize(List<int> bytes) {
    return MsgClaimVoucherResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1MsgClaimVoucherResponse;
}
