import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// UserAllocation tracks the status of an allocation for a user on a specific
/// airdrop
class UserAllocation extends CosmosProtoMessage {
  /// ID of the airdrop
  final String? airdropId;

  /// Address of the account that is receiving the airdrop allocation
  /// The address does not have to be a stride address - but non-stride addresses
  /// must be linked and merged into a stride address before claiming
  final String? address;

  /// The total amount of tokens that have already been claimed
  final String? claimed;

  /// The total amount of tokens that have been forfeited by the user for
  /// claiming early
  final String? forfeited;

  /// The current state of allocations for this airdrop
  ///
  /// Ex 1:
  /// Day 0: {claimed:0, allocations:[10,10,10]}
  /// *MsgClaim*
  /// Day 1: {claimed:10, allocations:[0,10,10]}
  /// *MsgClaim*
  /// Day 2: {claimed:20, allocations:[0,0,10]}
  ///
  /// Ex 2:
  /// Day 0: {claimed:0, allocations:[10,10,10]}
  /// *MsgClaimEarly*
  /// Day 1: {claimed:15, forfeited:15, allocations:[0,0,0]}
  final List<String> allocations;

  const UserAllocation({
    this.airdropId,
    this.address,
    this.claimed,
    this.forfeited,
    this.allocations = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    airdropId,
    address,
    claimed,
    forfeited,
    allocations,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'airdrop_id': airdropId,
      'address': address,
      'claimed': claimed,
      'forfeited': forfeited,
      'allocations': allocations.map((e) => e).toList(),
    };
  }

  factory UserAllocation.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserAllocation(
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      claimed: json.valueAsString<String?>(
        'claimed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      forfeited: json.valueAsString<String?>(
        'forfeited',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      allocations:
          (json.valueEnsureAsList<dynamic>(
            'allocations',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory UserAllocation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserAllocation(
      airdropId: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      claimed: decode.getString<String?>(3),
      forfeited: decode.getString<String?>(4),
      allocations: decode.getListOrEmpty<String>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropUserAllocation;
}

/// Airdrop track the aggregate unbondings across an epoch
class Airdrop extends CosmosProtoMessage {
  /// Airdrop ID
  final String? id;

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

  const Airdrop({
    this.id,
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
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'id': id,
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

  factory Airdrop.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Airdrop(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      distributionStartDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, Object>(
            key: 'distribution_start_date',
            parse:
                (v) => google_protobuf_timestamp.Timestamp.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      distributionEndDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, Object>(
            key: 'distribution_end_date',
            parse:
                (v) => google_protobuf_timestamp.Timestamp.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      clawbackDate: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'clawback_date',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      claimTypeDeadlineDate: json
          .valueTo<google_protobuf_timestamp.Timestamp?, Object>(
            key: 'claim_type_deadline_date',
            parse:
                (v) => google_protobuf_timestamp.Timestamp.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      earlyClaimPenalty: json.valueAsString<String?>(
        'early_claim_penalty',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      distributorAddress: json.valueAsString<String?>(
        'distributor_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      allocatorAddress: json.valueAsString<String?>(
        'allocator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      linkerAddress: json.valueAsString<String?>(
        'linker_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Airdrop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Airdrop(
      id: decode.getString<String?>(1),
      rewardDenom: decode.getString<String?>(2),
      distributionStartDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            3,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      distributionEndDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            4,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      clawbackDate: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      claimTypeDeadlineDate: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            6,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      earlyClaimPenalty: decode.getString<String?>(7),
      distributorAddress: decode.getString<String?>(8),
      allocatorAddress: decode.getString<String?>(9),
      linkerAddress: decode.getString<String?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropAirdrop;
}
