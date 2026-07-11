import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// ClaimDaily
class MsgClaimDaily extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimDailyResponse>,
        ICosmosProtoAminoMessage {
  /// Address of the claimer
  final String? claimer;

  /// Airdrop ID
  final String? airdropId;

  const MsgClaimDaily({this.claimer, this.airdropId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "claimer"),
        ProtoOptionString(name: "amino.name", value: "airdrop/MsgClaimDaily"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [claimer, airdropId];

  @override
  Map<String, dynamic> toJson() {
    return {'claimer': claimer, 'airdrop_id': airdropId};
  }

  factory MsgClaimDaily.fromJson(Map<String, dynamic> json) {
    return MsgClaimDaily(
      claimer: json.valueAsString<String?>('claimer', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgClaimDaily.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimDaily(
      claimer: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgClaimDaily;
  @override
  MsgClaimDailyResponse onServiceResponse(List<int> bytes) {
    return MsgClaimDailyResponse.deserialize(bytes);
  }

  @override
  MsgClaimDailyResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimDailyResponse.fromJson(json);
  }
}

class MsgClaimDailyResponse extends CosmosProtoMessage {
  const MsgClaimDailyResponse();

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

  factory MsgClaimDailyResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimDailyResponse();
  }

  factory MsgClaimDailyResponse.deserialize(List<int> bytes) {
    return MsgClaimDailyResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgClaimDailyResponse;
}

/// ClaimEarly
class MsgClaimEarly extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimEarlyResponse>,
        ICosmosProtoAminoMessage {
  /// Address of the claimer
  final String? claimer;

  /// Airdrop ID
  final String? airdropId;

  const MsgClaimEarly({this.claimer, this.airdropId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "claimer"),
        ProtoOptionString(name: "amino.name", value: "airdrop/MsgClaimEarly"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [claimer, airdropId];

  @override
  Map<String, dynamic> toJson() {
    return {'claimer': claimer, 'airdrop_id': airdropId};
  }

  factory MsgClaimEarly.fromJson(Map<String, dynamic> json) {
    return MsgClaimEarly(
      claimer: json.valueAsString<String?>('claimer', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgClaimEarly.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimEarly(
      claimer: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgClaimEarly;
  @override
  MsgClaimEarlyResponse onServiceResponse(List<int> bytes) {
    return MsgClaimEarlyResponse.deserialize(bytes);
  }

  @override
  MsgClaimEarlyResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimEarlyResponse.fromJson(json);
  }
}

class MsgClaimEarlyResponse extends CosmosProtoMessage {
  const MsgClaimEarlyResponse();

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

  factory MsgClaimEarlyResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimEarlyResponse();
  }

  factory MsgClaimEarlyResponse.deserialize(List<int> bytes) {
    return MsgClaimEarlyResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgClaimEarlyResponse;
}

/// CreateAirdrop
class MsgCreateAirdrop extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateAirdropResponse>,
        ICosmosProtoAminoMessage {
  /// Airdrop admin address
  final String? admin;

  /// Airdrop ID
  final String? airdropId;

  /// Denom used when distributing rewards
  final String? rewardDenom;

  /// The first date that claiming begins and rewards are distributed
  final google_protobuf_timestamp.Timestamp? distributionStartDate;

  /// The last date for rewards to be distributed. Immediately after this date
  /// the rewards can no longer be claimed, but rewards have not been clawed back
  /// yet
  final google_protobuf_timestamp.Timestamp? distributionEndDate;

  /// Date with which the rewards are clawed back (occurs after the distribution
  /// end date)
  final google_protobuf_timestamp.Timestamp? clawbackDate;

  /// Deadline for the user to make a decision on their claim type
  final google_protobuf_timestamp.Timestamp? claimTypeDeadlineDate;

  /// Penalty for claiming rewards early - e.g. 0.5 means claiming early will
  /// result in losing 50% of rewards
  final String? earlyClaimPenalty;

  /// Account that holds the total reward balance and distributes to users
  final String? distributorAddress;

  /// Admin account with permissions to add or update allocations
  final String? allocatorAddress;

  /// Admin account with permissions to link addresseses
  final String? linkerAddress;

  const MsgCreateAirdrop({
    this.admin,
    this.airdropId,
    this.rewardDenom,
    this.distributionStartDate,
    this.distributionEndDate,
    this.clawbackDate,
    this.claimTypeDeadlineDate,
    this.earlyClaimPenalty,
    this.distributorAddress,
    this.allocatorAddress,
    this.linkerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "airdrop/MsgCreateAirdrop",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    airdropId,
    rewardDenom,
    distributionStartDate,
    distributionEndDate,
    clawbackDate,
    claimTypeDeadlineDate,
    earlyClaimPenalty,
    distributorAddress,
    allocatorAddress,
    linkerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'airdrop_id': airdropId,
      'reward_denom': rewardDenom,
      'distribution_start_date': distributionStartDate?.toRfc3339(),
      'distribution_end_date': distributionEndDate?.toRfc3339(),
      'clawback_date': clawbackDate?.toRfc3339(),
      'claim_type_deadline_date': claimTypeDeadlineDate?.toRfc3339(),
      'early_claim_penalty': earlyClaimPenalty,
      'distributor_address': distributorAddress,
      'allocator_address': allocatorAddress,
      'linker_address': linkerAddress,
    };
  }

  factory MsgCreateAirdrop.fromJson(Map<String, dynamic> json) {
    return MsgCreateAirdrop(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        acceptCamelCase: true,
      ),
      distributionStartDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'distribution_start_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      distributionEndDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'distribution_end_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      clawbackDate: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'clawback_date',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      claimTypeDeadlineDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'claim_type_deadline_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      earlyClaimPenalty: json.valueAsString<String?>(
        'early_claim_penalty',
        acceptCamelCase: true,
      ),
      distributorAddress: json.valueAsString<String?>(
        'distributor_address',
        acceptCamelCase: true,
      ),
      allocatorAddress: json.valueAsString<String?>(
        'allocator_address',
        acceptCamelCase: true,
      ),
      linkerAddress: json.valueAsString<String?>(
        'linker_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateAirdrop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateAirdrop(
      admin: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
      rewardDenom: decode.getString<String?>(3),
      distributionStartDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            4,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      distributionEndDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            5,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      clawbackDate: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      claimTypeDeadlineDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            7,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      earlyClaimPenalty: decode.getString<String?>(8),
      distributorAddress: decode.getString<String?>(9),
      allocatorAddress: decode.getString<String?>(10),
      linkerAddress: decode.getString<String?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgCreateAirdrop;
  @override
  MsgCreateAirdropResponse onServiceResponse(List<int> bytes) {
    return MsgCreateAirdropResponse.deserialize(bytes);
  }

  @override
  MsgCreateAirdropResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateAirdropResponse.fromJson(json);
  }
}

class MsgCreateAirdropResponse extends CosmosProtoMessage {
  const MsgCreateAirdropResponse();

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

  factory MsgCreateAirdropResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateAirdropResponse();
  }

  factory MsgCreateAirdropResponse.deserialize(List<int> bytes) {
    return MsgCreateAirdropResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgCreateAirdropResponse;
}

/// UpdateAirdrop
class MsgUpdateAirdrop extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateAirdropResponse>,
        ICosmosProtoAminoMessage {
  /// Airdrop admin address
  final String? admin;

  /// Airdrop ID
  final String? airdropId;

  /// Denom used when distributing rewards
  final String? rewardDenom;

  /// The first date that claiming begins and rewards are distributed
  final google_protobuf_timestamp.Timestamp? distributionStartDate;

  /// The last date for rewards to be distributed. Immediately after this date
  /// the rewards can no longer be claimed, but rewards have not been clawed back
  /// yet
  final google_protobuf_timestamp.Timestamp? distributionEndDate;

  /// Date with which the rewards are clawed back (occurs after the distribution
  /// end date)
  final google_protobuf_timestamp.Timestamp? clawbackDate;

  /// Deadline for the user to make a decision on their claim type
  final google_protobuf_timestamp.Timestamp? claimTypeDeadlineDate;

  /// Penalty for claiming rewards early - e.g. 0.5 means claiming early will
  /// result in losing 50% of rewards
  final String? earlyClaimPenalty;

  /// Account that holds the total reward balance and distributes to users
  final String? distributorAddress;

  /// Admin account with permissions to add or update allocations
  final String? allocatorAddress;

  /// Admin account with permissions to link addresseses
  final String? linkerAddress;

  const MsgUpdateAirdrop({
    this.admin,
    this.airdropId,
    this.rewardDenom,
    this.distributionStartDate,
    this.distributionEndDate,
    this.clawbackDate,
    this.claimTypeDeadlineDate,
    this.earlyClaimPenalty,
    this.distributorAddress,
    this.allocatorAddress,
    this.linkerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "airdrop/MsgUpdateAirdrop",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    airdropId,
    rewardDenom,
    distributionStartDate,
    distributionEndDate,
    clawbackDate,
    claimTypeDeadlineDate,
    earlyClaimPenalty,
    distributorAddress,
    allocatorAddress,
    linkerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'airdrop_id': airdropId,
      'reward_denom': rewardDenom,
      'distribution_start_date': distributionStartDate?.toRfc3339(),
      'distribution_end_date': distributionEndDate?.toRfc3339(),
      'clawback_date': clawbackDate?.toRfc3339(),
      'claim_type_deadline_date': claimTypeDeadlineDate?.toRfc3339(),
      'early_claim_penalty': earlyClaimPenalty,
      'distributor_address': distributorAddress,
      'allocator_address': allocatorAddress,
      'linker_address': linkerAddress,
    };
  }

  factory MsgUpdateAirdrop.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAirdrop(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        acceptCamelCase: true,
      ),
      distributionStartDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'distribution_start_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      distributionEndDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'distribution_end_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      clawbackDate: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'clawback_date',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      claimTypeDeadlineDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'claim_type_deadline_date',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      earlyClaimPenalty: json.valueAsString<String?>(
        'early_claim_penalty',
        acceptCamelCase: true,
      ),
      distributorAddress: json.valueAsString<String?>(
        'distributor_address',
        acceptCamelCase: true,
      ),
      allocatorAddress: json.valueAsString<String?>(
        'allocator_address',
        acceptCamelCase: true,
      ),
      linkerAddress: json.valueAsString<String?>(
        'linker_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateAirdrop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAirdrop(
      admin: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
      rewardDenom: decode.getString<String?>(3),
      distributionStartDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            4,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      distributionEndDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            5,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      clawbackDate: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      claimTypeDeadlineDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            7,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      earlyClaimPenalty: decode.getString<String?>(8),
      distributorAddress: decode.getString<String?>(9),
      allocatorAddress: decode.getString<String?>(10),
      linkerAddress: decode.getString<String?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgUpdateAirdrop;
  @override
  MsgUpdateAirdropResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateAirdropResponse.deserialize(bytes);
  }

  @override
  MsgUpdateAirdropResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateAirdropResponse.fromJson(json);
  }
}

class MsgUpdateAirdropResponse extends CosmosProtoMessage {
  const MsgUpdateAirdropResponse();

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

  factory MsgUpdateAirdropResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAirdropResponse();
  }

  factory MsgUpdateAirdropResponse.deserialize(List<int> bytes) {
    return MsgUpdateAirdropResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgUpdateAirdropResponse;
}

/// Allocation specification when bootstrapping reward data
class RawAllocation extends CosmosProtoMessage {
  final String? userAddress;

  final List<String> allocations;

  const RawAllocation({this.userAddress, this.allocations = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [userAddress, allocations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'user_address': userAddress,
      'allocations': allocations.map((e) => e).toList(),
    };
  }

  factory RawAllocation.fromJson(Map<String, dynamic> json) {
    return RawAllocation(
      userAddress: json.valueAsString<String?>(
        'user_address',
        acceptCamelCase: true,
      ),
      allocations:
          (json.valueEnsureAsList<dynamic>(
            'allocations',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory RawAllocation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RawAllocation(
      userAddress: decode.getString<String?>(1),
      allocations: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropRawAllocation;
}

/// AddAllocations
class MsgAddAllocations extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddAllocationsResponse>,
        ICosmosProtoAminoMessage {
  /// Airdrop admin address
  final String? admin;

  /// Airdrop ID
  final String? airdropId;

  /// List of address/allocation pairs for each user
  final List<RawAllocation> allocations;

  const MsgAddAllocations({
    this.admin,
    this.airdropId,
    this.allocations = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "airdrop/MsgAddAllocations",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [admin, airdropId, allocations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'airdrop_id': airdropId,
      'allocations': allocations.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgAddAllocations.fromJson(Map<String, dynamic> json) {
    return MsgAddAllocations(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      allocations:
          (json.valueEnsureAsList<dynamic>(
                'allocations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<RawAllocation, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => RawAllocation.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgAddAllocations.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddAllocations(
      admin: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
      allocations:
          decode
              .getListOfBytes(3)
              .map((b) => RawAllocation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgAddAllocations;
  @override
  MsgAddAllocationsResponse onServiceResponse(List<int> bytes) {
    return MsgAddAllocationsResponse.deserialize(bytes);
  }

  @override
  MsgAddAllocationsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddAllocationsResponse.fromJson(json);
  }
}

class MsgAddAllocationsResponse extends CosmosProtoMessage {
  const MsgAddAllocationsResponse();

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

  factory MsgAddAllocationsResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddAllocationsResponse();
  }

  factory MsgAddAllocationsResponse.deserialize(List<int> bytes) {
    return MsgAddAllocationsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgAddAllocationsResponse;
}

/// UpdateUserAllocation
class MsgUpdateUserAllocation extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateUserAllocationResponse>,
        ICosmosProtoAminoMessage {
  /// Airdrop admin address
  final String? admin;

  /// Airdrop ID
  final String? airdropId;

  /// Address of the airdrop recipient
  final String? userAddress;

  /// Allocations - as an array where each element represents the rewards for a
  /// day
  final List<String> allocations;

  const MsgUpdateUserAllocation({
    this.admin,
    this.airdropId,
    this.userAddress,
    this.allocations = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "airdrop/MsgUpdateUserAllocation",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [admin, airdropId, userAddress, allocations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'airdrop_id': airdropId,
      'user_address': userAddress,
      'allocations': allocations.map((e) => e).toList(),
    };
  }

  factory MsgUpdateUserAllocation.fromJson(Map<String, dynamic> json) {
    return MsgUpdateUserAllocation(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      userAddress: json.valueAsString<String?>(
        'user_address',
        acceptCamelCase: true,
      ),
      allocations:
          (json.valueEnsureAsList<dynamic>(
            'allocations',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgUpdateUserAllocation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateUserAllocation(
      admin: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
      userAddress: decode.getString<String?>(3),
      allocations: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgUpdateUserAllocation;
  @override
  MsgUpdateUserAllocationResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateUserAllocationResponse.deserialize(bytes);
  }

  @override
  MsgUpdateUserAllocationResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateUserAllocationResponse.fromJson(json);
  }
}

class MsgUpdateUserAllocationResponse extends CosmosProtoMessage {
  const MsgUpdateUserAllocationResponse();

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

  factory MsgUpdateUserAllocationResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateUserAllocationResponse();
  }

  factory MsgUpdateUserAllocationResponse.deserialize(List<int> bytes) {
    return MsgUpdateUserAllocationResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgUpdateUserAllocationResponse;
}

/// LinkAddresses
class MsgLinkAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLinkAddressesResponse>,
        ICosmosProtoAminoMessage {
  /// Airdrop admin address
  final String? admin;

  /// Airdrop ID
  final String? airdropId;

  /// Stride address - this address may or may not exist in allocations yet
  final String? strideAddress;

  /// Host address - this address must exist
  final String? hostAddress;

  const MsgLinkAddresses({
    this.admin,
    this.airdropId,
    this.strideAddress,
    this.hostAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "airdrop/MsgLinkAddresses",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    airdropId,
    strideAddress,
    hostAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'airdrop_id': airdropId,
      'stride_address': strideAddress,
      'host_address': hostAddress,
    };
  }

  factory MsgLinkAddresses.fromJson(Map<String, dynamic> json) {
    return MsgLinkAddresses(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      strideAddress: json.valueAsString<String?>(
        'stride_address',
        acceptCamelCase: true,
      ),
      hostAddress: json.valueAsString<String?>(
        'host_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLinkAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLinkAddresses(
      admin: decode.getString<String?>(1),
      airdropId: decode.getString<String?>(2),
      strideAddress: decode.getString<String?>(3),
      hostAddress: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgLinkAddresses;
  @override
  MsgLinkAddressesResponse onServiceResponse(List<int> bytes) {
    return MsgLinkAddressesResponse.deserialize(bytes);
  }

  @override
  MsgLinkAddressesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLinkAddressesResponse.fromJson(json);
  }
}

class MsgLinkAddressesResponse extends CosmosProtoMessage {
  const MsgLinkAddressesResponse();

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

  factory MsgLinkAddressesResponse.fromJson(Map<String, dynamic> json) {
    return MsgLinkAddressesResponse();
  }

  factory MsgLinkAddressesResponse.deserialize(List<int> bytes) {
    return MsgLinkAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropMsgLinkAddressesResponse;
}
