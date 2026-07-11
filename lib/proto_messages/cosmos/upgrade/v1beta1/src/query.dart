import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/upgrade/v1beta1/src/upgrade.dart"
    as cosmos_upgrade_v1beta1_upgrade;

/// QueryCurrentPlanRequest is the request type for the Query/CurrentPlan RPC
/// method.
class QueryCurrentPlanRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCurrentPlanResponse> {
  const QueryCurrentPlanRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/upgrade/v1beta1/current_plan",
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

  factory QueryCurrentPlanRequest.fromJson(Map<String, dynamic> json) {
    return QueryCurrentPlanRequest();
  }

  factory QueryCurrentPlanRequest.deserialize(List<int> bytes) {
    return QueryCurrentPlanRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryCurrentPlanRequest;
  @override
  QueryCurrentPlanResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentPlanResponse.deserialize(bytes);
  }

  @override
  QueryCurrentPlanResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCurrentPlanResponse.fromJson(json);
  }
}

/// QueryCurrentPlanResponse is the response type for the Query/CurrentPlan RPC
/// method.
class QueryCurrentPlanResponse extends CosmosProtoMessage {
  /// plan is the current upgrade plan.
  final cosmos_upgrade_v1beta1_upgrade.Plan? plan;

  const QueryCurrentPlanResponse({this.plan});

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
  List<Object?> get protoValues => [plan];

  @override
  Map<String, dynamic> toJson() {
    return {'plan': plan?.toJson()};
  }

