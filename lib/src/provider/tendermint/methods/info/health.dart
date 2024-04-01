import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Gets Node Health
/// https://docs.tendermint.com/v0.34/rpc/#/Info/health
class TendermintRequestHealth
    extends TendermintRequestParam<bool, Map<String, dynamic>> {
  TendermintRequestHealth();

  /// Node heartbeat
  @override
  String get method => TendermintMethods.health.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};
  @override
  bool onResonse(Map<String, dynamic> result) {
    return true;
  }
}
