import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns a boolean indicating whether the chain is in ragnarok.
class ThorNodeRequestRagnarok extends ThorNodeRequestParam<bool, bool> {
  ThorNodeRequestRagnarok({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.ragnarok.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
