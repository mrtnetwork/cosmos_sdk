import 'package:cosmos_sdk/proto_messages/tendermint/abci/src/types.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';

/// Checks the transaction without executing it.
/// https://docs.tendermint.com/v0.34/rpc/#/Tx/check_tx
class TendermintRequestBroadcastCheckTx
    extends TendermintRequest<ResponseCheckTx, Map<String, dynamic>> {
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

  @override
  ResponseCheckTx onResonse(Map<String, dynamic> result) {
    return ResponseCheckTx.fromJson(result);
  }
}
