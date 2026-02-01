import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/constant.dart';

/// Returns constant configuration, can be overridden by mimir.
class ThorNodeRequestConstants
    extends
        ThorNodeRequestParam<ThorNodeNetworkConstants, Map<String, dynamic>> {
  ThorNodeRequestConstants({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.constants.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  ThorNodeNetworkConstants onResonse(Map<String, dynamic> result) {
    return ThorNodeNetworkConstants.fromJson(result["int_64_values"]);
  }
}
