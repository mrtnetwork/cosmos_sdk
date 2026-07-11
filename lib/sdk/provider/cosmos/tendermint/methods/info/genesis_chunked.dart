import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get Genesis in multiple chunks
/// https://docs.tendermint.com/v0.34/rpc/#/Info/genesis_chunked
class TendermintRequestGenesisChunked
    extends
        TendermintRequest<
          TendermintGenesisChunkedResponseResult,
          Map<String, dynamic>
        > {
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

  @override
  TendermintGenesisChunkedResponseResult onResonse(
    Map<String, dynamic> result,
  ) {
    return TendermintGenesisChunkedResponseResult.fromJson(result);
  }
}
