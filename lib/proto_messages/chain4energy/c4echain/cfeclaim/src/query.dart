import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeclaim/src/claim_record.dart"
    as chain4energy_c4echain_cfeclaim_claim_record;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeclaim/src/mission.dart"
    as chain4energy_c4echain_cfeclaim_mission;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeclaim/src/campaign.dart"
    as chain4energy_c4echain_cfeclaim_campaign;

/// this line is used by starport scaffolding # 2
class QueryUserEntryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUserEntryResponse> {
  final String? address;

  const QueryUserEntryRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/user_entry/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryUserEntryRequest.fromJson(Map<String, dynamic> json) {
    return QueryUserEntryRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryUserEntryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserEntryRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryUserEntryRequest;
  @override
  QueryUserEntryResponse onQueryResponse(List<int> bytes) {
    return QueryUserEntryResponse.deserialize(bytes);
  }

  @override
  QueryUserEntryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUserEntryResponse.fromJson(json);
  }
}

class QueryUserEntryResponse extends CosmosProtoMessage {
  final chain4energy_c4echain_cfeclaim_claim_record.UserEntry? userEntry;

  const QueryUserEntryResponse({this.userEntry});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [userEntry];

  @override
  Map<String, dynamic> toJson() {
    return {'user_entry': userEntry?.toJson()};
  }

