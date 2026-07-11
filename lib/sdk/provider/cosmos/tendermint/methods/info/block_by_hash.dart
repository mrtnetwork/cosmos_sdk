import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get block by hash.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block_by_hash
class TendermintRequestBlockByHash
    extends TendermintRequest<TendermintBlockComplete, Map<String, dynamic>> {
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

  @override
  TendermintBlockComplete onResonse(Map<String, dynamic> result) {
    return TendermintBlockComplete.fromJson(result);
  }
}
