import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/src/tx.dart"
    as cosmos_tx_v1beta1_tx;
import "package:cosmos_sdk/proto_messages/cosmos/base/abci/v1beta1/src/abci.dart"
    as cosmos_base_abci_v1beta1_abci;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/types.dart"
    as tendermint_types_types;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/block.dart"
    as tendermint_types_block;

/// OrderBy defines the sorting order
enum OrderBy implements ProtoEnumVariant {
  /// ORDER_BY_UNSPECIFIED specifies an unknown sorting order. OrderBy defaults
  /// to ASC in this case.
  orderByUnspecified(0, 'ORDER_BY_UNSPECIFIED'),

  /// ORDER_BY_ASC defines ascending order
  orderByAsc(1, 'ORDER_BY_ASC'),

  /// ORDER_BY_DESC defines descending order
  orderByDesc(2, 'ORDER_BY_DESC');

  const OrderBy(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static OrderBy fromValue(int? value) {
    return OrderBy.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "OrderBy", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static OrderBy from(Object? value) {
    return OrderBy.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "OrderBy", value: value),
    );
  }
}

/// BroadcastMode specifies the broadcast mode for the TxService.Broadcast RPC
/// method.
enum BroadcastMode implements ProtoEnumVariant {
  /// zero-value for mode ordering
  broadcastModeUnspecified(0, 'BROADCAST_MODE_UNSPECIFIED'),

  /// DEPRECATED: use BROADCAST_MODE_SYNC instead,
  /// BROADCAST_MODE_BLOCK is not supported by the SDK from v0.47.x onwards.
  broadcastModeBlock(1, 'BROADCAST_MODE_BLOCK'),

  /// BROADCAST_MODE_SYNC defines a tx broadcasting mode where the client waits
  /// for a CheckTx execution response only.
  broadcastModeSync(2, 'BROADCAST_MODE_SYNC'),

  /// BROADCAST_MODE_ASYNC defines a tx broadcasting mode where the client
  /// returns immediately.
  broadcastModeAsync(3, 'BROADCAST_MODE_ASYNC');

  const BroadcastMode(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static BroadcastMode fromValue(int? value) {
    return BroadcastMode.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "BroadcastMode", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static BroadcastMode from(Object? value) {
    return BroadcastMode.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "BroadcastMode", value: value),
    );
  }
}

/// GetTxsEventRequest is the request type for the Service.TxsByEvents
/// RPC method.
class GetTxsEventRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetTxsEventResponse> {
  /// events is the list of transaction event type.
  /// Deprecated post v0.47.x: use query instead, which should contain a valid
  /// events query.
  final List<String> events;

  /// pagination defines a pagination for the request.
  /// Deprecated post v0.46.x: use page and limit instead.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  final OrderBy? orderBy;

  /// page is the page number to query, starts at 1. If not provided, will
  /// default to first page.
  final BigInt? page;

  /// limit is the total number of results to be returned in the result page.
  /// If left empty it will default to a value to be set by each app.
  final BigInt? limit;

  /// query defines the transaction event query that is proxied to Tendermint's
  /// TxSearch RPC method. The query must be valid.
  final String? query;

  const GetTxsEventRequest({
    this.events = const [],
    this.pagination,
    this.orderBy,
    this.page,
    this.limit,
    this.query,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/tx/v1beta1/txs",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.string(
          6,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    events,
    pagination,
    orderBy,
    page,
    limit,
    query,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'events': events.map((e) => e).toList(),
      'pagination': pagination?.toJson(),
      'order_by': orderBy?.protoName,
      'page': page?.toString(),
      'limit': limit?.toString(),
      'query': query,
    };
  }

