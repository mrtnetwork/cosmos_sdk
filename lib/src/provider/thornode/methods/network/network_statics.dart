import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/network.dart';

/// Returns network overview statistics.
class ThorNodeRequestNetworkStatistics extends ThorNodeRequestParam<
    ThorNetworkStaticsResponse, Map<String, dynamic>> {
  ThorNodeRequestNetworkStatistics({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.network.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
  @override
  ThorNetworkStaticsResponse onResonse(Map<String, dynamic> result) {
    return ThorNetworkStaticsResponse.fromJson(result);
  }
}
