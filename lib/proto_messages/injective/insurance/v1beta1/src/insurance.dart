import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class Params extends CosmosProtoMessage {
  /// default_redemption_notice_period_duration defines the default minimum
  /// notice period duration that must pass after an underwriter sends a
  /// redemption request before the underwriter can claim his tokens
  final google_protobuf_duration.Duration?
  defaultRedemptionNoticePeriodDuration;

  const Params({this.defaultRedemptionNoticePeriodDuration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "insurance/Params"),
      ],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [defaultRedemptionNoticePeriodDuration];

  @override
  Map<String, dynamic> toJson() {
    return {
      'default_redemption_notice_period_duration':
          defaultRedemptionNoticePeriodDuration?.encodeString(asNanos: true),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      defaultRedemptionNoticePeriodDuration: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'default_redemption_notice_period_duration',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      defaultRedemptionNoticePeriodDuration: decode
          .messageTo<google_protobuf_duration.Duration?>(
            1,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1Params;
}

class InsuranceFund extends CosmosProtoMessage {
  /// deposit denomination for the given insurance fund
  final String? depositDenom;

  /// insurance fund pool token denomination for the given insurance fund
  final String? insurancePoolTokenDenom;

  /// redemption_notice_period_duration defines the minimum notice period
  /// duration that must pass after an underwriter sends a redemption request
  /// before the underwriter can claim his tokens
  final google_protobuf_duration.Duration? redemptionNoticePeriodDuration;

  /// balance of fund
  final String? balance;

  /// total share tokens minted
  final String? totalShare;

  /// marketID of the derivative market
  final String? marketId;

  /// ticker of the derivative market
  final String? marketTicker;

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

  const InsuranceFund({
    this.depositDenom,
    this.insurancePoolTokenDenom,
    this.redemptionNoticePeriodDuration,
    this.balance,
    this.totalShare,
    this.marketId,
    this.marketTicker,
    this.oracleBase,
    this.oracleQuote,
    this.oracleType,
    this.expiry,
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
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.enumType(10),
        ProtoFieldConfig.int64(11),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    depositDenom,
    insurancePoolTokenDenom,
    redemptionNoticePeriodDuration,
    balance,
    totalShare,
    marketId,
    marketTicker,
    oracleBase,
    oracleQuote,
    oracleType,
    expiry,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deposit_denom': depositDenom,
      'insurance_pool_token_denom': insurancePoolTokenDenom,
      'redemption_notice_period_duration': redemptionNoticePeriodDuration
          ?.encodeString(asNanos: true),
      'balance': balance,
      'total_share': totalShare,
      'market_id': marketId,
      'market_ticker': marketTicker,
      'oracle_base': oracleBase,
      'oracle_quote': oracleQuote,
      'oracle_type': oracleType?.protoName,
      'expiry': expiry?.toString(),
    };
  }

  factory InsuranceFund.fromJson(Map<String, dynamic> json) {
    return InsuranceFund(
      depositDenom: json.valueAsString<String?>(
        'deposit_denom',
        acceptCamelCase: true,
      ),
      insurancePoolTokenDenom: json.valueAsString<String?>(
        'insurance_pool_token_denom',
        acceptCamelCase: true,
      ),
      redemptionNoticePeriodDuration: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'redemption_notice_period_duration',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      balance: json.valueAsString<String?>('balance', acceptCamelCase: true),
      totalShare: json.valueAsString<String?>(
        'total_share',
        acceptCamelCase: true,
      ),
      marketId: json.valueAsString<String?>('market_id', acceptCamelCase: true),
      marketTicker: json.valueAsString<String?>(
        'market_ticker',
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
    );
  }

  factory InsuranceFund.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InsuranceFund(
      depositDenom: decode.getString<String?>(1),
      insurancePoolTokenDenom: decode.getString<String?>(2),
      redemptionNoticePeriodDuration: decode
          .messageTo<google_protobuf_duration.Duration?>(
            3,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
      balance: decode.getString<String?>(4),
      totalShare: decode.getString<String?>(5),
      marketId: decode.getString<String?>(6),
      marketTicker: decode.getString<String?>(7),
      oracleBase: decode.getString<String?>(8),
      oracleQuote: decode.getString<String?>(9),
      oracleType: decode.getEnum<injective_oracle_v1beta1_oracle.OracleType?>(
        10,
        injective_oracle_v1beta1_oracle.OracleType.values,
      ),
      expiry: decode.getBigInt<BigInt?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1InsuranceFund;
}

class RedemptionSchedule extends CosmosProtoMessage {
  /// id of redemption schedule
  final BigInt? id;

  /// marketId of insurance fund for the redemption
  final String? marketId;

  /// address of the redeemer
  final String? redeemer;

  /// the time after which the redemption can be claimed
  final google_protobuf_timestamp.Timestamp? claimableRedemptionTime;

  /// the insurance_pool_token amount to redeem
  final cosmos_base_v1beta1_coin.Coin? redemptionAmount;

  const RedemptionSchedule({
    this.id,
    this.marketId,
    this.redeemer,
    this.claimableRedemptionTime,
    this.redemptionAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    marketId,
    redeemer,
    claimableRedemptionTime,
    redemptionAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'marketId': marketId,
      'redeemer': redeemer,
      'claimable_redemption_time': claimableRedemptionTime?.toRfc3339(),
      'redemption_amount': redemptionAmount?.toJson(),
    };
  }

  factory RedemptionSchedule.fromJson(Map<String, dynamic> json) {
    return RedemptionSchedule(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      marketId: json.valueAsString<String?>('marketId', acceptCamelCase: true),
      redeemer: json.valueAsString<String?>('redeemer', acceptCamelCase: true),
      claimableRedemptionTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'claimable_redemption_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      redemptionAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'redemption_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory RedemptionSchedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RedemptionSchedule(
      id: decode.getBigInt<BigInt?>(1),
      marketId: decode.getString<String?>(2),
      redeemer: decode.getString<String?>(3),
      claimableRedemptionTime: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            4,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      redemptionAmount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        5,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1RedemptionSchedule;
}

class FailedRedemptionSchedule extends CosmosProtoMessage {
  /// id of the failed redemption
  final BigInt? id;

  /// the original redemption schedule that failed to execute
  final RedemptionSchedule? schedule;

  /// the error message from the failed withdrawal attempt
  final String? err;

  const FailedRedemptionSchedule({this.id, this.schedule, this.err});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, schedule, err];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id?.toString(), 'schedule': schedule?.toJson(), 'err': err};
  }

  factory FailedRedemptionSchedule.fromJson(Map<String, dynamic> json) {
    return FailedRedemptionSchedule(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      schedule: json.valueTo<RedemptionSchedule?, Map<String, dynamic>>(
        key: 'schedule',
        parse: (v) => RedemptionSchedule.fromJson(v),
        acceptCamelCase: true,
      ),
      err: json.valueAsString<String?>('err', acceptCamelCase: true),
    );
  }

  factory FailedRedemptionSchedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FailedRedemptionSchedule(
      id: decode.getBigInt<BigInt?>(1),
      schedule: decode.messageTo<RedemptionSchedule?>(
        2,
        (b) => RedemptionSchedule.deserialize(b),
      ),
      err: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveInsuranceV1beta1FailedRedemptionSchedule;
}
