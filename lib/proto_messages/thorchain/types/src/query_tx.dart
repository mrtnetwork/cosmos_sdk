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
  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxStagesRequest.fromJson(Map<String, dynamic> json) {
    return QueryTxStagesRequest(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'inbound_observed': inboundObserved?.toJson(),
      'inbound_confirmation_counted': inboundConfirmationCounted?.toJson(),
      'inbound_finalised': inboundFinalised?.toJson(),
      'swap_status': swapStatus?.toJson(),
      'swap_finalised': swapFinalised?.toJson(),
      'outbound_delay': outboundDelay?.toJson(),
      'outbound_signed': outboundSigned?.toJson(),
    };
  }

  factory QueryTxStagesResponse.fromJson(Map<String, dynamic> json) {
    return QueryTxStagesResponse(
      inboundObserved: json
          .valueTo<InboundObservedStage?, Map<String, dynamic>>(
            key: 'inbound_observed',
            parse: (v) => InboundObservedStage.fromJson(v),
            acceptCamelCase: true,
          ),
      inboundConfirmationCounted: json
          .valueTo<InboundConfirmationCountedStage?, Map<String, dynamic>>(
            key: 'inbound_confirmation_counted',
            parse: (v) => InboundConfirmationCountedStage.fromJson(v),
            acceptCamelCase: true,
          ),
      inboundFinalised: json
          .valueTo<InboundFinalisedStage?, Map<String, dynamic>>(
            key: 'inbound_finalised',
            parse: (v) => InboundFinalisedStage.fromJson(v),
            acceptCamelCase: true,
          ),
      swapStatus: json.valueTo<SwapStatus?, Map<String, dynamic>>(
        key: 'swap_status',
        parse: (v) => SwapStatus.fromJson(v),
        acceptCamelCase: true,
      ),
      swapFinalised: json.valueTo<SwapFinalisedStage?, Map<String, dynamic>>(
        key: 'swap_finalised',
        parse: (v) => SwapFinalisedStage.fromJson(v),
        acceptCamelCase: true,
      ),
      outboundDelay: json.valueTo<OutboundDelayStage?, Map<String, dynamic>>(
        key: 'outbound_delay',
        parse: (v) => OutboundDelayStage.fromJson(v),
        acceptCamelCase: true,
      ),
      outboundSigned: json.valueTo<OutboundSignedStage?, Map<String, dynamic>>(
        key: 'outbound_signed',
        parse: (v) => OutboundSignedStage.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxStatusRequest.fromJson(Map<String, dynamic> json) {
    return QueryTxStatusRequest(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'tx': tx?.toJson(),
      'planned_out_txs': plannedOutTxs.map((e) => e.toJson()).toList(),
      'out_txs': outTxs.map((e) => e.toJson()).toList(),
      'stages': stages?.toJson(),
    };
  }

  factory QueryTxStatusResponse.fromJson(Map<String, dynamic> json) {
    return QueryTxStatusResponse(
      tx: json.valueTo<common_common.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => common_common.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
      plannedOutTxs:
          (json.valueEnsureAsList<dynamic>(
                'planned_out_txs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<PlannedOutTx, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => PlannedOutTx.fromJson(v),
                ),
              )
              .toList(),
      outTxs:
          (json.valueEnsureAsList<dynamic>('out_txs', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<common_common.Tx, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => common_common.Tx.fromJson(v),
                    ),
              )
              .toList(),
      stages: json.valueTo<QueryTxStagesResponse?, Map<String, dynamic>>(
        key: 'stages',
        parse: (v) => QueryTxStagesResponse.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxRequest.fromJson(Map<String, dynamic> json) {
    return QueryTxRequest(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'observed_tx': observedTx?.toJson(),
      'consensus_height': consensusHeight?.toString(),
      'finalised_height': finalisedHeight?.toString(),
      'outbound_height': outboundHeight?.toString(),
      'keysign_metric': keysignMetric?.toJson(),
    };
  }

  factory QueryTxResponse.fromJson(Map<String, dynamic> json) {
    return QueryTxResponse(
      observedTx: json.valueTo<QueryObservedTx?, Map<String, dynamic>>(
        key: 'observed_tx',
        parse: (v) => QueryObservedTx.fromJson(v),
        acceptCamelCase: true,
      ),
      consensusHeight: json.valueAsBigInt<BigInt?>(
        'consensus_height',
        acceptCamelCase: true,
      ),
      finalisedHeight: json.valueAsBigInt<BigInt?>(
        'finalised_height',
        acceptCamelCase: true,
      ),
      outboundHeight: json.valueAsBigInt<BigInt?>(
        'outbound_height',
        acceptCamelCase: true,
      ),
      keysignMetric: json.valueTo<
        types_type_tss_metric.TssKeysignMetric?,
        Map<String, dynamic>
      >(
        key: 'keysign_metric',
        parse: (v) => types_type_tss_metric.TssKeysignMetric.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'tx': tx?.toJson(),
      'status': status,
      'out_hashes': outHashes.map((e) => e).toList(),
      'block_height': blockHeight?.toString(),
      'signers': signers.map((e) => e).toList(),
      'observed_pub_key': observedPubKey,
      'keysign_ms': keysignMs?.toString(),
      'finalise_height': finaliseHeight?.toString(),
      'aggregator': aggregator,
      'aggregator_target': aggregatorTarget,
      'aggregator_target_limit': aggregatorTargetLimit,
      'spent_output_refs': spentOutputRefs.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryObservedTx.fromJson(Map<String, dynamic> json) {
    return QueryObservedTx(
      tx: json.valueTo<common_common.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => common_common.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      outHashes:
          (json.valueEnsureAsList<dynamic>(
            'out_hashes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      signers:
          (json.valueEnsureAsList<dynamic>(
            'signers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      observedPubKey: json.valueAsString<String?>(
        'observed_pub_key',
        acceptCamelCase: true,
      ),
      keysignMs: json.valueAsBigInt<BigInt?>(
        'keysign_ms',
        acceptCamelCase: true,
      ),
      finaliseHeight: json.valueAsBigInt<BigInt?>(
        'finalise_height',
        acceptCamelCase: true,
      ),
      aggregator: json.valueAsString<String?>(
        'aggregator',
        acceptCamelCase: true,
      ),
      aggregatorTarget: json.valueAsString<String?>(
        'aggregator_target',
        acceptCamelCase: true,
      ),
      aggregatorTargetLimit: json.valueAsString<String?>(
        'aggregator_target_limit',
        acceptCamelCase: true,
      ),
      spentOutputRefs:
          (json.valueEnsureAsList<dynamic>(
                'spent_output_refs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.OutputRef,
                  Map<String, dynamic>
                >(value: e, parse: (v) => common_common.OutputRef.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {
      'tx_id': txId,
      'tx': tx?.toJson(),
      'height': height?.toString(),
      'txs': txs.map((e) => e.toJson()).toList(),
      'actions': actions.map((e) => e.toJson()).toList(),
      'out_txs': outTxs.map((e) => e.toJson()).toList(),
      'finalised_height': finalisedHeight?.toString(),
      'updated_vault': updatedVault,
      'reverted': reverted,
      'outbound_height': outboundHeight?.toString(),
    };
  }

  factory QueryObservedTxVoter.fromJson(Map<String, dynamic> json) {
    return QueryObservedTxVoter(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      tx: json.valueTo<QueryObservedTx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => QueryObservedTx.fromJson(v),
        acceptCamelCase: true,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<QueryObservedTx, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => QueryObservedTx.fromJson(v),
                    ),
              )
              .toList(),
      actions:
          (json.valueEnsureAsList<dynamic>('actions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_tx_out.TxOutItem,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => types_type_tx_out.TxOutItem.fromJson(v),
                ),
              )
              .toList(),
      outTxs:
          (json.valueEnsureAsList<dynamic>('out_txs', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<common_common.Tx, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => common_common.Tx.fromJson(v),
                    ),
              )
              .toList(),
      finalisedHeight: json.valueAsBigInt<BigInt?>(
        'finalised_height',
        acceptCamelCase: true,
      ),
      updatedVault: json.valueAsBool<bool?>(
        'updated_vault',
        acceptCamelCase: true,
      ),
      reverted: json.valueAsBool<bool?>('reverted', acceptCamelCase: true),
      outboundHeight: json.valueAsBigInt<BigInt?>(
        'outbound_height',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'height': height};
  }

  factory QueryTxVotersRequest.fromJson(Map<String, dynamic> json) {
    return QueryTxVotersRequest(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'to_address': toAddress,
      'coin': coin?.toJson(),
      'refund': refund,
    };
  }

  factory PlannedOutTx.fromJson(Map<String, dynamic> json) {
    return PlannedOutTx(
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      toAddress: json.valueAsString<String?>(
        'to_address',
        acceptCamelCase: true,
      ),
      coin: json.valueTo<common_common.Coin?, Map<String, dynamic>>(
        key: 'coin',
        parse: (v) => common_common.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
      refund: json.valueAsBool<bool?>('refund', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'started': started,
      'pre_confirmation_count': preConfirmationCount?.toString(),
      'final_count': finalCount?.toString(),
      'completed': completed,
    };
  }

  factory InboundObservedStage.fromJson(Map<String, dynamic> json) {
    return InboundObservedStage(
      started: json.valueAsBool<bool?>('started', acceptCamelCase: true),
      preConfirmationCount: json.valueAsBigInt<BigInt?>(
        'pre_confirmation_count',
        acceptCamelCase: true,
      ),
      finalCount: json.valueAsBigInt<BigInt?>(
        'final_count',
        acceptCamelCase: true,
      ),
      completed: json.valueAsBool<bool?>('completed', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'counting_start_height': countingStartHeight?.toString(),
      'chain': chain,
      'external_observed_height': externalObservedHeight?.toString(),
      'external_confirmation_delay_height':
          externalConfirmationDelayHeight?.toString(),
      'remaining_confirmation_seconds':
          remainingConfirmationSeconds?.toString(),
      'completed': completed,
    };
  }

  factory InboundConfirmationCountedStage.fromJson(Map<String, dynamic> json) {
    return InboundConfirmationCountedStage(
      countingStartHeight: json.valueAsBigInt<BigInt?>(
        'counting_start_height',
        acceptCamelCase: true,
      ),
      chain: json.valueAsString<String?>('chain', acceptCamelCase: true),
      externalObservedHeight: json.valueAsBigInt<BigInt?>(
        'external_observed_height',
        acceptCamelCase: true,
      ),
      externalConfirmationDelayHeight: json.valueAsBigInt<BigInt?>(
        'external_confirmation_delay_height',
        acceptCamelCase: true,
      ),
      remainingConfirmationSeconds: json.valueAsBigInt<BigInt?>(
        'remaining_confirmation_seconds',
        acceptCamelCase: true,
      ),
      completed: json.valueAsBool<bool?>('completed', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'completed': completed};
  }

  factory InboundFinalisedStage.fromJson(Map<String, dynamic> json) {
    return InboundFinalisedStage(
      completed: json.valueAsBool<bool?>('completed', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'pending': pending, 'streaming': streaming?.toJson()};
  }

  factory SwapStatus.fromJson(Map<String, dynamic> json) {
    return SwapStatus(
      pending: json.valueAsBool<bool?>('pending', acceptCamelCase: true),
      streaming: json.valueTo<StreamingStatus?, Map<String, dynamic>>(
        key: 'streaming',
        parse: (v) => StreamingStatus.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'interval': interval?.toString(),
      'quantity': quantity?.toString(),
      'count': count?.toString(),
    };
  }

  factory StreamingStatus.fromJson(Map<String, dynamic> json) {
    return StreamingStatus(
      interval: json.valueAsBigInt<BigInt?>('interval', acceptCamelCase: true),
      quantity: json.valueAsBigInt<BigInt?>('quantity', acceptCamelCase: true),
      count: json.valueAsBigInt<BigInt?>('count', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'completed': completed};
  }

  factory SwapFinalisedStage.fromJson(Map<String, dynamic> json) {
    return SwapFinalisedStage(
      completed: json.valueAsBool<bool?>('completed', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'remaining_delay_blocks': remainingDelayBlocks?.toString(),
      'remaining_delay_seconds': remainingDelaySeconds?.toString(),
      'completed': completed,
    };
  }

  factory OutboundDelayStage.fromJson(Map<String, dynamic> json) {
    return OutboundDelayStage(
      remainingDelayBlocks: json.valueAsBigInt<BigInt?>(
        'remaining_delay_blocks',
        acceptCamelCase: true,
      ),
      remainingDelaySeconds: json.valueAsBigInt<BigInt?>(
        'remaining_delay_seconds',
        acceptCamelCase: true,
      ),
      completed: json.valueAsBool<bool?>('completed', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'scheduled_outbound_height': scheduledOutboundHeight?.toString(),
      'blocks_since_scheduled': blocksSinceScheduled?.toJson(),
      'completed': completed,
    };
  }

  factory OutboundSignedStage.fromJson(Map<String, dynamic> json) {
    return OutboundSignedStage(
      scheduledOutboundHeight: json.valueAsBigInt<BigInt?>(
        'scheduled_outbound_height',
        acceptCamelCase: true,
      ),
      blocksSinceScheduled: json
          .valueTo<types_misc.ProtoInt64?, Map<String, dynamic>>(
            key: 'blocks_since_scheduled',
            parse: (v) => types_misc.ProtoInt64.fromJson(v),
            acceptCamelCase: true,
          ),
      completed: json.valueAsBool<bool?>('completed', acceptCamelCase: true),
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
