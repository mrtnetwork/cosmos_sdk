import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';

/// Get validator set at a specified height
/// https://docs.tendermint.com/v0.34/rpc/#/Info/validators
class TendermintRequestValidators
    extends TendermintRequest<List<Map<String, dynamic>>, List<dynamic>> {
  TendermintRequestValidators({this.height, this.page, this.perPage});

  /// height to return. If no height is provided,
  /// it will fetch information regarding the latest block.
  final int? height;

  /// Page number (1-based)
  final int? page;

  /// Number of entries per page (max: 100)
  /// Default value : 30
  final int? perPage;

  /// Get validator set at a specified height
  @override
  String get method => TendermintMethods.validators.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
    "height": height?.toString(),
    "page": page?.toString(),
    "per_page": perPage?.toString(),
  };

  @override
  List<Map<String, dynamic>> onResonse(List<dynamic> result) {
    return result.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
