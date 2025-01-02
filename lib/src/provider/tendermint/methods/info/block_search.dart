import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models/ordering.dart';

/// Search for blocks by BeginBlock and EndBlock events.
/// See /subscribe for the query syntax.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block_search
class TendermintRequestBlockSearch
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBlockSearch(
      {this.query = "block.height > 1000 AND valset.changed > 0",
      this.page,
      this.perPage,
      this.orderBy,
      this.matchEvents});

  final String query;

  /// Page number (1-based)
  /// Default value : 1
  final int? page;

  /// Number of entries per page (max: 100)
  /// Default value : 30
  final int? perPage;

  /// Order in which blocks are sorted ("asc" or "desc"), by height.
  /// If empty, default sorting will be still applied.
  final TendermintRequestOrderingResponse? orderBy;

  /// Match attributes in query within events, in addition to the height
  final bool? matchEvents;

  /// Search for blocks by BeginBlock and EndBlock events.
  @override
  String get method => TendermintMethods.blockSearch.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "query": query,
        "page": page?.toString(),
        "per_page": perPage?.toString(),
        "order_by": orderBy?.name,
        "match_events": matchEvents?.toString()
      };
}
