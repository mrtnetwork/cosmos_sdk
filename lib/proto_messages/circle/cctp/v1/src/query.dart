import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/attester.dart"
    as circle_cctp_v1_attester;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/per_message_burn_limit.dart"
    as circle_cctp_v1_per_message_burn_limit;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/burning_and_minting_paused.dart"
    as circle_cctp_v1_burning_and_minting_paused;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/sending_and_receiving_messages_paused.dart"
    as circle_cctp_v1_sending_and_receiving_messages_paused;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/max_message_body_size.dart"
    as circle_cctp_v1_max_message_body_size;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/nonce.dart"
    as circle_cctp_v1_nonce;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/signature_threshold.dart"
    as circle_cctp_v1_signature_threshold;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/token_pair.dart"
    as circle_cctp_v1_token_pair;
import "package:cosmos_sdk/proto_messages/circle/cctp/v1/src/remote_token_messenger.dart"
    as circle_cctp_v1_remote_token_messenger;

/// QueryRolesRequest is the request type for the Query/Roles RPC method.
class QueryRolesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRolesResponse> {
  const QueryRolesRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/roles",
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

  factory QueryRolesRequest.fromJson(Map<String, dynamic> json) {
    return QueryRolesRequest();
  }

  factory QueryRolesRequest.deserialize(List<int> bytes) {
    return QueryRolesRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryRolesRequest;
  @override
  QueryRolesResponse onQueryResponse(List<int> bytes) {
    return QueryRolesResponse.deserialize(bytes);
  }

  @override
  QueryRolesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRolesResponse.fromJson(json);
  }
}

/// QueryRolesResponse is the response type for the Query/Roles RPC method.
class QueryRolesResponse extends CosmosProtoMessage {
  final String? owner;

  final String? attesterManager;

  final String? pauser;

  final String? tokenController;

  const QueryRolesResponse({
    this.owner,
    this.attesterManager,
    this.pauser,
    this.tokenController,
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
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    owner,
    attesterManager,
    pauser,
    tokenController,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'attester_manager': attesterManager,
      'pauser': pauser,
      'token_controller': tokenController,
    };
  }

