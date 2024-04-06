import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns keysign information for the provided height - the height being the first block a tx out item appears in the signed-but-unobserved outbound queue.
class ThorNodeRequestKeysign
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestKeysign({required this.height});

  /// optional block height, defaults to current tip
  final BigInt height;
  @override
  String get method => ThorNodeMethods.keysign.url;

  @override
  List<String> get pathParameters => [height.toString()];

  @override
  Map<String, String?> get parameters => {};
}
