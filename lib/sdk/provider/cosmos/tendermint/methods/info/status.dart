import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Node Status
/// https://docs.tendermint.com/v0.34/rpc/#/Info/status
class TendermintRequestStatus
    extends TendermintRequest<TendermintStatus, Map<String, dynamic>> {
  TendermintRequestStatus();

  /// Node Status
  @override
  String get method => TendermintMethods.status.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};

  @override
  TendermintStatus onResonse(Map<String, dynamic> result) {
    return TendermintStatus.fromJson(result);
  }
}
