import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/queue_statistics.dart';

/// Returns all trade accounts for an asset
class ThorNodeRequestQueue extends ThorNodeRequestParam<
    ThorQueueStatisticsResponse, Map<String, dynamic>> {
  ThorNodeRequestQueue({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.queue.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  ThorQueueStatisticsResponse onResonse(Map<String, dynamic> result) {
    return ThorQueueStatisticsResponse.fromJson(result);
  }
}
