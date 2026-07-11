import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get consensus state
/// https://docs.tendermint.com/v0.34/rpc/#/Info/dump_consensus_state
class TendermintRequestDumpConsensusState
    extends
        TendermintRequest<
          TendermintDumpConsensusResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestDumpConsensusState();

  /// Get consensus state
  @override
  String get method => TendermintMethods.dumpConsensusState.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};

  @override
  TendermintDumpConsensusResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintDumpConsensusResponseResult.fromJson(result);
  }
}
