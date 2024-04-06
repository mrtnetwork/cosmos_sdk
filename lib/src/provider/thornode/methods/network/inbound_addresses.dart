import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/asgard_addresses.dart';

/// Returns the set of asgard addresses that should be used for inbound transactions.
class ThorNodeRequestAsgardInboundAddresses extends ThorNodeRequestParam<
    List<ThorAsgardInboundAddressesResponse>, List<Map<String, dynamic>>> {
  ThorNodeRequestAsgardInboundAddresses({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.inboundAddresses.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
  @override
  List<ThorAsgardInboundAddressesResponse> onResonse(
      List<Map<String, dynamic>> result) {
    return result
        .map((e) => ThorAsgardInboundAddressesResponse.fromJson(e))
        .toList();
  }
}
