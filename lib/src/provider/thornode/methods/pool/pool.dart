import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/pool.dart';

/// Returns protocol owned liquidity overview statistics..
class ThorNodeRequestPolStatics
    extends ThorNodeRequestParam<PolStaticsResponse, Map<String, dynamic>> {
  ThorNodeRequestPolStatics({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.pool.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  PolStaticsResponse onResonse(Map<String, dynamic> result) {
    return PolStaticsResponse.fromJson(result);
  }
}
