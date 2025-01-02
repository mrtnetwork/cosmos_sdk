import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Node Status
/// https://docs.tendermint.com/v0.34/rpc/#/Info/status
class TendermintRequestStatus
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestStatus();

  /// Node Status
  @override
  String get method => TendermintMethods.status.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};
}
