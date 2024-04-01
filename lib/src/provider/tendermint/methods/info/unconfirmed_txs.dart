import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get the list of unconfirmed transactions
/// https://docs.tendermint.com/v0.34/rpc/#/Info/unconfirmed_txs
class TendermintRequestUnconfirmedTxs
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestUnconfirmedTxs({this.limit});

  /// Maximum number of unconfirmed transactions to return (max 100)
  /// Default value : 30
  final int? limit;

  /// Get the list of unconfirmed transactions
  @override
  String get method => TendermintMethods.unconfirmedTxs.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"limit": limit?.toString()};
}
