import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get consensus parameters
/// https://docs.tendermint.com/v0.34/rpc/#/Info/consensus_params
class TendermintRequestConsensusParams
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestConsensusParams({this.height});

  /// height to return. If no height is provided,
  /// it will fetch commit informations regarding the latest block.
  final int? height;

  /// Get consensus parameters
  @override
  String get method => TendermintMethods.consensusParams.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
