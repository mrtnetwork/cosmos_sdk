import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns node information for the provided node address.
class ThorNodeRequestNodeInformation
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestNodeInformation({required this.address, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String address;
  @override
  String get method => ThorNodeMethods.node.url;

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
