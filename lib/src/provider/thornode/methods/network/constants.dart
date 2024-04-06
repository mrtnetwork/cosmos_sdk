import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns constant configuration, can be overridden by mimir.
class ThorNodeRequestConstants
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestConstants({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.constants.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
