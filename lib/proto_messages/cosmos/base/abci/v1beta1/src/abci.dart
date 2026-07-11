import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/tendermint/abci/src/types.dart"
    as tendermint_abci_types;

/// TxResponse defines a structure containing relevant tx data and metadata. The
/// tags are stringified and the log is JSON decoded.
class TxResponse extends CosmosProtoMessage {
  /// The block height
  final BigInt? height;

  /// The transaction hash.
  final String? txhash;

  /// Namespace for the Code
  final String? codespace;

  /// Response code.
  final int? code;

  /// Result bytes, if any.
  final String? data;

  /// The output of the application's logger (raw string). May be
  /// non-deterministic.
  final String? rawLog;

  /// The output of the application's logger (typed). May be non-deterministic.
  final List<ABCIMessageLog> logs;

  /// Additional information. May be non-deterministic.
  final String? info;

  /// Amount of gas requested for transaction.
  final BigInt? gasWanted;

  /// Amount of gas consumed by transaction.
  final BigInt? gasUsed;

  /// The request transaction bytes.
  final google_protobuf_any.Any? tx;

  /// Time of the previous block. For heights > 1, it's the weighted median of
  /// the timestamps of the valid votes in the block.LastCommit. For height == 1,
  /// it's genesis time.
  final String? timestamp;

  /// Events defines all the events emitted by processing a transaction. Note,
  /// these events include those emitted by processing all the messages and those
  /// emitted from the ante. Whereas Logs contains the events, with
  /// additional metadata, emitted only by processing the messages.
  final List<tendermint_abci_types.Event> events;

