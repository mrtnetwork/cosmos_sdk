import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// SendQuorumTxResult is the empty return type
class SendQuorumTxResult extends CosmosProtoMessage {
  const SendQuorumTxResult();

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory SendQuorumTxResult.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SendQuorumTxResult();
  }

  factory SendQuorumTxResult.deserialize(List<int> bytes) {
    return SendQuorumTxResult();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSendQuorumTxResult;
}

class SubscribeRequest extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<EventNotification> {
  /// Optional fields to filter what events to subscribe to
  final List<String> eventTypes;

  const SubscribeRequest({this.eventTypes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [eventTypes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'event_types': eventTypes.map((e) => e).toList()};
  }

  factory SubscribeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubscribeRequest(
      eventTypes:
          (json.valueEnsureAsList<dynamic>(
            'event_types',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory SubscribeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubscribeRequest(eventTypes: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSubscribeRequest;
  @override
  EventNotification onServiceResponse(List<int> bytes) {
    return EventNotification.deserialize(bytes);
  }

  @override
  EventNotification onServiceResponseJson(Map<String, dynamic> json) {
    return EventNotification.fromJson(json);
  }
}

class EventNotification extends CosmosProtoMessage {
  final String? eventType;

  final BuBytes? payload;

  final BigInt? timestamp;

  EventNotification({this.eventType, List<int>? payload, this.timestamp})
    : payload = payload?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [eventType, payload, timestamp];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'event_type': eventType,
      'payload': config.encodeBinary(payload),
      'timestamp': config.encodeBigint(timestamp),
    };
  }

  factory EventNotification.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return EventNotification(
      eventType: json.valueAsString<String?>(
        'event_type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      payload: config.decodeBinary<List<int>?>(
        json.valueAs('payload', normalizeKeyLookup: config.normalizeKeys),
      ),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory EventNotification.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EventNotification(
      eventType: decode.getString<String?>(1),
      payload: decode.getBytes<List<int>?>(2),
      timestamp: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesEventNotification;
}

/// SendQuorumNetworkFeeResult is the empty return type
class SendQuorumNetworkFeeResult extends CosmosProtoMessage {
  const SendQuorumNetworkFeeResult();

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory SendQuorumNetworkFeeResult.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SendQuorumNetworkFeeResult();
  }

  factory SendQuorumNetworkFeeResult.deserialize(List<int> bytes) {
    return SendQuorumNetworkFeeResult();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSendQuorumNetworkFeeResult;
}

/// SendQuorumSolvencyResult is the empty return type
class SendQuorumSolvencyResult extends CosmosProtoMessage {
  const SendQuorumSolvencyResult();

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory SendQuorumSolvencyResult.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SendQuorumSolvencyResult();
  }

  factory SendQuorumSolvencyResult.deserialize(List<int> bytes) {
    return SendQuorumSolvencyResult();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSendQuorumSolvencyResult;
}

/// SendQuorumErrataTxResult is the empty return type
class SendQuorumErrataTxResult extends CosmosProtoMessage {
  const SendQuorumErrataTxResult();

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory SendQuorumErrataTxResult.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SendQuorumErrataTxResult();
  }

  factory SendQuorumErrataTxResult.deserialize(List<int> bytes) {
    return SendQuorumErrataTxResult();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSendQuorumErrataTxResult;
}

/// SendQuorumPriceFeedBatchResult is the empty return type
class SendQuorumPriceFeedBatchResult extends CosmosProtoMessage {
  const SendQuorumPriceFeedBatchResult();

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory SendQuorumPriceFeedBatchResult.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SendQuorumPriceFeedBatchResult();
  }

  factory SendQuorumPriceFeedBatchResult.deserialize(List<int> bytes) {
    return SendQuorumPriceFeedBatchResult();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSendQuorumPriceFeedBatchResult;
}
