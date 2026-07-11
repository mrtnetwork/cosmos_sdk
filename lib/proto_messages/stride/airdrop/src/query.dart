import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/stride/airdrop/src/airdrop.dart"
    as stride_airdrop_airdrop;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// Airdrop
class QueryAirdropRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAirdropResponse> {
  final String? id;

  const QueryAirdropRequest({this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/airdrop/airdrop/{id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  factory QueryAirdropRequest.fromJson(Map<String, dynamic> json) {
    return QueryAirdropRequest(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
    );
  }

  factory QueryAirdropRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAirdropRequest(id: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryAirdropRequest;
  @override
  QueryAirdropResponse onQueryResponse(List<int> bytes) {
    return QueryAirdropResponse.deserialize(bytes);
  }

  @override
  QueryAirdropResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAirdropResponse.fromJson(json);
  }
}

class QueryAirdropResponse extends CosmosProtoMessage {
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

  /// The current date index into the airdrop array
  final BigInt? currentDateIndex;

  /// The length of the airdrop (i.e. number of periods in the airdrop array)
  final BigInt? airdropLength;

  const QueryAirdropResponse({
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
    this.currentDateIndex,
    this.airdropLength,
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
        ProtoFieldConfig.int64(11),
        ProtoFieldConfig.int64(12),
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
    currentDateIndex,
    airdropLength,
  ];

  @override
  Map<String, dynamic> toJson() {
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
      'current_date_index': currentDateIndex?.toString(),
      'airdrop_length': airdropLength?.toString(),
    };
  }

  factory QueryAirdropResponse.fromJson(Map<String, dynamic> json) {
    return QueryAirdropResponse(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
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
      currentDateIndex: json.valueAsBigInt<BigInt?>(
        'current_date_index',
        acceptCamelCase: true,
      ),
      airdropLength: json.valueAsBigInt<BigInt?>(
        'airdrop_length',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAirdropResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAirdropResponse(
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
      currentDateIndex: decode.getBigInt<BigInt?>(11),
      airdropLength: decode.getBigInt<BigInt?>(12),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryAirdropResponse;
}

/// Airdrops
class QueryAllAirdropsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllAirdropsResponse> {
  const QueryAllAirdropsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/airdrop/airdrops",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryAllAirdropsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllAirdropsRequest();
  }

  factory QueryAllAirdropsRequest.deserialize(List<int> bytes) {
    return QueryAllAirdropsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryAllAirdropsRequest;
  @override
  QueryAllAirdropsResponse onQueryResponse(List<int> bytes) {
    return QueryAllAirdropsResponse.deserialize(bytes);
  }

  @override
  QueryAllAirdropsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllAirdropsResponse.fromJson(json);
  }
}

class QueryAllAirdropsResponse extends CosmosProtoMessage {
  final List<stride_airdrop_airdrop.Airdrop> airdrops;

  const QueryAllAirdropsResponse({this.airdrops = const []});

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
  List<Object?> get protoValues => [airdrops];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrops': airdrops.map((e) => e.toJson()).toList()};
  }

  factory QueryAllAirdropsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllAirdropsResponse(
      airdrops:
          (json.valueEnsureAsList<dynamic>('airdrops', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_airdrop_airdrop.Airdrop,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_airdrop_airdrop.Airdrop.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryAllAirdropsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllAirdropsResponse(
      airdrops:
          decode
              .getListOfBytes(1)
              .map((b) => stride_airdrop_airdrop.Airdrop.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryAllAirdropsResponse;
}

/// UserAllocation
class QueryUserAllocationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUserAllocationResponse> {
  final String? airdropId;

  final String? address;

  const QueryUserAllocationRequest({this.airdropId, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/Stride-Labs/stride/airdrop/user_allocation/{airdrop_id}/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [airdropId, address];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrop_id': airdropId, 'address': address};
  }

  factory QueryUserAllocationRequest.fromJson(Map<String, dynamic> json) {
    return QueryUserAllocationRequest(
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryUserAllocationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserAllocationRequest(
      airdropId: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryUserAllocationRequest;
  @override
  QueryUserAllocationResponse onQueryResponse(List<int> bytes) {
    return QueryUserAllocationResponse.deserialize(bytes);
  }

  @override
  QueryUserAllocationResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUserAllocationResponse.fromJson(json);
  }
}

class QueryUserAllocationResponse extends CosmosProtoMessage {
  final stride_airdrop_airdrop.UserAllocation? userAllocation;

  const QueryUserAllocationResponse({this.userAllocation});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [userAllocation];

  @override
  Map<String, dynamic> toJson() {
    return {'user_allocation': userAllocation?.toJson()};
  }

  factory QueryUserAllocationResponse.fromJson(Map<String, dynamic> json) {
    return QueryUserAllocationResponse(
      userAllocation: json.valueTo<
        stride_airdrop_airdrop.UserAllocation?,
        Map<String, dynamic>
      >(
        key: 'user_allocation',
        parse: (v) => stride_airdrop_airdrop.UserAllocation.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUserAllocationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserAllocationResponse(
      userAllocation: decode.messageTo<stride_airdrop_airdrop.UserAllocation?>(
        1,
        (b) => stride_airdrop_airdrop.UserAllocation.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryUserAllocationResponse;
}

/// UserAllocations
class QueryUserAllocationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUserAllocationsResponse> {
  final String? address;

  const QueryUserAllocationsRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/airdrop/user_allocations/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryUserAllocationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryUserAllocationsRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryUserAllocationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserAllocationsRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryUserAllocationsRequest;
  @override
  QueryUserAllocationsResponse onQueryResponse(List<int> bytes) {
    return QueryUserAllocationsResponse.deserialize(bytes);
  }

  @override
  QueryUserAllocationsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUserAllocationsResponse.fromJson(json);
  }
}

class QueryUserAllocationsResponse extends CosmosProtoMessage {
  final List<stride_airdrop_airdrop.UserAllocation> userAllocations;

  const QueryUserAllocationsResponse({this.userAllocations = const []});

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
  List<Object?> get protoValues => [userAllocations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'user_allocations': userAllocations.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryUserAllocationsResponse.fromJson(Map<String, dynamic> json) {
    return QueryUserAllocationsResponse(
      userAllocations:
          (json.valueEnsureAsList<dynamic>(
                'user_allocations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_airdrop_airdrop.UserAllocation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_airdrop_airdrop.UserAllocation.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryUserAllocationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserAllocationsResponse(
      userAllocations:
          decode
              .getListOfBytes(1)
              .map((b) => stride_airdrop_airdrop.UserAllocation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryUserAllocationsResponse;
}

/// AllAllocations
class QueryAllAllocationsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllAllocationsResponse> {
  final String? airdropId;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllAllocationsRequest({this.airdropId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/airdrop/all_allocations/{airdrop_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [airdropId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrop_id': airdropId, 'pagination': pagination?.toJson()};
  }

  factory QueryAllAllocationsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllAllocationsRequest(
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAllAllocationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllAllocationsRequest(
      airdropId: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryAllAllocationsRequest;
  @override
  QueryAllAllocationsResponse onQueryResponse(List<int> bytes) {
    return QueryAllAllocationsResponse.deserialize(bytes);
  }

  @override
  QueryAllAllocationsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllAllocationsResponse.fromJson(json);
  }
}

class QueryAllAllocationsResponse extends CosmosProtoMessage {
  final List<stride_airdrop_airdrop.UserAllocation> allocations;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllAllocationsResponse({
    this.allocations = const [],
    this.pagination,
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
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [allocations, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'allocations': allocations.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllAllocationsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllAllocationsResponse(
      allocations:
          (json.valueEnsureAsList<dynamic>(
                'allocations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_airdrop_airdrop.UserAllocation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_airdrop_airdrop.UserAllocation.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAllAllocationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllAllocationsResponse(
      allocations:
          decode
              .getListOfBytes(1)
              .map((b) => stride_airdrop_airdrop.UserAllocation.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryAllAllocationsResponse;
}

/// UserSummary
class QueryUserSummaryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUserSummaryResponse> {
  final String? airdropId;

  final String? address;

  const QueryUserSummaryRequest({this.airdropId, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/Stride-Labs/stride/airdrop/user_summary/{airdrop_id}/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [airdropId, address];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrop_id': airdropId, 'address': address};
  }

  factory QueryUserSummaryRequest.fromJson(Map<String, dynamic> json) {
    return QueryUserSummaryRequest(
      airdropId: json.valueAsString<String?>(
        'airdrop_id',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryUserSummaryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserSummaryRequest(
      airdropId: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryUserSummaryRequest;
  @override
  QueryUserSummaryResponse onQueryResponse(List<int> bytes) {
    return QueryUserSummaryResponse.deserialize(bytes);
  }

  @override
  QueryUserSummaryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUserSummaryResponse.fromJson(json);
  }
}

class QueryUserSummaryResponse extends CosmosProtoMessage {
  /// The claim type (claim daily or claim early)
  final String? claimType;

  /// The total rewards claimed so far
  final String? claimed;

  /// The total rewards forfeited (in the case of claiming early)
  final String? forfeited;

  /// The total rewards remaining
  final String? remaining;

  /// The total rewards that can be claimed right now
  final String? claimable;

  const QueryUserSummaryResponse({
    this.claimType,
    this.claimed,
    this.forfeited,
    this.remaining,
    this.claimable,
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
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    claimType,
    claimed,
    forfeited,
    remaining,
    claimable,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'claim_type': claimType,
      'claimed': claimed,
      'forfeited': forfeited,
      'remaining': remaining,
      'claimable': claimable,
    };
  }

  factory QueryUserSummaryResponse.fromJson(Map<String, dynamic> json) {
    return QueryUserSummaryResponse(
      claimType: json.valueAsString<String?>(
        'claim_type',
        acceptCamelCase: true,
      ),
      claimed: json.valueAsString<String?>('claimed', acceptCamelCase: true),
      forfeited: json.valueAsString<String?>(
        'forfeited',
        acceptCamelCase: true,
      ),
      remaining: json.valueAsString<String?>(
        'remaining',
        acceptCamelCase: true,
      ),
      claimable: json.valueAsString<String?>(
        'claimable',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUserSummaryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserSummaryResponse(
      claimType: decode.getString<String?>(1),
      claimed: decode.getString<String?>(2),
      forfeited: decode.getString<String?>(3),
      remaining: decode.getString<String?>(4),
      claimable: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAirdropQueryUserSummaryResponse;
}
