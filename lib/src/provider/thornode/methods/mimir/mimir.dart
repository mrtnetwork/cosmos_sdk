import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns current active mimir configuration.
class ThorNodeRequesActiveMimirConfiguration
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequesActiveMimirConfiguration({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  @override
  String get method => ThorNodeMethods.mimir.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
