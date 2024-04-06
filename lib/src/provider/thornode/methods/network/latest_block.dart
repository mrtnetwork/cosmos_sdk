import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/latest_block.dart';

/// Returns the last block information for all chains.
class ThorNodeRequestLatestBlock extends ThorNodeRequestParam<
    List<ThorLatestBlockResponse>, List<Map<String, dynamic>>> {
  ThorNodeRequestLatestBlock({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.lastblock.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
  @override
  List<ThorLatestBlockResponse> onResonse(List<Map<String, dynamic>> result) {
    return result.map((e) => ThorLatestBlockResponse.fromJson(e)).toList();
  }
}
