import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get Genesis in multiple chunks
/// https://docs.tendermint.com/v0.34/rpc/#/Info/genesis_chunked
class TendermintRequestGenesisChunked
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestGenesisChunked({this.chunk});

  /// Sequence number of the chunk to download.
  final int? chunk;

  /// Get Genesis in multiple chunks
  @override
  String get method => TendermintMethods.genesisChunked.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"chunk": chunk?.toString()};
}
