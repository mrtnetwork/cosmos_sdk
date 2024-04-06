import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns keygen metrics for the provided vault pubkey.
class ThorNodeRequesPubkeyKeygenMetrics
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequesPubkeyKeygenMetrics({this.height, required this.pubkey});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: thorpub1addwnpepq068dr0x7ue973drmq4eqmzhcq3650n7nx5fhgn9gl207luxp6vaklu52tc
  final String pubkey;
  @override
  String get method => ThorNodeMethods.pubkeyKeygenMetrics.url;

  @override
  List<String> get pathParameters => [pubkey];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
