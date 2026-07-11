import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryUpgradeProposalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUpgradeProposalResponse> {
  final String? name;

  final String? height;

  const QueryUpgradeProposalRequest({this.name, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/upgrade_proposal/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, height];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'height': height};
  }

  factory QueryUpgradeProposalRequest.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeProposalRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryUpgradeProposalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradeProposalRequest(
      name: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryUpgradeProposalRequest;
  @override
  QueryUpgradeProposalResponse onQueryResponse(List<int> bytes) {
    return QueryUpgradeProposalResponse.deserialize(bytes);
  }

  @override
  QueryUpgradeProposalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUpgradeProposalResponse.fromJson(json);
  }
}

class QueryUpgradeProposalResponse extends CosmosProtoMessage {
  /// the name of the upgrade
  final String? name;

  /// the block height at which the upgrade will occur
  final BigInt? height;

  /// the description of the upgrade, typically json with URLs to binaries for
  /// use with automation tools
  final String? info;

  /// whether the upgrade has been approved by the active validators
  final bool? approved;

  /// the percentage of active validators that have approved the upgrade
  final String? approvedPercent;

  /// the amount of additional active validators required to reach quorum for the
  /// upgrade
  final BigInt? validatorsToQuorum;

  /// the list of node addresses that have approved the upgrade
  final List<String> approvers;

  /// the list of node addresses that have rejected the upgrade
  final List<String> rejecters;

  const QueryUpgradeProposalResponse({
    this.name,
    this.height,
    this.info,
    this.approved,
    this.approvedPercent,
    this.validatorsToQuorum,
    this.approvers = const [],
    this.rejecters = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.bool(4, options: const []),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.int64(6, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    height,
    info,
    approved,
    approvedPercent,
    validatorsToQuorum,
    approvers,
    rejecters,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'height': height?.toString(),
      'info': info,
      'approved': approved,
      'approved_percent': approvedPercent,
      'validators_to_quorum': validatorsToQuorum?.toString(),
      'approvers': approvers.map((e) => e).toList(),
      'rejecters': rejecters.map((e) => e).toList(),
    };
  }

  factory QueryUpgradeProposalResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeProposalResponse(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      approved: json.valueAsBool<bool?>('approved', acceptCamelCase: true),
      approvedPercent: json.valueAsString<String?>(
        'approved_percent',
        acceptCamelCase: true,
      ),
      validatorsToQuorum: json.valueAsBigInt<BigInt?>(
        'validators_to_quorum',
        acceptCamelCase: true,
      ),
      approvers:
          (json.valueEnsureAsList<dynamic>(
            'approvers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      rejecters:
          (json.valueEnsureAsList<dynamic>(
            'rejecters',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryUpgradeProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradeProposalResponse(
      name: decode.getString<String?>(1),
      height: decode.getBigInt<BigInt?>(2),
      info: decode.getString<String?>(3),
      approved: decode.getBool<bool?>(4),
      approvedPercent: decode.getString<String?>(5),
      validatorsToQuorum: decode.getBigInt<BigInt?>(6),
      approvers: decode.getListOrEmpty<String>(7),
      rejecters: decode.getListOrEmpty<String>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryUpgradeProposalResponse;
}

class QueryUpgradeProposalsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUpgradeProposalsResponse> {
  final String? height;

  const QueryUpgradeProposalsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/upgrade_proposals",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryUpgradeProposalsRequest.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeProposalsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryUpgradeProposalsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradeProposalsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryUpgradeProposalsRequest;
  @override
  QueryUpgradeProposalsResponse onQueryResponse(List<int> bytes) {
    return QueryUpgradeProposalsResponse.deserialize(bytes);
  }

  @override
  QueryUpgradeProposalsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUpgradeProposalsResponse.fromJson(json);
  }
}

class QueryUpgradeProposalsResponse extends CosmosProtoMessage {
  final List<QueryUpgradeProposalResponse> upgradeProposals;

  const QueryUpgradeProposalsResponse({this.upgradeProposals = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [upgradeProposals];

  @override
  Map<String, dynamic> toJson() {
    return {
      'upgrade_proposals': upgradeProposals.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryUpgradeProposalsResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeProposalsResponse(
      upgradeProposals:
          (json.valueEnsureAsList<dynamic>(
                'upgrade_proposals',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryUpgradeProposalResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => QueryUpgradeProposalResponse.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryUpgradeProposalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradeProposalsResponse(
      upgradeProposals:
          decode
              .getListOfBytes(1)
              .map((b) => QueryUpgradeProposalResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryUpgradeProposalsResponse;
}

class QueryUpgradeVotesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUpgradeVotesResponse> {
  final String? name;

  final String? height;

  const QueryUpgradeVotesRequest({this.name, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/upgrade_votes/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, height];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'height': height};
  }

  factory QueryUpgradeVotesRequest.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeVotesRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryUpgradeVotesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradeVotesRequest(
      name: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryUpgradeVotesRequest;
  @override
  QueryUpgradeVotesResponse onQueryResponse(List<int> bytes) {
    return QueryUpgradeVotesResponse.deserialize(bytes);
  }

  @override
  QueryUpgradeVotesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUpgradeVotesResponse.fromJson(json);
  }
}

class UpgradeVote extends CosmosProtoMessage {
  final String? nodeAddress;

  final String? vote;

  const UpgradeVote({this.nodeAddress, this.vote});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nodeAddress, vote];

  @override
  Map<String, dynamic> toJson() {
    return {'node_address': nodeAddress, 'vote': vote};
  }

  factory UpgradeVote.fromJson(Map<String, dynamic> json) {
    return UpgradeVote(
      nodeAddress: json.valueAsString<String?>(
        'node_address',
        acceptCamelCase: true,
      ),
      vote: json.valueAsString<String?>('vote', acceptCamelCase: true),
    );
  }

  factory UpgradeVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UpgradeVote(
      nodeAddress: decode.getString<String?>(1),
      vote: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesUpgradeVote;
}

class QueryUpgradeVotesResponse extends CosmosProtoMessage {
  final List<UpgradeVote> upgradeVotes;

  const QueryUpgradeVotesResponse({this.upgradeVotes = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [upgradeVotes];

  @override
  Map<String, dynamic> toJson() {
    return {'upgrade_votes': upgradeVotes.map((e) => e.toJson()).toList()};
  }

  factory QueryUpgradeVotesResponse.fromJson(Map<String, dynamic> json) {
    return QueryUpgradeVotesResponse(
      upgradeVotes:
          (json.valueEnsureAsList<dynamic>(
                'upgrade_votes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<UpgradeVote, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => UpgradeVote.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryUpgradeVotesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradeVotesResponse(
      upgradeVotes:
          decode
              .getListOfBytes(1)
              .map((b) => UpgradeVote.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryUpgradeVotesResponse;
}
