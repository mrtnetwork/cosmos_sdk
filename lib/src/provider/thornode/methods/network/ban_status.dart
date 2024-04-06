import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/ban_status_response.dart';

/// Returns the ban status for the provided node address.
class ThorNodeRequestBanStatus
    extends ThorNodeRequestParam<ThorBanStatusResponse, Map<String, dynamic>> {
  ThorNodeRequestBanStatus({required this.address, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String address;
  @override
  String get method => ThorNodeMethods.ban.url;

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  ThorBanStatusResponse onResonse(Map<String, dynamic> result) {
    return ThorBanStatusResponse.fromJson(result);
  }
}
