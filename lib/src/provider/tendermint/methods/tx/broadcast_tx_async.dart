import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Returns right away, with no response. Does not wait for CheckTx nor DeliverTx results.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/broadcast_tx_async
class TendermintRequestBroadcastTxAsync
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBroadcastTxAsync(this.tx);

  /// The transaction
  final String tx;

  /// Returns right away, with no response. Does not wait for CheckTx nor DeliverTx results.
  @override
  String get method => TendermintMethods.broadcastTxAsync.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"tx": tx};
}
