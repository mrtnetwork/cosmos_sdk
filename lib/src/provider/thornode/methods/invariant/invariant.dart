import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns result of running the given invariant.
class ThorNodeRequestInvariant
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestInvariant({this.height, required this.invariant});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String invariant;

  @override
  String get method => ThorNodeMethods.invariant.url;

  @override
  List<String> get pathParameters => [invariant];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
