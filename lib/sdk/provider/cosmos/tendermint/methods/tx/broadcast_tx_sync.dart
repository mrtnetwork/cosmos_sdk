import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Returns with the response from CheckTx. Does not wait for DeliverTx result.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/broadcast_tx_sync
class TendermintRequestBroadcastTxSync
    extends
        TendermintRequest<
          TendermintBroadcastTxResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestBroadcastTxSync(this.tx);

  /// The transaction
  final String tx;

  /// Returns with the response from CheckTx. Does not wait for DeliverTx result.
  @override
  String get method => TendermintMethods.broadcastTxSync.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"tx": tx};

  @override
  TendermintBroadcastTxResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintBroadcastTxResponseResult.fromJson(result);
  }
}
