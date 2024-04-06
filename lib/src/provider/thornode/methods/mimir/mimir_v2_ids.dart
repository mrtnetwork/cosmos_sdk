import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns mapping of mimir V2 IDs to name.
class ThorNodeRequestMimirV2Ids
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestMimirV2Ids({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  @override
  String get method => ThorNodeMethods.mirmirV2Ids.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
