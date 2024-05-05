import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisMintV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisMintV1beta1Types._(this.typeUrl, {this.rpc});
  static const OsmosisMintV1beta1Types weightedAddress =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.WeightedAddress");
  static const OsmosisMintV1beta1Types distributionProportions =
      OsmosisMintV1beta1Types._(
          "/osmosis.mint.v1beta1.DistributionProportions");
  static const OsmosisMintV1beta1Types minter =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.Minter");
  static const OsmosisMintV1beta1Types params =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.Params");
  static const OsmosisMintV1beta1Types genesisState =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.GenesisState");

  static const OsmosisMintV1beta1Types queryParamsRequest =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.QueryParamsRequest");
  static const OsmosisMintV1beta1Types queryParamsResponse =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.QueryParamsResponse");

  static const OsmosisMintV1beta1Types queryEpochProvisionsRequest =
      OsmosisMintV1beta1Types._(
          "/osmosis.mint.v1beta1.QueryEpochProvisionsRequest");
  static const OsmosisMintV1beta1Types queryEpochProvisionsResponse =
      OsmosisMintV1beta1Types._(
          "/osmosis.mint.v1beta1.QueryEpochProvisionsResponse");

  /// query
  static const OsmosisMintV1beta1Types epochProvisions =
      OsmosisMintV1beta1Types._("/osmosis.mint.v1beta1.Query/EpochProvisions",
          rpc: "/osmosis/mint/v1beta1/epoch_provisions");
  static const OsmosisMintV1beta1Types queryParams = OsmosisMintV1beta1Types._(
      "/osmosis.mint.v1beta1.Query/Params",
      rpc: "/osmosis/mint/v1beta1/params");
}
