import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Network informations
/// https://docs.tendermint.com/v0.34/rpc/#/Info/net_info
class TendermintRequestNetInfo
    extends TendermintRequest<TendermintNetInfo, Map<String, dynamic>> {
  TendermintRequestNetInfo();

  /// Network informations
  @override
  String get method => TendermintMethods.netInfo.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};

  @override
  TendermintNetInfo onResonse(Map<String, dynamic> result) {
    return TendermintNetInfo.fromJson(result);
  }
}