  factory QueryCurrentPlanResponse.fromJson(Map<String, dynamic> json) {
    return QueryCurrentPlanResponse(
      plan: json
          .valueTo<cosmos_upgrade_v1beta1_upgrade.Plan?, Map<String, dynamic>>(
            key: 'plan',
            parse: (v) => cosmos_upgrade_v1beta1_upgrade.Plan.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryCurrentPlanResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentPlanResponse(
      plan: decode.messageTo<cosmos_upgrade_v1beta1_upgrade.Plan?>(
        1,
        (b) => cosmos_upgrade_v1beta1_upgrade.Plan.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryCurrentPlanResponse;
}

/// QueryCurrentPlanRequest is the request type for the Query/AppliedPlan RPC
/// method.
class QueryAppliedPlanRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAppliedPlanResponse> {
  /// name is the name of the applied plan to query for.
  final String? name;

  const QueryAppliedPlanRequest({this.name});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/upgrade/v1beta1/applied_plan/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [name];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  factory QueryAppliedPlanRequest.fromJson(Map<String, dynamic> json) {
    return QueryAppliedPlanRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
    );
  }

  factory QueryAppliedPlanRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAppliedPlanRequest(name: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryAppliedPlanRequest;
  @override
  QueryAppliedPlanResponse onQueryResponse(List<int> bytes) {
    return QueryAppliedPlanResponse.deserialize(bytes);
  }

  @override
  QueryAppliedPlanResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAppliedPlanResponse.fromJson(json);
  }
}

/// QueryAppliedPlanResponse is the response type for the Query/AppliedPlan RPC
/// method.
class QueryAppliedPlanResponse extends CosmosProtoMessage {
  /// height is the block height at which the plan was applied.
  final BigInt? height;

  const QueryAppliedPlanResponse({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height?.toString()};
  }

  factory QueryAppliedPlanResponse.fromJson(Map<String, dynamic> json) {
    return QueryAppliedPlanResponse(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
    );
  }

  factory QueryAppliedPlanResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAppliedPlanResponse(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryAppliedPlanResponse;
}

/// QueryUpgradedConsensusStateRequest is the request type for the Query/UpgradedConsensusState
/// RPC method.
class QueryUpgradedConsensusStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUpgradedConsensusStateResponse> {
  /// last height of the current chain must be sent in request
  /// as this is the height under which next consensus state is stored
  final BigInt? lastHeight;

  const QueryUpgradedConsensusStateRequest({this.lastHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/cosmos/upgrade/v1beta1/upgraded_consensus_state/{last_height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [lastHeight];

  @override
  Map<String, dynamic> toJson() {
    return {'last_height': lastHeight?.toString()};
  }

  factory QueryUpgradedConsensusStateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateRequest(
      lastHeight: json.valueAsBigInt<BigInt?>(
        'last_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryUpgradedConsensusStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradedConsensusStateRequest(
      lastHeight: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosUpgradeV1beta1QueryUpgradedConsensusStateRequest;
  @override
  QueryUpgradedConsensusStateResponse onQueryResponse(List<int> bytes) {
    return QueryUpgradedConsensusStateResponse.deserialize(bytes);
  }

  @override
  QueryUpgradedConsensusStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateResponse.fromJson(json);
  }
}

/// QueryUpgradedConsensusStateResponse is the response type for the Query/UpgradedConsensusState
/// RPC method.
class QueryUpgradedConsensusStateResponse extends CosmosProtoMessage {
  final List<int>? upgradedConsensusState;

  const QueryUpgradedConsensusStateResponse({this.upgradedConsensusState});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.bytes(
          2,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [upgradedConsensusState];

  @override
  Map<String, dynamic> toJson() {
    return {
      'upgraded_consensus_state': switch (upgradedConsensusState) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryUpgradedConsensusStateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState: json.valueAsBytes<List<int>?>(
        'upgraded_consensus_state',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryUpgradedConsensusStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUpgradedConsensusStateResponse(
      upgradedConsensusState: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosUpgradeV1beta1QueryUpgradedConsensusStateResponse;
}

/// QueryModuleVersionsRequest is the request type for the Query/ModuleVersions
/// RPC method.
class QueryModuleVersionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleVersionsResponse> {
  /// module_name is a field to query a specific module
  /// consensus version from state. Leaving this empty will
  /// fetch the full list of module versions from state
  final String? moduleName;

  const QueryModuleVersionsRequest({this.moduleName});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/upgrade/v1beta1/module_versions",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [moduleName];

  @override
  Map<String, dynamic> toJson() {
    return {'module_name': moduleName};
  }

  factory QueryModuleVersionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleVersionsRequest(
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleVersionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleVersionsRequest(moduleName: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryModuleVersionsRequest;
  @override
  QueryModuleVersionsResponse onQueryResponse(List<int> bytes) {
    return QueryModuleVersionsResponse.deserialize(bytes);
  }

  @override
  QueryModuleVersionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleVersionsResponse.fromJson(json);
  }
}

/// QueryModuleVersionsResponse is the response type for the Query/ModuleVersions
/// RPC method.
class QueryModuleVersionsResponse extends CosmosProtoMessage {
  /// module_versions is a list of module names with their consensus versions.
  final List<cosmos_upgrade_v1beta1_upgrade.ModuleVersion> moduleVersions;

  const QueryModuleVersionsResponse({this.moduleVersions = const []});

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
  List<Object?> get protoValues => [moduleVersions];

  @override
  Map<String, dynamic> toJson() {
    return {'module_versions': moduleVersions.map((e) => e.toJson()).toList()};
  }

  factory QueryModuleVersionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleVersionsResponse(
      moduleVersions:
          (json.valueEnsureAsList<dynamic>(
                'module_versions',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_upgrade_v1beta1_upgrade.ModuleVersion,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_upgrade_v1beta1_upgrade
                          .ModuleVersion.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryModuleVersionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleVersionsResponse(
      moduleVersions:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    cosmos_upgrade_v1beta1_upgrade.ModuleVersion.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryModuleVersionsResponse;
}

/// QueryAuthorityRequest is the request type for Query/Authority
class QueryAuthorityRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAuthorityResponse> {
  const QueryAuthorityRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/upgrade/v1beta1/authority",
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

  factory QueryAuthorityRequest.fromJson(Map<String, dynamic> json) {
    return QueryAuthorityRequest();
  }

  factory QueryAuthorityRequest.deserialize(List<int> bytes) {
    return QueryAuthorityRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryAuthorityRequest;
  @override
  QueryAuthorityResponse onQueryResponse(List<int> bytes) {
    return QueryAuthorityResponse.deserialize(bytes);
  }

  @override
  QueryAuthorityResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAuthorityResponse.fromJson(json);
  }
}

/// QueryAuthorityResponse is the response type for Query/Authority
class QueryAuthorityResponse extends CosmosProtoMessage {
  final String? address;

  const QueryAuthorityResponse({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryAuthorityResponse.fromJson(Map<String, dynamic> json) {
    return QueryAuthorityResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryAuthorityResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuthorityResponse(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1QueryAuthorityResponse;
}
