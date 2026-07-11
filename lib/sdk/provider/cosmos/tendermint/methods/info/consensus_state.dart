import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get consensus state
/// https://docs.tendermint.com/v0.34/rpc/#/Info/consensus_state
class TendermintRequestConsensusState
    extends
        TendermintRequest<
          TendermintConsensusStateResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestConsensusState();

  /// Get consensus state
  @override
  String get method => TendermintMethods.consensusState.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};

  @override
  TendermintConsensusStateResponseResult onResonse(
    Map<String, dynamic> result,
  ) {
    return TendermintConsensusStateResponseResult.fromJson(result);
  }
}
