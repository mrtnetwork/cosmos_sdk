import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_tss_metric.dart"
    as types_type_tss_metric;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_tx_out.dart"
    as types_type_tx_out;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/misc.dart"
    as types_misc;

class QueryTxStagesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTxStagesResponse> {
  final String? txId;

  final String? height;

  const QueryTxStagesRequest({this.txId, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tx/stages/{tx_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txId, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxStagesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxStagesRequest(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTxStagesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxStagesRequest(
      txId: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxStagesRequest;
  @override
  QueryTxStagesResponse onQueryResponse(List<int> bytes) {
    return QueryTxStagesResponse.deserialize(bytes);
  }

  @override
  QueryTxStagesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTxStagesResponse.fromJson(json);
  }
}

class QueryTxStagesResponse extends CosmosProtoMessage {
  final InboundObservedStage? inboundObserved;

  final InboundConfirmationCountedStage? inboundConfirmationCounted;

  final InboundFinalisedStage? inboundFinalised;

  final SwapStatus? swapStatus;

  final SwapFinalisedStage? swapFinalised;

  final OutboundDelayStage? outboundDelay;

  final OutboundSignedStage? outboundSigned;

  const QueryTxStagesResponse({
    this.inboundObserved,
    this.inboundConfirmationCounted,
    this.inboundFinalised,
    this.swapStatus,
    this.swapFinalised,
    this.outboundDelay,
    this.outboundSigned,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.message(6),
        ProtoFieldConfig.message(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    inboundObserved,
    inboundConfirmationCounted,
    inboundFinalised,
    swapStatus,
    swapFinalised,
    outboundDelay,
    outboundSigned,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'inbound_observed': config.encodeMessage(inboundObserved),
      'inbound_confirmation_counted': config.encodeMessage(
        inboundConfirmationCounted,
      ),
      'inbound_finalised': config.encodeMessage(inboundFinalised),
      'swap_status': config.encodeMessage(swapStatus),
      'swap_finalised': config.encodeMessage(swapFinalised),
      'outbound_delay': config.encodeMessage(outboundDelay),
      'outbound_signed': config.encodeMessage(outboundSigned),
    };
  }

  factory QueryTxStagesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxStagesResponse(
      inboundObserved: json.valueTo<InboundObservedStage?, Object>(
        key: 'inbound_observed',
        parse:
            (v) => InboundObservedStage.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inboundConfirmationCounted: json
          .valueTo<InboundConfirmationCountedStage?, Object>(
            key: 'inbound_confirmation_counted',
            parse:
                (v) => InboundConfirmationCountedStage.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      inboundFinalised: json.valueTo<InboundFinalisedStage?, Object>(
        key: 'inbound_finalised',
        parse:
            (v) => InboundFinalisedStage.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      swapStatus: json.valueTo<SwapStatus?, Object>(
        key: 'swap_status',
        parse:
            (v) => SwapStatus.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      swapFinalised: json.valueTo<SwapFinalisedStage?, Object>(
        key: 'swap_finalised',
        parse:
            (v) => SwapFinalisedStage.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outboundDelay: json.valueTo<OutboundDelayStage?, Object>(
        key: 'outbound_delay',
        parse:
            (v) => OutboundDelayStage.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outboundSigned: json.valueTo<OutboundSignedStage?, Object>(
        key: 'outbound_signed',
        parse:
            (v) => OutboundSignedStage.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTxStagesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxStagesResponse(
      inboundObserved: decode.messageTo<InboundObservedStage?>(
        1,
        (b) => InboundObservedStage.deserialize(b),
      ),
      inboundConfirmationCounted: decode
          .messageTo<InboundConfirmationCountedStage?>(
            2,
            (b) => InboundConfirmationCountedStage.deserialize(b),
          ),
      inboundFinalised: decode.messageTo<InboundFinalisedStage?>(
        3,
        (b) => InboundFinalisedStage.deserialize(b),
      ),
      swapStatus: decode.messageTo<SwapStatus?>(
        4,
        (b) => SwapStatus.deserialize(b),
      ),
      swapFinalised: decode.messageTo<SwapFinalisedStage?>(
        5,
        (b) => SwapFinalisedStage.deserialize(b),
      ),
      outboundDelay: decode.messageTo<OutboundDelayStage?>(
        6,
        (b) => OutboundDelayStage.deserialize(b),
      ),
      outboundSigned: decode.messageTo<OutboundSignedStage?>(
        7,
        (b) => OutboundSignedStage.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxStagesResponse;
}

class QueryTxStatusRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTxStatusResponse> {
  final String? txId;

  final String? height;

  const QueryTxStatusRequest({this.txId, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tx/status/{tx_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txId, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxStatusRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxStatusRequest(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTxStatusRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxStatusRequest(
      txId: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxStatusRequest;
  @override
  QueryTxStatusResponse onQueryResponse(List<int> bytes) {
    return QueryTxStatusResponse.deserialize(bytes);
  }

  @override
  QueryTxStatusResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTxStatusResponse.fromJson(json);
  }
}

class QueryTxStatusResponse extends CosmosProtoMessage {
  final common_common.Tx? tx;

  final List<PlannedOutTx> plannedOutTxs;

  final List<common_common.Tx> outTxs;

  final QueryTxStagesResponse? stages;

  const QueryTxStatusResponse({
    this.tx,
    this.plannedOutTxs = const [],
    this.outTxs = const [],
    this.stages,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tx, plannedOutTxs, outTxs, stages];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx': config.encodeMessage(tx),
      'planned_out_txs':
          plannedOutTxs.map((e) => config.encodeMessage(e)).toList(),
      'out_txs': outTxs.map((e) => config.encodeMessage(e)).toList(),
      'stages': config.encodeMessage(stages),
    };
  }

  factory QueryTxStatusResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxStatusResponse(
      tx: json.valueTo<common_common.Tx?, Object>(
        key: 'tx',
        parse:
            (v) => common_common.Tx.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      plannedOutTxs:
          (json.valueEnsureAsList<dynamic>(
                'planned_out_txs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<PlannedOutTx, Object>(
                  value: e,
                  parse:
                      (v) => PlannedOutTx.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      outTxs:
          (json.valueEnsureAsList<dynamic>(
                'out_txs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<common_common.Tx, Object>(
                  value: e,
                  parse:
                      (v) => common_common.Tx.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      stages: json.valueTo<QueryTxStagesResponse?, Object>(
        key: 'stages',
        parse:
            (v) => QueryTxStagesResponse.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTxStatusResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxStatusResponse(
      tx: decode.messageTo<common_common.Tx?>(
        1,
        (b) => common_common.Tx.deserialize(b),
      ),
      plannedOutTxs:
          decode
              .getListOfBytes(2)
              .map((b) => PlannedOutTx.deserialize(b))
              .toList(),
      outTxs:
          decode
              .getListOfBytes(3)
              .map((b) => common_common.Tx.deserialize(b))
              .toList(),
      stages: decode.messageTo<QueryTxStagesResponse?>(
        4,
        (b) => QueryTxStagesResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxStatusResponse;
}

class QueryTxRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTxResponse> {
  final String? txId;

  final String? height;

  const QueryTxRequest({this.txId, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tx/{tx_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txId, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxRequest(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTxRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxRequest(
      txId: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxRequest;
  @override
  QueryTxResponse onQueryResponse(List<int> bytes) {
    return QueryTxResponse.deserialize(bytes);
  }

  @override
  QueryTxResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTxResponse.fromJson(json);
  }
}

class QueryTxResponse extends CosmosProtoMessage {
  final QueryObservedTx? observedTx;

  /// the thorchain height at which the inbound reached consensus
  final BigInt? consensusHeight;

  /// the thorchain height at which the outbound was finalised
  final BigInt? finalisedHeight;

  /// the thorchain height for which the outbound was scheduled
  final BigInt? outboundHeight;

  final types_type_tss_metric.TssKeysignMetric? keysignMetric;

  const QueryTxResponse({
    this.observedTx,
    this.consensusHeight,
    this.finalisedHeight,
    this.outboundHeight,
    this.keysignMetric,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    observedTx,
    consensusHeight,
    finalisedHeight,
    outboundHeight,
    keysignMetric,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'observed_tx': config.encodeMessage(observedTx),
      'consensus_height': config.encodeBigint(consensusHeight),
      'finalised_height': config.encodeBigint(finalisedHeight),
      'outbound_height': config.encodeBigint(outboundHeight),
      'keysign_metric': config.encodeMessage(keysignMetric),
    };
  }

  factory QueryTxResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxResponse(
      observedTx: json.valueTo<QueryObservedTx?, Object>(
        key: 'observed_tx',
        parse:
            (v) =>
                QueryObservedTx.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      consensusHeight: json.valueAsBigInt<BigInt?>(
        'consensus_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      finalisedHeight: json.valueAsBigInt<BigInt?>(
        'finalised_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outboundHeight: json.valueAsBigInt<BigInt?>(
        'outbound_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keysignMetric: json
          .valueTo<types_type_tss_metric.TssKeysignMetric?, Object>(
            key: 'keysign_metric',
            parse:
                (v) => types_type_tss_metric.TssKeysignMetric.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxResponse(
      observedTx: decode.messageTo<QueryObservedTx?>(
        1,
        (b) => QueryObservedTx.deserialize(b),
      ),
      consensusHeight: decode.getBigInt<BigInt?>(2),
      finalisedHeight: decode.getBigInt<BigInt?>(3),
      outboundHeight: decode.getBigInt<BigInt?>(4),
      keysignMetric: decode.messageTo<types_type_tss_metric.TssKeysignMetric?>(
        5,
        (b) => types_type_tss_metric.TssKeysignMetric.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxResponse;
}

/// Same as ObservedTx, but changes block_height and finalise_height (openapi
/// spec)
class QueryObservedTx extends CosmosProtoMessage {
  final common_common.Tx? tx;

  final String? status;

  final List<String> outHashes;

  final BigInt? blockHeight;

  final List<String> signers;

  final String? observedPubKey;

  final BigInt? keysignMs;

  final BigInt? finaliseHeight;

  final String? aggregator;

  final String? aggregatorTarget;

  final String? aggregatorTargetLimit;

  final List<common_common.OutputRef> spentOutputRefs;

  const QueryObservedTx({
    this.tx,
    this.status,
    this.outHashes = const [],
    this.blockHeight,
    this.signers = const [],
    this.observedPubKey,
    this.keysignMs,
    this.finaliseHeight,
    this.aggregator,
    this.aggregatorTarget,
    this.aggregatorTargetLimit,
    this.spentOutputRefs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.int64(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.int64(8, options: const []),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tx,
    status,
    outHashes,
    blockHeight,
    signers,
    observedPubKey,
    keysignMs,
    finaliseHeight,
    aggregator,
    aggregatorTarget,
    aggregatorTargetLimit,
    spentOutputRefs,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx': config.encodeMessage(tx),
      'status': status,
      'out_hashes': outHashes.map((e) => e).toList(),
      'block_height': config.encodeBigint(blockHeight),
      'signers': signers.map((e) => e).toList(),
      'observed_pub_key': observedPubKey,
      'keysign_ms': config.encodeBigint(keysignMs),
      'finalise_height': config.encodeBigint(finaliseHeight),
      'aggregator': aggregator,
      'aggregator_target': aggregatorTarget,
      'aggregator_target_limit': aggregatorTargetLimit,
      'spent_output_refs':
          spentOutputRefs.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryObservedTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryObservedTx(
      tx: json.valueTo<common_common.Tx?, Object>(
        key: 'tx',
        parse:
            (v) => common_common.Tx.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueAsString<String?>(
        'status',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outHashes:
          (json.valueEnsureAsList<dynamic>(
            'out_hashes',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signers:
          (json.valueEnsureAsList<dynamic>(
            'signers',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      observedPubKey: json.valueAsString<String?>(
        'observed_pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keysignMs: json.valueAsBigInt<BigInt?>(
        'keysign_ms',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      finaliseHeight: json.valueAsBigInt<BigInt?>(
        'finalise_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregator: json.valueAsString<String?>(
        'aggregator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregatorTarget: json.valueAsString<String?>(
        'aggregator_target',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregatorTargetLimit: json.valueAsString<String?>(
        'aggregator_target_limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      spentOutputRefs:
          (json.valueEnsureAsList<dynamic>(
                'spent_output_refs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<common_common.OutputRef, Object>(
                  value: e,
                  parse:
                      (v) => common_common.OutputRef.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryObservedTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryObservedTx(
      tx: decode.messageTo<common_common.Tx?>(
        1,
        (b) => common_common.Tx.deserialize(b),
      ),
      status: decode.getString<String?>(2),
      outHashes: decode.getListOrEmpty<String>(3),
      blockHeight: decode.getBigInt<BigInt?>(4),
      signers: decode.getListOrEmpty<String>(5),
      observedPubKey: decode.getString<String?>(6),
      keysignMs: decode.getBigInt<BigInt?>(7),
      finaliseHeight: decode.getBigInt<BigInt?>(8),
      aggregator: decode.getString<String?>(9),
      aggregatorTarget: decode.getString<String?>(10),
      aggregatorTargetLimit: decode.getString<String?>(11),
      spentOutputRefs:
          decode
              .getListOfBytes(12)
              .map((b) => common_common.OutputRef.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryObservedTx;
}

/// Same as ObservedTxVoter, but changes height (openapi spec)
class QueryObservedTxVoter extends CosmosProtoMessage {
  final String? txId;

  final QueryObservedTx? tx;

  final BigInt? height;

  final List<QueryObservedTx> txs;

  final List<types_type_tx_out.TxOutItem> actions;

  final List<common_common.Tx> outTxs;

  final BigInt? finalisedHeight;

  final bool? updatedVault;

  final bool? reverted;

  final BigInt? outboundHeight;

  const QueryObservedTxVoter({
    this.txId,
    this.tx,
    this.height,
    this.txs = const [],
    this.actions = const [],
    this.outTxs = const [],
    this.finalisedHeight,
    this.updatedVault,
    this.reverted,
    this.outboundHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.bool(8),
        ProtoFieldConfig.bool(9),
        ProtoFieldConfig.int64(10),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    txId,
    tx,
    height,
    txs,
    actions,
    outTxs,
    finalisedHeight,
    updatedVault,
    reverted,
    outboundHeight,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'tx_id': txId,
      'tx': config.encodeMessage(tx),
      'height': config.encodeBigint(height),
      'txs': txs.map((e) => config.encodeMessage(e)).toList(),
      'actions': actions.map((e) => config.encodeMessage(e)).toList(),
      'out_txs': outTxs.map((e) => config.encodeMessage(e)).toList(),
      'finalised_height': config.encodeBigint(finalisedHeight),
      'updated_vault': updatedVault,
      'reverted': reverted,
      'outbound_height': config.encodeBigint(outboundHeight),
    };
  }

  factory QueryObservedTxVoter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryObservedTxVoter(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tx: json.valueTo<QueryObservedTx?, Object>(
        key: 'tx',
        parse:
            (v) =>
                QueryObservedTx.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txs:
          (json.valueEnsureAsList<dynamic>(
                'txs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryObservedTx, Object>(
                  value: e,
                  parse:
                      (v) => QueryObservedTx.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      actions:
          (json.valueEnsureAsList<dynamic>(
                'actions',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<types_type_tx_out.TxOutItem, Object>(
                  value: e,
                  parse:
                      (v) => types_type_tx_out.TxOutItem.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      outTxs:
          (json.valueEnsureAsList<dynamic>(
                'out_txs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<common_common.Tx, Object>(
                  value: e,
                  parse:
                      (v) => common_common.Tx.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      finalisedHeight: json.valueAsBigInt<BigInt?>(
        'finalised_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      updatedVault: json.valueAsBool<bool?>(
        'updated_vault',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reverted: json.valueAsBool<bool?>(
        'reverted',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outboundHeight: json.valueAsBigInt<BigInt?>(
        'outbound_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryObservedTxVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryObservedTxVoter(
      txId: decode.getString<String?>(1),
      tx: decode.messageTo<QueryObservedTx?>(
        2,
        (b) => QueryObservedTx.deserialize(b),
      ),
      height: decode.getBigInt<BigInt?>(3),
      txs:
          decode
              .getListOfBytes(4)
              .map((b) => QueryObservedTx.deserialize(b))
              .toList(),
      actions:
          decode
              .getListOfBytes(5)
              .map((b) => types_type_tx_out.TxOutItem.deserialize(b))
              .toList(),
      outTxs:
          decode
              .getListOfBytes(6)
              .map((b) => common_common.Tx.deserialize(b))
              .toList(),
      finalisedHeight: decode.getBigInt<BigInt?>(7),
      updatedVault: decode.getBool<bool?>(8),
      reverted: decode.getBool<bool?>(9),
      outboundHeight: decode.getBigInt<BigInt?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryObservedTxVoter;
}

class QueryTxVotersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryObservedTxVoter> {
  final String? txId;

  final String? height;

  const QueryTxVotersRequest({this.txId, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tx/details/{tx_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tx/{tx_id}/signers",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txId, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxVotersRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTxVotersRequest(
      txId: json.valueAsString<String?>(
        'tx_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTxVotersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxVotersRequest(
      txId: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxVotersRequest;
  @override
  QueryObservedTxVoter onQueryResponse(List<int> bytes) {
    return QueryObservedTxVoter.deserialize(bytes);
  }

  @override
  QueryObservedTxVoter onQueryResponseJson(Map<String, dynamic> json) {
    return QueryObservedTxVoter.fromJson(json);
  }
}

class PlannedOutTx extends CosmosProtoMessage {
  final String? chain;

  final String? toAddress;

  final common_common.Coin? coin;

  /// returns true if the planned transaction has a refund memo
  final bool? refund;

  const PlannedOutTx({this.chain, this.toAddress, this.coin, this.refund});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.bool(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chain, toAddress, coin, refund];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'chain': chain,
      'to_address': toAddress,
      'coin': config.encodeMessage(coin),
      'refund': refund,
    };
  }

  factory PlannedOutTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PlannedOutTx(
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coin: json.valueTo<common_common.Coin?, Object>(
        key: 'coin',
        parse:
            (v) => common_common.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      refund: json.valueAsBool<bool?>(
        'refund',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory PlannedOutTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PlannedOutTx(
      chain: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      coin: decode.messageTo<common_common.Coin?>(
        3,
        (b) => common_common.Coin.deserialize(b),
      ),
      refund: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesPlannedOutTx;
}

class InboundObservedStage extends CosmosProtoMessage {
  /// returns true if any nodes have observed the transaction (to be deprecated
  /// in favour of counts)
  final bool? started;

  /// number of signers for pre-confirmation-counting observations
  final BigInt? preConfirmationCount;

  /// number of signers for final observations, after any confirmation counting
  /// complete
  final BigInt? finalCount;

  /// returns true if no transaction observation remains to be done
  final bool? completed;

  const InboundObservedStage({
    this.started,
    this.preConfirmationCount,
    this.finalCount,
    this.completed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3, options: const []),
        ProtoFieldConfig.bool(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    started,
    preConfirmationCount,
    finalCount,
    completed,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'started': started,
      'pre_confirmation_count': config.encodeBigint(preConfirmationCount),
      'final_count': config.encodeBigint(finalCount),
      'completed': completed,
    };
  }

  factory InboundObservedStage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return InboundObservedStage(
      started: json.valueAsBool<bool?>(
        'started',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      preConfirmationCount: json.valueAsBigInt<BigInt?>(
        'pre_confirmation_count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      finalCount: json.valueAsBigInt<BigInt?>(
        'final_count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      completed: json.valueAsBool<bool?>(
        'completed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory InboundObservedStage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InboundObservedStage(
      started: decode.getBool<bool?>(1),
      preConfirmationCount: decode.getBigInt<BigInt?>(2),
      finalCount: decode.getBigInt<BigInt?>(3),
      completed: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesInboundObservedStage;
}

class InboundConfirmationCountedStage extends CosmosProtoMessage {
  /// the THORChain block height when confirmation counting began
  final BigInt? countingStartHeight;

  /// the external source chain for which confirmation counting takes place
  final String? chain;

  /// the block height on the external source chain when the transaction was
  /// observed
  final BigInt? externalObservedHeight;

  /// the block height on the external source chain when confirmation counting
  /// will be complete
  final BigInt? externalConfirmationDelayHeight;

  /// the estimated remaining seconds before confirmation counting completes
  final BigInt? remainingConfirmationSeconds;

  /// returns true if no transaction confirmation counting remains to be done
  final bool? completed;

  const InboundConfirmationCountedStage({
    this.countingStartHeight,
    this.chain,
    this.externalObservedHeight,
    this.externalConfirmationDelayHeight,
    this.remainingConfirmationSeconds,
    this.completed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.bool(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    countingStartHeight,
    chain,
    externalObservedHeight,
    externalConfirmationDelayHeight,
    remainingConfirmationSeconds,
    completed,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'counting_start_height': config.encodeBigint(countingStartHeight),
      'chain': chain,
      'external_observed_height': config.encodeBigint(externalObservedHeight),
      'external_confirmation_delay_height': config.encodeBigint(
        externalConfirmationDelayHeight,
      ),
      'remaining_confirmation_seconds': config.encodeBigint(
        remainingConfirmationSeconds,
      ),
      'completed': completed,
    };
  }

  factory InboundConfirmationCountedStage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return InboundConfirmationCountedStage(
      countingStartHeight: json.valueAsBigInt<BigInt?>(
        'counting_start_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      externalObservedHeight: json.valueAsBigInt<BigInt?>(
        'external_observed_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      externalConfirmationDelayHeight: json.valueAsBigInt<BigInt?>(
        'external_confirmation_delay_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remainingConfirmationSeconds: json.valueAsBigInt<BigInt?>(
        'remaining_confirmation_seconds',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      completed: json.valueAsBool<bool?>(
        'completed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory InboundConfirmationCountedStage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InboundConfirmationCountedStage(
      countingStartHeight: decode.getBigInt<BigInt?>(1),
      chain: decode.getString<String?>(2),
      externalObservedHeight: decode.getBigInt<BigInt?>(3),
      externalConfirmationDelayHeight: decode.getBigInt<BigInt?>(4),
      remainingConfirmationSeconds: decode.getBigInt<BigInt?>(5),
      completed: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesInboundConfirmationCountedStage;
}

class InboundFinalisedStage extends CosmosProtoMessage {
  /// returns true if the inbound transaction has been finalised (THORChain
  /// agreeing it exists)
  final bool? completed;

  const InboundFinalisedStage({this.completed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [completed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'completed': completed};
  }

  factory InboundFinalisedStage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return InboundFinalisedStage(
      completed: json.valueAsBool<bool?>(
        'completed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory InboundFinalisedStage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InboundFinalisedStage(completed: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesInboundFinalisedStage;
}

class SwapStatus extends CosmosProtoMessage {
  /// true when awaiting a swap
  final bool? pending;

  final StreamingStatus? streaming;

  const SwapStatus({this.pending, this.streaming});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pending, streaming];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pending': pending, 'streaming': config.encodeMessage(streaming)};
  }

  factory SwapStatus.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapStatus(
      pending: json.valueAsBool<bool?>(
        'pending',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      streaming: json.valueTo<StreamingStatus?, Object>(
        key: 'streaming',
        parse:
            (v) =>
                StreamingStatus.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapStatus.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapStatus(
      pending: decode.getBool<bool?>(1),
      streaming: decode.messageTo<StreamingStatus?>(
        2,
        (b) => StreamingStatus.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSwapStatus;
}

class StreamingStatus extends CosmosProtoMessage {
  /// how often each swap is made, in blocks
  final BigInt? interval;

  /// the total number of swaps in a streaming swaps
  final BigInt? quantity;

  /// the amount of swap attempts so far
  final BigInt? count;

  const StreamingStatus({this.interval, this.quantity, this.count});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [interval, quantity, count];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'interval': config.encodeBigint(interval),
      'quantity': config.encodeBigint(quantity),
      'count': config.encodeBigint(count),
    };
  }

  factory StreamingStatus.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StreamingStatus(
      interval: json.valueAsBigInt<BigInt?>(
        'interval',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      quantity: json.valueAsBigInt<BigInt?>(
        'quantity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      count: json.valueAsBigInt<BigInt?>(
        'count',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory StreamingStatus.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StreamingStatus(
      interval: decode.getBigInt<BigInt?>(1),
      quantity: decode.getBigInt<BigInt?>(2),
      count: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesStreamingStatus;
}

class SwapFinalisedStage extends CosmosProtoMessage {
  /// (to be deprecated in favor of swap_status) returns true if an inbound
  /// transaction's swap (successful or refunded) is no longer pending
  final bool? completed;

  const SwapFinalisedStage({this.completed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [completed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'completed': completed};
  }

  factory SwapFinalisedStage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SwapFinalisedStage(
      completed: json.valueAsBool<bool?>(
        'completed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SwapFinalisedStage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SwapFinalisedStage(completed: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesSwapFinalisedStage;
}

class OutboundDelayStage extends CosmosProtoMessage {
  /// the number of remaining THORChain blocks the outbound will be delayed
  final BigInt? remainingDelayBlocks;

  /// the estimated remaining seconds of the outbound delay before it will be
  /// sent
  final BigInt? remainingDelaySeconds;

  /// returns true if no transaction outbound delay remains
  final bool? completed;

  const OutboundDelayStage({
    this.remainingDelayBlocks,
    this.remainingDelaySeconds,
    this.completed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.bool(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    remainingDelayBlocks,
    remainingDelaySeconds,
    completed,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'remaining_delay_blocks': config.encodeBigint(remainingDelayBlocks),
      'remaining_delay_seconds': config.encodeBigint(remainingDelaySeconds),
      'completed': completed,
    };
  }

  factory OutboundDelayStage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OutboundDelayStage(
      remainingDelayBlocks: json.valueAsBigInt<BigInt?>(
        'remaining_delay_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remainingDelaySeconds: json.valueAsBigInt<BigInt?>(
        'remaining_delay_seconds',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      completed: json.valueAsBool<bool?>(
        'completed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OutboundDelayStage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OutboundDelayStage(
      remainingDelayBlocks: decode.getBigInt<BigInt?>(1),
      remainingDelaySeconds: decode.getBigInt<BigInt?>(2),
      completed: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesOutboundDelayStage;
}

class OutboundSignedStage extends CosmosProtoMessage {
  /// THORChain height for which the external outbound is scheduled
  final BigInt? scheduledOutboundHeight;

  /// THORChain blocks since the scheduled outbound height
  final types_misc.ProtoInt64? blocksSinceScheduled;

  /// returns true if an external transaction has been signed and broadcast (and
  /// observed in its mempool)
  final bool? completed;

  const OutboundSignedStage({
    this.scheduledOutboundHeight,
    this.blocksSinceScheduled,
    this.completed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.bool(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    scheduledOutboundHeight,
    blocksSinceScheduled,
    completed,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'scheduled_outbound_height': config.encodeBigint(scheduledOutboundHeight),
      'blocks_since_scheduled': config.encodeMessage(blocksSinceScheduled),
      'completed': completed,
    };
  }

  factory OutboundSignedStage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return OutboundSignedStage(
      scheduledOutboundHeight: json.valueAsBigInt<BigInt?>(
        'scheduled_outbound_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blocksSinceScheduled: json.valueTo<types_misc.ProtoInt64?, Object>(
        key: 'blocks_since_scheduled',
        parse:
            (v) => types_misc.ProtoInt64.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      completed: json.valueAsBool<bool?>(
        'completed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory OutboundSignedStage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OutboundSignedStage(
      scheduledOutboundHeight: decode.getBigInt<BigInt?>(1),
      blocksSinceScheduled: decode.messageTo<types_misc.ProtoInt64?>(
        2,
        (b) => types_misc.ProtoInt64.deserialize(b),
      ),
      completed: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesOutboundSignedStage;
}
