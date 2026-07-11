import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get Genesis
/// https://docs.tendermint.com/v0.34/rpc/#/Info/genesis
class TendermintRequestGenesis
    extends
        TendermintRequest<
          TendermintGenesisResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestGenesis();

  /// Get Genesis
  @override
  String get method => TendermintMethods.genesis.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String> get parameters => {};

  @override
  TendermintGenesisResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintGenesisResponseResult.fromJson(result);
  }
}
