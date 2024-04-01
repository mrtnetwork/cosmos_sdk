import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get block headers (max: 20) for minHeight <= height <= maxHeight.
/// https://docs.tendermint.com/v0.34/rpc/#/Info/blockchain
class TendermintRequestBlockchain
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestBlockchain({this.minHeight, this.maxHeight});

  /// Minimum block height to return
  final int? minHeight;

  /// Maximum block height to return
  final int? maxHeight;

  /// Get block headers (max: 20) for minHeight <= height <= maxHeight.
  @override
  String get method => TendermintMethods.blockchain.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
        "minHeight": minHeight?.toString(),
        "maxHeight": maxHeight?.toString(),
      };
}
