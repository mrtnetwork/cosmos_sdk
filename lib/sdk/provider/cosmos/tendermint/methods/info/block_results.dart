import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Block results.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block_results
class TendermintRequestBlockResults
    extends
        TendermintRequest<
          TendermintBlockResultsResponseResult,
          Map<String, dynamic>
        > {
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

  @override
  TendermintBlockResultsResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintBlockResultsResponseResult.fromJson(result);
  }
}
