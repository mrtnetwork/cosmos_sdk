import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns current admin mimir configuration.
class ThorNodeRequesAdminMimirConfiguration
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequesAdminMimirConfiguration({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  @override
  String get method => ThorNodeMethods.mirmirAdmin.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