  const TxResponse({
    this.height,
    this.txhash,
    this.codespace,
    this.code,
    this.data,
    this.rawLog,
    this.logs = const [],
    this.info,
    this.gasWanted,
    this.gasUsed,
    this.tx,
    this.timestamp,
    this.events = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint32(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.int64(9),
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.message(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.45",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    height,
    txhash,
    codespace,
    code,
    data,
    rawLog,
    logs,
    info,
    gasWanted,
    gasUsed,
    tx,
    timestamp,
    events,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'txhash': txhash,
      'codespace': codespace,
      'code': code,
      'data': data,
      'raw_log': rawLog,
      'logs': logs.map((e) => e.toJson()).toList(),
      'info': info,
      'gas_wanted': gasWanted?.toString(),
      'gas_used': gasUsed?.toString(),
      'tx': tx?.toJson(),
      'timestamp': timestamp,
      'events': events.map((e) => e.toJson()).toList(),
    };
  }

  factory TxResponse.fromJson(Map<String, dynamic> json) {
    return TxResponse(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      txhash: json.valueAsString<String?>('txhash', acceptCamelCase: true),
      codespace: json.valueAsString<String?>(
        'codespace',
        acceptCamelCase: true,
      ),
      code: json.valueAsInt<int?>('code', acceptCamelCase: true),
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
      rawLog: json.valueAsString<String?>('raw_log', acceptCamelCase: true),
      logs:
          (json.valueEnsureAsList<dynamic>('logs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<ABCIMessageLog, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => ABCIMessageLog.fromJson(v),
                ),
              )
              .toList(),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      gasWanted: json.valueAsBigInt<BigInt?>(
        'gas_wanted',
        acceptCamelCase: true,
      ),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
      tx: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      timestamp: json.valueAsString<String?>(
        'timestamp',
        acceptCamelCase: true,
      ),
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_abci_types.Event,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => tendermint_abci_types.Event.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory TxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxResponse(
      height: decode.getBigInt<BigInt?>(1),
      txhash: decode.getString<String?>(2),
      codespace: decode.getString<String?>(3),
      code: decode.getInt<int?>(4),
      data: decode.getString<String?>(5),
      rawLog: decode.getString<String?>(6),
      logs:
          decode
              .getListOfBytes(7)
              .map((b) => ABCIMessageLog.deserialize(b))
              .toList(),
      info: decode.getString<String?>(8),
      gasWanted: decode.getBigInt<BigInt?>(9),
      gasUsed: decode.getBigInt<BigInt?>(10),
      tx: decode.messageTo<google_protobuf_any.Any?>(
        11,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      timestamp: decode.getString<String?>(12),
      events:
          decode
              .getListOfBytes(13)
              .map((b) => tendermint_abci_types.Event.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseAbciV1beta1TxResponse;
}

/// ABCIMessageLog defines a structure containing an indexed tx ABCI message log.
class ABCIMessageLog extends CosmosProtoMessage {
  final int? msgIndex;

  final String? log;

  /// Events contains a slice of Event objects that were emitted during some
  /// execution.
  final List<StringEvent> events;

  const ABCIMessageLog({this.msgIndex, this.log, this.events = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [msgIndex, log, events];

  @override
  Map<String, dynamic> toJson() {
    return {
      'msg_index': msgIndex,
      'log': log,
      'events': events.map((e) => e.toJson()).toList(),
    };
  }

  factory ABCIMessageLog.fromJson(Map<String, dynamic> json) {
    return ABCIMessageLog(
      msgIndex: json.valueAsInt<int?>('msg_index', acceptCamelCase: true),
      log: json.valueAsString<String?>('log', acceptCamelCase: true),
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<StringEvent, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => StringEvent.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory ABCIMessageLog.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ABCIMessageLog(
      msgIndex: decode.getInt<int?>(1),
      log: decode.getString<String?>(2),
      events:
          decode
              .getListOfBytes(3)
              .map((b) => StringEvent.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseAbciV1beta1ABCIMessageLog;
}

/// StringEvent defines en Event object wrapper where all the attributes
/// contain key/value pairs that are strings instead of raw bytes.
class StringEvent extends CosmosProtoMessage {
  final String? type;

  final List<Attribute> attributes;

  const StringEvent({this.type, this.attributes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [type, attributes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes.map((e) => e.toJson()).toList(),
    };
  }

  factory StringEvent.fromJson(Map<String, dynamic> json) {
    return StringEvent(
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
      attributes:
          (json.valueEnsureAsList<dynamic>('attributes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Attribute, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Attribute.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory StringEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StringEvent(
      type: decode.getString<String?>(1),
      attributes:
          decode
              .getListOfBytes(2)
              .map((b) => Attribute.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseAbciV1beta1StringEvent;
}

/// Attribute defines an attribute wrapper where the key and value are
/// strings instead of raw bytes.
class Attribute extends CosmosProtoMessage {
  final String? key;

  final String? value;

  const Attribute({this.key, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [key, value];

  @override
  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value};
  }

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
    );
  }

  factory Attribute.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Attribute(
      key: decode.getString<String?>(1),
      value: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseAbciV1beta1Attribute;
}

/// GasInfo defines tx execution gas context.
class GasInfo extends CosmosProtoMessage {
  /// GasWanted is the maximum units of work we allow this tx to perform.
  final BigInt? gasWanted;

  /// GasUsed is the amount of gas actually consumed.
  final BigInt? gasUsed;

  const GasInfo({this.gasWanted, this.gasUsed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [gasWanted, gasUsed];

  @override
  Map<String, dynamic> toJson() {
    return {
      'gas_wanted': gasWanted?.toString(),
      'gas_used': gasUsed?.toString(),
    };
  }

  factory GasInfo.fromJson(Map<String, dynamic> json) {
    return GasInfo(
      gasWanted: json.valueAsBigInt<BigInt?>(
        'gas_wanted',
        acceptCamelCase: true,
      ),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
    );
  }

  factory GasInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GasInfo(
      gasWanted: decode.getBigInt<BigInt?>(1),
      gasUsed: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseAbciV1beta1GasInfo;
}

/// Result is the union of ResponseFormat and ResponseCheckTx.
class Result extends CosmosProtoMessage {
  /// Data is any data returned from message or handler execution. It MUST be
  /// length prefixed in order to separate data from multiple message executions.
  /// Deprecated. This field is still populated, but prefer msg_response instead
  /// because it also contains the Msg response typeURL.
  final List<int>? data;

  /// Log contains the log information from message or handler execution.
  final String? log;

  /// Events contains a slice of Event objects that were emitted during message
  /// or handler execution.
  final List<tendermint_abci_types.Event> events;

  /// msg_responses contains the Msg handler responses type packed in Anys.
  final List<google_protobuf_any.Any> msgResponses;

  const Result({
    this.data,
    this.log,
    this.events = const [],
    this.msgResponses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.46",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, log, events, msgResponses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'log': log,
      'events': events.map((e) => e.toJson()).toList(),
      'msg_responses': msgResponses.map((e) => e.toJson()).toList(),
    };
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      log: json.valueAsString<String?>('log', acceptCamelCase: true),
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_abci_types.Event,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => tendermint_abci_types.Event.fromJson(v),
                ),
              )
              .toList(),
      msgResponses:
          (json.valueEnsureAsList<dynamic>(
                'msg_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory Result.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Result(
      data: decode.getBytes<List<int>?>(1),
      log: decode.getString<String?>(2),
      events:
          decode
              .getListOfBytes(3)
              .map((b) => tendermint_abci_types.Event.deserialize(b))
              .toList(),
      msgResponses:
          decode
              .getListOfBytes(4)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseAbciV1beta1Result;
}
