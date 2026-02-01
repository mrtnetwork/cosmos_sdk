import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/streaming_swap_state.dart';

/// Returns the state of a streaming swap
class ThorNodeRequestStreamingSwapState
    extends
        ThorNodeRequestParam<StreamingSwapStateResponse, Map<String, dynamic>> {
  ThorNodeRequestStreamingSwapState({this.height, required this.hash});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String hash;
  @override
  String get method => ThorNodeMethods.streamingState.url;

  @override
  List<String> get pathParameters => [hash];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  StreamingSwapStateResponse onResonse(Map<String, dynamic> result) {
    return StreamingSwapStateResponse.fromJson(result);
  }
}
