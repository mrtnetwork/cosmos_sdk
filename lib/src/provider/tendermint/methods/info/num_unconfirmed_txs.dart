import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get data about unconfirmed transactions
/// https://docs.tendermint.com/v0.34/rpc/#/Info/num_unconfirmed_txs
class TendermintRequestNumUnconfirmedTxs
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestNumUnconfirmedTxs();

  /// Get data about unconfirmed transactions
  @override
  String get method => TendermintMethods.numUnconfirmedTxs.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};
}
