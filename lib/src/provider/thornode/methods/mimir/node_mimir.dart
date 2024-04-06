import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns current node mimir configuration for the provided node address.
class ThorNodeRequestNodeMimirConfiguration
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestNodeMimirConfiguration({required this.address, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String address;

  @override
  String get method => ThorNodeMethods.mirmirNodeAddress.url;

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
