import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get data about unconfirmed transactions
/// https://docs.tendermint.com/v0.34/rpc/#/Info/num_unconfirmed_txs
class TendermintRequestNumUnconfirmedTxs
    extends
        TendermintRequest<
          TendermintNumUnconfirmedTransactionsResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestNumUnconfirmedTxs();

  /// Get data about unconfirmed transactions
  @override
  String get method => TendermintMethods.numUnconfirmedTxs.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};

  @override
  TendermintNumUnconfirmedTransactionsResponseResult onResonse(
    Map<String, dynamic> result,
  ) {
    return TendermintNumUnconfirmedTransactionsResponseResult.fromJson(result);
  }
}