  factory GetTxsEventRequest.fromJson(Map<String, dynamic> json) {
    return GetTxsEventRequest(
      events:
          (json.valueEnsureAsList<dynamic>(
            'events',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
      orderBy: json.valueTo<OrderBy?, Object?>(
        key: 'order_by',
        parse: (v) => OrderBy.from(v),
      ),
      page: json.valueAsBigInt<BigInt?>('page', acceptCamelCase: true),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
      query: json.valueAsString<String?>('query', acceptCamelCase: true),
    );
  }

  factory GetTxsEventRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetTxsEventRequest(
      events: decode.getListOrEmpty<String>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
      orderBy: decode.getEnum<OrderBy?>(3, OrderBy.values),
      page: decode.getBigInt<BigInt?>(4),
      limit: decode.getBigInt<BigInt?>(5),
      query: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1GetTxsEventRequest;
  @override
  GetTxsEventResponse onQueryResponse(List<int> bytes) {
    return GetTxsEventResponse.deserialize(bytes);
  }

  @override
  GetTxsEventResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetTxsEventResponse.fromJson(json);
  }
}

/// GetTxsEventResponse is the response type for the Service.TxsByEvents
/// RPC method.
class GetTxsEventResponse extends CosmosProtoMessage {
  /// txs is the list of queried transactions.
  final List<cosmos_tx_v1beta1_tx.Tx> txs;

  /// tx_responses is the list of queried TxResponses.
  final List<cosmos_base_abci_v1beta1_abci.TxResponse> txResponses;

  /// pagination defines a pagination for the response.
  /// Deprecated post v0.46.x: use total instead.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  /// total is total number of results available
  final BigInt? total;

  const GetTxsEventResponse({
    this.txs = const [],
    this.txResponses = const [],
    this.pagination,
    this.total,
  });

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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txs, txResponses, pagination, total];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs': txs.map((e) => e.toJson()).toList(),
      'tx_responses': txResponses.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'total': total?.toString(),
    };
  }

  factory GetTxsEventResponse.fromJson(Map<String, dynamic> json) {
    return GetTxsEventResponse(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_tx_v1beta1_tx.Tx,
                  Map<String, dynamic>
                >(value: e, parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v)),
              )
              .toList(),
      txResponses:
          (json.valueEnsureAsList<dynamic>(
                'tx_responses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_abci_v1beta1_abci.TxResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          cosmos_base_abci_v1beta1_abci.TxResponse.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
      total: json.valueAsBigInt<BigInt?>('total', acceptCamelCase: true),
    );
  }

  factory GetTxsEventResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetTxsEventResponse(
      txs:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b))
              .toList(),
      txResponses:
          decode
              .getListOfBytes(2)
              .map(
                (b) => cosmos_base_abci_v1beta1_abci.TxResponse.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        3,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
      total: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1GetTxsEventResponse;
}

/// BroadcastTxRequest is the request type for the Service.BroadcastTxRequest
/// RPC method.
class BroadcastTxRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<BroadcastTxResponse> {
  /// tx_bytes is the raw transaction.
  final List<int>? txBytes;

  final BroadcastMode? mode;

