import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get consensus state
/// https://docs.tendermint.com/v0.34/rpc/#/Info/dump_consensus_state
class TendermintRequestDumpConsensusState
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestDumpConsensusState();

  /// Get consensus state
  @override
  String get method => TendermintMethods.dumpConsensusState.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};
}
