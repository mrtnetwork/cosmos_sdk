import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/borrower_information.dart';

/// Returns the borrower position given the pool and address.
class ThorNodeRequestAddressBorrowerSaverPosition extends ThorNodeRequestParam<
    AssetBorrowerPositionResponse, Map<String, dynamic>> {
  ThorNodeRequestAddressBorrowerSaverPosition(
      {required this.asset, required this.address, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: BTC.BTC
  final String asset;

  /// Example: thor1zupk5lmc84r2dh738a9g3zscavannjy3nzplwt
  final String address;
  @override
  String get method => ThorNodeMethods.borrower.url;

  @override
  List<String> get pathParameters => [asset, address];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  AssetBorrowerPositionResponse onResonse(Map<String, dynamic> result) {
    return AssetBorrowerPositionResponse.fromJson(result);
  }
}
