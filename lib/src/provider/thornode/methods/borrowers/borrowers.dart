import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/borrower_information.dart';

/// Returns all borrowers for the given pool.
class ThorNodeRequestAssetBorrowersInformation
    extends
        ThorNodeRequestParam<
          List<AssetBorrowerPositionResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestAssetBorrowersInformation({required this.asset, this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;

  /// Example: BTC.BTC
  final String asset;

  @override
  String get method => ThorNodeMethods.borrowers.url;

  @override
  List<String> get pathParameters => [asset];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};

  @override
  List<AssetBorrowerPositionResponse> onResonse(
    List<Map<String, dynamic>> result,
  ) {
    return result
        .map((e) => AssetBorrowerPositionResponse.fromJson(e))
        .toList();
  }
}
