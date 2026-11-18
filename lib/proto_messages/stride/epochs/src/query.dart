import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/stride/epochs/src/genesis.dart"
    as stride_epochs_genesis;

class QueryEpochsInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochsInfoResponse> {
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
          path: "/Stridelabs/stride/epochs",
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

  factory QueryEpochsInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEpochsInfoRequest(
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
      DefaultCosmosProtoTypeUrl.strideEpochsQueryEpochsInfoRequest;
  @override
  QueryEpochsInfoResponse onQueryResponse(List<int> bytes) {
    return QueryEpochsInfoResponse.deserialize(bytes);
  }

  @override
  QueryEpochsInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEpochsInfoResponse.fromJson(json);
  }
}

class QueryEpochsInfoResponse extends CosmosProtoMessage {
  final List<stride_epochs_genesis.EpochInfo> epochs;

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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epochs, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'epochs': epochs.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryEpochsInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEpochsInfoResponse(
      epochs:
          (json.valueEnsureAsList<dynamic>(
                'epochs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<stride_epochs_genesis.EpochInfo, Object>(
                      value: e,
                      parse:
                          (v) => stride_epochs_genesis.EpochInfo.fromJson(
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

  factory QueryEpochsInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochsInfoResponse(
      epochs:
          decode
              .getListOfBytes(1)
              .map((b) => stride_epochs_genesis.EpochInfo.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.strideEpochsQueryEpochsInfoResponse;
}

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
          path: "/Stridelabs/stride/epochs/current_epoch",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [identifier];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'identifier': identifier};
  }

  factory QueryCurrentEpochRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCurrentEpochRequest(
      identifier: json.valueAsString<String?>(
        'identifier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCurrentEpochRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCurrentEpochRequest(identifier: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideEpochsQueryCurrentEpochRequest;
  @override
  QueryCurrentEpochResponse onQueryResponse(List<int> bytes) {
    return QueryCurrentEpochResponse.deserialize(bytes);
  }

  @override
  QueryCurrentEpochResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCurrentEpochResponse.fromJson(json);
  }
}

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'current_epoch': config.encodeBigint(currentEpoch)};
  }

  factory QueryCurrentEpochResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCurrentEpochResponse(
      currentEpoch: json.valueAsBigInt<BigInt?>(
        'current_epoch',
        normalizeKeyLookup: config.normalizeKeys,
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
      DefaultCosmosProtoTypeUrl.strideEpochsQueryCurrentEpochResponse;
}

class QueryEpochInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEpochInfoResponse> {
  final String? identifier;

  const QueryEpochInfoRequest({this.identifier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/Stridelabs/stride/epochs/epoch_info",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [identifier];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'identifier': identifier};
  }

  factory QueryEpochInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEpochInfoRequest(
      identifier: json.valueAsString<String?>(
        'identifier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryEpochInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochInfoRequest(identifier: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideEpochsQueryEpochInfoRequest;
  @override
  QueryEpochInfoResponse onQueryResponse(List<int> bytes) {
    return QueryEpochInfoResponse.deserialize(bytes);
  }

  @override
  QueryEpochInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEpochInfoResponse.fromJson(json);
  }
}

class QueryEpochInfoResponse extends CosmosProtoMessage {
  final stride_epochs_genesis.EpochInfo? epoch;

  const QueryEpochInfoResponse({this.epoch});

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
  List<Object?> get protoValues => [epoch];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'epoch': config.encodeMessage(epoch)};
  }

  factory QueryEpochInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEpochInfoResponse(
      epoch: json.valueTo<stride_epochs_genesis.EpochInfo?, Object>(
        key: 'epoch',
        parse:
            (v) => stride_epochs_genesis.EpochInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryEpochInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEpochInfoResponse(
      epoch: decode.messageTo<stride_epochs_genesis.EpochInfo?>(
        1,
        (b) => stride_epochs_genesis.EpochInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideEpochsQueryEpochInfoResponse;
}
