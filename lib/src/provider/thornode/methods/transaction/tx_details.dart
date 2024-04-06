import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';

/// Returns the signers for a provided inbound or outbound hash..
class ThorNodeRequestGetTransactionDetails
    extends ThorNodeRequestParam<Map<String, dynamic>, Map<String, dynamic>> {
  ThorNodeRequestGetTransactionDetails({required this.hash, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: CF524818D42B63D25BBA0CCC4909F127CAA645C0F9CD07324F2824CC151A64C7
  final String hash;
  @override
  String get method => ThorNodeMethods.getTransactionDetails.url;

  @override
  List<String> get pathParameters => [hash];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
}
