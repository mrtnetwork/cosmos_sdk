import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

class QueryScheduledOutboundRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutboundResponse> {
  final String? height;

  const QueryScheduledOutboundRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/queue/scheduled",
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

  factory QueryScheduledOutboundRequest.fromJson(Map<String, dynamic> json) {
    return QueryScheduledOutboundRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryScheduledOutboundRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryScheduledOutboundRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryScheduledOutboundRequest;
  @override
  QueryOutboundResponse onQueryResponse(List<int> bytes) {
    return QueryOutboundResponse.deserialize(bytes);
  }

  @override
  QueryOutboundResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOutboundResponse.fromJson(json);
  }
}

class QueryPendingOutboundRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryOutboundResponse> {
  final String? height;

  const QueryPendingOutboundRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/queue/outbound",
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

  factory QueryPendingOutboundRequest.fromJson(Map<String, dynamic> json) {
    return QueryPendingOutboundRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryPendingOutboundRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPendingOutboundRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryPendingOutboundRequest;
  @override
  QueryOutboundResponse onQueryResponse(List<int> bytes) {
    return QueryOutboundResponse.deserialize(bytes);
  }

  @override
  QueryOutboundResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryOutboundResponse.fromJson(json);
  }
}

class QueryOutboundResponse extends CosmosProtoMessage {
  final List<QueryTxOutItem> txOutItems;

  const QueryOutboundResponse({this.txOutItems = const []});

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
  List<Object?> get protoValues => [txOutItems];

  @override
  Map<String, dynamic> toJson() {
    return {'tx_out_items': txOutItems.map((e) => e.toJson()).toList()};
  }

  factory QueryOutboundResponse.fromJson(Map<String, dynamic> json) {
    return QueryOutboundResponse(
      txOutItems:
          (json.valueEnsureAsList<dynamic>(
                'tx_out_items',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<QueryTxOutItem, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => QueryTxOutItem.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryOutboundResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryOutboundResponse(
      txOutItems:
          decode
              .getListOfBytes(1)
              .map((b) => QueryTxOutItem.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryOutboundResponse;
}

/// Fields are rearranged for querier response readability while preserving their
/// field numbers.
class QueryTxOutItem extends CosmosProtoMessage {
  final BigInt? height;

  final String? vaultPubKey;

  final String? inHash;

  final String? outHash;

  final String? chain;

  final String? toAddress;

  final common_common.Coin? coin;

  final List<common_common.Coin> maxGas;

  final BigInt? gasRate;

  final String? memo;

  final String? originalMemo;

  final String? aggregator;

  final String? aggregatorTargetAsset;

  final String? aggregatorTargetLimit;

  /// clout spent in RUNE for the outbound
  final String? cloutSpent;

  final String? vaultPubKeyEddsa;

  const QueryTxOutItem({
    this.height,
    this.vaultPubKey,
    this.inHash,
    this.outHash,
    this.chain,
    this.toAddress,
    this.coin,
    this.maxGas = const [],
    this.gasRate,
    this.memo,
    this.originalMemo,
    this.aggregator,
    this.aggregatorTargetAsset,
    this.aggregatorTargetLimit,
    this.cloutSpent,
    this.vaultPubKeyEddsa,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(10),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(16),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.string(14),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(15),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    height,
    vaultPubKey,
    inHash,
    outHash,
    chain,
    toAddress,
    coin,
    maxGas,
    gasRate,
    memo,
    originalMemo,
    aggregator,
    aggregatorTargetAsset,
    aggregatorTargetLimit,
    cloutSpent,
    vaultPubKeyEddsa,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'vault_pub_key': vaultPubKey,
      'in_hash': inHash,
      'out_hash': outHash,
      'chain': chain,
      'to_address': toAddress,
      'coin': coin?.toJson(),
      'max_gas': maxGas.map((e) => e.toJson()).toList(),
      'gas_rate': gasRate?.toString(),
      'memo': memo,
      'original_memo': originalMemo,
      'aggregator': aggregator,
      'aggregator_target_asset': aggregatorTargetAsset,
      'aggregator_target_limit': aggregatorTargetLimit,
      'clout_spent': cloutSpent,
      'vault_pub_key_eddsa': vaultPubKeyEddsa,
    };
  }

  factory QueryTxOutItem.fromJson(Map<String, dynamic> json) {
    return QueryTxOutItem(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      vaultPubKey: json.valueAsString<String?>(
        'vault_pub_key',
        acceptCamelCase: true,
      ),
      inHash: json.valueAsString<String?>('in_hash', acceptCamelCase: true),
      outHash: json.valueAsString<String?>('out_hash', acceptCamelCase: true),
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
      maxGas:
          (json.valueEnsureAsList<dynamic>('max_gas', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.Coin,
                  Map<String, dynamic>
                >(value: e, parse: (v) => common_common.Coin.fromJson(v)),
              )
              .toList(),
      gasRate: json.valueAsBigInt<BigInt?>('gas_rate', acceptCamelCase: true),
      memo: json.valueAsString<String?>('memo', acceptCamelCase: true),
      originalMemo: json.valueAsString<String?>(
        'original_memo',
        acceptCamelCase: true,
      ),
      aggregator: json.valueAsString<String?>(
        'aggregator',
        acceptCamelCase: true,
      ),
      aggregatorTargetAsset: json.valueAsString<String?>(
        'aggregator_target_asset',
        acceptCamelCase: true,
      ),
      aggregatorTargetLimit: json.valueAsString<String?>(
        'aggregator_target_limit',
        acceptCamelCase: true,
      ),
      cloutSpent: json.valueAsString<String?>(
        'clout_spent',
        acceptCamelCase: true,
      ),
      vaultPubKeyEddsa: json.valueAsString<String?>(
        'vault_pub_key_eddsa',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTxOutItem.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTxOutItem(
      height: decode.getBigInt<BigInt?>(10),
      vaultPubKey: decode.getString<String?>(3),
      inHash: decode.getString<String?>(8),
      outHash: decode.getString<String?>(9),
      chain: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      coin: decode.messageTo<common_common.Coin?>(
        4,
        (b) => common_common.Coin.deserialize(b),
      ),
      maxGas:
          decode
              .getListOfBytes(6)
              .map((b) => common_common.Coin.deserialize(b))
              .toList(),
      gasRate: decode.getBigInt<BigInt?>(7),
      memo: decode.getString<String?>(5),
      originalMemo: decode.getString<String?>(16),
      aggregator: decode.getString<String?>(12),
      aggregatorTargetAsset: decode.getString<String?>(13),
      aggregatorTargetLimit: decode.getString<String?>(14),
      cloutSpent: decode.getString<String?>(11),
      vaultPubKeyEddsa: decode.getString<String?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTxOutItem;
}
