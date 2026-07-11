import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';

/// Get validator set at a specified height
/// https://docs.tendermint.com/v0.34/rpc/#/Info/validators
class TendermintRequestValidators
    extends
        TendermintRequest<
          TendermintValidatorsResponseResult,
          Map<String, dynamic>
        > {
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
  TendermintValidatorsResponseResult onResonse(Map<String, dynamic> result) {
    return TendermintValidatorsResponseResult.fromJson(result);
  }
}