  factory QueryUserEntryResponse.fromJson(Map<String, dynamic> json) {
    return QueryUserEntryResponse(
      userEntry: json.valueTo<
        chain4energy_c4echain_cfeclaim_claim_record.UserEntry?,
        Map<String, dynamic>
      >(
        key: 'user_entry',
        parse:
            (v) => chain4energy_c4echain_cfeclaim_claim_record
                .UserEntry.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUserEntryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserEntryResponse(
      userEntry: decode
          .messageTo<chain4energy_c4echain_cfeclaim_claim_record.UserEntry?>(
            1,
            (b) => chain4energy_c4echain_cfeclaim_claim_record
                .UserEntry.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryUserEntryResponse;
}

class QueryUsersEntriesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUsersEntriesResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryUsersEntriesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/users_entries",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryUsersEntriesRequest.fromJson(Map<String, dynamic> json) {
    return QueryUsersEntriesRequest(
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

  factory QueryUsersEntriesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUsersEntriesRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryUsersEntriesRequest;
  @override
  QueryUsersEntriesResponse onQueryResponse(List<int> bytes) {
    return QueryUsersEntriesResponse.deserialize(bytes);
  }

  @override
  QueryUsersEntriesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUsersEntriesResponse.fromJson(json);
  }
}

class QueryUsersEntriesResponse extends CosmosProtoMessage {
  final List<chain4energy_c4echain_cfeclaim_claim_record.UserEntry>
  usersEntries;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryUsersEntriesResponse({
    this.usersEntries = const [],
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
  List<Object?> get protoValues => [usersEntries, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'users_entries': usersEntries.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryUsersEntriesResponse.fromJson(Map<String, dynamic> json) {
    return QueryUsersEntriesResponse(
      usersEntries:
          (json.valueEnsureAsList<dynamic>(
                'users_entries',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_claim_record.UserEntry,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_claim_record
                          .UserEntry.fromJson(v),
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

  factory QueryUsersEntriesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUsersEntriesResponse(
      usersEntries:
          decode
              .getListOfBytes(1)
              .map(
                (b) => chain4energy_c4echain_cfeclaim_claim_record
                    .UserEntry.deserialize(b),
              )
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
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryUsersEntriesResponse;
}

class QueryMissionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMissionResponse> {
  final BigInt? campaignId;

  final BigInt? missionId;

  const QueryMissionRequest({this.campaignId, this.missionId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/mission/{campaign_id}/{mission_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [campaignId, missionId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'campaign_id': campaignId?.toString(),
      'mission_id': missionId?.toString(),
    };
  }

  factory QueryMissionRequest.fromJson(Map<String, dynamic> json) {
    return QueryMissionRequest(
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

  factory QueryMissionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMissionRequest(
      campaignId: decode.getBigInt<BigInt?>(1),
      missionId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimQueryMissionRequest;
  @override
  QueryMissionResponse onQueryResponse(List<int> bytes) {
    return QueryMissionResponse.deserialize(bytes);
  }

  @override
  QueryMissionResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMissionResponse.fromJson(json);
  }
}

class QueryMissionResponse extends CosmosProtoMessage {
  final chain4energy_c4echain_cfeclaim_mission.Mission? mission;

  const QueryMissionResponse({this.mission});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [mission];

  @override
  Map<String, dynamic> toJson() {
    return {'mission': mission?.toJson()};
  }

  factory QueryMissionResponse.fromJson(Map<String, dynamic> json) {
    return QueryMissionResponse(
      mission: json.valueTo<
        chain4energy_c4echain_cfeclaim_mission.Mission?,
        Map<String, dynamic>
      >(
        key: 'mission',
        parse:
            (v) => chain4energy_c4echain_cfeclaim_mission.Mission.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryMissionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMissionResponse(
      mission: decode
          .messageTo<chain4energy_c4echain_cfeclaim_mission.Mission?>(
            1,
            (b) =>
                chain4energy_c4echain_cfeclaim_mission.Mission.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryMissionResponse;
}

class QueryMissionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMissionsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryMissionsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/missions",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryMissionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryMissionsRequest(
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

  factory QueryMissionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMissionsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryMissionsRequest;
  @override
  QueryMissionsResponse onQueryResponse(List<int> bytes) {
    return QueryMissionsResponse.deserialize(bytes);
  }

  @override
  QueryMissionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMissionsResponse.fromJson(json);
  }
}

class QueryMissionsResponse extends CosmosProtoMessage {
  final List<chain4energy_c4echain_cfeclaim_mission.Mission> missions;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryMissionsResponse({this.missions = const [], this.pagination});

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
  List<Object?> get protoValues => [missions, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'missions': missions.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryMissionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryMissionsResponse(
      missions:
          (json.valueEnsureAsList<dynamic>('missions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_mission.Mission,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_mission
                          .Mission.fromJson(v),
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

  factory QueryMissionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMissionsResponse(
      missions:
          decode
              .getListOfBytes(1)
              .map(
                (b) => chain4energy_c4echain_cfeclaim_mission
                    .Mission.deserialize(b),
              )
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
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryMissionsResponse;
}

class QueryCampaignMissionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCampaignMissionsResponse> {
  final BigInt? campaignId;

  const QueryCampaignMissionsRequest({this.campaignId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/missions/{campaign_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [campaignId];

  @override
  Map<String, dynamic> toJson() {
    return {'campaign_id': campaignId?.toString()};
  }

  factory QueryCampaignMissionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryCampaignMissionsRequest(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCampaignMissionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCampaignMissionsRequest(
      campaignId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryCampaignMissionsRequest;
  @override
  QueryCampaignMissionsResponse onQueryResponse(List<int> bytes) {
    return QueryCampaignMissionsResponse.deserialize(bytes);
  }

  @override
  QueryCampaignMissionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCampaignMissionsResponse.fromJson(json);
  }
}

class QueryCampaignMissionsResponse extends CosmosProtoMessage {
  final List<chain4energy_c4echain_cfeclaim_mission.Mission> missions;

  const QueryCampaignMissionsResponse({this.missions = const []});

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
  List<Object?> get protoValues => [missions];

  @override
  Map<String, dynamic> toJson() {
    return {'missions': missions.map((e) => e.toJson()).toList()};
  }

  factory QueryCampaignMissionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryCampaignMissionsResponse(
      missions:
          (json.valueEnsureAsList<dynamic>('missions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_mission.Mission,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_mission
                          .Mission.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryCampaignMissionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCampaignMissionsResponse(
      missions:
          decode
              .getListOfBytes(1)
              .map(
                (b) => chain4energy_c4echain_cfeclaim_mission
                    .Mission.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryCampaignMissionsResponse;
}

class QueryCampaignsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCampaignsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryCampaignsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/campaigns",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryCampaignsRequest.fromJson(Map<String, dynamic> json) {
    return QueryCampaignsRequest(
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

  factory QueryCampaignsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCampaignsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryCampaignsRequest;
  @override
  QueryCampaignsResponse onQueryResponse(List<int> bytes) {
    return QueryCampaignsResponse.deserialize(bytes);
  }

  @override
  QueryCampaignsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCampaignsResponse.fromJson(json);
  }
}

class QueryCampaignsResponse extends CosmosProtoMessage {
  final List<chain4energy_c4echain_cfeclaim_campaign.Campaign> campaigns;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryCampaignsResponse({this.campaigns = const [], this.pagination});

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
  List<Object?> get protoValues => [campaigns, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'campaigns': campaigns.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryCampaignsResponse.fromJson(Map<String, dynamic> json) {
    return QueryCampaignsResponse(
      campaigns:
          (json.valueEnsureAsList<dynamic>('campaigns', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_campaign.Campaign,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_campaign
                          .Campaign.fromJson(v),
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

  factory QueryCampaignsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCampaignsResponse(
      campaigns:
          decode
              .getListOfBytes(1)
              .map(
                (b) => chain4energy_c4echain_cfeclaim_campaign
                    .Campaign.deserialize(b),
              )
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
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryCampaignsResponse;
}

class QueryCampaignRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCampaignResponse> {
  final BigInt? campaignId;

  const QueryCampaignRequest({this.campaignId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/c4e/claim/v1beta1/campaign/{campaign_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [campaignId];

  @override
  Map<String, dynamic> toJson() {
    return {'campaign_id': campaignId?.toString()};
  }

  factory QueryCampaignRequest.fromJson(Map<String, dynamic> json) {
    return QueryCampaignRequest(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCampaignRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCampaignRequest(campaignId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryCampaignRequest;
  @override
  QueryCampaignResponse onQueryResponse(List<int> bytes) {
    return QueryCampaignResponse.deserialize(bytes);
  }

  @override
  QueryCampaignResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCampaignResponse.fromJson(json);
  }
}

class QueryCampaignResponse extends CosmosProtoMessage {
  final chain4energy_c4echain_cfeclaim_campaign.Campaign? campaign;

  const QueryCampaignResponse({this.campaign});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [campaign];

  @override
  Map<String, dynamic> toJson() {
    return {'campaign': campaign?.toJson()};
  }

  factory QueryCampaignResponse.fromJson(Map<String, dynamic> json) {
    return QueryCampaignResponse(
      campaign: json.valueTo<
        chain4energy_c4echain_cfeclaim_campaign.Campaign?,
        Map<String, dynamic>
      >(
        key: 'campaign',
        parse:
            (v) => chain4energy_c4echain_cfeclaim_campaign.Campaign.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCampaignResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCampaignResponse(
      campaign: decode
          .messageTo<chain4energy_c4echain_cfeclaim_campaign.Campaign?>(
            1,
            (b) =>
                chain4energy_c4echain_cfeclaim_campaign.Campaign.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeclaimQueryCampaignResponse;
}
