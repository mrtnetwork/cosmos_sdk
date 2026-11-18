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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory QueryUserEntryRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUserEntryRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'user_entry': config.encodeMessage(userEntry)};
  }

  factory QueryUserEntryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUserEntryResponse(
      userEntry: json.valueTo<
        chain4energy_c4echain_cfeclaim_claim_record.UserEntry?,
        Object
      >(
        key: 'user_entry',
        parse:
            (v) => chain4energy_c4echain_cfeclaim_claim_record
                .UserEntry.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryUsersEntriesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUsersEntriesRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'users_entries':
          usersEntries.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryUsersEntriesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryUsersEntriesResponse(
      usersEntries:
          (json.valueEnsureAsList<dynamic>(
                'users_entries',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_claim_record.UserEntry,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_claim_record
                          .UserEntry.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'campaign_id': config.encodeBigint(campaignId),
      'mission_id': config.encodeBigint(missionId),
    };
  }

  factory QueryMissionRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMissionRequest(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      missionId: json.valueAsBigInt<BigInt?>(
        'mission_id',
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'mission': config.encodeMessage(mission)};
  }

  factory QueryMissionResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMissionResponse(
      mission: json
          .valueTo<chain4energy_c4echain_cfeclaim_mission.Mission?, Object>(
            key: 'mission',
            parse:
                (v) => chain4energy_c4echain_cfeclaim_mission.Mission.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryMissionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMissionsRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'missions': missions.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryMissionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMissionsResponse(
      missions:
          (json.valueEnsureAsList<dynamic>(
                'missions',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_mission.Mission,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_mission
                          .Mission.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'campaign_id': config.encodeBigint(campaignId)};
  }

  factory QueryCampaignMissionsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCampaignMissionsRequest(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'missions': missions.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryCampaignMissionsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCampaignMissionsResponse(
      missions:
          (json.valueEnsureAsList<dynamic>(
                'missions',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_mission.Mission,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_mission
                          .Mission.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryCampaignsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCampaignsRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'campaigns': campaigns.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryCampaignsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCampaignsResponse(
      campaigns:
          (json.valueEnsureAsList<dynamic>(
                'campaigns',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeclaim_campaign.Campaign,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeclaim_campaign
                          .Campaign.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'campaign_id': config.encodeBigint(campaignId)};
  }

  factory QueryCampaignRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCampaignRequest(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        normalizeKeyLookup: config.normalizeKeys,
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'campaign': config.encodeMessage(campaign)};
  }

  factory QueryCampaignResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCampaignResponse(
      campaign: json
          .valueTo<chain4energy_c4echain_cfeclaim_campaign.Campaign?, Object>(
            key: 'campaign',
            parse:
                (v) => chain4energy_c4echain_cfeclaim_campaign
                    .Campaign.fromJson(JsonParser.valueAs(v), config: config),
            normalizeKeyLookup: config.normalizeKeys,
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
