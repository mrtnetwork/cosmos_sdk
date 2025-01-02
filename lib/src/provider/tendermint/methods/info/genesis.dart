import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get Genesis
/// https://docs.tendermint.com/v0.34/rpc/#/Info/genesis
class TendermintRequestGenesis
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestGenesis();

  /// Get Genesis
  @override
  String get method => TendermintMethods.genesis.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};
}
