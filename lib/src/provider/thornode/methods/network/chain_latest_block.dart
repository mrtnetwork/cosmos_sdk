import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/latest_block.dart';

/// Returns the last block information for the provided chain.
class ThorNodeRequestChainLatestBlock extends ThorNodeRequestParam<
    List<ThorLatestBlockResponse>, List<Map<String, dynamic>>> {
  ThorNodeRequestChainLatestBlock({this.height, required this.chain});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String chain;
  @override
  String get method => ThorNodeMethods.lastblockChain.url;

  @override
  List<String> get pathParameters => [chain];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
  @override
  List<ThorLatestBlockResponse> onResonse(List<Map<String, dynamic>> result) {
    return result.map((e) => ThorLatestBlockResponse.fromJson(e)).toList();
  }
}
