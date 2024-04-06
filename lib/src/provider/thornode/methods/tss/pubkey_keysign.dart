import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns keysign information for the provided height and pubkey -
/// the height being the block at which a tx out item is scheduled to
/// be signed and moved from the scheduled outbound queue to the outbound queue.
class ThorNodeRequestPubKeyKeysign
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestPubKeyKeysign({required this.height, required this.pubKey});

  final BigInt height;

  /// Example: thorpub1addwnpepq068dr0x7ue973drmq4eqmzhcq3650n7nx5fhgn9gl207luxp6vaklu52tc
  final String pubKey;
  @override
  String get method => ThorNodeMethods.pubkeyKeysign.url;

  @override
  List<String> get pathParameters => [height.toString(), pubKey];

  @override
  Map<String, String?> get parameters => {};
}
