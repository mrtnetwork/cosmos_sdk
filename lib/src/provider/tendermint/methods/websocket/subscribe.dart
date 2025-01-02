import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Subscribe for events via WebSocket.
/// https://docs.tendermint.com/v0.34/rpc/#/Websocket/subscribe
class TendermintRequestSubscribe
    extends TendermintRequest<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestSubscribe(this.query);

  /// query is a string, which has a form:
  /// "condition AND condition ..." (no OR at the moment).
  /// condition has a form:
  /// "key operation operand".
  /// key is a string with a restricted set of possible symbols ( \t\n\r\()"'=>< are not allowed).
  /// operation can be "=", "<", "<=", ">", ">=", "CONTAINS".
  /// operand can be a string (escaped with single quotes), number, date or time.
  /// Example: tm.event = 'Tx' AND tx.height = 5
  final String query;

  /// Subscribe for events via WebSocket.
  @override
  String get method => TendermintMethods.subscribe.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"query": query};
}
