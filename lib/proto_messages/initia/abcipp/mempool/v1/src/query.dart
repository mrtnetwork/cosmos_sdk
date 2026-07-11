import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// QueryTxDistributionRequest is the request type for the Query.QueryTxDistribution
/// RPC method.
class QueryTxDistributionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTxDistributionResponse> {
  const QueryTxDistributionRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.get,
          path: "/initia/abcipp/mempool/v1/distribution",
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

  factory QueryTxDistributionRequest.fromJson(Map<String, dynamic> json) {
    return QueryTxDistributionRequest();
  }

  factory QueryTxDistributionRequest.deserialize(List<int> bytes) {
    return QueryTxDistributionRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaAbcippMempoolV1QueryTxDistributionRequest;
  @override
  QueryTxDistributionResponse onQueryResponse(List<int> bytes) {
    return QueryTxDistributionResponse.deserialize(bytes);
  }

  @override
  QueryTxDistributionResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTxDistributionResponse.fromJson(json);
  }
}

/// QueryTxDistributionResponse is the response type for the Query.QueryTxDistribution
/// RPC method.
class QueryTxDistributionResponse extends CosmosProtoMessage {
  /// Distribution is a map of lane to the number of transactions in the mempool for that lane.
  final Map<String, BigInt> distribution;

  const QueryTxDistributionResponse({this.distribution = const {}});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.map(
          fieldNumber: 1,
          keyType: ProtoFieldType.string,
          valueType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [distribution];

  @override
  Map<String, dynamic> toJson() {
    return {
      'distribution': distribution.map((k, v) => MapEntry(k, v.toString())),
    };
  }

  factory QueryTxDistributionResponse.fromJson(Map<String, dynamic> json) {
    return QueryTxDistributionResponse(
      distribution: (json.valueAsMap<Map<dynamic, dynamic>>(
        'distribution',
        acceptCamelCase: true,
      )).map(
        (k, v) => MapEntry(
          JsonParser.valueAsString<String>(k),
          JsonParser.valueAsBigInt<BigInt>(v),
        ),
      ),
    );
  }

  factory QueryTxDistributionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxDistributionResponse(
      distribution: decode.getMap<String, BigInt>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .initiaAbcippMempoolV1QueryTxDistributionResponse;
}

/// QueryTxHashRequest is the request type for the Query.QueryTxHash
/// RPC method.
class QueryTxHashRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTxHashResponse> {
  final String? sender;

  final String? sequence;

  const QueryTxHashRequest({this.sender, this.sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.get,
          path: "/initia/abcipp/mempool/v1/{sender}/{sequence}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'sequence': sequence};
  }

  factory QueryTxHashRequest.fromJson(Map<String, dynamic> json) {
    return QueryTxHashRequest(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      sequence: json.valueAsString<String?>('sequence', acceptCamelCase: true),
    );
  }

  factory QueryTxHashRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxHashRequest(
      sender: decode.getString<String?>(1),
      sequence: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaAbcippMempoolV1QueryTxHashRequest;
  @override
  QueryTxHashResponse onQueryResponse(List<int> bytes) {
    return QueryTxHashResponse.deserialize(bytes);
  }

  @override
  QueryTxHashResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTxHashResponse.fromJson(json);
  }
}

/// QueryTxHashResponse is the response type for the Query.QueryTxHash
/// RPC method.
class QueryTxHashResponse extends CosmosProtoMessage {
  final String? txHash;

  const QueryTxHashResponse({this.txHash});

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
  List<Object?> get protoValues => [txHash];

  @override
  Map<String, dynamic> toJson() {
    return {'txHash': txHash};
  }

  factory QueryTxHashResponse.fromJson(Map<String, dynamic> json) {
    return QueryTxHashResponse(
      txHash: json.valueAsString<String?>('txHash', acceptCamelCase: true),
    );
  }

  factory QueryTxHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxHashResponse(txHash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaAbcippMempoolV1QueryTxHashResponse;
}
