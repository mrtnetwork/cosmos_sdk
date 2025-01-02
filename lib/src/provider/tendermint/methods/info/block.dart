import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get Block.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block
class TendermintRequestBlock
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBlock({this.height});

  /// height to return. If no height is provided, it will fetch the latest block.
  final int? height;

  /// Get Block.
  @override
  String get method => TendermintMethods.block.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
