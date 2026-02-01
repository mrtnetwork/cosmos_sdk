import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get transactions by hash
/// https://docs.tendermint.com/v0.34/rpc/#/Info/tx
class TendermintRequestTx
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestTx({required this.hash, this.prove});

  /// hash of transaction to retrieve
  final String hash;

  /// Include proofs of the transactions inclusion in the block
  /// Default value : false
  final bool? prove;

  /// Get transactions by hash
  @override
  String get method => TendermintMethods.tx.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
    "hash": hash,
    "prove": prove?.toString(),
  };
}
