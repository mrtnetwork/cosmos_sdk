import 'package:cosmos_sdk/sdk/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/sdk/provider/thornode/models/models/queue_statistics.dart';

/// Returns queue statistics for the network.
class ThorNodeRequestQueue
    extends
        ThorNodeRequestParam<
          ThorQueueStatisticsResponse,
          Map<String, dynamic>
        > {
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
  ThorQueueStatisticsResponse onResponse(Map<String, dynamic> result) {
    return ThorQueueStatisticsResponse.fromJson(result);
  }
}
