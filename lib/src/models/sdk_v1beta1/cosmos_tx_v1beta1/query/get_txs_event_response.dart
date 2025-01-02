import 'package:blockchain_utils/utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tx.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/tx_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GetTxsEventResponse is the response type for the Service.TxsByEvents RPC method.
class GetTxsEventResponse extends CosmosMessage {
  /// txs is the list of queried transactions.
  final List<Tx> txs;

  /// tx_responses is the list of queried TxResponses.
  final List<TxResponse> txResponses;

  /// pagination defines a pagination for the response.
  /// Deprecated: post v0.46.x use total instead.
  final PageResponse? pagination;

  /// total is total number of results available
  final BigInt? total;
  factory GetTxsEventResponse.fromRpc(Map<String, dynamic> json) {
    return GetTxsEventResponse(
        txResponses: (json["tx_responses"] as List?)
                ?.map((e) => TxResponse.fromRpc(e))
                .toList() ??
            [],
        txs: (json["txs"] as List?)?.map((e) => Tx.fromRpc(e)).toList() ?? [],
        pagination: json["pagination"] == null
            ? null
            : PageResponse.fromRpc(json["pagination"]),
        total: BigintUtils.tryParse(json["total"]));
  }
  GetTxsEventResponse(
      {required List<Tx> txs,
      required List<TxResponse> txResponses,
      this.pagination,
      this.total})
      : txs = txs.immutable,
        txResponses = txResponses.immutable;
  factory GetTxsEventResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetTxsEventResponse(
        txs: decode
            .getFields<List<int>>(1)
            .map((e) => Tx.deserialize(e))
            .toList(),
        txResponses: decode
            .getFields<List<int>>(2)
            .map((e) => TxResponse.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(3)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
        total: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "txs": txs.map((e) => e.toJson()).toList(),
      "tx_responses": txResponses.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
      "total": total?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.getTxsEventResponse;

  @override
  List get values => [txs, txResponses, pagination, total];
}
