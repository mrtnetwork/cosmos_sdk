import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get Block.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/block
class TendermintRequestBlock
    extends TendermintRequest<TendermintBlockComplete, Map<String, dynamic>> {
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

  @override
  TendermintBlockComplete onResonse(Map<String, dynamic> result) {
    return TendermintBlockComplete.fromJson(result);
  }
}
