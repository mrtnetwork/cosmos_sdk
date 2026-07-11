import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get the list of unconfirmed transactions
/// https://docs.tendermint.com/v0.34/rpc/#/Info/unconfirmed_txs
class TendermintRequestUnconfirmedTxs
    extends
        TendermintRequest<
          TendermintUnconfirmedTransactionsResponseResult,
          Map<String, dynamic>
        > {
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

  @override
  TendermintUnconfirmedTransactionsResponseResult onResonse(
    Map<String, dynamic> result,
  ) {
    return TendermintUnconfirmedTransactionsResponseResult.fromJson(result);
  }
}
