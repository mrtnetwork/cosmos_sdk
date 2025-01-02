import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Broadcast evidence of the misbehavior.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/broadcast_evidence
class TendermintRequestBroadcastEvidence
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBroadcastEvidence(this.evidence);

  /// JSON evidence
  final String evidence;

  /// Broadcast evidence of the misbehavior.
  @override
  String get method => TendermintMethods.broadcastEvidence.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"evidence": evidence};
}
