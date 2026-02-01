import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

///
class ThorNodeRequestQueueOutbound
    extends
        ThorNodeRequestParam<
          List<Map<String, dynamic>>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestQueueOutbound({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.outbound.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
