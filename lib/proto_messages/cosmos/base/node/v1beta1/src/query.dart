import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// ConfigRequest defines the request structure for the Config gRPC query.
class ConfigRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ConfigResponse> {
  const ConfigRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/node/v1beta1/config",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory ConfigRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConfigRequest();
  }

  factory ConfigRequest.deserialize(List<int> bytes) {
    return ConfigRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseNodeV1beta1ConfigRequest;
  @override
  ConfigResponse onQueryResponse(List<int> bytes) {
    return ConfigResponse.deserialize(bytes);
  }

  @override
  ConfigResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ConfigResponse.fromJson(json);
  }
}

/// ConfigResponse defines the response structure for the Config gRPC query.
class ConfigResponse extends CosmosProtoMessage {
  final String? minimumGasPrice;

  final String? pruningKeepRecent;

  final String? pruningInterval;

  final BigInt? haltHeight;

  const ConfigResponse({
    this.minimumGasPrice,
    this.pruningKeepRecent,
    this.pruningInterval,
    this.haltHeight,
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
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    minimumGasPrice,
    pruningKeepRecent,
    pruningInterval,
    haltHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'minimum_gas_price': minimumGasPrice,
      'pruning_keep_recent': pruningKeepRecent,
      'pruning_interval': pruningInterval,
      'halt_height': config.encodeBigint(haltHeight),
    };
  }

  factory ConfigResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConfigResponse(
      minimumGasPrice: json.valueAsString<String?>(
        'minimum_gas_price',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pruningKeepRecent: json.valueAsString<String?>(
        'pruning_keep_recent',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pruningInterval: json.valueAsString<String?>(
        'pruning_interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      haltHeight: json.valueAsBigInt<BigInt?>(
        'halt_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ConfigResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConfigResponse(
      minimumGasPrice: decode.getString<String?>(1),
      pruningKeepRecent: decode.getString<String?>(2),
      pruningInterval: decode.getString<String?>(3),
      haltHeight: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseNodeV1beta1ConfigResponse;
}

/// StateRequest defines the request structure for the status of a node.
class StatusRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<StatusResponse> {
  const StatusRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/node/v1beta1/status",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory StatusRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StatusRequest();
  }

  factory StatusRequest.deserialize(List<int> bytes) {
    return StatusRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseNodeV1beta1StatusRequest;
  @override
  StatusResponse onQueryResponse(List<int> bytes) {
    return StatusResponse.deserialize(bytes);
  }

  @override
  StatusResponse onQueryResponseJson(Map<String, dynamic> json) {
    return StatusResponse.fromJson(json);
  }
}

/// StateResponse defines the response structure for the status of a node.
class StatusResponse extends CosmosProtoMessage {
  final BigInt? earliestStoreHeight;

  /// earliest block height available in the store
  final BigInt? height;

  /// current block height
  final google_protobuf_timestamp.Timestamp? timestamp;

  /// block height timestamp
  final BuBytes? appHash;

  /// app hash of the current block
  final BuBytes? validatorHash;

  StatusResponse({
    this.earliestStoreHeight,
    this.height,
    this.timestamp,
    List<int>? appHash,
    List<int>? validatorHash,
  }) : appHash = appHash?.asImmutableBytes,
       validatorHash = validatorHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    earliestStoreHeight,
    height,
    timestamp,
    appHash,
    validatorHash,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'earliest_store_height': config.encodeBigint(earliestStoreHeight),
      'height': config.encodeBigint(height),
      'timestamp': timestamp?.toRfc3339(),
      'app_hash': config.encodeBinary(appHash),
      'validator_hash': config.encodeBinary(validatorHash),
    };
  }

  factory StatusResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StatusResponse(
      earliestStoreHeight: json.valueAsBigInt<BigInt?>(
        'earliest_store_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'timestamp',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      appHash: config.decodeBinary<List<int>?>(
        json.valueAs('app_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      validatorHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'validator_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory StatusResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StatusResponse(
      earliestStoreHeight: decode.getBigInt<BigInt?>(1),
      height: decode.getBigInt<BigInt?>(2),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      appHash: decode.getBytes<List<int>?>(4),
      validatorHash: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseNodeV1beta1StatusResponse;
}
