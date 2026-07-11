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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SendQuorumTxResult.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'event_types': eventTypes.map((e) => e).toList()};
  }

  factory SubscribeRequest.fromJson(Map<String, dynamic> json) {
    return SubscribeRequest(
      eventTypes:
          (json.valueEnsureAsList<dynamic>(
            'event_types',
            acceptCamelCase: true,
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

  final List<int>? payload;

  final BigInt? timestamp;

  const EventNotification({this.eventType, this.payload, this.timestamp});

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
  Map<String, dynamic> toJson() {
    return {
      'event_type': eventType,
      'payload': switch (payload) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'timestamp': timestamp?.toString(),
    };
  }

  factory EventNotification.fromJson(Map<String, dynamic> json) {
    return EventNotification(
      eventType: json.valueAsString<String?>(
        'event_type',
        acceptCamelCase: true,
      ),
      payload: json.valueAsBytes<List<int>?>(
        'payload',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      timestamp: json.valueAsBigInt<BigInt?>(
        'timestamp',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SendQuorumNetworkFeeResult.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SendQuorumSolvencyResult.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SendQuorumErrataTxResult.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SendQuorumPriceFeedBatchResult.fromJson(Map<String, dynamic> json) {
    return SendQuorumPriceFeedBatchResult();
  }

  factory SendQuorumPriceFeedBatchResult.deserialize(List<int> bytes) {
    return SendQuorumPriceFeedBatchResult();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSendQuorumPriceFeedBatchResult;
}
