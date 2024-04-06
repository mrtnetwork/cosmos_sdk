import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/version.dart';

/// Returns the network's current THORNode version,
/// the network's next THORNode version, and the querier's THORNode version.
class ThorNodeRequestVersion
    extends ThorNodeRequestParam<ThorVersionResponse, Map<String, dynamic>> {
  ThorNodeRequestVersion({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.version.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  ThorVersionResponse onResonse(Map<String, dynamic> result) {
    return ThorVersionResponse.fromJson(result);
  }
}
