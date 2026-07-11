import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get commit results at a specified height
/// https://docs.tendermint.com/v0.34/rpc/#/Info/commit
class TendermintRequestCommit
    extends
        TendermintRequest<
          TendermintCommitResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestCommit({this.height});

  /// height to return. If no height is provided,
  /// it will fetch information regarding the latest block.
  final int? height;

  /// Get commit results at a specified height
  @override
  String get method => TendermintMethods.commit.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  TendermintCommitResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintCommitResponseResult.fromJson(result);
  }
}
