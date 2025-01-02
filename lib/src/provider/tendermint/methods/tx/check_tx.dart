import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Checks the transaction without executing it.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/check_tx
class TendermintRequestBroadcastCheckTx
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBroadcastCheckTx(this.tx);

  /// The transaction
  final String tx;

  /// Checks the transaction without executing it.
  @override
  String get method => TendermintMethods.checkTx.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"tx": tx};
}
