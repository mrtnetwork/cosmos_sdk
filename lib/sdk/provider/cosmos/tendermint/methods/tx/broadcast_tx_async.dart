import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Returns right away, with no response. Does not wait for CheckTx nor DeliverTx results.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/broadcast_tx_async
class TendermintRequestBroadcastTxAsync
    extends
        TendermintRequest<
          TendermintBroadcastTxResponseResult,
          Map<String, dynamic>
        > {
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

  @override
  TendermintBroadcastTxResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintBroadcastTxResponseResult.fromJson(result);
  }
}
