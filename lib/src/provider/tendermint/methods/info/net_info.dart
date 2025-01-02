import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Network informations
/// https://docs.tendermint.com/v0.34/rpc/#/Info/net_info
class TendermintRequestNetInfo
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestNetInfo();

  /// Network informations
  @override
  String get method => TendermintMethods.netInfo.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};
}
