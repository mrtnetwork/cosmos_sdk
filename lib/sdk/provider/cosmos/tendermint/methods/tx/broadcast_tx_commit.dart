import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Returns with the responses from CheckTx and DeliverTx.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/broadcast_tx_commit
class TendermintRequestBroadcastTxCommit
    extends
        TendermintRequest<
          TendermintBroadcastTxCommitResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestBroadcastTxCommit(this.tx);

  /// The transaction
  final String tx;

  /// Returns with the responses from CheckTx and DeliverTx.
  @override
  String get method => TendermintMethods.broadcastTxCommit.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"tx": tx};

  @override
  TendermintBroadcastTxCommitResponseResult onResonse(
    Map<String, dynamic> result,
  ) {
    return TendermintBroadcastTxCommitResponseResult.fromJson(result);
  }
}
