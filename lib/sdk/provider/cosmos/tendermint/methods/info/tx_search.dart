import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Search for transactions
/// https://docs.tendermint.com/v0.34/rpc/#/Info/tx_search
class TendermintRequestTxSearch
    extends
        TendermintRequest<
          TendermintTxSearchResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestTxSearch({
    required this.query,
    this.prove,
    this.page,
    this.perPage,
    this.orderBy,
  });

  final String query;

  /// Include proofs of the transactions inclusion in the block
  final bool? prove;

  /// Page number (1-based)
  /// Default value : 1
  final int? page;

  /// Number of entries per page (max: 100)
  /// Default value : 30
  final int? perPage;

  /// Order in which transactions are sorted ("asc" or "desc"),
  /// by height & index. If empty, default sorting will be still applied.
  /// Default value : asc
  final TendermintRequestOrderingResponse? orderBy;

  /// Search for transactions
  @override
  String get method => TendermintMethods.txSearch.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
    "query": '''"$query"''',
    "prove": prove?.toString(),
    "page": page?.toString(),
    "per_page": perPage?.toString(),
    "order_by": orderBy?.name,
  };

  @override
  TendermintTxSearchResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintTxSearchResponseResult.fromJson(result);
  }
}
