import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Unsubscribe from all events via WebSocket
/// https://docs.tendermint.com/v0.34/rpc/#/Websocket/unsubscribe_all
class TendermintRequestUnSubscribeAll
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestUnSubscribeAll();

  /// Unsubscribe from all events via WebSocket
  @override
  String get method => TendermintMethods.unsubscribeAll.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};
}
