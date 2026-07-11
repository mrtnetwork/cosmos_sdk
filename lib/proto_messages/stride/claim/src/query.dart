import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/stride/claim/src/params.dart"
    as stride_claim_params;
import "package:cosmos_sdk/proto_messages/stride/claim/src/claim.dart"
    as stride_claim_claim;
import "package:cosmos_sdk/proto_messages/stride/vesting/src/vesting.dart"
    as stride_vesting_vesting;

class ClaimStatus extends CosmosProtoMessage {
  final String? airdropIdentifier;

  final bool? claimed;

  const ClaimStatus({this.airdropIdentifier, this.claimed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [airdropIdentifier, claimed];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrop_identifier': airdropIdentifier, 'claimed': claimed};
  }

  factory ClaimStatus.fromJson(Map<String, dynamic> json) {
    return ClaimStatus(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      claimed: json.valueAsBool<bool?>('claimed', acceptCamelCase: true),
    );
  }

  factory ClaimStatus.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimStatus(
      airdropIdentifier: decode.getString<String?>(1),
      claimed: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimClaimStatus;
}

class QueryClaimStatusRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClaimStatusResponse> {
  final String? address;

  const QueryClaimStatusRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/claim_status/{address}",
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

  factory QueryClaimStatusRequest.fromJson(Map<String, dynamic> json) {
    return QueryClaimStatusRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryClaimStatusRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimStatusRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimStatusRequest;
  @override
  QueryClaimStatusResponse onQueryResponse(List<int> bytes) {
    return QueryClaimStatusResponse.deserialize(bytes);
  }

  @override
  QueryClaimStatusResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClaimStatusResponse.fromJson(json);
  }
}

class QueryClaimStatusResponse extends CosmosProtoMessage {
  final List<ClaimStatus> claimStatus;

  const QueryClaimStatusResponse({this.claimStatus = const []});

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
  List<Object?> get protoValues => [claimStatus];

  @override
  Map<String, dynamic> toJson() {
    return {'claim_status': claimStatus.map((e) => e.toJson()).toList()};
  }

  factory QueryClaimStatusResponse.fromJson(Map<String, dynamic> json) {
    return QueryClaimStatusResponse(
      claimStatus:
          (json.valueEnsureAsList<dynamic>(
                'claim_status',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<ClaimStatus, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ClaimStatus.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryClaimStatusResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimStatusResponse(
      claimStatus:
          decode
              .getListOfBytes(1)
              .map((b) => ClaimStatus.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimStatusResponse;
}

class ClaimMetadata extends CosmosProtoMessage {
  final String? airdropIdentifier;

  final String? currentRound;

  final google_protobuf_timestamp.Timestamp? currentRoundStart;

  final google_protobuf_timestamp.Timestamp? currentRoundEnd;

  const ClaimMetadata({
    this.airdropIdentifier,
    this.currentRound,
    this.currentRoundStart,
    this.currentRoundEnd,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    airdropIdentifier,
    currentRound,
    currentRoundStart,
    currentRoundEnd,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'airdrop_identifier': airdropIdentifier,
      'current_round': currentRound,
      'current_round_start': currentRoundStart?.toRfc3339(),
      'current_round_end': currentRoundEnd?.toRfc3339(),
    };
  }

  factory ClaimMetadata.fromJson(Map<String, dynamic> json) {
    return ClaimMetadata(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      currentRound: json.valueAsString<String?>(
        'current_round',
        acceptCamelCase: true,
      ),
      currentRoundStart: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'current_round_start',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      currentRoundEnd: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'current_round_end',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory ClaimMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimMetadata(
      airdropIdentifier: decode.getString<String?>(1),
      currentRound: decode.getString<String?>(2),
      currentRoundStart: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      currentRoundEnd: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimClaimMetadata;
}

class QueryClaimMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClaimMetadataResponse> {
  const QueryClaimMetadataRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/claim_metadata",
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

  factory QueryClaimMetadataRequest.fromJson(Map<String, dynamic> json) {
    return QueryClaimMetadataRequest();
  }

  factory QueryClaimMetadataRequest.deserialize(List<int> bytes) {
    return QueryClaimMetadataRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimMetadataRequest;
  @override
  QueryClaimMetadataResponse onQueryResponse(List<int> bytes) {
    return QueryClaimMetadataResponse.deserialize(bytes);
  }

  @override
  QueryClaimMetadataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClaimMetadataResponse.fromJson(json);
  }
}

class QueryClaimMetadataResponse extends CosmosProtoMessage {
  final List<ClaimMetadata> claimMetadata;

  const QueryClaimMetadataResponse({this.claimMetadata = const []});

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
  List<Object?> get protoValues => [claimMetadata];

  @override
  Map<String, dynamic> toJson() {
    return {'claim_metadata': claimMetadata.map((e) => e.toJson()).toList()};
  }

  factory QueryClaimMetadataResponse.fromJson(Map<String, dynamic> json) {
    return QueryClaimMetadataResponse(
      claimMetadata:
          (json.valueEnsureAsList<dynamic>(
                'claim_metadata',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<ClaimMetadata, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ClaimMetadata.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryClaimMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimMetadataResponse(
      claimMetadata:
          decode
              .getListOfBytes(1)
              .map((b) => ClaimMetadata.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimMetadataResponse;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryDistributorAccountBalanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDistributorAccountBalanceResponse> {
  final String? airdropIdentifier;

  const QueryDistributorAccountBalanceRequest({this.airdropIdentifier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/module_account_balance",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [airdropIdentifier];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrop_identifier': airdropIdentifier};
  }

  factory QueryDistributorAccountBalanceRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDistributorAccountBalanceRequest(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDistributorAccountBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDistributorAccountBalanceRequest(
      airdropIdentifier: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideClaimQueryDistributorAccountBalanceRequest;
  @override
  QueryDistributorAccountBalanceResponse onQueryResponse(List<int> bytes) {
    return QueryDistributorAccountBalanceResponse.deserialize(bytes);
  }

  @override
  QueryDistributorAccountBalanceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDistributorAccountBalanceResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryDistributorAccountBalanceResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final List<cosmos_base_v1beta1_coin.Coin> distributorAccountBalance;

  const QueryDistributorAccountBalanceResponse({
    this.distributorAccountBalance = const [],
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [distributorAccountBalance];

  @override
  Map<String, dynamic> toJson() {
    return {
      'distributor_account_balance':
          distributorAccountBalance.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryDistributorAccountBalanceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDistributorAccountBalanceResponse(
      distributorAccountBalance:
          (json.valueEnsureAsList<dynamic>(
                'distributor_account_balance',
                acceptCamelCase: true,
              ))
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

  factory QueryDistributorAccountBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDistributorAccountBalanceResponse(
      distributorAccountBalance:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideClaimQueryDistributorAccountBalanceResponse;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/params",
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

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final stride_claim_params.Params? params;

  const QueryParamsResponse({this.params});

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
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<stride_claim_params.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stride_claim_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stride_claim_params.Params?>(
        1,
        (b) => stride_claim_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryParamsResponse;
}

class QueryClaimRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClaimRecordResponse> {
  final String? airdropIdentifier;

  final String? address;

  const QueryClaimRecordRequest({this.airdropIdentifier, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/claim_record/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [airdropIdentifier, address];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrop_identifier': airdropIdentifier, 'address': address};
  }

  factory QueryClaimRecordRequest.fromJson(Map<String, dynamic> json) {
    return QueryClaimRecordRequest(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryClaimRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimRecordRequest(
      airdropIdentifier: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimRecordRequest;
  @override
  QueryClaimRecordResponse onQueryResponse(List<int> bytes) {
    return QueryClaimRecordResponse.deserialize(bytes);
  }

  @override
  QueryClaimRecordResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryClaimRecordResponse.fromJson(json);
  }
}

class QueryClaimRecordResponse extends CosmosProtoMessage {
  final stride_claim_claim.ClaimRecord? claimRecord;

  const QueryClaimRecordResponse({this.claimRecord});

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
  List<Object?> get protoValues => [claimRecord];

  @override
  Map<String, dynamic> toJson() {
    return {'claim_record': claimRecord?.toJson()};
  }

  factory QueryClaimRecordResponse.fromJson(Map<String, dynamic> json) {
    return QueryClaimRecordResponse(
      claimRecord: json
          .valueTo<stride_claim_claim.ClaimRecord?, Map<String, dynamic>>(
            key: 'claim_record',
            parse: (v) => stride_claim_claim.ClaimRecord.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryClaimRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimRecordResponse(
      claimRecord: decode.messageTo<stride_claim_claim.ClaimRecord?>(
        1,
        (b) => stride_claim_claim.ClaimRecord.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimRecordResponse;
}

class QueryClaimableForActionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryClaimableForActionResponse> {
  final String? airdropIdentifier;

  final String? address;

  final stride_claim_claim.Action? action;

  const QueryClaimableForActionRequest({
    this.airdropIdentifier,
    this.address,
    this.action,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/claimable_for_action/{address}/{action}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.enumType(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [airdropIdentifier, address, action];

  @override
  Map<String, dynamic> toJson() {
    return {
      'airdrop_identifier': airdropIdentifier,
      'address': address,
      'action': action?.protoName,
    };
  }

  factory QueryClaimableForActionRequest.fromJson(Map<String, dynamic> json) {
    return QueryClaimableForActionRequest(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      action: json.valueTo<stride_claim_claim.Action?, Object?>(
        key: 'action',
        parse: (v) => stride_claim_claim.Action.from(v),
      ),
    );
  }

  factory QueryClaimableForActionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimableForActionRequest(
      airdropIdentifier: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      action: decode.getEnum<stride_claim_claim.Action?>(
        3,
        stride_claim_claim.Action.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimableForActionRequest;
  @override
  QueryClaimableForActionResponse onQueryResponse(List<int> bytes) {
    return QueryClaimableForActionResponse.deserialize(bytes);
  }

  @override
  QueryClaimableForActionResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryClaimableForActionResponse.fromJson(json);
  }
}

class QueryClaimableForActionResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const QueryClaimableForActionResponse({this.coins = const []});

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
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory QueryClaimableForActionResponse.fromJson(Map<String, dynamic> json) {
    return QueryClaimableForActionResponse(
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
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

  factory QueryClaimableForActionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryClaimableForActionResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryClaimableForActionResponse;
}

class QueryTotalClaimableRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalClaimableResponse> {
  final String? airdropIdentifier;

  final String? address;

  final bool? includeClaimed;

  const QueryTotalClaimableRequest({
    this.airdropIdentifier,
    this.address,
    this.includeClaimed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/total_claimable/{address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [airdropIdentifier, address, includeClaimed];

  @override
  Map<String, dynamic> toJson() {
    return {
      'airdrop_identifier': airdropIdentifier,
      'address': address,
      'include_claimed': includeClaimed,
    };
  }

  factory QueryTotalClaimableRequest.fromJson(Map<String, dynamic> json) {
    return QueryTotalClaimableRequest(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      includeClaimed: json.valueAsBool<bool?>(
        'include_claimed',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTotalClaimableRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalClaimableRequest(
      airdropIdentifier: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      includeClaimed: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryTotalClaimableRequest;
  @override
  QueryTotalClaimableResponse onQueryResponse(List<int> bytes) {
    return QueryTotalClaimableResponse.deserialize(bytes);
  }

  @override
  QueryTotalClaimableResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTotalClaimableResponse.fromJson(json);
  }
}

class QueryTotalClaimableResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const QueryTotalClaimableResponse({this.coins = const []});

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
  List<Object?> get protoValues => [coins];

  @override
  Map<String, dynamic> toJson() {
    return {'coins': coins.map((e) => e.toJson()).toList()};
  }

  factory QueryTotalClaimableResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalClaimableResponse(
      coins:
          (json.valueEnsureAsList<dynamic>('coins', acceptCamelCase: true))
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

  factory QueryTotalClaimableResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalClaimableResponse(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryTotalClaimableResponse;
}

class QueryUserVestingsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryUserVestingsResponse> {
  final String? address;

  const QueryUserVestingsRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/claim/user_vestings/{address}",
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

  factory QueryUserVestingsRequest.fromJson(Map<String, dynamic> json) {
    return QueryUserVestingsRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryUserVestingsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserVestingsRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryUserVestingsRequest;
  @override
  QueryUserVestingsResponse onQueryResponse(List<int> bytes) {
    return QueryUserVestingsResponse.deserialize(bytes);
  }

  @override
  QueryUserVestingsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryUserVestingsResponse.fromJson(json);
  }
}

class QueryUserVestingsResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> spendableCoins;

  final List<stride_vesting_vesting.Period> periods;

  const QueryUserVestingsResponse({
    this.spendableCoins = const [],
    this.periods = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [spendableCoins, periods];

  @override
  Map<String, dynamic> toJson() {
    return {
      'spendable_coins': spendableCoins.map((e) => e.toJson()).toList(),
      'periods': periods.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryUserVestingsResponse.fromJson(Map<String, dynamic> json) {
    return QueryUserVestingsResponse(
      spendableCoins:
          (json.valueEnsureAsList<dynamic>(
                'spendable_coins',
                acceptCamelCase: true,
              ))
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
      periods:
          (json.valueEnsureAsList<dynamic>('periods', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_vesting_vesting.Period,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_vesting_vesting.Period.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryUserVestingsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryUserVestingsResponse(
      spendableCoins:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      periods:
          decode
              .getListOfBytes(1)
              .map((b) => stride_vesting_vesting.Period.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimQueryUserVestingsResponse;
}
