import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryBlockRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBlockResponse> {
  final String? height;

  const QueryBlockRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/block",
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

  factory QueryBlockRequest.fromJson(Map<String, dynamic> json) {
    return QueryBlockRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryBlockRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBlockRequest;
  @override
  QueryBlockResponse onQueryResponse(List<int> bytes) {
    return QueryBlockResponse.deserialize(bytes);
  }

  @override
  QueryBlockResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBlockResponse.fromJson(json);
  }
}

class QueryBlockResponse extends CosmosProtoMessage {
  final BlockResponseId? id;

  final BlockResponseHeader? header;

  final List<BlockEvent> beginBlockEvents;

  final List<BlockEvent> endBlockEvents;

  final List<BlockEvent> finalizeBlockEvents;

  final List<QueryBlockTx> txs;

  const QueryBlockResponse({
    this.id,
    this.header,
    this.beginBlockEvents = const [],
    this.endBlockEvents = const [],
    this.finalizeBlockEvents = const [],
    this.txs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    header,
    beginBlockEvents,
    endBlockEvents,
    finalizeBlockEvents,
    txs,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toJson(),
      'header': header?.toJson(),
      'begin_block_events': beginBlockEvents.map((e) => e.toJson()).toList(),
      'end_block_events': endBlockEvents.map((e) => e.toJson()).toList(),
      'finalize_block_events':
          finalizeBlockEvents.map((e) => e.toJson()).toList(),
      'txs': txs.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryBlockResponse.fromJson(Map<String, dynamic> json) {
    return QueryBlockResponse(
      id: json.valueTo<BlockResponseId?, Map<String, dynamic>>(
        key: 'id',
        parse: (v) => BlockResponseId.fromJson(v),
        acceptCamelCase: true,
      ),
      header: json.valueTo<BlockResponseHeader?, Map<String, dynamic>>(
        key: 'header',
        parse: (v) => BlockResponseHeader.fromJson(v),
        acceptCamelCase: true,
      ),
      beginBlockEvents:
          (json.valueEnsureAsList<dynamic>(
                'begin_block_events',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<BlockEvent, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => BlockEvent.fromJson(v),
                ),
              )
              .toList(),
      endBlockEvents:
          (json.valueEnsureAsList<dynamic>(
                'end_block_events',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<BlockEvent, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => BlockEvent.fromJson(v),
                ),
              )
              .toList(),
      finalizeBlockEvents:
          (json.valueEnsureAsList<dynamic>(
                'finalize_block_events',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<BlockEvent, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => BlockEvent.fromJson(v),
                ),
              )
              .toList(),
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<QueryBlockTx, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => QueryBlockTx.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryBlockResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockResponse(
      id: decode.messageTo<BlockResponseId?>(
        1,
        (b) => BlockResponseId.deserialize(b),
      ),
      header: decode.messageTo<BlockResponseHeader?>(
        2,
        (b) => BlockResponseHeader.deserialize(b),
      ),
      beginBlockEvents:
          decode
              .getListOfBytes(3)
              .map((b) => BlockEvent.deserialize(b))
              .toList(),
      endBlockEvents:
          decode
              .getListOfBytes(4)
              .map((b) => BlockEvent.deserialize(b))
              .toList(),
      finalizeBlockEvents:
          decode
              .getListOfBytes(6)
              .map((b) => BlockEvent.deserialize(b))
              .toList(),
      txs:
          decode
              .getListOfBytes(5)
              .map((b) => QueryBlockTx.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBlockResponse;
}

class BlockResponseId extends CosmosProtoMessage {
  final String? hash;

  final BlockResponseIdParts? parts;

  const BlockResponseId({this.hash, this.parts});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hash, parts];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash, 'parts': parts?.toJson()};
  }

  factory BlockResponseId.fromJson(Map<String, dynamic> json) {
    return BlockResponseId(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
      parts: json.valueTo<BlockResponseIdParts?, Map<String, dynamic>>(
        key: 'parts',
        parse: (v) => BlockResponseIdParts.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory BlockResponseId.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockResponseId(
      hash: decode.getString<String?>(1),
      parts: decode.messageTo<BlockResponseIdParts?>(
        2,
        (b) => BlockResponseIdParts.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlockResponseId;
}

class BlockResponseIdParts extends CosmosProtoMessage {
  final BigInt? total;

  final String? hash;

  const BlockResponseIdParts({this.total, this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [total, hash];

  @override
  Map<String, dynamic> toJson() {
    return {'total': total?.toString(), 'hash': hash};
  }

  factory BlockResponseIdParts.fromJson(Map<String, dynamic> json) {
    return BlockResponseIdParts(
      total: json.valueAsBigInt<BigInt?>('total', acceptCamelCase: true),
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory BlockResponseIdParts.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockResponseIdParts(
      total: decode.getBigInt<BigInt?>(1),
      hash: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlockResponseIdParts;
}

class BlockResponseHeader extends CosmosProtoMessage {
  final BlockResponseHeaderVersion? version;

  final String? chainId;

  final BigInt? height;

  final String? time;

  final BlockResponseId? lastBlockId;

  final String? lastCommitHash;

  final String? dataHash;

  final String? validatorsHash;

  final String? nextValidatorsHash;

  final String? consensusHash;

  final String? appHash;

  final String? lastResultsHash;

  final String? evidenceHash;

  final String? proposerAddress;

  const BlockResponseHeader({
    this.version,
    this.chainId,
    this.height,
    this.time,
    this.lastBlockId,
    this.lastCommitHash,
    this.dataHash,
    this.validatorsHash,
    this.nextValidatorsHash,
    this.consensusHash,
    this.appHash,
    this.lastResultsHash,
    this.evidenceHash,
    this.proposerAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    version,
    chainId,
    height,
    time,
    lastBlockId,
    lastCommitHash,
    dataHash,
    validatorsHash,
    nextValidatorsHash,
    consensusHash,
    appHash,
    lastResultsHash,
    evidenceHash,
    proposerAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'version': version?.toJson(),
      'chain_id': chainId,
      'height': height?.toString(),
      'time': time,
      'last_block_id': lastBlockId?.toJson(),
      'last_commit_hash': lastCommitHash,
      'data_hash': dataHash,
      'validators_hash': validatorsHash,
      'next_validators_hash': nextValidatorsHash,
      'consensus_hash': consensusHash,
      'app_hash': appHash,
      'last_results_hash': lastResultsHash,
      'evidence_hash': evidenceHash,
      'proposer_address': proposerAddress,
    };
  }

  factory BlockResponseHeader.fromJson(Map<String, dynamic> json) {
    return BlockResponseHeader(
      version: json.valueTo<BlockResponseHeaderVersion?, Map<String, dynamic>>(
        key: 'version',
        parse: (v) => BlockResponseHeaderVersion.fromJson(v),
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueAsString<String?>('time', acceptCamelCase: true),
      lastBlockId: json.valueTo<BlockResponseId?, Map<String, dynamic>>(
        key: 'last_block_id',
        parse: (v) => BlockResponseId.fromJson(v),
        acceptCamelCase: true,
      ),
      lastCommitHash: json.valueAsString<String?>(
        'last_commit_hash',
        acceptCamelCase: true,
      ),
      dataHash: json.valueAsString<String?>('data_hash', acceptCamelCase: true),
      validatorsHash: json.valueAsString<String?>(
        'validators_hash',
        acceptCamelCase: true,
      ),
      nextValidatorsHash: json.valueAsString<String?>(
        'next_validators_hash',
        acceptCamelCase: true,
      ),
      consensusHash: json.valueAsString<String?>(
        'consensus_hash',
        acceptCamelCase: true,
      ),
      appHash: json.valueAsString<String?>('app_hash', acceptCamelCase: true),
      lastResultsHash: json.valueAsString<String?>(
        'last_results_hash',
        acceptCamelCase: true,
      ),
      evidenceHash: json.valueAsString<String?>(
        'evidence_hash',
        acceptCamelCase: true,
      ),
      proposerAddress: json.valueAsString<String?>(
        'proposer_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory BlockResponseHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockResponseHeader(
      version: decode.messageTo<BlockResponseHeaderVersion?>(
        1,
        (b) => BlockResponseHeaderVersion.deserialize(b),
      ),
      chainId: decode.getString<String?>(2),
      height: decode.getBigInt<BigInt?>(3),
      time: decode.getString<String?>(4),
      lastBlockId: decode.messageTo<BlockResponseId?>(
        5,
        (b) => BlockResponseId.deserialize(b),
      ),
      lastCommitHash: decode.getString<String?>(6),
      dataHash: decode.getString<String?>(7),
      validatorsHash: decode.getString<String?>(8),
      nextValidatorsHash: decode.getString<String?>(9),
      consensusHash: decode.getString<String?>(10),
      appHash: decode.getString<String?>(11),
      lastResultsHash: decode.getString<String?>(12),
      evidenceHash: decode.getString<String?>(13),
      proposerAddress: decode.getString<String?>(14),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlockResponseHeader;
}

class BlockResponseHeaderVersion extends CosmosProtoMessage {
  final String? block;

  final String? app;

  const BlockResponseHeaderVersion({this.block, this.app});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [block, app];

  @override
  Map<String, dynamic> toJson() {
    return {'block': block, 'app': app};
  }

  factory BlockResponseHeaderVersion.fromJson(Map<String, dynamic> json) {
    return BlockResponseHeaderVersion(
      block: json.valueAsString<String?>('block', acceptCamelCase: true),
      app: json.valueAsString<String?>('app', acceptCamelCase: true),
    );
  }

  factory BlockResponseHeaderVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockResponseHeaderVersion(
      block: decode.getString<String?>(1),
      app: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlockResponseHeaderVersion;
}

class BlockEvent extends CosmosProtoMessage {
  final List<EventKeyValuePair> eventKvPair;

  const BlockEvent({this.eventKvPair = const []});

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
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [eventKvPair];

  @override
  Map<String, dynamic> toJson() {
    return {'event_kv_pair': eventKvPair.map((e) => e.toJson()).toList()};
  }

  factory BlockEvent.fromJson(Map<String, dynamic> json) {
    return BlockEvent(
      eventKvPair:
          (json.valueEnsureAsList<dynamic>(
                'event_kv_pair',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<EventKeyValuePair, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => EventKeyValuePair.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory BlockEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockEvent(
      eventKvPair:
          decode
              .getListOfBytes(1)
              .map((b) => EventKeyValuePair.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlockEvent;
}

class EventKeyValuePair extends CosmosProtoMessage {
  final String? key;

  final String? value;

  const EventKeyValuePair({this.key, this.value});

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

  factory EventKeyValuePair.fromJson(Map<String, dynamic> json) {
    return EventKeyValuePair(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
    );
  }

  factory EventKeyValuePair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EventKeyValuePair(
      key: decode.getString<String?>(1),
      value: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesEventKeyValuePair;
}

class QueryBlockTx extends CosmosProtoMessage {
  final String? hash;

  final List<int>? tx;

  final BlockTxResult? result;

  const QueryBlockTx({this.hash, this.tx, this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hash, tx, result];

  @override
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'tx': switch (tx) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'result': result?.toJson(),
    };
  }

  factory QueryBlockTx.fromJson(Map<String, dynamic> json) {
    return QueryBlockTx(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
      tx: json.valueAsBytes<List<int>?>(
        'tx',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      result: json.valueTo<BlockTxResult?, Map<String, dynamic>>(
        key: 'result',
        parse: (v) => BlockTxResult.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryBlockTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockTx(
      hash: decode.getString<String?>(1),
      tx: decode.getBytes<List<int>?>(2),
      result: decode.messageTo<BlockTxResult?>(
        3,
        (b) => BlockTxResult.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBlockTx;
}

class BlockTxResult extends CosmosProtoMessage {
  final BigInt? code;

  final String? data;

  final String? log;

  final String? info;

  final String? gasWanted;

  final String? gasUsed;

  final List<BlockEvent> events;

  final String? codespace;

  const BlockTxResult({
    this.code,
    this.data,
    this.log,
    this.info,
    this.gasWanted,
    this.gasUsed,
    this.events = const [],
    this.codespace,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    code,
    data,
    log,
    info,
    gasWanted,
    gasUsed,
    events,
    codespace,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code': code?.toString(),
      'data': data,
      'log': log,
      'info': info,
      'gas_wanted': gasWanted,
      'gas_used': gasUsed,
      'events': events.map((e) => e.toJson()).toList(),
      'codespace': codespace,
    };
  }

  factory BlockTxResult.fromJson(Map<String, dynamic> json) {
    return BlockTxResult(
      code: json.valueAsBigInt<BigInt?>('code', acceptCamelCase: true),
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
      log: json.valueAsString<String?>('log', acceptCamelCase: true),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      gasWanted: json.valueAsString<String?>(
        'gas_wanted',
        acceptCamelCase: true,
      ),
      gasUsed: json.valueAsString<String?>('gas_used', acceptCamelCase: true),
      events:
          (json.valueEnsureAsList<dynamic>('events', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<BlockEvent, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => BlockEvent.fromJson(v),
                ),
              )
              .toList(),
      codespace: json.valueAsString<String?>(
        'codespace',
        acceptCamelCase: true,
      ),
    );
  }

  factory BlockTxResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockTxResult(
      code: decode.getBigInt<BigInt?>(1),
      data: decode.getString<String?>(2),
      log: decode.getString<String?>(3),
      info: decode.getString<String?>(4),
      gasWanted: decode.getString<String?>(5),
      gasUsed: decode.getString<String?>(6),
      events:
          decode
              .getListOfBytes(7)
              .map((b) => BlockEvent.deserialize(b))
              .toList(),
      codespace: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBlockTxResult;
}
