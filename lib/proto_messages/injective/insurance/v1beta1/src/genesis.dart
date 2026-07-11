import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/insurance/v1beta1/src/insurance.dart"
    as injective_insurance_v1beta1_insurance;
import "package:cosmos_sdk/proto_messages/injective/common/vouchers/v1/src/vouchers.dart"
    as injective_common_vouchers_v1_vouchers;

/// GenesisState defines the insurance module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines all the parameters of related to insurance.
  final injective_insurance_v1beta1_insurance.Params? params;

  /// insurance_funds describes the insurance funds available for derivative
  /// markets
  final List<injective_insurance_v1beta1_insurance.InsuranceFund>
  insuranceFunds;

  /// redemption_schedule describes the redemption requests pending
  final List<injective_insurance_v1beta1_insurance.RedemptionSchedule>
  redemptionSchedule;

  /// next_share_denom_id describes the next share denom id to be used for newly
  /// creating insurance fund incremented by 1 per insurance fund creation
  final BigInt? nextShareDenomId;

  /// next_redemption_schedule_id describes next redemption schedule id to be
  /// used for next schedule incremented by 1 per redemption request
  final BigInt? nextRedemptionScheduleId;

  /// failed_redemption_schedules describes redemptions that failed during
  /// settlement and are preserved for manual resolution
  final List<injective_insurance_v1beta1_insurance.FailedRedemptionSchedule>
  failedRedemptionSchedules;

  /// next_failed_redemption_schedule_id describes the next id for failed
  /// redemption schedules, incremented by 1 per failed settlement
  final BigInt? nextFailedRedemptionScheduleId;

  /// outstanding vouchers (failed redemption deliveries)
  final List<injective_common_vouchers_v1_vouchers.AddressVoucher> vouchers;

  const GenesisState({
    this.params,
    this.insuranceFunds = const [],
    this.redemptionSchedule = const [],
    this.nextShareDenomId,
    this.nextRedemptionScheduleId,
    this.failedRedemptionSchedules = const [],
    this.nextFailedRedemptionScheduleId,
    this.vouchers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    params,
    insuranceFunds,
    redemptionSchedule,
    nextShareDenomId,
    nextRedemptionScheduleId,
    failedRedemptionSchedules,
    nextFailedRedemptionScheduleId,
    vouchers,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'insurance_funds': insuranceFunds.map((e) => e.toJson()).toList(),
      'redemption_schedule': redemptionSchedule.map((e) => e.toJson()).toList(),
      'next_share_denom_id': nextShareDenomId?.toString(),
      'next_redemption_schedule_id': nextRedemptionScheduleId?.toString(),
      'failed_redemption_schedules':
          failedRedemptionSchedules.map((e) => e.toJson()).toList(),
      'next_failed_redemption_schedule_id':
          nextFailedRedemptionScheduleId?.toString(),
      'vouchers': vouchers.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json.valueTo<
        injective_insurance_v1beta1_insurance.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_insurance_v1beta1_insurance.Params.fromJson(v),
        acceptCamelCase: true,
      ),
      insuranceFunds:
          (json.valueEnsureAsList<dynamic>(
                'insurance_funds',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_insurance_v1beta1_insurance.InsuranceFund,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_insurance_v1beta1_insurance
                          .InsuranceFund.fromJson(v),
                ),
              )
              .toList(),
      redemptionSchedule:
          (json.valueEnsureAsList<dynamic>(
                'redemption_schedule',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_insurance_v1beta1_insurance.RedemptionSchedule,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_insurance_v1beta1_insurance
                          .RedemptionSchedule.fromJson(v),
                ),
              )
              .toList(),
      nextShareDenomId: json.valueAsBigInt<BigInt?>(
        'next_share_denom_id',
        acceptCamelCase: true,
      ),
      nextRedemptionScheduleId: json.valueAsBigInt<BigInt?>(
        'next_redemption_schedule_id',
        acceptCamelCase: true,
      ),
      failedRedemptionSchedules:
          (json.valueEnsureAsList<dynamic>(
                'failed_redemption_schedules',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_insurance_v1beta1_insurance.FailedRedemptionSchedule,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_insurance_v1beta1_insurance
                          .FailedRedemptionSchedule.fromJson(v),
                ),
              )
              .toList(),
      nextFailedRedemptionScheduleId: json.valueAsBigInt<BigInt?>(
        'next_failed_redemption_schedule_id',
        acceptCamelCase: true,
      ),
      vouchers:
          (json.valueEnsureAsList<dynamic>('vouchers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_common_vouchers_v1_vouchers.AddressVoucher,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_common_vouchers_v1_vouchers
                          .AddressVoucher.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_insurance_v1beta1_insurance.Params?>(
        1,
        (b) => injective_insurance_v1beta1_insurance.Params.deserialize(b),
      ),
      insuranceFunds:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_insurance_v1beta1_insurance
                    .InsuranceFund.deserialize(b),
              )
              .toList(),
      redemptionSchedule:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_insurance_v1beta1_insurance
                    .RedemptionSchedule.deserialize(b),
              )
              .toList(),
      nextShareDenomId: decode.getBigInt<BigInt?>(4),
      nextRedemptionScheduleId: decode.getBigInt<BigInt?>(5),
      failedRedemptionSchedules:
          decode
              .getListOfBytes(6)
              .map(
                (b) => injective_insurance_v1beta1_insurance
                    .FailedRedemptionSchedule.deserialize(b),
              )
              .toList(),
      nextFailedRedemptionScheduleId: decode.getBigInt<BigInt?>(7),
      vouchers:
          decode
              .getListOfBytes(8)
              .map(
                (b) => injective_common_vouchers_v1_vouchers
                    .AddressVoucher.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveInsuranceV1beta1GenesisState;
}
