import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Unsubscribe from event on Websocket
/// https://docs.tendermint.com/v0.34/rpc/#/Websocket/unsubscribe
class TendermintRequestUnSubscribe
    extends TendermintRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  TendermintRequestUnSubscribe(this.query);

  /// query is a string, which has a form:
  /// "condition AND condition ..." (no OR at the moment).
  /// condition has a form:
  /// "key operation operand".
  /// key is a string with a restricted set of possible symbols ( \t\n\r\()"'=>< are not allowed).
  /// operation can be "=", "<", "<=", ">", ">=", "CONTAINS".
  /// operand can be a string (escaped with single quotes), number, date or time.
  /// Example: tm.event = 'Tx' AND tx.height = 5
  final String query;

  /// Unsubscribe from event on Websocket
  @override
  String get method => TendermintMethods.unsubscribe.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"query": query};
}
