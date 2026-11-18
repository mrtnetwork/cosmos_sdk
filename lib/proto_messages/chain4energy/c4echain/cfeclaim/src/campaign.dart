import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

enum CampaignType implements ProtoEnumVariant {
  campaignTypeUnspecified(0, 'CAMPAIGN_TYPE_UNSPECIFIED'),
  default_(1, 'DEFAULT'),

  /// campaign must be enabled to add new claim records
  vestingPool(2, 'VESTING_POOL');

  const CampaignType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static CampaignType fromValue(int? value) {
    value ??= 0;
    return CampaignType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching CampaignType found for the given value. $value",
                details: {"name": "CampaignType", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static CampaignType from(Object? value) {
    value ??= 0;
    return CampaignType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching CampaignType found for the given value. $value",
                details: {"name": "CampaignType", "value": value?.toString()},
              ),
    );
  }
}

class Campaign extends CosmosProtoMessage {
  final BigInt? id;

  final String? owner;

  final String? name;

  final String? description;

  final CampaignType? campaignType;

  final bool? removableClaimRecords;

  final String? feegrantAmount;

  final String? initialClaimFreeAmount;

  final String? free;

  final bool? enabled;

  final google_protobuf_timestamp.Timestamp? startTime;

  final google_protobuf_timestamp.Timestamp? endTime;

  /// period of locked coins from claim
  final google_protobuf_duration.Duration? lockupPeriod;

  /// period of vesting coins after lockup period
  final google_protobuf_duration.Duration? vestingPeriod;

  final String? vestingPoolName;

  final List<cosmos_base_v1beta1_coin.Coin> campaignTotalAmount;

  final List<cosmos_base_v1beta1_coin.Coin> campaignCurrentAmount;

  const Campaign({
    this.id,
    this.owner,
    this.name,
    this.description,
    this.campaignType,
    this.removableClaimRecords,
    this.feegrantAmount,
    this.initialClaimFreeAmount,
    this.free,
    this.enabled,
    this.startTime,
    this.endTime,
    this.lockupPeriod,
    this.vestingPeriod,
    this.vestingPoolName,
    this.campaignTotalAmount = const [],
    this.campaignCurrentAmount = const [],
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
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.enumType(5),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.bool(10),
        ProtoFieldConfig.message(11, options: const []),
        ProtoFieldConfig.message(12, options: const []),
        ProtoFieldConfig.message(13, options: const []),
        ProtoFieldConfig.message(14, options: const []),
        ProtoFieldConfig.string(15),
        ProtoFieldConfig.repeated(
          fieldNumber: 16,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 17,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    owner,
    name,
    description,
    campaignType,
    removableClaimRecords,
    feegrantAmount,
    initialClaimFreeAmount,
    free,
    enabled,
    startTime,
    endTime,
    lockupPeriod,
    vestingPeriod,
    vestingPoolName,
    campaignTotalAmount,
    campaignCurrentAmount,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': config.encodeBigint(id),
      'owner': owner,
      'name': name,
      'description': description,
      'campaignType': config.encodeEnum(campaignType),
      'removable_claim_records': removableClaimRecords,
      'feegrant_amount': feegrantAmount,
      'initial_claim_free_amount': initialClaimFreeAmount,
      'free': free,
      'enabled': enabled,
      'start_time': startTime?.toRfc3339(),
      'end_time': endTime?.toRfc3339(),
      'lockup_period': lockupPeriod?.encodeString(asNanos: true),
      'vesting_period': vestingPeriod?.encodeString(asNanos: true),
      'vestingPoolName': vestingPoolName,
      'campaign_total_amount':
          campaignTotalAmount.map((e) => config.encodeMessage(e)).toList(),
      'campaign_current_amount':
          campaignCurrentAmount.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Campaign.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Campaign(
      id: json.valueAsBigInt<BigInt?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      campaignType: json.valueTo<CampaignType?, Object?>(
        key: 'campaignType',
        parse: (v) => CampaignType.from(v),
      ),
      removableClaimRecords: json.valueAsBool<bool?>(
        'removable_claim_records',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      feegrantAmount: json.valueAsString<String?>(
        'feegrant_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initialClaimFreeAmount: json.valueAsString<String?>(
        'initial_claim_free_amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      free: json.valueAsString<String?>(
        'free',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      enabled: json.valueAsBool<bool?>(
        'enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'start_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'end_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lockupPeriod: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'lockup_period',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      vestingPeriod: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'vesting_period',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      vestingPoolName: json.valueAsString<String?>(
        'vestingPoolName',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      campaignTotalAmount:
          (json.valueEnsureAsList<dynamic>(
                'campaign_total_amount',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      campaignCurrentAmount:
          (json.valueEnsureAsList<dynamic>(
                'campaign_current_amount',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory Campaign.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Campaign(
      id: decode.getBigInt<BigInt?>(1),
      owner: decode.getString<String?>(2),
      name: decode.getString<String?>(3),
      description: decode.getString<String?>(4),
      campaignType: decode.getEnum<CampaignType?>(5, CampaignType.values),
      removableClaimRecords: decode.getBool<bool?>(6),
      feegrantAmount: decode.getString<String?>(7),
      initialClaimFreeAmount: decode.getString<String?>(8),
      free: decode.getString<String?>(9),
      enabled: decode.getBool<bool?>(10),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        11,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        12,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      lockupPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        13,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      vestingPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        14,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      vestingPoolName: decode.getString<String?>(15),
      campaignTotalAmount:
          decode
              .getListOfBytes(16)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      campaignCurrentAmount:
          decode
              .getListOfBytes(17)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimCampaign;
}
