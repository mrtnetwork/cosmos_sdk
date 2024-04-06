import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/clout_score.dart';

/// Returns the clout score of an address
class ThorNodeRequestAddressCloutScore
    extends ThorNodeRequestParam<CloutScoreResponse, Map<String, dynamic>> {
  ThorNodeRequestAddressCloutScore({this.height, required this.address});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: thor1zupk5lmc84r2dh738a9g3zscavannjy3nzplwt
  final String address;
  @override
  String get method => ThorNodeMethods.cloutScore.url;

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  CloutScoreResponse onResonse(Map<String, dynamic> result) {
    return CloutScoreResponse.fromJson(result);
  }
}
