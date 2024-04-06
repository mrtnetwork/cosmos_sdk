import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'tx_response.dart';

/// SearchTxsResult defines a structure for querying txs pageable.
class SearchTxsResult extends CosmosMessage {
  /// Count of all transactions.
  final BigInt totalCount;

  /// Count of transactions in the current page.
  final BigInt count;

  /// Index of the current page, starting from 1.
  final BigInt pageNumber;

  /// Count of total pages.
  final BigInt pageTotal;

  /// Maximum count of transactions per page.
  final BigInt limit;

  /// List of transactions in the current page.
  final List<TxResponse> txs;

  const SearchTxsResult({
    required this.totalCount,
    required this.count,
    required this.pageNumber,
    required this.pageTotal,
    required this.limit,
    required this.txs,
  });

  factory SearchTxsResult.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SearchTxsResult(
        totalCount: decode.getField(1),
        count: decode.getField(2),
        pageNumber: decode.getField(3),
        pageTotal: decode.getField(4),
        limit: decode.getField(5),
        txs: decode
            .getFields<List<int>>(6)
            .map((e) => TxResponse.deserialize(e))
            .toList());
  }

  /// Converts the search result to a JSON-serializable map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount.toString(),
      'count': count.toString(),
      'page_number': pageNumber.toString(),
      'page_total': pageTotal.toString(),
      'limit': limit.toString(),
      'txs': txs.map((tx) => tx.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  String get typeUrl => BaseAbciV1beta1.searchTxsResult.typeUrl;

  @override
  List get values => [totalCount, count, pageNumber, pageTotal, limit, txs];
}
