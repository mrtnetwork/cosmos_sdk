import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/params.dart"
    as stride_stakeibc_params;
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/validator.dart"
    as stride_stakeibc_validator;
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/host_zone.dart"
    as stride_stakeibc_host_zone;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/epoch_tracker.dart"
    as stride_stakeibc_epoch_tracker;
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/address_unbonding.dart"
    as stride_stakeibc_address_unbonding;
import "package:cosmos_sdk/proto_messages/stride/stakeibc/src/trade_route.dart"
    as stride_stakeibc_trade_route;

/// QueryInterchainAccountFromAddressRequest is the request type for the
/// Query/InterchainAccountAddress RPC
class QueryInterchainAccountFromAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInterchainAccountFromAddressResponse> {
  final String? owner;

  final String? connectionId;

  const QueryInterchainAccountFromAddressRequest({
    this.owner,
    this.connectionId,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, connectionId];

  @override
  Map<String, dynamic> toJson() {
    return {'owner': owner, 'connection_id': connectionId};
  }

  factory QueryInterchainAccountFromAddressRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryInterchainAccountFromAddressRequest(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInterchainAccountFromAddressRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInterchainAccountFromAddressRequest(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcQueryInterchainAccountFromAddressRequest;
  @override
  QueryInterchainAccountFromAddressResponse onQueryResponse(List<int> bytes) {
    return QueryInterchainAccountFromAddressResponse.deserialize(bytes);
  }

  @override
  QueryInterchainAccountFromAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryInterchainAccountFromAddressResponse.fromJson(json);
  }
}

/// QueryInterchainAccountFromAddressResponse the response type for the
/// Query/InterchainAccountAddress RPC
class QueryInterchainAccountFromAddressResponse extends CosmosProtoMessage {
  final String? interchainAccountAddress;

  const QueryInterchainAccountFromAddressResponse({
    this.interchainAccountAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [interchainAccountAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'interchain_account_address': interchainAccountAddress};
  }

  factory QueryInterchainAccountFromAddressResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryInterchainAccountFromAddressResponse(
      interchainAccountAddress: json.valueAsString<String?>(
        'interchain_account_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryInterchainAccountFromAddressResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInterchainAccountFromAddressResponse(
      interchainAccountAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcQueryInterchainAccountFromAddressResponse;
}

/// QueryParamsRequest is request type for the Query/Params RPC method.
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
          path: "/Stridelabs/stride/stakeibc/params",
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
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final stride_stakeibc_params.Params? params;

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
      params: json
          .valueTo<stride_stakeibc_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => stride_stakeibc_params.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stride_stakeibc_params.Params?>(
        1,
        (b) => stride_stakeibc_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryParamsResponse;
}

class QueryGetValidatorsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetValidatorsResponse> {
  final String? chainId;

  const QueryGetValidatorsRequest({this.chainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/validators/{chain_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [chainId];

  @override
  Map<String, dynamic> toJson() {
    return {'chain_id': chainId};
  }

  factory QueryGetValidatorsRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetValidatorsRequest(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
    );
  }

  factory QueryGetValidatorsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetValidatorsRequest(chainId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetValidatorsRequest;
  @override
  QueryGetValidatorsResponse onQueryResponse(List<int> bytes) {
    return QueryGetValidatorsResponse.deserialize(bytes);
  }

  @override
  QueryGetValidatorsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetValidatorsResponse.fromJson(json);
  }
}

class QueryGetValidatorsResponse extends CosmosProtoMessage {
  final List<stride_stakeibc_validator.Validator> validators;

  const QueryGetValidatorsResponse({this.validators = const []});

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
  List<Object?> get protoValues => [validators];

  @override
  Map<String, dynamic> toJson() {
    return {'validators': validators.map((e) => e.toJson()).toList()};
  }

  factory QueryGetValidatorsResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetValidatorsResponse(
      validators:
          (json.valueEnsureAsList<dynamic>('validators', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_validator.Validator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_stakeibc_validator.Validator.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryGetValidatorsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetValidatorsResponse(
      validators:
          decode
              .getListOfBytes(1)
              .map((b) => stride_stakeibc_validator.Validator.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetValidatorsResponse;
}

class QueryGetHostZoneRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetHostZoneResponse> {
  final String? chainId;

  const QueryGetHostZoneRequest({this.chainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/host_zone/{chain_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [chainId];

  @override
  Map<String, dynamic> toJson() {
    return {'chain_id': chainId};
  }

  factory QueryGetHostZoneRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetHostZoneRequest(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
    );
  }

  factory QueryGetHostZoneRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetHostZoneRequest(chainId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetHostZoneRequest;
  @override
  QueryGetHostZoneResponse onQueryResponse(List<int> bytes) {
    return QueryGetHostZoneResponse.deserialize(bytes);
  }

  @override
  QueryGetHostZoneResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetHostZoneResponse.fromJson(json);
  }
}

class QueryGetHostZoneResponse extends CosmosProtoMessage {
  final stride_stakeibc_host_zone.HostZone? hostZone;

  const QueryGetHostZoneResponse({this.hostZone});

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
  List<Object?> get protoValues => [hostZone];

  @override
  Map<String, dynamic> toJson() {
    return {'host_zone': hostZone?.toJson()};
  }

  factory QueryGetHostZoneResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetHostZoneResponse(
      hostZone: json
          .valueTo<stride_stakeibc_host_zone.HostZone?, Map<String, dynamic>>(
            key: 'host_zone',
            parse: (v) => stride_stakeibc_host_zone.HostZone.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryGetHostZoneResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetHostZoneResponse(
      hostZone: decode.messageTo<stride_stakeibc_host_zone.HostZone?>(
        1,
        (b) => stride_stakeibc_host_zone.HostZone.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetHostZoneResponse;
}

class QueryAllHostZoneRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllHostZoneResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllHostZoneRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/host_zone",
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

  factory QueryAllHostZoneRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllHostZoneRequest(
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

  factory QueryAllHostZoneRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllHostZoneRequest(
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
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAllHostZoneRequest;
  @override
  QueryAllHostZoneResponse onQueryResponse(List<int> bytes) {
    return QueryAllHostZoneResponse.deserialize(bytes);
  }

  @override
  QueryAllHostZoneResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllHostZoneResponse.fromJson(json);
  }
}

class QueryAllHostZoneResponse extends CosmosProtoMessage {
  final List<stride_stakeibc_host_zone.HostZone> hostZone;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllHostZoneResponse({this.hostZone = const [], this.pagination});

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
  List<Object?> get protoValues => [hostZone, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'host_zone': hostZone.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllHostZoneResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllHostZoneResponse(
      hostZone:
          (json.valueEnsureAsList<dynamic>('host_zone', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_host_zone.HostZone,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_stakeibc_host_zone.HostZone.fromJson(v),
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

  factory QueryAllHostZoneResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllHostZoneResponse(
      hostZone:
          decode
              .getListOfBytes(1)
              .map((b) => stride_stakeibc_host_zone.HostZone.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAllHostZoneResponse;
}

class QueryModuleAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleAddressResponse> {
  final String? name;

  const QueryModuleAddressRequest({this.name});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/module_address/{name}",
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

  factory QueryModuleAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleAddressRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
    );
  }

  factory QueryModuleAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleAddressRequest(name: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryModuleAddressRequest;
  @override
  QueryModuleAddressResponse onQueryResponse(List<int> bytes) {
    return QueryModuleAddressResponse.deserialize(bytes);
  }

  @override
  QueryModuleAddressResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleAddressResponse.fromJson(json);
  }
}

class QueryModuleAddressResponse extends CosmosProtoMessage {
  final String? addr;

  const QueryModuleAddressResponse({this.addr});

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
  List<Object?> get protoValues => [addr];

  @override
  Map<String, dynamic> toJson() {
    return {'addr': addr};
  }

  factory QueryModuleAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleAddressResponse(
      addr: json.valueAsString<String?>('addr', acceptCamelCase: true),
    );
  }

  factory QueryModuleAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleAddressResponse(addr: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryModuleAddressResponse;
}

class QueryGetEpochTrackerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetEpochTrackerResponse> {
  final String? epochIdentifier;

  const QueryGetEpochTrackerRequest({this.epochIdentifier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/epoch_tracker/{epoch_identifier}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [epochIdentifier];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch_identifier': epochIdentifier};
  }

  factory QueryGetEpochTrackerRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetEpochTrackerRequest(
      epochIdentifier: json.valueAsString<String?>(
        'epoch_identifier',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetEpochTrackerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetEpochTrackerRequest(
      epochIdentifier: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetEpochTrackerRequest;
  @override
  QueryGetEpochTrackerResponse onQueryResponse(List<int> bytes) {
    return QueryGetEpochTrackerResponse.deserialize(bytes);
  }

  @override
  QueryGetEpochTrackerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetEpochTrackerResponse.fromJson(json);
  }
}

class QueryGetEpochTrackerResponse extends CosmosProtoMessage {
  final stride_stakeibc_epoch_tracker.EpochTracker? epochTracker;

  const QueryGetEpochTrackerResponse({this.epochTracker});

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
  List<Object?> get protoValues => [epochTracker];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch_tracker': epochTracker?.toJson()};
  }

  factory QueryGetEpochTrackerResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetEpochTrackerResponse(
      epochTracker: json.valueTo<
        stride_stakeibc_epoch_tracker.EpochTracker?,
        Map<String, dynamic>
      >(
        key: 'epoch_tracker',
        parse: (v) => stride_stakeibc_epoch_tracker.EpochTracker.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetEpochTrackerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetEpochTrackerResponse(
      epochTracker: decode
          .messageTo<stride_stakeibc_epoch_tracker.EpochTracker?>(
            1,
            (b) => stride_stakeibc_epoch_tracker.EpochTracker.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetEpochTrackerResponse;
}

class QueryAllEpochTrackerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllEpochTrackerResponse> {
  const QueryAllEpochTrackerRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/epoch_tracker",
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

  factory QueryAllEpochTrackerRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllEpochTrackerRequest();
  }

  factory QueryAllEpochTrackerRequest.deserialize(List<int> bytes) {
    return QueryAllEpochTrackerRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAllEpochTrackerRequest;
  @override
  QueryAllEpochTrackerResponse onQueryResponse(List<int> bytes) {
    return QueryAllEpochTrackerResponse.deserialize(bytes);
  }

  @override
  QueryAllEpochTrackerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllEpochTrackerResponse.fromJson(json);
  }
}

class QueryAllEpochTrackerResponse extends CosmosProtoMessage {
  final List<stride_stakeibc_epoch_tracker.EpochTracker> epochTracker;

  const QueryAllEpochTrackerResponse({this.epochTracker = const []});

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
  List<Object?> get protoValues => [epochTracker];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch_tracker': epochTracker.map((e) => e.toJson()).toList()};
  }

  factory QueryAllEpochTrackerResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllEpochTrackerResponse(
      epochTracker:
          (json.valueEnsureAsList<dynamic>(
                'epoch_tracker',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_epoch_tracker.EpochTracker,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_stakeibc_epoch_tracker
                          .EpochTracker.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryAllEpochTrackerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllEpochTrackerResponse(
      epochTracker:
          decode
              .getListOfBytes(1)
              .map(
                (b) =>
                    stride_stakeibc_epoch_tracker.EpochTracker.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAllEpochTrackerResponse;
}

class QueryGetNextPacketSequenceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetNextPacketSequenceResponse> {
  final String? channelId;

  final String? portId;

  const QueryGetNextPacketSequenceRequest({this.channelId, this.portId});

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
              "/Stride-Labs/stride/stakeibc/next_packet_sequence/{channel_id}/{port_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [channelId, portId];

  @override
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId, 'port_id': portId};
  }

  factory QueryGetNextPacketSequenceRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetNextPacketSequenceRequest(
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
    );
  }

  factory QueryGetNextPacketSequenceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetNextPacketSequenceRequest(
      channelId: decode.getString<String?>(1),
      portId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryGetNextPacketSequenceRequest;
  @override
  QueryGetNextPacketSequenceResponse onQueryResponse(List<int> bytes) {
    return QueryGetNextPacketSequenceResponse.deserialize(bytes);
  }

  @override
  QueryGetNextPacketSequenceResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetNextPacketSequenceResponse.fromJson(json);
  }
}

class QueryGetNextPacketSequenceResponse extends CosmosProtoMessage {
  final BigInt? sequence;

  const QueryGetNextPacketSequenceResponse({this.sequence});

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
  List<Object?> get protoValues => [sequence];

  @override
  Map<String, dynamic> toJson() {
    return {'sequence': sequence?.toString()};
  }

  factory QueryGetNextPacketSequenceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryGetNextPacketSequenceResponse(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory QueryGetNextPacketSequenceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetNextPacketSequenceResponse(
      sequence: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStakeibcQueryGetNextPacketSequenceResponse;
}

class QueryAddressUnbondings extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAddressUnbondingsResponse> {
  final String? address;

  const QueryAddressUnbondings({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/unbondings/{address}",
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

  factory QueryAddressUnbondings.fromJson(Map<String, dynamic> json) {
    return QueryAddressUnbondings(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryAddressUnbondings.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAddressUnbondings(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAddressUnbondings;
  @override
  QueryAddressUnbondingsResponse onQueryResponse(List<int> bytes) {
    return QueryAddressUnbondingsResponse.deserialize(bytes);
  }

  @override
  QueryAddressUnbondingsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAddressUnbondingsResponse.fromJson(json);
  }
}

class QueryAddressUnbondingsResponse extends CosmosProtoMessage {
  final List<stride_stakeibc_address_unbonding.AddressUnbonding>
  addressUnbondings;

  const QueryAddressUnbondingsResponse({this.addressUnbondings = const []});

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
  List<Object?> get protoValues => [addressUnbondings];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address_unbondings': addressUnbondings.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryAddressUnbondingsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAddressUnbondingsResponse(
      addressUnbondings:
          (json.valueEnsureAsList<dynamic>(
                'address_unbondings',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_address_unbonding.AddressUnbonding,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_stakeibc_address_unbonding
                          .AddressUnbonding.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryAddressUnbondingsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAddressUnbondingsResponse(
      addressUnbondings:
          decode
              .getListOfBytes(1)
              .map(
                (b) => stride_stakeibc_address_unbonding
                    .AddressUnbonding.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAddressUnbondingsResponse;
}

class QueryAllTradeRoutes extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllTradeRoutesResponse> {
  const QueryAllTradeRoutes();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stride-Labs/stride/stakeibc/trade_routes",
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

  factory QueryAllTradeRoutes.fromJson(Map<String, dynamic> json) {
    return QueryAllTradeRoutes();
  }

  factory QueryAllTradeRoutes.deserialize(List<int> bytes) {
    return QueryAllTradeRoutes();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAllTradeRoutes;
  @override
  QueryAllTradeRoutesResponse onQueryResponse(List<int> bytes) {
    return QueryAllTradeRoutesResponse.deserialize(bytes);
  }

  @override
  QueryAllTradeRoutesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllTradeRoutesResponse.fromJson(json);
  }
}

class QueryAllTradeRoutesResponse extends CosmosProtoMessage {
  final List<stride_stakeibc_trade_route.TradeRoute> tradeRoutes;

  const QueryAllTradeRoutesResponse({this.tradeRoutes = const []});

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
  List<Object?> get protoValues => [tradeRoutes];

  @override
  Map<String, dynamic> toJson() {
    return {'trade_routes': tradeRoutes.map((e) => e.toJson()).toList()};
  }

  factory QueryAllTradeRoutesResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllTradeRoutesResponse(
      tradeRoutes:
          (json.valueEnsureAsList<dynamic>(
                'trade_routes',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stride_stakeibc_trade_route.TradeRoute,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => stride_stakeibc_trade_route.TradeRoute.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryAllTradeRoutesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllTradeRoutesResponse(
      tradeRoutes:
          decode
              .getListOfBytes(1)
              .map((b) => stride_stakeibc_trade_route.TradeRoute.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcQueryAllTradeRoutesResponse;
}
