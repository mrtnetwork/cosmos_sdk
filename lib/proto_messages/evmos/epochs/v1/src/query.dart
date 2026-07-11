import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/evmos/epochs/v1/src/genesis.dart"
    as evmos_epochs_v1_genesis;

/// QueryEpochsInfoRequest is the request type for the Query/EpochInfos RPC
/// method.
class QueryEpochsInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochsInfoResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryEpochsInfoRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/epochs/v1/epochs",
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

  factory QueryEpochsInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryEpochsInfoRequest(
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

  factory QueryEpochsInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochsInfoRequest(
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
      DefaultCosmosProtoTypeUrl.evmosEpochsV1QueryEpochsInfoRequest;
  @override
  QueryEpochsInfoResponse onQueryResponse(List<int> bytes) {
    return QueryEpochsInfoResponse.deserialize(bytes);
  }

  @override
  QueryEpochsInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEpochsInfoResponse.fromJson(json);
  }
}

/// QueryEpochsInfoResponse is the response type for the Query/EpochInfos RPC
/// method.
class QueryEpochsInfoResponse extends CosmosProtoMessage {
  /// epochs is a slice of all EpochInfos
  final List<evmos_epochs_v1_genesis.EpochInfo> epochs;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryEpochsInfoResponse({this.epochs = const [], this.pagination});

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epochs, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epochs': epochs.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryEpochsInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryEpochsInfoResponse(
      epochs:
          (json.valueEnsureAsList<dynamic>('epochs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  evmos_epochs_v1_genesis.EpochInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => evmos_epochs_v1_genesis.EpochInfo.fromJson(v),
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

  factory QueryEpochsInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochsInfoResponse(
      epochs:
          decode
              .getListOfBytes(1)
              .map((b) => evmos_epochs_v1_genesis.EpochInfo.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.evmosEpochsV1QueryEpochsInfoResponse;
}

/// QueryCurrentEpochRequest is the request type for the Query/EpochInfos RPC
/// method.
class QueryCurrentEpochRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCurrentEpochResponse> {
  /// identifier of the current epoch
  final String? identifier;

  const QueryCurrentEpochRequest({this.identifier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/evmos/epochs/v1/current_epoch",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [identifier];

  @override
  Map<String, dynamic> toJson() {
    return {'identifier': identifier};
  }

  factory QueryCurrentEpochRequest.fromJson(Map<String, dynamic> json) {
    return QueryCurrentEpochRequest(
      identifier: json.valueAsString<String?>(
        'identifier',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCurrentEpochRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentEpochRequest(identifier: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosEpochsV1QueryCurrentEpochRequest;
  @override
  QueryCurrentEpochResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentEpochResponse.deserialize(bytes);
  }

  @override
  QueryCurrentEpochResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCurrentEpochResponse.fromJson(json);
  }
}

/// QueryCurrentEpochResponse is the response type for the Query/EpochInfos RPC
/// method.
class QueryCurrentEpochResponse extends CosmosProtoMessage {
  /// current_epoch is the number of the current epoch
  final BigInt? currentEpoch;

  const QueryCurrentEpochResponse({this.currentEpoch});

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
  List<Object?> get protoValues => [currentEpoch];

  @override
  Map<String, dynamic> toJson() {
    return {'current_epoch': currentEpoch?.toString()};
  }

  factory QueryCurrentEpochResponse.fromJson(Map<String, dynamic> json) {
    return QueryCurrentEpochResponse(
      currentEpoch: json.valueAsBigInt<BigInt?>(
        'current_epoch',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryCurrentEpochResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentEpochResponse(
      currentEpoch: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosEpochsV1QueryCurrentEpochResponse;
}
