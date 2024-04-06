import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns the swap queue.
class ThorNodeRequestQueueSwap extends ThorNodeRequestParam<
    List<Map<String, dynamic>>, List<Map<String, dynamic>>> {
  ThorNodeRequestQueueSwap({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.quoteSwap.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
