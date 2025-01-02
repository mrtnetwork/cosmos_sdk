import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models.dart';

/// Returns with the responses from CheckTx and DeliverTx.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/broadcast_tx_commit
class TendermintRequestBroadcastTxCommit
    extends TendermintRequest<BrodcastTxResponse, Map<String, dynamic>> {
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
  BrodcastTxResponse onResonse(Map<String, dynamic> result) {
    return BrodcastTxResponse.fromJson(result);
  }
}
