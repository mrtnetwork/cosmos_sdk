import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get block by hash.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block_by_hash
class TendermintRequestBlockByHash
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBlockByHash(this.hash);

  /// block hash
  final String hash;

  /// Get block by hash.
  @override
  String get method => TendermintMethods.blockByHash.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"hash": hash};
}
