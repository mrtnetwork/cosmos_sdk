import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/streaming_swap_state.dart';

/// Returns the state of all streaming swaps
class ThorNodeRequestStreamingSwapsState
    extends
        ThorNodeRequestParam<
          List<StreamingSwapStateResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestStreamingSwapsState(this.hash, {this.height});
  final String hash;

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.streamingState.url;

  @override
  List<String> get pathParameters => [hash];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<StreamingSwapStateResponse> onResonse(
    List<Map<String, dynamic>> result,
  ) {
    return result.map((e) => StreamingSwapStateResponse.fromJson(e)).toList();
  }
}
