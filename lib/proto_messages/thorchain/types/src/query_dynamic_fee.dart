import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryDynamicL1FeesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDynamicL1FeesResponse> {
  final String? height;

  const QueryDynamicL1FeesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/dynamic_l1_fees",
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

  factory QueryDynamicL1FeesRequest.fromJson(Map<String, dynamic> json) {
    return QueryDynamicL1FeesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryDynamicL1FeesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDynamicL1FeesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDynamicL1FeesRequest;
  @override
  QueryDynamicL1FeesResponse onQueryResponse(List<int> bytes) {
    return QueryDynamicL1FeesResponse.deserialize(bytes);
  }

  @override
  QueryDynamicL1FeesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDynamicL1FeesResponse.fromJson(json);
  }
}

class DynamicL1FeeEntry extends CosmosProtoMessage {
  final String? thorname;

  final String? pair;

  final BigInt? dynamicBps;

  final BigInt? whitelistState;

  final BigInt? lastActiveEpoch;

  final String? latestFeesTor;

  const DynamicL1FeeEntry({
    this.thorname,
    this.pair,
    this.dynamicBps,
    this.whitelistState,
    this.lastActiveEpoch,
    this.latestFeesTor,
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
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    thorname,
    pair,
    dynamicBps,
    whitelistState,
    lastActiveEpoch,
    latestFeesTor,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'thorname': thorname,
      'pair': pair,
      'dynamic_bps': dynamicBps?.toString(),
      'whitelist_state': whitelistState?.toString(),
      'last_active_epoch': lastActiveEpoch?.toString(),
      'latest_fees_tor': latestFeesTor,
    };
  }

  factory DynamicL1FeeEntry.fromJson(Map<String, dynamic> json) {
    return DynamicL1FeeEntry(
      thorname: json.valueAsString<String?>('thorname', acceptCamelCase: true),
      pair: json.valueAsString<String?>('pair', acceptCamelCase: true),
      dynamicBps: json.valueAsBigInt<BigInt?>(
        'dynamic_bps',
        acceptCamelCase: true,
      ),
      whitelistState: json.valueAsBigInt<BigInt?>(
        'whitelist_state',
        acceptCamelCase: true,
      ),
      lastActiveEpoch: json.valueAsBigInt<BigInt?>(
        'last_active_epoch',
        acceptCamelCase: true,
      ),
      latestFeesTor: json.valueAsString<String?>(
        'latest_fees_tor',
        acceptCamelCase: true,
      ),
    );
  }

  factory DynamicL1FeeEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DynamicL1FeeEntry(
      thorname: decode.getString<String?>(1),
      pair: decode.getString<String?>(2),
      dynamicBps: decode.getBigInt<BigInt?>(3),
      whitelistState: decode.getBigInt<BigInt?>(4),
      lastActiveEpoch: decode.getBigInt<BigInt?>(5),
      latestFeesTor: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesDynamicL1FeeEntry;
}

class QueryDynamicL1FeesResponse extends CosmosProtoMessage {
  final List<DynamicL1FeeEntry> entries;

  const QueryDynamicL1FeesResponse({this.entries = const []});

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
  List<Object?> get protoValues => [entries];

  @override
  Map<String, dynamic> toJson() {
    return {'entries': entries.map((e) => e.toJson()).toList()};
  }

