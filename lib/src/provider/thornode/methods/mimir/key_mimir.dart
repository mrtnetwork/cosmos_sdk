import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns current active mimir configuration for the provided key.
class ThorNodeRequesKeyActiveMimirConfiguration
    extends ThorNodeRequestParam<int, int> {
  ThorNodeRequesKeyActiveMimirConfiguration({required this.key, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// the mimir key to lookup
  final String key;

  @override
  String get method => ThorNodeMethods.keyMimir.url;

  @override
  List<String> get pathParameters => [key];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
