import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// QueryGetCountRequest defines the request type for querying x/mock count.
class QueryGetCountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGetCountResponse> {
  const QueryGetCountRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryGetCountRequest.fromJson(Map<String, dynamic> json) {
    return QueryGetCountRequest();
  }

  factory QueryGetCountRequest.deserialize(List<int> bytes) {
    return QueryGetCountRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCounterV1QueryGetCountRequest;
  @override
  QueryGetCountResponse onQueryResponse(List<int> bytes) {
    return QueryGetCountResponse.deserialize(bytes);
  }

  @override
  QueryGetCountResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGetCountResponse.fromJson(json);
  }
}

/// QueryGetCountResponse defines the response type for querying x/mock count.
class QueryGetCountResponse extends CosmosProtoMessage {
  final BigInt? totalCount;

  const QueryGetCountResponse({this.totalCount});

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
  List<Object?> get protoValues => [totalCount];

  @override
  Map<String, dynamic> toJson() {
    return {'total_count': totalCount?.toString()};
  }

  factory QueryGetCountResponse.fromJson(Map<String, dynamic> json) {
    return QueryGetCountResponse(
      totalCount: json.valueAsBigInt<BigInt?>(
        'total_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGetCountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGetCountResponse(totalCount: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCounterV1QueryGetCountResponse;
}
