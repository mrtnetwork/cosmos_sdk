import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Block results.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block_results
class TendermintRequestBlockResults
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBlockResults({this.height});

  /// height to return. If no height is provided,
  /// it will fetch information regarding the latest block.
  final int? height;

  /// Block results.
  @override
  String get method => TendermintMethods.blockResult.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
