import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/epochs/v1beta1/src/genesis.dart"
    as cosmos_epochs_v1beta1_genesis;

/// QueryEpochInfosRequest defines the gRPC request structure for
/// querying all epoch info.
class QueryEpochInfosRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochInfosResponse> {
  const QueryEpochInfosRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/epochs/v1beta1/epochs",
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

  factory QueryEpochInfosRequest.fromJson(Map<String, dynamic> json) {
    return QueryEpochInfosRequest();
  }

  factory QueryEpochInfosRequest.deserialize(List<int> bytes) {
    return QueryEpochInfosRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEpochsV1beta1QueryEpochInfosRequest;
  @override
  QueryEpochInfosResponse onQueryResponse(List<int> bytes) {
    return QueryEpochInfosResponse.deserialize(bytes);
  }

  @override
  QueryEpochInfosResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEpochInfosResponse.fromJson(json);
  }
}

/// QueryEpochInfosRequest defines the gRPC response structure for
/// querying all epoch info.
class QueryEpochInfosResponse extends CosmosProtoMessage {
  final List<cosmos_epochs_v1beta1_genesis.EpochInfo> epochs;

  const QueryEpochInfosResponse({this.epochs = const []});

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
  List<Object?> get protoValues => [epochs];

  @override
  Map<String, dynamic> toJson() {
    return {'epochs': epochs.map((e) => e.toJson()).toList()};
  }

  factory QueryEpochInfosResponse.fromJson(Map<String, dynamic> json) {
    return QueryEpochInfosResponse(
      epochs:
          (json.valueEnsureAsList<dynamic>('epochs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_epochs_v1beta1_genesis.EpochInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          cosmos_epochs_v1beta1_genesis.EpochInfo.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryEpochInfosResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochInfosResponse(
      epochs:
          decode
              .getListOfBytes(1)
              .map(
                (b) => cosmos_epochs_v1beta1_genesis.EpochInfo.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEpochsV1beta1QueryEpochInfosResponse;
}

/// QueryCurrentEpochRequest defines the gRPC request structure for
/// querying an epoch by its identifier.
class QueryCurrentEpochRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCurrentEpochResponse> {
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
          path: "/cosmos/epochs/v1beta1/current_epoch",
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
      DefaultCosmosProtoTypeUrl.cosmosEpochsV1beta1QueryCurrentEpochRequest;
  @override
  QueryCurrentEpochResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentEpochResponse.deserialize(bytes);
  }

  @override
  QueryCurrentEpochResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCurrentEpochResponse.fromJson(json);
  }
}

/// QueryCurrentEpochResponse defines the gRPC response structure for
/// querying an epoch by its identifier.
class QueryCurrentEpochResponse extends CosmosProtoMessage {
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
      DefaultCosmosProtoTypeUrl.cosmosEpochsV1beta1QueryCurrentEpochResponse;
}