  factory QueryRolesResponse.fromJson(Map<String, dynamic> json) {
    return QueryRolesResponse(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      attesterManager: json.valueAsString<String?>(
        'attester_manager',
        acceptCamelCase: true,
      ),
      pauser: json.valueAsString<String?>('pauser', acceptCamelCase: true),
      tokenController: json.valueAsString<String?>(
        'token_controller',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRolesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRolesResponse(
      owner: decode.getString<String?>(1),
      attesterManager: decode.getString<String?>(2),
      pauser: decode.getString<String?>(3),
      tokenController: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryRolesResponse;
}

/// QueryAttestersRequest is the request type for the Query/Attester RPC method.
class QueryGetAttesterRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetAttesterResponse> {
  final String? attester;

  const QueryGetAttesterRequest({this.attester});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/attesters/{attester}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [attester];

  @override
  Map<String, dynamic> toJson() {
    return {'attester': attester};
  }

  factory QueryGetAttesterRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetAttesterRequest(
      attester: json.valueAsString<String?>('attester', acceptCamelCase: true),
    );
  }

  factory QueryGetAttesterRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetAttesterRequest(attester: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetAttesterRequest;
  @override
  QueryGetAttesterResponse onQueryResponse(List<int> bytes) {
    return QueryGetAttesterResponse.deserialize(bytes);
  }

  @override
  QueryGetAttesterResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetAttesterResponse.fromJson(json);
  }
}

/// QueryAttestersResponse is the response type for the Query/Attester RPC
/// method.
class QueryGetAttesterResponse extends CosmosProtoMessage {
  final circle_cctp_v1_attester.Attester? attester;

  const QueryGetAttesterResponse({this.attester});

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
  List<Object?> get protoValues => [attester];

  @override
  Map<String, dynamic> toJson() {
    return {'attester': attester?.toJson()};
  }

  factory QueryGetAttesterResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetAttesterResponse(
      attester: json
          .valueTo<circle_cctp_v1_attester.Attester?, Map<String, dynamic>>(
            key: 'attester',
            parse: (v) => circle_cctp_v1_attester.Attester.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGetAttesterResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetAttesterResponse(
      attester: decode.messageTo<circle_cctp_v1_attester.Attester?>(
        1,
        (b) => circle_cctp_v1_attester.Attester.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetAttesterResponse;
}

/// QueryAllAttestersRequest is the request type for the Query/Attesters RPC
/// method.
class QueryAllAttestersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllAttestersResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllAttestersRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/attesters",
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

  factory QueryAllAttestersRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllAttestersRequest(
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

  factory QueryAllAttestersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllAttestersRequest(
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllAttestersRequest;
  @override
  QueryAllAttestersResponse onQueryResponse(List<int> bytes) {
    return QueryAllAttestersResponse.deserialize(bytes);
  }

  @override
  QueryAllAttestersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllAttestersResponse.fromJson(json);
  }
}

/// QueryAllAttestersResponse is the response type for the Query/Attesters RPC
/// method.
class QueryAllAttestersResponse extends CosmosProtoMessage {
  final List<circle_cctp_v1_attester.Attester> attesters;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllAttestersResponse({this.attesters = const [], this.pagination});

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
  List<Object?> get protoValues => [attesters, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'attesters': attesters.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllAttestersResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllAttestersResponse(
      attesters:
          (json.valueEnsureAsList<dynamic>('attesters', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  circle_cctp_v1_attester.Attester,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => circle_cctp_v1_attester.Attester.fromJson(v),
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

  factory QueryAllAttestersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllAttestersResponse(
      attesters:
          decode
              .getListOfBytes(1)
              .map((b) => circle_cctp_v1_attester.Attester.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllAttestersResponse;
}

/// QueryPerMessageBurnLimitRequest is the request type for the
/// Query/PerMessageBurnLimit RPC method.
class QueryGetPerMessageBurnLimitRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetPerMessageBurnLimitResponse> {
  final String? denom;

  const QueryGetPerMessageBurnLimitRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/per_message_burn_limits/{denom}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryGetPerMessageBurnLimitRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetPerMessageBurnLimitRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryGetPerMessageBurnLimitRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetPerMessageBurnLimitRequest(
      denom: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetPerMessageBurnLimitRequest;
  @override
  QueryGetPerMessageBurnLimitResponse onQueryResponse(List<int> bytes) {
    return QueryGetPerMessageBurnLimitResponse.deserialize(bytes);
  }

  @override
  QueryGetPerMessageBurnLimitResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetPerMessageBurnLimitResponse.fromJson(json);
  }
}

/// QueryPerMessageBurnLimitResponse is the response type for the
/// Query/PerMessageBurnLimit RPC method.
class QueryGetPerMessageBurnLimitResponse extends CosmosProtoMessage {
  final circle_cctp_v1_per_message_burn_limit.PerMessageBurnLimit? burnLimit;

  const QueryGetPerMessageBurnLimitResponse({this.burnLimit});

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
  List<Object?> get protoValues => [burnLimit];

  @override
  Map<String, dynamic> toJson() {
    return {'burn_limit': burnLimit?.toJson()};
  }

  factory QueryGetPerMessageBurnLimitResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetPerMessageBurnLimitResponse(
      burnLimit: json.valueTo<
        circle_cctp_v1_per_message_burn_limit.PerMessageBurnLimit?,
        Map<String, dynamic>
      >(
        key: 'burn_limit',
        parse:
            (v) => circle_cctp_v1_per_message_burn_limit
                .PerMessageBurnLimit.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetPerMessageBurnLimitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetPerMessageBurnLimitResponse(
      burnLimit: decode.messageTo<
        circle_cctp_v1_per_message_burn_limit.PerMessageBurnLimit?
      >(
        1,
        (b) => circle_cctp_v1_per_message_burn_limit
            .PerMessageBurnLimit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetPerMessageBurnLimitResponse;
}

/// QueryAllPerMessageBurnLimitsRequest is the response type for the
/// Query/PerMessageBurnLimit RPC method.
class QueryAllPerMessageBurnLimitsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllPerMessageBurnLimitsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllPerMessageBurnLimitsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/per_message_burn_limits",
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

  factory QueryAllPerMessageBurnLimitsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllPerMessageBurnLimitsRequest(
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

  factory QueryAllPerMessageBurnLimitsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllPerMessageBurnLimitsRequest(
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllPerMessageBurnLimitsRequest;
  @override
  QueryAllPerMessageBurnLimitsResponse onQueryResponse(List<int> bytes) {
    return QueryAllPerMessageBurnLimitsResponse.deserialize(bytes);
  }

  @override
  QueryAllPerMessageBurnLimitsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllPerMessageBurnLimitsResponse.fromJson(json);
  }
}

/// QueryAllPerMessageBurnLimitsRequest is the response type for the
/// Query/PerMessageBurnLimit RPC method.
class QueryAllPerMessageBurnLimitsResponse extends CosmosProtoMessage {
  final List<circle_cctp_v1_per_message_burn_limit.PerMessageBurnLimit>
  burnLimits;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllPerMessageBurnLimitsResponse({
    this.burnLimits = const [],
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
  List<Object?> get protoValues => [burnLimits, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'burn_limits': burnLimits.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllPerMessageBurnLimitsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllPerMessageBurnLimitsResponse(
      burnLimits:
          (json.valueEnsureAsList<dynamic>(
                'burn_limits',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  circle_cctp_v1_per_message_burn_limit.PerMessageBurnLimit,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => circle_cctp_v1_per_message_burn_limit
                          .PerMessageBurnLimit.fromJson(v),
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

  factory QueryAllPerMessageBurnLimitsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllPerMessageBurnLimitsResponse(
      burnLimits:
          decode
              .getListOfBytes(1)
              .map(
                (b) => circle_cctp_v1_per_message_burn_limit
                    .PerMessageBurnLimit.deserialize(b),
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
          .circleCctpV1QueryAllPerMessageBurnLimitsResponse;
}

/// QueryBurningAndMintingPausedRequest is the request type for the
/// Query/BurningAndMintingPaused RPC method.
class QueryGetBurningAndMintingPausedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetBurningAndMintingPausedResponse> {
  const QueryGetBurningAndMintingPausedRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/burning_and_minting_paused",
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

  factory QueryGetBurningAndMintingPausedRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetBurningAndMintingPausedRequest();
  }

  factory QueryGetBurningAndMintingPausedRequest.deserialize(List<int> bytes) {
    return QueryGetBurningAndMintingPausedRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1QueryGetBurningAndMintingPausedRequest;
  @override
  QueryGetBurningAndMintingPausedResponse onQueryResponse(List<int> bytes) {
    return QueryGetBurningAndMintingPausedResponse.deserialize(bytes);
  }

  @override
  QueryGetBurningAndMintingPausedResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetBurningAndMintingPausedResponse.fromJson(json);
  }
}

/// QueryBurningAndMintingPausedResponse is the response type for the
/// Query/BurningAndMintingPaused RPC method.
class QueryGetBurningAndMintingPausedResponse extends CosmosProtoMessage {
  final circle_cctp_v1_burning_and_minting_paused.BurningAndMintingPaused?
  paused;

  const QueryGetBurningAndMintingPausedResponse({this.paused});

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
  List<Object?> get protoValues => [paused];

  @override
  Map<String, dynamic> toJson() {
    return {'paused': paused?.toJson()};
  }

  factory QueryGetBurningAndMintingPausedResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetBurningAndMintingPausedResponse(
      paused: json.valueTo<
        circle_cctp_v1_burning_and_minting_paused.BurningAndMintingPaused?,
        Map<String, dynamic>
      >(
        key: 'paused',
        parse:
            (v) => circle_cctp_v1_burning_and_minting_paused
                .BurningAndMintingPaused.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetBurningAndMintingPausedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetBurningAndMintingPausedResponse(
      paused: decode.messageTo<
        circle_cctp_v1_burning_and_minting_paused.BurningAndMintingPaused?
      >(
        1,
        (b) => circle_cctp_v1_burning_and_minting_paused
            .BurningAndMintingPaused.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1QueryGetBurningAndMintingPausedResponse;
}

/// QuerySendingAndReceivingPausedRequest is the request type for the
/// Query/SendingAndReceivingPaused RPC method.
class QueryGetSendingAndReceivingMessagesPausedRequest
    extends CosmosProtoMessage
    with
        ICosmosProtoQueryMessage<
          QueryGetSendingAndReceivingMessagesPausedResponse
        > {
  const QueryGetSendingAndReceivingMessagesPausedRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/sending_and_receiving_messages_paused",
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

  factory QueryGetSendingAndReceivingMessagesPausedRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetSendingAndReceivingMessagesPausedRequest();
  }

  factory QueryGetSendingAndReceivingMessagesPausedRequest.deserialize(
    List<int> bytes,
  ) {
    return QueryGetSendingAndReceivingMessagesPausedRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1QueryGetSendingAndReceivingMessagesPausedRequest;
  @override
  QueryGetSendingAndReceivingMessagesPausedResponse onQueryResponse(
    List<int> bytes,
  ) {
    return QueryGetSendingAndReceivingMessagesPausedResponse.deserialize(bytes);
  }

  @override
  QueryGetSendingAndReceivingMessagesPausedResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetSendingAndReceivingMessagesPausedResponse.fromJson(json);
  }
}

/// QuerySendingAndReceivingPausedResponse is the response type for the
/// Query/SendingAndReceivingPaused RPC method.
class QueryGetSendingAndReceivingMessagesPausedResponse
    extends CosmosProtoMessage {
  final circle_cctp_v1_sending_and_receiving_messages_paused.SendingAndReceivingMessagesPaused?
  paused;

  const QueryGetSendingAndReceivingMessagesPausedResponse({this.paused});

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
  List<Object?> get protoValues => [paused];

  @override
  Map<String, dynamic> toJson() {
    return {'paused': paused?.toJson()};
  }

  factory QueryGetSendingAndReceivingMessagesPausedResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetSendingAndReceivingMessagesPausedResponse(
      paused: json.valueTo<
        circle_cctp_v1_sending_and_receiving_messages_paused.SendingAndReceivingMessagesPaused?,
        Map<String, dynamic>
      >(
        key: 'paused',
        parse:
            (v) => circle_cctp_v1_sending_and_receiving_messages_paused
                .SendingAndReceivingMessagesPaused.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetSendingAndReceivingMessagesPausedResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetSendingAndReceivingMessagesPausedResponse(
      paused: decode.messageTo<
        circle_cctp_v1_sending_and_receiving_messages_paused.SendingAndReceivingMessagesPaused?
      >(
        1,
        (b) => circle_cctp_v1_sending_and_receiving_messages_paused
            .SendingAndReceivingMessagesPaused.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1QueryGetSendingAndReceivingMessagesPausedResponse;
}

/// QueryMaxMessageBodySizeRequest is the request type for the
/// Query/MaxMessageBodySize RPC method.
class QueryGetMaxMessageBodySizeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetMaxMessageBodySizeResponse> {
  const QueryGetMaxMessageBodySizeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/max_message_body_size",
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

  factory QueryGetMaxMessageBodySizeRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetMaxMessageBodySizeRequest();
  }

  factory QueryGetMaxMessageBodySizeRequest.deserialize(List<int> bytes) {
    return QueryGetMaxMessageBodySizeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetMaxMessageBodySizeRequest;
  @override
  QueryGetMaxMessageBodySizeResponse onQueryResponse(List<int> bytes) {
    return QueryGetMaxMessageBodySizeResponse.deserialize(bytes);
  }

  @override
  QueryGetMaxMessageBodySizeResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetMaxMessageBodySizeResponse.fromJson(json);
  }
}

/// QueryMaxMessageBodySizeResponse is the response type for the
/// Query/MaxMessageBodySize RPC method.
class QueryGetMaxMessageBodySizeResponse extends CosmosProtoMessage {
  final circle_cctp_v1_max_message_body_size.MaxMessageBodySize? amount;

  const QueryGetMaxMessageBodySizeResponse({this.amount});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toJson()};
  }

  factory QueryGetMaxMessageBodySizeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetMaxMessageBodySizeResponse(
      amount: json.valueTo<
        circle_cctp_v1_max_message_body_size.MaxMessageBodySize?,
        Map<String, dynamic>
      >(
        key: 'amount',
        parse:
            (v) => circle_cctp_v1_max_message_body_size
                .MaxMessageBodySize.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetMaxMessageBodySizeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetMaxMessageBodySizeResponse(
      amount: decode
          .messageTo<circle_cctp_v1_max_message_body_size.MaxMessageBodySize?>(
            1,
            (b) => circle_cctp_v1_max_message_body_size
                .MaxMessageBodySize.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetMaxMessageBodySizeResponse;
}

/// QueryGetNextAvailableNonceRequest is the request type for the
/// Query/NextAvailableNonce RPC method.
class QueryGetNextAvailableNonceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetNextAvailableNonceResponse> {
  const QueryGetNextAvailableNonceRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/next_available_nonce",
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

  factory QueryGetNextAvailableNonceRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetNextAvailableNonceRequest();
  }

  factory QueryGetNextAvailableNonceRequest.deserialize(List<int> bytes) {
    return QueryGetNextAvailableNonceRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetNextAvailableNonceRequest;
  @override
  QueryGetNextAvailableNonceResponse onQueryResponse(List<int> bytes) {
    return QueryGetNextAvailableNonceResponse.deserialize(bytes);
  }

  @override
  QueryGetNextAvailableNonceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetNextAvailableNonceResponse.fromJson(json);
  }
}

/// Query QueryGetNextAvailableNonceResponse is the response type for the
/// Query/NextAvailableNonce RPC method.
class QueryGetNextAvailableNonceResponse extends CosmosProtoMessage {
  final circle_cctp_v1_nonce.Nonce? nonce;

  const QueryGetNextAvailableNonceResponse({this.nonce});

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
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson() {
    return {'nonce': nonce?.toJson()};
  }

  factory QueryGetNextAvailableNonceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetNextAvailableNonceResponse(
      nonce: json.valueTo<circle_cctp_v1_nonce.Nonce?, Map<String, dynamic>>(
        key: 'nonce',
        parse: (v) => circle_cctp_v1_nonce.Nonce.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetNextAvailableNonceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetNextAvailableNonceResponse(
      nonce: decode.messageTo<circle_cctp_v1_nonce.Nonce?>(
        1,
        (b) => circle_cctp_v1_nonce.Nonce.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetNextAvailableNonceResponse;
}

/// QuerySignatureThresholdRequest is the request type for the
/// Query/SignatureThreshold RPC method.
class QueryGetSignatureThresholdRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetSignatureThresholdResponse> {
  const QueryGetSignatureThresholdRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/signature_threshold",
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

  factory QueryGetSignatureThresholdRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetSignatureThresholdRequest();
  }

  factory QueryGetSignatureThresholdRequest.deserialize(List<int> bytes) {
    return QueryGetSignatureThresholdRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetSignatureThresholdRequest;
  @override
  QueryGetSignatureThresholdResponse onQueryResponse(List<int> bytes) {
    return QueryGetSignatureThresholdResponse.deserialize(bytes);
  }

  @override
  QueryGetSignatureThresholdResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetSignatureThresholdResponse.fromJson(json);
  }
}

/// QuerySignatureThresholdResponse is the response type for the
/// Query/SignatureThreshold RPC method.
class QueryGetSignatureThresholdResponse extends CosmosProtoMessage {
  final circle_cctp_v1_signature_threshold.SignatureThreshold? amount;

  const QueryGetSignatureThresholdResponse({this.amount});

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
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toJson()};
  }

  factory QueryGetSignatureThresholdResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetSignatureThresholdResponse(
      amount: json.valueTo<
        circle_cctp_v1_signature_threshold.SignatureThreshold?,
        Map<String, dynamic>
      >(
        key: 'amount',
        parse:
            (v) => circle_cctp_v1_signature_threshold
                .SignatureThreshold.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetSignatureThresholdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetSignatureThresholdResponse(
      amount: decode
          .messageTo<circle_cctp_v1_signature_threshold.SignatureThreshold?>(
            1,
            (b) => circle_cctp_v1_signature_threshold
                .SignatureThreshold.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetSignatureThresholdResponse;
}

/// QueryGetTokenPairRequest is the request type for the Query/TokenPair RPC
/// method.
class QueryGetTokenPairRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetTokenPairResponse> {
  final int? remoteDomain;

  final String? remoteToken;

  const QueryGetTokenPairRequest({this.remoteDomain, this.remoteToken});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/token_pairs/{remote_domain}/{remote_token}",
        ),
      ],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [remoteDomain, remoteToken];

  @override
  Map<String, dynamic> toJson() {
    return {'remote_domain': remoteDomain, 'remote_token': remoteToken};
  }

  factory QueryGetTokenPairRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetTokenPairRequest(
      remoteDomain: json.valueAsInt<int?>(
        'remote_domain',
        acceptCamelCase: true,
      ),
      remoteToken: json.valueAsString<String?>(
        'remote_token',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetTokenPairRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetTokenPairRequest(
      remoteDomain: decode.getInt<int?>(1),
      remoteToken: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetTokenPairRequest;
  @override
  QueryGetTokenPairResponse onQueryResponse(List<int> bytes) {
    return QueryGetTokenPairResponse.deserialize(bytes);
  }

  @override
  QueryGetTokenPairResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetTokenPairResponse.fromJson(json);
  }
}

/// QueryGetTokenPairResponse is the response type for the Query/TokenPair RPC
/// method.
class QueryGetTokenPairResponse extends CosmosProtoMessage {
  final circle_cctp_v1_token_pair.TokenPair? pair;

  const QueryGetTokenPairResponse({this.pair});

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
  List<Object?> get protoValues => [pair];

  @override
  Map<String, dynamic> toJson() {
    return {'pair': pair?.toJson()};
  }

  factory QueryGetTokenPairResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetTokenPairResponse(
      pair: json
          .valueTo<circle_cctp_v1_token_pair.TokenPair?, Map<String, dynamic>>(
            key: 'pair',
            parse: (v) => circle_cctp_v1_token_pair.TokenPair.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGetTokenPairResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetTokenPairResponse(
      pair: decode.messageTo<circle_cctp_v1_token_pair.TokenPair?>(
        1,
        (b) => circle_cctp_v1_token_pair.TokenPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetTokenPairResponse;
}

/// QueryAllTokenPairsRequest is the request type for the Query/TokenPairs RPC
/// method.
class QueryAllTokenPairsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllTokenPairsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllTokenPairsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/token_pairs",
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

  factory QueryAllTokenPairsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllTokenPairsRequest(
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

  factory QueryAllTokenPairsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllTokenPairsRequest(
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllTokenPairsRequest;
  @override
  QueryAllTokenPairsResponse onQueryResponse(List<int> bytes) {
    return QueryAllTokenPairsResponse.deserialize(bytes);
  }

  @override
  QueryAllTokenPairsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllTokenPairsResponse.fromJson(json);
  }
}

/// QueryAllTokenPairsResponse is the response type for the Query/TokenPairs RPC
/// method.
class QueryAllTokenPairsResponse extends CosmosProtoMessage {
  final List<circle_cctp_v1_token_pair.TokenPair> tokenPairs;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllTokenPairsResponse({
    this.tokenPairs = const [],
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
  List<Object?> get protoValues => [tokenPairs, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'token_pairs': tokenPairs.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllTokenPairsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllTokenPairsResponse(
      tokenPairs:
          (json.valueEnsureAsList<dynamic>(
                'token_pairs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  circle_cctp_v1_token_pair.TokenPair,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => circle_cctp_v1_token_pair.TokenPair.fromJson(v),
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

  factory QueryAllTokenPairsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllTokenPairsResponse(
      tokenPairs:
          decode
              .getListOfBytes(1)
              .map((b) => circle_cctp_v1_token_pair.TokenPair.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllTokenPairsResponse;
}

/// QueryGetUsedNonceRequest is the request type for the Query/UsedNonce RPC
/// method.
class QueryGetUsedNonceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetUsedNonceResponse> {
  final int? sourceDomain;

  final BigInt? nonce;

  const QueryGetUsedNonceRequest({this.sourceDomain, this.nonce});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/used_nonces/{source_domain}/{nonce}",
        ),
      ],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sourceDomain, nonce];

  @override
  Map<String, dynamic> toJson() {
    return {'source_domain': sourceDomain, 'nonce': nonce?.toString()};
  }

  factory QueryGetUsedNonceRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetUsedNonceRequest(
      sourceDomain: json.valueAsInt<int?>(
        'source_domain',
        acceptCamelCase: true,
      ),
      nonce: json.valueAsBigInt<BigInt?>('nonce', acceptCamelCase: true),
    );
  }

  factory QueryGetUsedNonceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetUsedNonceRequest(
      sourceDomain: decode.getInt<int?>(1),
      nonce: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetUsedNonceRequest;
  @override
  QueryGetUsedNonceResponse onQueryResponse(List<int> bytes) {
    return QueryGetUsedNonceResponse.deserialize(bytes);
  }

  @override
  QueryGetUsedNonceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetUsedNonceResponse.fromJson(json);
  }
}

/// QueryGetUsedNonceResponse is the response type for the Query/UsedNonce RPC
/// method.
class QueryGetUsedNonceResponse extends CosmosProtoMessage {
  final circle_cctp_v1_nonce.Nonce? nonce;

  const QueryGetUsedNonceResponse({this.nonce});

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
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson() {
    return {'nonce': nonce?.toJson()};
  }

  factory QueryGetUsedNonceResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetUsedNonceResponse(
      nonce: json.valueTo<circle_cctp_v1_nonce.Nonce?, Map<String, dynamic>>(
        key: 'nonce',
        parse: (v) => circle_cctp_v1_nonce.Nonce.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetUsedNonceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetUsedNonceResponse(
      nonce: decode.messageTo<circle_cctp_v1_nonce.Nonce?>(
        1,
        (b) => circle_cctp_v1_nonce.Nonce.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryGetUsedNonceResponse;
}

/// QueryAllUsedNonceRequest is the request type for the Query/UsedNonces RPC
/// method.
class QueryAllUsedNoncesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllUsedNoncesResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllUsedNoncesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/used_nonces",
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

  factory QueryAllUsedNoncesRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllUsedNoncesRequest(
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

  factory QueryAllUsedNoncesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllUsedNoncesRequest(
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllUsedNoncesRequest;
  @override
  QueryAllUsedNoncesResponse onQueryResponse(List<int> bytes) {
    return QueryAllUsedNoncesResponse.deserialize(bytes);
  }

  @override
  QueryAllUsedNoncesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllUsedNoncesResponse.fromJson(json);
  }
}

/// QueryAllUsedNonceResponse is the response type for the Query/UsedNonces RPC
/// method.
class QueryAllUsedNoncesResponse extends CosmosProtoMessage {
  final List<circle_cctp_v1_nonce.Nonce> usedNonces;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllUsedNoncesResponse({
    this.usedNonces = const [],
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
  List<Object?> get protoValues => [usedNonces, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'used_nonces': usedNonces.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllUsedNoncesResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllUsedNoncesResponse(
      usedNonces:
          (json.valueEnsureAsList<dynamic>(
                'used_nonces',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  circle_cctp_v1_nonce.Nonce,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => circle_cctp_v1_nonce.Nonce.fromJson(v),
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

  factory QueryAllUsedNoncesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllUsedNoncesResponse(
      usedNonces:
          decode
              .getListOfBytes(1)
              .map((b) => circle_cctp_v1_nonce.Nonce.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryAllUsedNoncesResponse;
}

/// QueryRemoteTokenMessengerRequest is the request type for the
/// Query/RemoteTokenMessenger RPC method.
class QueryRemoteTokenMessengerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRemoteTokenMessengerResponse> {
  final int? domainId;

  const QueryRemoteTokenMessengerRequest({this.domainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/remote_token_messengers/{domain_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint32(1)],
    );
  }

  @override
  List<Object?> get protoValues => [domainId];

  @override
  Map<String, dynamic> toJson() {
    return {'domain_id': domainId};
  }

  factory QueryRemoteTokenMessengerRequest.fromJson(Map<String, dynamic> json) {
    return QueryRemoteTokenMessengerRequest(
      domainId: json.valueAsInt<int?>('domain_id', acceptCamelCase: true),
    );
  }

  factory QueryRemoteTokenMessengerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRemoteTokenMessengerRequest(domainId: decode.getInt<int?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryRemoteTokenMessengerRequest;
  @override
  QueryRemoteTokenMessengerResponse onQueryResponse(List<int> bytes) {
    return QueryRemoteTokenMessengerResponse.deserialize(bytes);
  }

  @override
  QueryRemoteTokenMessengerResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryRemoteTokenMessengerResponse.fromJson(json);
  }
}

/// QueryRemoteTokenMessengerResponse is the response type for the
/// Query/RemoteTokenMessenger RPC method.
class QueryRemoteTokenMessengerResponse extends CosmosProtoMessage {
  final circle_cctp_v1_remote_token_messenger.RemoteTokenMessenger?
  remoteTokenMessenger;

  const QueryRemoteTokenMessengerResponse({this.remoteTokenMessenger});

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
  List<Object?> get protoValues => [remoteTokenMessenger];

  @override
  Map<String, dynamic> toJson() {
    return {'remote_token_messenger': remoteTokenMessenger?.toJson()};
  }

  factory QueryRemoteTokenMessengerResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryRemoteTokenMessengerResponse(
      remoteTokenMessenger: json.valueTo<
        circle_cctp_v1_remote_token_messenger.RemoteTokenMessenger?,
        Map<String, dynamic>
      >(
        key: 'remote_token_messenger',
        parse:
            (v) => circle_cctp_v1_remote_token_messenger
                .RemoteTokenMessenger.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRemoteTokenMessengerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRemoteTokenMessengerResponse(
      remoteTokenMessenger: decode.messageTo<
        circle_cctp_v1_remote_token_messenger.RemoteTokenMessenger?
      >(
        1,
        (b) => circle_cctp_v1_remote_token_messenger
            .RemoteTokenMessenger.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryRemoteTokenMessengerResponse;
}

/// QueryRemoteTokenMessengersRequest is the request type for the
/// Query/RemoteTokenMessengers RPC method.
class QueryRemoteTokenMessengersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRemoteTokenMessengersResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryRemoteTokenMessengersRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/remote_token_messengers",
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

  factory QueryRemoteTokenMessengersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryRemoteTokenMessengersRequest(
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

  factory QueryRemoteTokenMessengersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRemoteTokenMessengersRequest(
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryRemoteTokenMessengersRequest;
  @override
  QueryRemoteTokenMessengersResponse onQueryResponse(List<int> bytes) {
    return QueryRemoteTokenMessengersResponse.deserialize(bytes);
  }

  @override
  QueryRemoteTokenMessengersResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryRemoteTokenMessengersResponse.fromJson(json);
  }
}

/// QueryRemoteTokenMessengersResponse is the response type for the
/// Query/RemoteTokenMessengers RPC method.
class QueryRemoteTokenMessengersResponse extends CosmosProtoMessage {
  final List<circle_cctp_v1_remote_token_messenger.RemoteTokenMessenger>
  remoteTokenMessengers;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryRemoteTokenMessengersResponse({
    this.remoteTokenMessengers = const [],
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
  List<Object?> get protoValues => [remoteTokenMessengers, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'remote_token_messengers':
          remoteTokenMessengers.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRemoteTokenMessengersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryRemoteTokenMessengersResponse(
      remoteTokenMessengers:
          (json.valueEnsureAsList<dynamic>(
                'remote_token_messengers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  circle_cctp_v1_remote_token_messenger.RemoteTokenMessenger,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => circle_cctp_v1_remote_token_messenger
                          .RemoteTokenMessenger.fromJson(v),
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

  factory QueryRemoteTokenMessengersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRemoteTokenMessengersResponse(
      remoteTokenMessengers:
          decode
              .getListOfBytes(1)
              .map(
                (b) => circle_cctp_v1_remote_token_messenger
                    .RemoteTokenMessenger.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryRemoteTokenMessengersResponse;
}

/// QueryBurnMessageVersionRequest is the request type for the
/// Query/BurnMessageVersion RPC method.
class QueryBurnMessageVersionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBurnMessageVersionResponse> {
  const QueryBurnMessageVersionRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/burn_message_version",
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

  factory QueryBurnMessageVersionRequest.fromJson(Map<String, dynamic> json) {
    return QueryBurnMessageVersionRequest();
  }

  factory QueryBurnMessageVersionRequest.deserialize(List<int> bytes) {
    return QueryBurnMessageVersionRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryBurnMessageVersionRequest;
  @override
  QueryBurnMessageVersionResponse onQueryResponse(List<int> bytes) {
    return QueryBurnMessageVersionResponse.deserialize(bytes);
  }

  @override
  QueryBurnMessageVersionResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBurnMessageVersionResponse.fromJson(json);
  }
}

/// QueryBurnMessageVersionResponse is the response type for the
/// Query/BurnMessageVersion RPC method.
class QueryBurnMessageVersionResponse extends CosmosProtoMessage {
  /// version is the burn message version of the local domain.
  final int? version;

  const QueryBurnMessageVersionResponse({this.version});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1)],
    );
  }

  @override
  List<Object?> get protoValues => [version];

  @override
  Map<String, dynamic> toJson() {
    return {'version': version};
  }

  factory QueryBurnMessageVersionResponse.fromJson(Map<String, dynamic> json) {
    return QueryBurnMessageVersionResponse(
      version: json.valueAsInt<int?>('version', acceptCamelCase: true),
    );
  }

  factory QueryBurnMessageVersionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBurnMessageVersionResponse(version: decode.getInt<int?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryBurnMessageVersionResponse;
}

/// QueryLocalMessageVersionRequest is the request type for the
/// Query/LocalMessageVersion RPC method.
class QueryLocalMessageVersionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLocalMessageVersionResponse> {
  const QueryLocalMessageVersionRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/local_message_version",
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

  factory QueryLocalMessageVersionRequest.fromJson(Map<String, dynamic> json) {
    return QueryLocalMessageVersionRequest();
  }

  factory QueryLocalMessageVersionRequest.deserialize(List<int> bytes) {
    return QueryLocalMessageVersionRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryLocalMessageVersionRequest;
  @override
  QueryLocalMessageVersionResponse onQueryResponse(List<int> bytes) {
    return QueryLocalMessageVersionResponse.deserialize(bytes);
  }

  @override
  QueryLocalMessageVersionResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryLocalMessageVersionResponse.fromJson(json);
  }
}

/// QueryLocalMessageVersionResponse is the response type for the
/// Query/LocalMessageVersion RPC method.
class QueryLocalMessageVersionResponse extends CosmosProtoMessage {
  /// version is the message version of the local domain.
  final int? version;

  const QueryLocalMessageVersionResponse({this.version});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1)],
    );
  }

  @override
  List<Object?> get protoValues => [version];

  @override
  Map<String, dynamic> toJson() {
    return {'version': version};
  }

  factory QueryLocalMessageVersionResponse.fromJson(Map<String, dynamic> json) {
    return QueryLocalMessageVersionResponse(
      version: json.valueAsInt<int?>('version', acceptCamelCase: true),
    );
  }

  factory QueryLocalMessageVersionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLocalMessageVersionResponse(version: decode.getInt<int?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryLocalMessageVersionResponse;
}

/// QueryLocalDomainRequest is the request type for the Query/LocalDomain RPC
/// method.
class QueryLocalDomainRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLocalDomainResponse> {
  const QueryLocalDomainRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/circle/cctp/v1/local_domain",
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

  factory QueryLocalDomainRequest.fromJson(Map<String, dynamic> json) {
    return QueryLocalDomainRequest();
  }

  factory QueryLocalDomainRequest.deserialize(List<int> bytes) {
    return QueryLocalDomainRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryLocalDomainRequest;
  @override
  QueryLocalDomainResponse onQueryResponse(List<int> bytes) {
    return QueryLocalDomainResponse.deserialize(bytes);
  }

  @override
  QueryLocalDomainResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLocalDomainResponse.fromJson(json);
  }
}

/// QueryLocalDomainResponse is the response type for the Query/LocalDomain RPC
/// method.
class QueryLocalDomainResponse extends CosmosProtoMessage {
  /// domain_id is the id of the local domain.
  final int? domainId;

  const QueryLocalDomainResponse({this.domainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1)],
    );
  }

  @override
  List<Object?> get protoValues => [domainId];

  @override
  Map<String, dynamic> toJson() {
    return {'domain_id': domainId};
  }

  factory QueryLocalDomainResponse.fromJson(Map<String, dynamic> json) {
    return QueryLocalDomainResponse(
      domainId: json.valueAsInt<int?>('domain_id', acceptCamelCase: true),
    );
  }

  factory QueryLocalDomainResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLocalDomainResponse(domainId: decode.getInt<int?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1QueryLocalDomainResponse;
}
