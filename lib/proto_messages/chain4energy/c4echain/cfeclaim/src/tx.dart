import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeclaim/src/campaign.dart"
    as chain4energy_c4echain_cfeclaim_campaign;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeclaim/src/mission.dart"
    as chain4energy_c4echain_cfeclaim_mission;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeclaim/src/claim_record.dart"
    as chain4energy_c4echain_cfeclaim_claim_record;

/// this line is used by starport scaffolding # proto/tx/rpc
class MsgClaim extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgClaimResponse> {
  final String? claimer;

  final BigInt? campaignId;

  final BigInt? missionId;

  const MsgClaim({this.claimer, this.campaignId, this.missionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [claimer, campaignId, missionId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'claimer': claimer,
      'campaign_id': campaignId?.toString(),
      'mission_id': missionId?.toString(),
    };
  }

  factory MsgClaim.fromJson(Map<String, dynamic> json) {
    return MsgClaim(
      claimer: json.valueAsString<String?>('claimer', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      missionId: json.valueAsBigInt<BigInt?>(
        'mission_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgClaim.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaim(
      claimer: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      missionId: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgClaim;
  @override
  MsgClaimResponse onServiceResponse(List<int> bytes) {
    return MsgClaimResponse.deserialize(bytes);
  }

  @override
  MsgClaimResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimResponse.fromJson(json);
  }
}

class MsgClaimResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgClaimResponse({this.amount = const []});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory MsgClaimResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimResponse(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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

  factory MsgClaimResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgClaimResponse;
}

class MsgInitialClaim extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgInitialClaimResponse> {
  final String? claimer;

  final BigInt? campaignId;

  final String? destinationAddress;

  const MsgInitialClaim({
    this.claimer,
    this.campaignId,
    this.destinationAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [claimer, campaignId, destinationAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'claimer': claimer,
      'campaign_id': campaignId?.toString(),
      'destination_address': destinationAddress,
    };
  }

  factory MsgInitialClaim.fromJson(Map<String, dynamic> json) {
    return MsgInitialClaim(
      claimer: json.valueAsString<String?>('claimer', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      destinationAddress: json.valueAsString<String?>(
        'destination_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgInitialClaim.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInitialClaim(
      claimer: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      destinationAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgInitialClaim;
  @override
  MsgInitialClaimResponse onServiceResponse(List<int> bytes) {
    return MsgInitialClaimResponse.deserialize(bytes);
  }

  @override
  MsgInitialClaimResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgInitialClaimResponse.fromJson(json);
  }
}

class MsgInitialClaimResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgInitialClaimResponse({this.amount = const []});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount.map((e) => e.toJson()).toList()};
  }

  factory MsgInitialClaimResponse.fromJson(Map<String, dynamic> json) {
    return MsgInitialClaimResponse(
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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

  factory MsgInitialClaimResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInitialClaimResponse(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgInitialClaimResponse;
}

class MsgCreateCampaign extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCreateCampaignResponse> {
  final String? owner;

  final String? name;

  final String? description;

  final chain4energy_c4echain_cfeclaim_campaign.CampaignType? campaignType;

  final bool? removableClaimRecords;

  final String? feegrantAmount;

  final String? initialClaimFreeAmount;

  final String? free;

  final google_protobuf_timestamp.Timestamp? startTime;

  final google_protobuf_timestamp.Timestamp? endTime;

  final google_protobuf_duration.Duration? lockupPeriod;

  final google_protobuf_duration.Duration? vestingPeriod;

  final String? vestingPoolName;

  const MsgCreateCampaign({
    this.owner,
    this.name,
    this.description,
    this.campaignType,
    this.removableClaimRecords,
    this.feegrantAmount,
    this.initialClaimFreeAmount,
    this.free,
    this.startTime,
    this.endTime,
    this.lockupPeriod,
    this.vestingPeriod,
    this.vestingPoolName,
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
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.message(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.message(11, options: const []),
        ProtoFieldConfig.message(12, options: const []),
        ProtoFieldConfig.string(13),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    owner,
    name,
    description,
    campaignType,
    removableClaimRecords,
    feegrantAmount,
    initialClaimFreeAmount,
    free,
    startTime,
    endTime,
    lockupPeriod,
    vestingPeriod,
    vestingPoolName,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'name': name,
      'description': description,
      'campaign_type': campaignType?.protoName,
      'removable_claim_records': removableClaimRecords,
      'feegrant_amount': feegrantAmount,
      'initial_claim_free_amount': initialClaimFreeAmount,
      'free': free,
      'start_time': startTime?.toRfc3339(),
      'end_time': endTime?.toRfc3339(),
      'lockup_period': lockupPeriod?.encodeString(asNanos: true),
      'vesting_period': vestingPeriod?.encodeString(asNanos: true),
      'vesting_pool_name': vestingPoolName,
    };
  }

  factory MsgCreateCampaign.fromJson(Map<String, dynamic> json) {
    return MsgCreateCampaign(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      description: json.valueAsString<String?>(
        'description',
        acceptCamelCase: true,
      ),
      campaignType: json.valueTo<
        chain4energy_c4echain_cfeclaim_campaign.CampaignType?,
        Object?
      >(
        key: 'campaign_type',
        parse:
            (v) => chain4energy_c4echain_cfeclaim_campaign.CampaignType.from(v),
      ),
      removableClaimRecords: json.valueAsBool<bool?>(
        'removable_claim_records',
        acceptCamelCase: true,
      ),
      feegrantAmount: json.valueAsString<String?>(
        'feegrant_amount',
        acceptCamelCase: true,
      ),
      initialClaimFreeAmount: json.valueAsString<String?>(
        'initial_claim_free_amount',
        acceptCamelCase: true,
      ),
      free: json.valueAsString<String?>('free', acceptCamelCase: true),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      lockupPeriod: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'lockup_period',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      vestingPeriod: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'vesting_period',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      vestingPoolName: json.valueAsString<String?>(
        'vesting_pool_name',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateCampaign.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateCampaign(
      owner: decode.getString<String?>(1),
      name: decode.getString<String?>(2),
      description: decode.getString<String?>(3),
      campaignType: decode
          .getEnum<chain4energy_c4echain_cfeclaim_campaign.CampaignType?>(
            4,
            chain4energy_c4echain_cfeclaim_campaign.CampaignType.values,
          ),
      removableClaimRecords: decode.getBool<bool?>(5),
      feegrantAmount: decode.getString<String?>(6),
      initialClaimFreeAmount: decode.getString<String?>(7),
      free: decode.getString<String?>(8),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        9,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        10,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      lockupPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        11,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      vestingPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        12,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      vestingPoolName: decode.getString<String?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgCreateCampaign;
  @override
  MsgCreateCampaignResponse onServiceResponse(List<int> bytes) {
    return MsgCreateCampaignResponse.deserialize(bytes);
  }

  @override
  MsgCreateCampaignResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateCampaignResponse.fromJson(json);
  }
}

class MsgCreateCampaignResponse extends CosmosProtoMessage {
  final BigInt? campaignId;

  const MsgCreateCampaignResponse({this.campaignId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [campaignId];

  @override
  Map<String, dynamic> toJson() {
    return {'campaign_id': campaignId?.toString()};
  }

  factory MsgCreateCampaignResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateCampaignResponse(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateCampaignResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateCampaignResponse(campaignId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgCreateCampaignResponse;
}

class MsgAddMission extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgAddMissionResponse> {
  final String? owner;

  final BigInt? campaignId;

  final String? name;

  final String? description;

  final chain4energy_c4echain_cfeclaim_mission.MissionType? missionType;

  final String? weight;

  final google_protobuf_timestamp.Timestamp? claimStartDate;

  const MsgAddMission({
    this.owner,
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
        ProtoFieldConfig.string(1),
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
    owner,
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
      'owner': owner,
      'campaign_id': campaignId?.toString(),
      'name': name,
      'description': description,
      'mission_type': missionType?.protoName,
      'weight': weight,
      'claim_start_date': claimStartDate?.toRfc3339(),
    };
  }

  factory MsgAddMission.fromJson(Map<String, dynamic> json) {
    return MsgAddMission(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      description: json.valueAsString<String?>(
        'description',
        acceptCamelCase: true,
      ),
      missionType: json.valueTo<
        chain4energy_c4echain_cfeclaim_mission.MissionType?,
        Object?
      >(
        key: 'mission_type',
        parse:
            (v) => chain4energy_c4echain_cfeclaim_mission.MissionType.from(v),
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

  factory MsgAddMission.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddMission(
      owner: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      name: decode.getString<String?>(3),
      description: decode.getString<String?>(4),
      missionType: decode
          .getEnum<chain4energy_c4echain_cfeclaim_mission.MissionType?>(
            5,
            chain4energy_c4echain_cfeclaim_mission.MissionType.values,
          ),
      weight: decode.getString<String?>(6),
      claimStartDate: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgAddMission;
  @override
  MsgAddMissionResponse onServiceResponse(List<int> bytes) {
    return MsgAddMissionResponse.deserialize(bytes);
  }

  @override
  MsgAddMissionResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddMissionResponse.fromJson(json);
  }
}

class MsgAddMissionResponse extends CosmosProtoMessage {
  final BigInt? missionId;

  const MsgAddMissionResponse({this.missionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [missionId];

  @override
  Map<String, dynamic> toJson() {
    return {'mission_id': missionId?.toString()};
  }

  factory MsgAddMissionResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddMissionResponse(
      missionId: json.valueAsBigInt<BigInt?>(
        'mission_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgAddMissionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddMissionResponse(missionId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgAddMissionResponse;
}

class MsgAddClaimRecords extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgAddClaimRecordsResponse> {
  final String? owner;

  final BigInt? campaignId;

  final List<chain4energy_c4echain_cfeclaim_claim_record.ClaimRecordEntry>
  claimRecordEntries;

  const MsgAddClaimRecords({
    this.owner,
    this.campaignId,
    this.claimRecordEntries = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, campaignId, claimRecordEntries];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'campaign_id': campaignId?.toString(),
      'claim_record_entries':
          claimRecordEntries.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgAddClaimRecords.fromJson(Map<String, dynamic> json) {
    return MsgAddClaimRecords(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      claimRecordEntries:
          (json.valueEnsureAsList<dynamic>(
                'claim_record_entries',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_claim_record.ClaimRecordEntry,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_claim_record
                          .ClaimRecordEntry.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgAddClaimRecords.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddClaimRecords(
      owner: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      claimRecordEntries:
          decode
              .getListOfBytes(3)
              .map(
                (b) => chain4energy_c4echain_cfeclaim_claim_record
                    .ClaimRecordEntry.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgAddClaimRecords;
  @override
  MsgAddClaimRecordsResponse onServiceResponse(List<int> bytes) {
    return MsgAddClaimRecordsResponse.deserialize(bytes);
  }

  @override
  MsgAddClaimRecordsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddClaimRecordsResponse.fromJson(json);
  }
}

class MsgAddClaimRecordsResponse extends CosmosProtoMessage {
  const MsgAddClaimRecordsResponse();

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

  factory MsgAddClaimRecordsResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddClaimRecordsResponse();
  }

  factory MsgAddClaimRecordsResponse.deserialize(List<int> bytes) {
    return MsgAddClaimRecordsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgAddClaimRecordsResponse;
}

class MsgDeleteClaimRecord extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgDeleteClaimRecordResponse> {
  final String? owner;

  final BigInt? campaignId;

  final String? userAddress;

  const MsgDeleteClaimRecord({this.owner, this.campaignId, this.userAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, campaignId, userAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'campaign_id': campaignId?.toString(),
      'user_address': userAddress,
    };
  }

  factory MsgDeleteClaimRecord.fromJson(Map<String, dynamic> json) {
    return MsgDeleteClaimRecord(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      userAddress: json.valueAsString<String?>(
        'user_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDeleteClaimRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteClaimRecord(
      owner: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      userAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgDeleteClaimRecord;
  @override
  MsgDeleteClaimRecordResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteClaimRecordResponse.deserialize(bytes);
  }

  @override
  MsgDeleteClaimRecordResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDeleteClaimRecordResponse.fromJson(json);
  }
}

class MsgDeleteClaimRecordResponse extends CosmosProtoMessage {
  const MsgDeleteClaimRecordResponse();

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

  factory MsgDeleteClaimRecordResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeleteClaimRecordResponse();
  }

  factory MsgDeleteClaimRecordResponse.deserialize(List<int> bytes) {
    return MsgDeleteClaimRecordResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgDeleteClaimRecordResponse;
}

class MsgCloseCampaign extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCloseCampaignResponse> {
  final String? owner;

  final BigInt? campaignId;

  const MsgCloseCampaign({this.owner, this.campaignId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [owner, campaignId];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'campaign_id': campaignId?.toString()};
  }

  factory MsgCloseCampaign.fromJson(Map<String, dynamic> json) {
    return MsgCloseCampaign(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCloseCampaign.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCloseCampaign(
      owner: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgCloseCampaign;
  @override
  MsgCloseCampaignResponse onServiceResponse(List<int> bytes) {
    return MsgCloseCampaignResponse.deserialize(bytes);
  }

  @override
  MsgCloseCampaignResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCloseCampaignResponse.fromJson(json);
  }
}

class MsgCloseCampaignResponse extends CosmosProtoMessage {
  const MsgCloseCampaignResponse();

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

  factory MsgCloseCampaignResponse.fromJson(Map<String, dynamic> json) {
    return MsgCloseCampaignResponse();
  }

  factory MsgCloseCampaignResponse.deserialize(List<int> bytes) {
    return MsgCloseCampaignResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgCloseCampaignResponse;
}

class MsgEnableCampaign extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgEnableCampaignResponse> {
  final String? owner;

  final BigInt? campaignId;

  final google_protobuf_timestamp.Timestamp? startTime;

  final google_protobuf_timestamp.Timestamp? endTime;

  const MsgEnableCampaign({
    this.owner,
    this.campaignId,
    this.startTime,
    this.endTime,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, campaignId, startTime, endTime];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'campaign_id': campaignId?.toString(),
      'start_time': startTime?.toRfc3339(),
      'end_time': endTime?.toRfc3339(),
    };
  }

  factory MsgEnableCampaign.fromJson(Map<String, dynamic> json) {
    return MsgEnableCampaign(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgEnableCampaign.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEnableCampaign(
      owner: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgEnableCampaign;
  @override
  MsgEnableCampaignResponse onServiceResponse(List<int> bytes) {
    return MsgEnableCampaignResponse.deserialize(bytes);
  }

  @override
  MsgEnableCampaignResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgEnableCampaignResponse.fromJson(json);
  }
}

class MsgEnableCampaignResponse extends CosmosProtoMessage {
  const MsgEnableCampaignResponse();

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

  factory MsgEnableCampaignResponse.fromJson(Map<String, dynamic> json) {
    return MsgEnableCampaignResponse();
  }

  factory MsgEnableCampaignResponse.deserialize(List<int> bytes) {
    return MsgEnableCampaignResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgEnableCampaignResponse;
}

class MsgRemoveCampaign extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRemoveCampaignResponse> {
  final String? owner;

  final BigInt? campaignId;

  const MsgRemoveCampaign({this.owner, this.campaignId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [owner, campaignId];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'campaign_id': campaignId?.toString()};
  }

  factory MsgRemoveCampaign.fromJson(Map<String, dynamic> json) {
    return MsgRemoveCampaign(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveCampaign.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveCampaign(
      owner: decode.getString<String?>(1),
      campaignId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimMsgRemoveCampaign;
  @override
  MsgRemoveCampaignResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveCampaignResponse.deserialize(bytes);
  }

  @override
  MsgRemoveCampaignResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveCampaignResponse.fromJson(json);
  }
}

class MsgRemoveCampaignResponse extends CosmosProtoMessage {
  const MsgRemoveCampaignResponse();

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

  factory MsgRemoveCampaignResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveCampaignResponse();
  }

  factory MsgRemoveCampaignResponse.deserialize(List<int> bytes) {
    return MsgRemoveCampaignResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimMsgRemoveCampaignResponse;
}