  const BroadcastTxRequest({this.txBytes, this.mode});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/cosmos/tx/v1beta1/txs",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.enumType(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txBytes, mode];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx_bytes': switch (txBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'mode': mode?.protoName,
    };
  }

  factory BroadcastTxRequest.fromJson(Map<String, dynamic> json) {
    return BroadcastTxRequest(
      txBytes: json.valueAsBytes<List<int>?>(
        'tx_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      mode: json.valueTo<BroadcastMode?, Object?>(
        key: 'mode',
        parse: (v) => BroadcastMode.from(v),
      ),
    );
  }

  factory BroadcastTxRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BroadcastTxRequest(
      txBytes: decode.getBytes<List<int>?>(1),
      mode: decode.getEnum<BroadcastMode?>(2, BroadcastMode.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1BroadcastTxRequest;
  @override
  BroadcastTxResponse onQueryResponse(List<int> bytes) {
    return BroadcastTxResponse.deserialize(bytes);
  }

  @override
  BroadcastTxResponse onQueryResponseJson(Map<String, dynamic> json) {
    return BroadcastTxResponse.fromJson(json);
  }
}

/// BroadcastTxResponse is the response type for the
/// Service.BroadcastTx method.
class BroadcastTxResponse extends CosmosProtoMessage {
  /// tx_response is the queried TxResponses.
  final cosmos_base_abci_v1beta1_abci.TxResponse? txResponse;

  const BroadcastTxResponse({this.txResponse});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [txResponse];

  @override
  Map<String, dynamic> toJson() {
    return {'tx_response': txResponse?.toJson()};
  }

  factory BroadcastTxResponse.fromJson(Map<String, dynamic> json) {
    return BroadcastTxResponse(
      txResponse: json.valueTo<
        cosmos_base_abci_v1beta1_abci.TxResponse?,
        Map<String, dynamic>
      >(
        key: 'tx_response',
        parse: (v) => cosmos_base_abci_v1beta1_abci.TxResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory BroadcastTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BroadcastTxResponse(
      txResponse: decode.messageTo<cosmos_base_abci_v1beta1_abci.TxResponse?>(
        1,
        (b) => cosmos_base_abci_v1beta1_abci.TxResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1BroadcastTxResponse;
}

/// SimulateRequest is the request type for the Service.Simulate
/// RPC method.
class SimulateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<SimulateResponse> {
  /// tx is the transaction to simulate.
  /// Deprecated. Send raw tx bytes instead.
  final cosmos_tx_v1beta1_tx.Tx? tx;

  /// tx_bytes is the raw transaction.
  final List<int>? txBytes;

  const SimulateRequest({this.tx, this.txBytes});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/cosmos/tx/v1beta1/simulate",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(
          2,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tx, txBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx': tx?.toJson(),
      'tx_bytes': switch (txBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory SimulateRequest.fromJson(Map<String, dynamic> json) {
    return SimulateRequest(
      tx: json.valueTo<cosmos_tx_v1beta1_tx.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
      txBytes: json.valueAsBytes<List<int>?>(
        'tx_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory SimulateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SimulateRequest(
      tx: decode.messageTo<cosmos_tx_v1beta1_tx.Tx?>(
        1,
        (b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b),
      ),
      txBytes: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1SimulateRequest;
  @override
  SimulateResponse onQueryResponse(List<int> bytes) {
    return SimulateResponse.deserialize(bytes);
  }

  @override
  SimulateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return SimulateResponse.fromJson(json);
  }
}

/// SimulateResponse is the response type for the
/// Service.SimulateRPC method.
class SimulateResponse extends CosmosProtoMessage {
  /// gas_info is the information about gas used in the simulation.
  final cosmos_base_abci_v1beta1_abci.GasInfo? gasInfo;

  /// result is the result of the simulation.
  final cosmos_base_abci_v1beta1_abci.Result? result;

  const SimulateResponse({this.gasInfo, this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [gasInfo, result];

  @override
  Map<String, dynamic> toJson() {
    return {'gas_info': gasInfo?.toJson(), 'result': result?.toJson()};
  }

  factory SimulateResponse.fromJson(Map<String, dynamic> json) {
    return SimulateResponse(
      gasInfo: json.valueTo<
        cosmos_base_abci_v1beta1_abci.GasInfo?,
        Map<String, dynamic>
      >(
        key: 'gas_info',
        parse: (v) => cosmos_base_abci_v1beta1_abci.GasInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      result: json
          .valueTo<cosmos_base_abci_v1beta1_abci.Result?, Map<String, dynamic>>(
            key: 'result',
            parse: (v) => cosmos_base_abci_v1beta1_abci.Result.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory SimulateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SimulateResponse(
      gasInfo: decode.messageTo<cosmos_base_abci_v1beta1_abci.GasInfo?>(
        1,
        (b) => cosmos_base_abci_v1beta1_abci.GasInfo.deserialize(b),
      ),
      result: decode.messageTo<cosmos_base_abci_v1beta1_abci.Result?>(
        2,
        (b) => cosmos_base_abci_v1beta1_abci.Result.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1SimulateResponse;
}

/// GetTxRequest is the request type for the Service.GetTx
/// RPC method.
class GetTxRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetTxResponse> {
  /// hash is the tx hash to query, encoded as a hex string.
  final String? hash;

  const GetTxRequest({this.hash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/tx/v1beta1/txs/{hash}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson() {
    return {'hash': hash};
  }

  factory GetTxRequest.fromJson(Map<String, dynamic> json) {
    return GetTxRequest(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
    );
  }

  factory GetTxRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetTxRequest(hash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1GetTxRequest;
  @override
  GetTxResponse onQueryResponse(List<int> bytes) {
    return GetTxResponse.deserialize(bytes);
  }

  @override
  GetTxResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetTxResponse.fromJson(json);
  }
}

/// GetTxResponse is the response type for the Service.GetTx method.
class GetTxResponse extends CosmosProtoMessage {
  /// tx is the queried transaction.
  final cosmos_tx_v1beta1_tx.Tx? tx;

  /// tx_response is the queried TxResponses.
  final cosmos_base_abci_v1beta1_abci.TxResponse? txResponse;

  const GetTxResponse({this.tx, this.txResponse});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [tx, txResponse];

  @override
  Map<String, dynamic> toJson() {
    return {'tx': tx?.toJson(), 'tx_response': txResponse?.toJson()};
  }

  factory GetTxResponse.fromJson(Map<String, dynamic> json) {
    return GetTxResponse(
      tx: json.valueTo<cosmos_tx_v1beta1_tx.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
      txResponse: json.valueTo<
        cosmos_base_abci_v1beta1_abci.TxResponse?,
        Map<String, dynamic>
      >(
        key: 'tx_response',
        parse: (v) => cosmos_base_abci_v1beta1_abci.TxResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetTxResponse(
      tx: decode.messageTo<cosmos_tx_v1beta1_tx.Tx?>(
        1,
        (b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b),
      ),
      txResponse: decode.messageTo<cosmos_base_abci_v1beta1_abci.TxResponse?>(
        2,
        (b) => cosmos_base_abci_v1beta1_abci.TxResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1GetTxResponse;
}

/// GetBlockWithTxsRequest is the request type for the Service.GetBlockWithTxs
/// RPC method.
class GetBlockWithTxsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetBlockWithTxsResponse> {
  /// height is the height of the block to query.
  final BigInt? height;

  /// pagination defines a pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const GetBlockWithTxsRequest({this.height, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/tx/v1beta1/txs/block/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height?.toString(), 'pagination': pagination?.toJson()};
  }

  factory GetBlockWithTxsRequest.fromJson(Map<String, dynamic> json) {
    return GetBlockWithTxsRequest(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetBlockWithTxsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetBlockWithTxsRequest(
      height: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1GetBlockWithTxsRequest;
  @override
  GetBlockWithTxsResponse onQueryResponse(List<int> bytes) {
    return GetBlockWithTxsResponse.deserialize(bytes);
  }

  @override
  GetBlockWithTxsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetBlockWithTxsResponse.fromJson(json);
  }
}

/// GetBlockWithTxsResponse is the response type for the Service.GetBlockWithTxs
/// method.
class GetBlockWithTxsResponse extends CosmosProtoMessage {
  /// txs are the transactions in the block.
  final List<cosmos_tx_v1beta1_tx.Tx> txs;

  final tendermint_types_types.BlockID? blockId;

  final tendermint_types_block.Block? block;

  /// pagination defines a pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const GetBlockWithTxsResponse({
    this.txs = const [],
    this.blockId,
    this.block,
    this.pagination,
  });

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
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txs, blockId, block, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs': txs.map((e) => e.toJson()).toList(),
      'block_id': blockId?.toJson(),
      'block': block?.toJson(),
      'pagination': pagination?.toJson(),
    };
  }

  factory GetBlockWithTxsResponse.fromJson(Map<String, dynamic> json) {
    return GetBlockWithTxsResponse(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_tx_v1beta1_tx.Tx,
                  Map<String, dynamic>
                >(value: e, parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v)),
              )
              .toList(),
      blockId: json
          .valueTo<tendermint_types_types.BlockID?, Map<String, dynamic>>(
            key: 'block_id',
            parse: (v) => tendermint_types_types.BlockID.fromJson(v),
            acceptCamelCase: true,
          ),
      block: json.valueTo<tendermint_types_block.Block?, Map<String, dynamic>>(
        key: 'block',
        parse: (v) => tendermint_types_block.Block.fromJson(v),
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetBlockWithTxsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetBlockWithTxsResponse(
      txs:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b))
              .toList(),
      blockId: decode.messageTo<tendermint_types_types.BlockID?>(
        2,
        (b) => tendermint_types_types.BlockID.deserialize(b),
      ),
      block: decode.messageTo<tendermint_types_block.Block?>(
        3,
        (b) => tendermint_types_block.Block.deserialize(b),
      ),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        4,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1GetBlockWithTxsResponse;
}

/// TxDecodeRequest is the request type for the Service.TxDecode
/// RPC method.
class TxDecodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TxDecodeResponse> {
  /// tx_bytes is the raw transaction.
  final List<int>? txBytes;

  const TxDecodeRequest({this.txBytes});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/cosmos/tx/v1beta1/decode",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [txBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx_bytes': switch (txBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TxDecodeRequest.fromJson(Map<String, dynamic> json) {
    return TxDecodeRequest(
      txBytes: json.valueAsBytes<List<int>?>(
        'tx_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TxDecodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxDecodeRequest(txBytes: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxDecodeRequest;
  @override
  TxDecodeResponse onQueryResponse(List<int> bytes) {
    return TxDecodeResponse.deserialize(bytes);
  }

  @override
  TxDecodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TxDecodeResponse.fromJson(json);
  }
}

/// TxDecodeResponse is the response type for the
/// Service.TxDecode method.
class TxDecodeResponse extends CosmosProtoMessage {
  /// tx is the decoded transaction.
  final cosmos_tx_v1beta1_tx.Tx? tx;

  const TxDecodeResponse({this.tx});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [tx];

  @override
  Map<String, dynamic> toJson() {
    return {'tx': tx?.toJson()};
  }

  factory TxDecodeResponse.fromJson(Map<String, dynamic> json) {
    return TxDecodeResponse(
      tx: json.valueTo<cosmos_tx_v1beta1_tx.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory TxDecodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxDecodeResponse(
      tx: decode.messageTo<cosmos_tx_v1beta1_tx.Tx?>(
        1,
        (b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxDecodeResponse;
}

/// TxEncodeRequest is the request type for the Service.TxEncode
/// RPC method.
class TxEncodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TxEncodeResponse> {
  /// tx is the transaction to encode.
  final cosmos_tx_v1beta1_tx.Tx? tx;

  const TxEncodeRequest({this.tx});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/cosmos/tx/v1beta1/encode",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [tx];

  @override
  Map<String, dynamic> toJson() {
    return {'tx': tx?.toJson()};
  }

  factory TxEncodeRequest.fromJson(Map<String, dynamic> json) {
    return TxEncodeRequest(
      tx: json.valueTo<cosmos_tx_v1beta1_tx.Tx?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => cosmos_tx_v1beta1_tx.Tx.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory TxEncodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxEncodeRequest(
      tx: decode.messageTo<cosmos_tx_v1beta1_tx.Tx?>(
        1,
        (b) => cosmos_tx_v1beta1_tx.Tx.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxEncodeRequest;
  @override
  TxEncodeResponse onQueryResponse(List<int> bytes) {
    return TxEncodeResponse.deserialize(bytes);
  }

  @override
  TxEncodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TxEncodeResponse.fromJson(json);
  }
}

/// TxEncodeResponse is the response type for the
/// Service.TxEncode method.
class TxEncodeResponse extends CosmosProtoMessage {
  /// tx_bytes is the encoded transaction bytes.
  final List<int>? txBytes;

  const TxEncodeResponse({this.txBytes});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [txBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tx_bytes': switch (txBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TxEncodeResponse.fromJson(Map<String, dynamic> json) {
    return TxEncodeResponse(
      txBytes: json.valueAsBytes<List<int>?>(
        'tx_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TxEncodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxEncodeResponse(txBytes: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxEncodeResponse;
}

/// TxEncodeAminoRequest is the request type for the Service.TxEncodeAmino
/// RPC method.
class TxEncodeAminoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TxEncodeAminoResponse> {
  final String? aminoJson;

  const TxEncodeAminoRequest({this.aminoJson});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/cosmos/tx/v1beta1/encode/amino",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [aminoJson];

  @override
  Map<String, dynamic> toJson() {
    return {'amino_json': aminoJson};
  }

  factory TxEncodeAminoRequest.fromJson(Map<String, dynamic> json) {
    return TxEncodeAminoRequest(
      aminoJson: json.valueAsString<String?>(
        'amino_json',
        acceptCamelCase: true,
      ),
    );
  }

  factory TxEncodeAminoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxEncodeAminoRequest(aminoJson: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxEncodeAminoRequest;
  @override
  TxEncodeAminoResponse onQueryResponse(List<int> bytes) {
    return TxEncodeAminoResponse.deserialize(bytes);
  }

  @override
  TxEncodeAminoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TxEncodeAminoResponse.fromJson(json);
  }
}

/// TxEncodeAminoResponse is the response type for the Service.TxEncodeAmino
/// RPC method.
class TxEncodeAminoResponse extends CosmosProtoMessage {
  final List<int>? aminoBinary;

  const TxEncodeAminoResponse({this.aminoBinary});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [aminoBinary];

  @override
  Map<String, dynamic> toJson() {
    return {
      'amino_binary': switch (aminoBinary) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TxEncodeAminoResponse.fromJson(Map<String, dynamic> json) {
    return TxEncodeAminoResponse(
      aminoBinary: json.valueAsBytes<List<int>?>(
        'amino_binary',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TxEncodeAminoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxEncodeAminoResponse(aminoBinary: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxEncodeAminoResponse;
}

/// TxDecodeAminoRequest is the request type for the Service.TxDecodeAmino
/// RPC method.
class TxDecodeAminoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<TxDecodeAminoResponse> {
  final List<int>? aminoBinary;

  const TxDecodeAminoRequest({this.aminoBinary});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/cosmos/tx/v1beta1/decode/amino",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [aminoBinary];

  @override
  Map<String, dynamic> toJson() {
    return {
      'amino_binary': switch (aminoBinary) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TxDecodeAminoRequest.fromJson(Map<String, dynamic> json) {
    return TxDecodeAminoRequest(
      aminoBinary: json.valueAsBytes<List<int>?>(
        'amino_binary',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TxDecodeAminoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxDecodeAminoRequest(aminoBinary: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxDecodeAminoRequest;
  @override
  TxDecodeAminoResponse onQueryResponse(List<int> bytes) {
    return TxDecodeAminoResponse.deserialize(bytes);
  }

  @override
  TxDecodeAminoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return TxDecodeAminoResponse.fromJson(json);
  }
}

/// TxDecodeAminoResponse is the response type for the Service.TxDecodeAmino
/// RPC method.
class TxDecodeAminoResponse extends CosmosProtoMessage {
  final String? aminoJson;

  const TxDecodeAminoResponse({this.aminoJson});

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
  List<Object?> get protoValues => [aminoJson];

  @override
  Map<String, dynamic> toJson() {
    return {'amino_json': aminoJson};
  }

  factory TxDecodeAminoResponse.fromJson(Map<String, dynamic> json) {
    return TxDecodeAminoResponse(
      aminoJson: json.valueAsString<String?>(
        'amino_json',
        acceptCamelCase: true,
      ),
    );
  }

  factory TxDecodeAminoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxDecodeAminoResponse(aminoJson: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxV1beta1TxDecodeAminoResponse;
}