  factory QueryDynamicL1FeesResponse.fromJson(Map<String, dynamic> json) {
    return QueryDynamicL1FeesResponse(
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<DynamicL1FeeEntry, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => DynamicL1FeeEntry.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory QueryDynamicL1FeesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDynamicL1FeesResponse(
      entries:
          decode
              .getListOfBytes(1)
              .map((b) => DynamicL1FeeEntry.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDynamicL1FeesResponse;
}

class QueryDynamicL1FeesByThornameRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDynamicL1FeesByThornameResponse> {
  final String? thorname;

  final String? height;

  const QueryDynamicL1FeesByThornameRequest({this.thorname, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/dynamic_l1_fees/{thorname}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [thorname, height];

  @override
  Map<String, dynamic> toJson() {
    return {'thorname': thorname, 'height': height};
  }

  factory QueryDynamicL1FeesByThornameRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDynamicL1FeesByThornameRequest(
      thorname: json.valueAsString<String?>('thorname', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryDynamicL1FeesByThornameRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDynamicL1FeesByThornameRequest(
      thorname: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDynamicL1FeesByThornameRequest;
  @override
  QueryDynamicL1FeesByThornameResponse onQueryResponse(List<int> bytes) {
    return QueryDynamicL1FeesByThornameResponse.deserialize(bytes);
  }

  @override
  QueryDynamicL1FeesByThornameResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDynamicL1FeesByThornameResponse.fromJson(json);
  }
}

class DynamicL1FeePairDetail extends CosmosProtoMessage {
  final String? pair;

  final BigInt? dynamicBps;

  final BigInt? lastActiveEpoch;

  final List<DynamicL1FeeHistoryEntry> history;

  const DynamicL1FeePairDetail({
    this.pair,
    this.dynamicBps,
    this.lastActiveEpoch,
    this.history = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pair, dynamicBps, lastActiveEpoch, history];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pair': pair,
      'dynamic_bps': dynamicBps?.toString(),
      'last_active_epoch': lastActiveEpoch?.toString(),
      'history': history.map((e) => e.toJson()).toList(),
    };
  }

  factory DynamicL1FeePairDetail.fromJson(Map<String, dynamic> json) {
    return DynamicL1FeePairDetail(
      pair: json.valueAsString<String?>('pair', acceptCamelCase: true),
      dynamicBps: json.valueAsBigInt<BigInt?>(
        'dynamic_bps',
        acceptCamelCase: true,
      ),
      lastActiveEpoch: json.valueAsBigInt<BigInt?>(
        'last_active_epoch',
        acceptCamelCase: true,
      ),
      history:
          (json.valueEnsureAsList<dynamic>('history', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  DynamicL1FeeHistoryEntry,
                  Map<String, dynamic>
                >(value: e, parse: (v) => DynamicL1FeeHistoryEntry.fromJson(v)),
              )
              .toList(),
    );
  }

  factory DynamicL1FeePairDetail.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DynamicL1FeePairDetail(
      pair: decode.getString<String?>(1),
      dynamicBps: decode.getBigInt<BigInt?>(2),
      lastActiveEpoch: decode.getBigInt<BigInt?>(3),
      history:
          decode
              .getListOfBytes(4)
              .map((b) => DynamicL1FeeHistoryEntry.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesDynamicL1FeePairDetail;
}

class DynamicL1FeeHistoryEntry extends CosmosProtoMessage {
  final BigInt? epoch;

  final String? volumeTor;

  final String? feesTor;

  final BigInt? bpsAtClose;

  const DynamicL1FeeHistoryEntry({
    this.epoch,
    this.volumeTor,
    this.feesTor,
    this.bpsAtClose,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epoch, volumeTor, feesTor, bpsAtClose];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch': epoch?.toString(),
      'volume_tor': volumeTor,
      'fees_tor': feesTor,
      'bps_at_close': bpsAtClose?.toString(),
    };
  }

  factory DynamicL1FeeHistoryEntry.fromJson(Map<String, dynamic> json) {
    return DynamicL1FeeHistoryEntry(
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
      volumeTor: json.valueAsString<String?>(
        'volume_tor',
        acceptCamelCase: true,
      ),
      feesTor: json.valueAsString<String?>('fees_tor', acceptCamelCase: true),
      bpsAtClose: json.valueAsBigInt<BigInt?>(
        'bps_at_close',
        acceptCamelCase: true,
      ),
    );
  }

  factory DynamicL1FeeHistoryEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DynamicL1FeeHistoryEntry(
      epoch: decode.getBigInt<BigInt?>(1),
      volumeTor: decode.getString<String?>(2),
      feesTor: decode.getString<String?>(3),
      bpsAtClose: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesDynamicL1FeeHistoryEntry;
}

class QueryDynamicL1FeesByThornameResponse extends CosmosProtoMessage {
  final String? thorname;

  final BigInt? whitelistState;

  final List<DynamicL1FeePairDetail> pairs;

  const QueryDynamicL1FeesByThornameResponse({
    this.thorname,
    this.whitelistState,
    this.pairs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [thorname, whitelistState, pairs];

  @override
  Map<String, dynamic> toJson() {
    return {
      'thorname': thorname,
      'whitelist_state': whitelistState?.toString(),
      'pairs': pairs.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryDynamicL1FeesByThornameResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDynamicL1FeesByThornameResponse(
      thorname: json.valueAsString<String?>('thorname', acceptCamelCase: true),
      whitelistState: json.valueAsBigInt<BigInt?>(
        'whitelist_state',
        acceptCamelCase: true,
      ),
      pairs:
          (json.valueEnsureAsList<dynamic>('pairs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  DynamicL1FeePairDetail,
                  Map<String, dynamic>
                >(value: e, parse: (v) => DynamicL1FeePairDetail.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryDynamicL1FeesByThornameResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDynamicL1FeesByThornameResponse(
      thorname: decode.getString<String?>(1),
      whitelistState: decode.getBigInt<BigInt?>(2),
      pairs:
          decode
              .getListOfBytes(3)
              .map((b) => DynamicL1FeePairDetail.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDynamicL1FeesByThornameResponse;
}

class QueryDynamicL1FeesCurrentRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDynamicL1FeesCurrentResponse> {
  final String? height;

  const QueryDynamicL1FeesCurrentRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/dynamic_l1_fees_current",
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

  factory QueryDynamicL1FeesCurrentRequest.fromJson(Map<String, dynamic> json) {
    return QueryDynamicL1FeesCurrentRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryDynamicL1FeesCurrentRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDynamicL1FeesCurrentRequest(
      height: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDynamicL1FeesCurrentRequest;
  @override
  QueryDynamicL1FeesCurrentResponse onQueryResponse(List<int> bytes) {
    return QueryDynamicL1FeesCurrentResponse.deserialize(bytes);
  }

  @override
  QueryDynamicL1FeesCurrentResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryDynamicL1FeesCurrentResponse.fromJson(json);
  }
}

class DynamicL1FeeCurrentEntry extends CosmosProtoMessage {
  final String? thorname;

  final String? pair;

  final String? volumeTor;

  final String? feesTor;

  final BigInt? epoch;

  const DynamicL1FeeCurrentEntry({
    this.thorname,
    this.pair,
    this.volumeTor,
    this.feesTor,
    this.epoch,
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
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.uint64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [thorname, pair, volumeTor, feesTor, epoch];

  @override
  Map<String, dynamic> toJson() {
    return {
      'thorname': thorname,
      'pair': pair,
      'volume_tor': volumeTor,
      'fees_tor': feesTor,
      'epoch': epoch?.toString(),
    };
  }

  factory DynamicL1FeeCurrentEntry.fromJson(Map<String, dynamic> json) {
    return DynamicL1FeeCurrentEntry(
      thorname: json.valueAsString<String?>('thorname', acceptCamelCase: true),
      pair: json.valueAsString<String?>('pair', acceptCamelCase: true),
      volumeTor: json.valueAsString<String?>(
        'volume_tor',
        acceptCamelCase: true,
      ),
      feesTor: json.valueAsString<String?>('fees_tor', acceptCamelCase: true),
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
    );
  }

  factory DynamicL1FeeCurrentEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DynamicL1FeeCurrentEntry(
      thorname: decode.getString<String?>(1),
      pair: decode.getString<String?>(2),
      volumeTor: decode.getString<String?>(3),
      feesTor: decode.getString<String?>(4),
      epoch: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesDynamicL1FeeCurrentEntry;
}

class QueryDynamicL1FeesCurrentResponse extends CosmosProtoMessage {
  final BigInt? epoch;

  final List<DynamicL1FeeCurrentEntry> entries;

  const QueryDynamicL1FeesCurrentResponse({
    this.epoch,
    this.entries = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epoch, entries];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch': epoch?.toString(),
      'entries': entries.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryDynamicL1FeesCurrentResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryDynamicL1FeesCurrentResponse(
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  DynamicL1FeeCurrentEntry,
                  Map<String, dynamic>
                >(value: e, parse: (v) => DynamicL1FeeCurrentEntry.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryDynamicL1FeesCurrentResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDynamicL1FeesCurrentResponse(
      epoch: decode.getBigInt<BigInt?>(1),
      entries:
          decode
              .getListOfBytes(2)
              .map((b) => DynamicL1FeeCurrentEntry.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryDynamicL1FeesCurrentResponse;
}
