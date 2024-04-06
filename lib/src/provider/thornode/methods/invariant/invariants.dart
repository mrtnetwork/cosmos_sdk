import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns a list of available invariants.
class ThorNodeRequestInvariants
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestInvariants({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  @override
  String get method => ThorNodeMethods.invariants.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
