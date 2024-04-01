import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get info about the application.
/// https://docs.tendermint.com/v0.34/rpc/#/ABCI/abci_info
class TendermintRequestBroadcastAbciInfo
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBroadcastAbciInfo();

  /// Get info about the application.
  @override
  String get method => TendermintMethods.abciInfo.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};
}
