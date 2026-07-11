import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get info about the application.
/// https://docs.tendermint.com/v0.34/rpc/#/ABCI/abci_info
class TendermintRequestBroadcastAbciInfo
    extends
        TendermintRequest<
          TendermintABCIInfoResponseResult,
          Map<String, dynamic>
        > {
  TendermintRequestBroadcastAbciInfo();

  /// Get info about the application.
  @override
  String get method => TendermintMethods.abciInfo.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};

  @override
  TendermintABCIInfoResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintABCIInfoResponseResult.fromJson(result);
  }
}
