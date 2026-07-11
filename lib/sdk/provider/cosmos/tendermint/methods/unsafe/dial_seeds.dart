import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Dial a peer, this route in under unsafe, and has to manually enabled to use
/// https://docs.tendermint.com/v0.34/rpc/#/Unsafe/dial_seeds
class TendermintRequestBroadcastDialSeeds
    extends TendermintRequest<TendermintdialResp, Map<String, dynamic>> {
  TendermintRequestBroadcastDialSeeds(this.peers);

  /// list of seed nodes to dial
  final List<String> peers;

  /// Dial a peer, this route in under unsafe, and has to manually enabled to use.
  @override
  String get method => TendermintMethods.dialSeeds.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"peers": peers.toString()};

  @override
  TendermintdialResp onResonse(Map<String, dynamic> result) {
    return TendermintdialResp.fromJson(result);
  }
}
