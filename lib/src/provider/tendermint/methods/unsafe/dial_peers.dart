import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Add Peers/Persistent Peers
/// https://docs.tendermint.com/v0.34/rpc/#/Unsafe/dial_peers
class TendermintRequestBroadcastDialPeers
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBroadcastDialPeers(
      {this.peers, this.unconditional, this.persistent, this.private});

  /// Have the peers you are dialing be persistent
  final bool? persistent;

  /// Have the peers you are dialing be unconditional
  final bool? unconditional;

  /// Have the peers you are dialing be private
  final bool? private;

  /// array of peers to dial
  final List<String>? peers;

  /// Add Peers/Persistent Peers
  @override
  String get method => TendermintMethods.dialPeers.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "peers": peers?.toString(),
        "persistent": persistent?.toString(),
        "unconditional": unconditional?.toString(),
        "private": private?.toString()
      };
}
