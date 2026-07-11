import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

enum MissionType implements ProtoEnumVariant {
  missionTypeUnspecified(0, 'MISSION_TYPE_UNSPECIFIED'),
  initialClaim(1, 'INITIAL_CLAIM'),
  delegate(2, 'DELEGATE'),
  vote(3, 'VOTE'),
  claim(4, 'CLAIM'),
  toDefine(5, 'TO_DEFINE');

  const MissionType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static MissionType fromValue(int? value) {
    return MissionType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "MissionType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static MissionType from(Object? value) {
    return MissionType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "MissionType", value: value),
    );
  }
}

class Mission extends CosmosProtoMessage {
  final BigInt? id;

  final BigInt? campaignId;

  final String? name;

  final String? description;

  final MissionType? missionType;

  final String? weight;

  final google_protobuf_timestamp.Timestamp? claimStartDate;

  const Mission({
    this.id,
    this.campaignId,
    this.name,
    this.description,
    this.missionType,
    this.weight,
    this.claimStartDate,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.enumType(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    campaignId,
    name,
    description,
    missionType,
    weight,
    claimStartDate,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'campaign_id': campaignId?.toString(),
      'name': name,
      'description': description,
      'missionType': missionType?.protoName,
      'weight': weight,
      'claim_start_date': claimStartDate?.toRfc3339(),
    };
  }

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      description: json.valueAsString<String?>(
        'description',
        acceptCamelCase: true,
      ),
      missionType: json.valueTo<MissionType?, Object?>(
        key: 'missionType',
        parse: (v) => MissionType.from(v),
      ),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
      claimStartDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'claim_start_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Mission.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Mission(
      id: decode.getBigInt<BigInt?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      name: decode.getString<String?>(3),
      description: decode.getString<String?>(4),
      missionType: decode.getEnum<MissionType?>(5, MissionType.values),
      weight: decode.getString<String?>(6),
      claimStartDate: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMission;
}
