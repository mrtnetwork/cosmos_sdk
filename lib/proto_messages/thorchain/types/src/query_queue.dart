import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryQueueRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryQueueResponse> {
  final String? height;

  const QueryQueueRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/queue",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryQueueRequest.fromJson(Map<String, dynamic> json) {
    return QueryQueueRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryQueueRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryQueueRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryQueueRequest;
  @override
  QueryQueueResponse onQueryResponse(List<int> bytes) {
    return QueryQueueResponse.deserialize(bytes);
  }

  @override
  QueryQueueResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryQueueResponse.fromJson(json);
  }
}

class QueryQueueResponse extends CosmosProtoMessage {
  final BigInt? swap;

  /// number of signed outbound tx in the queue
  final BigInt? outbound;

  final BigInt? internal;

  /// scheduled outbound value in RUNE
  final String? scheduledOutboundValue;

  /// scheduled outbound clout in RUNE
  final String? scheduledOutboundClout;

  const QueryQueueResponse({
    this.swap,
    this.outbound,
    this.internal,
    this.scheduledOutboundValue,
    this.scheduledOutboundClout,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1, options: const []),
        ProtoFieldConfig.int64(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    swap,
    outbound,
    internal,
    scheduledOutboundValue,
    scheduledOutboundClout,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'swap': swap?.toString(),
      'outbound': outbound?.toString(),
      'internal': internal?.toString(),
      'scheduled_outbound_value': scheduledOutboundValue,
      'scheduled_outbound_clout': scheduledOutboundClout,
    };
  }

  factory QueryQueueResponse.fromJson(Map<String, dynamic> json) {
    return QueryQueueResponse(
      swap: json.valueAsBigInt<BigInt?>('swap', acceptCamelCase: true),
      outbound: json.valueAsBigInt<BigInt?>('outbound', acceptCamelCase: true),
      internal: json.valueAsBigInt<BigInt?>('internal', acceptCamelCase: true),
      scheduledOutboundValue: json.valueAsString<String?>(
        'scheduled_outbound_value',
        acceptCamelCase: true,
      ),
      scheduledOutboundClout: json.valueAsString<String?>(
        'scheduled_outbound_clout',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryQueueResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryQueueResponse(
      swap: decode.getBigInt<BigInt?>(1),
      outbound: decode.getBigInt<BigInt?>(2),
      internal: decode.getBigInt<BigInt?>(3),
      scheduledOutboundValue: decode.getString<String?>(4),
      scheduledOutboundClout: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryQueueResponse;
}
