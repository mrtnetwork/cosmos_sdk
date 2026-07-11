import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/incentives/src/gauge.dart"
    as osmosis_incentives_gauge;

/// SplittingPolicy determines the way we want to split incentives in groupGauges
enum SplittingPolicy implements ProtoEnumVariant {
  byVolume(0, 'ByVolume');

  const SplittingPolicy(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SplittingPolicy fromValue(int? value) {
    return SplittingPolicy.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "SplittingPolicy",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SplittingPolicy from(Object? value) {
    return SplittingPolicy.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "SplittingPolicy",
                value: value,
              ),
    );
  }
}

/// Note that while both InternalGaugeInfo and InternalGaugeRecord could
/// technically be replaced by DistrInfo and DistrRecord from the pool-incentives
/// module, we create separate types here to keep our abstractions clean and
/// readable (pool-incentives distribution abstractions are used in a very
/// specific way that does not directly relate to gauge logic). This also helps
/// us sidestep a refactor to avoid an import cycle.
class InternalGaugeInfo extends CosmosProtoMessage {
  final String? totalWeight;

  final List<InternalGaugeRecord> gaugeRecords;

  const InternalGaugeInfo({this.totalWeight, this.gaugeRecords = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [totalWeight, gaugeRecords];

  @override
  Map<String, dynamic> toJson() {
    return {
      'total_weight': totalWeight,
      'gauge_records': gaugeRecords.map((e) => e.toJson()).toList(),
    };
  }

  factory InternalGaugeInfo.fromJson(Map<String, dynamic> json) {
    return InternalGaugeInfo(
      totalWeight: json.valueAsString<String?>(
        'total_weight',
        acceptCamelCase: true,
      ),
      gaugeRecords:
          (json.valueEnsureAsList<dynamic>(
                'gauge_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  InternalGaugeRecord,
                  Map<String, dynamic>
                >(value: e, parse: (v) => InternalGaugeRecord.fromJson(v)),
              )
              .toList(),
    );
  }

  factory InternalGaugeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InternalGaugeInfo(
      totalWeight: decode.getString<String?>(1),
      gaugeRecords:
          decode
              .getListOfBytes(2)
              .map((b) => InternalGaugeRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesInternalGaugeInfo;
}

class InternalGaugeRecord extends CosmosProtoMessage {
  final BigInt? gaugeId;

  /// CurrentWeight is the current weight of this gauge being distributed to for
  /// this epoch. For instance, for volume splitting policy, this stores the
  /// volume generated in the last epoch of the linked pool.
  final String? currentWeight;

  /// CumulativeWeight serves as a snapshot of the accumulator being tracked
  /// based on splitting policy. For instance, for volume splitting policy, this
  /// stores the cumulative volume for the linked pool at time of last update.
  final String? cumulativeWeight;

  const InternalGaugeRecord({
    this.gaugeId,
    this.currentWeight,
    this.cumulativeWeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [gaugeId, currentWeight, cumulativeWeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'gauge_id': gaugeId?.toString(),
      'current_weight': currentWeight,
      'cumulative_weight': cumulativeWeight,
    };
  }

  factory InternalGaugeRecord.fromJson(Map<String, dynamic> json) {
    return InternalGaugeRecord(
      gaugeId: json.valueAsBigInt<BigInt?>('gauge_id', acceptCamelCase: true),
      currentWeight: json.valueAsString<String?>(
        'current_weight',
        acceptCamelCase: true,
      ),
      cumulativeWeight: json.valueAsString<String?>(
        'cumulative_weight',
        acceptCamelCase: true,
      ),
    );
  }

  factory InternalGaugeRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InternalGaugeRecord(
      gaugeId: decode.getBigInt<BigInt?>(1),
      currentWeight: decode.getString<String?>(2),
      cumulativeWeight: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesInternalGaugeRecord;
}

/// Group is an object that stores a 1:1 mapped gauge ID, a list of pool gauge
/// info, and a splitting policy. These are grouped into a single abstraction to
/// allow for distribution of group incentives to internal gauges according to
/// the specified splitting policy.
class Group extends CosmosProtoMessage {
  final BigInt? groupGaugeId;

  final InternalGaugeInfo? internalGaugeInfo;

  final SplittingPolicy? splittingPolicy;

  const Group({
    this.groupGaugeId,
    this.internalGaugeInfo,
    this.splittingPolicy,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.enumType(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    groupGaugeId,
    internalGaugeInfo,
    splittingPolicy,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'group_gauge_id': groupGaugeId?.toString(),
      'internal_gauge_info': internalGaugeInfo?.toJson(),
      'splitting_policy': splittingPolicy?.protoName,
    };
  }

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupGaugeId: json.valueAsBigInt<BigInt?>(
        'group_gauge_id',
        acceptCamelCase: true,
      ),
      internalGaugeInfo: json.valueTo<InternalGaugeInfo?, Map<String, dynamic>>(
        key: 'internal_gauge_info',
        parse: (v) => InternalGaugeInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      splittingPolicy: json.valueTo<SplittingPolicy?, Object?>(
        key: 'splitting_policy',
        parse: (v) => SplittingPolicy.from(v),
      ),
    );
  }

  factory Group.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Group(
      groupGaugeId: decode.getBigInt<BigInt?>(1),
      internalGaugeInfo: decode.messageTo<InternalGaugeInfo?>(
        2,
        (b) => InternalGaugeInfo.deserialize(b),
      ),
      splittingPolicy: decode.getEnum<SplittingPolicy?>(
        3,
        SplittingPolicy.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGroup;
}

/// GroupsWithGauge is a helper struct that stores a group and its
/// associated gauge.
class GroupsWithGauge extends CosmosProtoMessage {
  final Group? group;

  final osmosis_incentives_gauge.Gauge? gauge;

  const GroupsWithGauge({this.group, this.gauge});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [group, gauge];

  @override
  Map<String, dynamic> toJson() {
    return {'group': group?.toJson(), 'gauge': gauge?.toJson()};
  }

  factory GroupsWithGauge.fromJson(Map<String, dynamic> json) {
    return GroupsWithGauge(
      group: json.valueTo<Group?, Map<String, dynamic>>(
        key: 'group',
        parse: (v) => Group.fromJson(v),
        acceptCamelCase: true,
      ),
      gauge: json
          .valueTo<osmosis_incentives_gauge.Gauge?, Map<String, dynamic>>(
            key: 'gauge',
            parse: (v) => osmosis_incentives_gauge.Gauge.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory GroupsWithGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GroupsWithGauge(
      group: decode.messageTo<Group?>(1, (b) => Group.deserialize(b)),
      gauge: decode.messageTo<osmosis_incentives_gauge.Gauge?>(
        2,
        (b) => osmosis_incentives_gauge.Gauge.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesGroupsWithGauge;
}
