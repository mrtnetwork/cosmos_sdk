import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

class ThorNodeRequestPing
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestPing();

  @override
  String get method => ThorNodeMethods.ping.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {};
}
