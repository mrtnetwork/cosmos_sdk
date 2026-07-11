import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';

class TendermintRequestRemoveTx
    extends TendermintRequest<void, Map<String, dynamic>> {
  TendermintRequestRemoveTx(this.txKey);

  /// The transaction
  final String txKey;

  /// Checks the transaction without executing it.
  @override
  String get method => TendermintMethods.removeTx.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"txKey": txKey};

  @override
  void onResonse(Map<String, dynamic> result) {}
}
