import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisEpochsV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisEpochsV1beta1Types._(this.typeUrl, {this.rpc});

  static OsmosisEpochsV1beta1Types epochInfo =
      OsmosisEpochsV1beta1Types._("/osmosis.epochs.v1beta1.EpochInfo");
  static OsmosisEpochsV1beta1Types genesisState =
      OsmosisEpochsV1beta1Types._("/osmosis.epochs.v1beta1.GenesisState");

  static OsmosisEpochsV1beta1Types epochInfos = OsmosisEpochsV1beta1Types._(
      "/osmosis.epochs.v1beta1.Query/EpochInfos",
      rpc: "/osmosis/epochs/v1beta1/epochs");

  static OsmosisEpochsV1beta1Types epochsInfoRequest =
      OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryEpochsInfoRequest");

  static OsmosisEpochsV1beta1Types epochsInfoResponse =
      OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryEpochsInfoResponse");

  static OsmosisEpochsV1beta1Types currentEpochRequest =
      OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryCurrentEpochRequest");

  static OsmosisEpochsV1beta1Types currentEpoch = OsmosisEpochsV1beta1Types._(
      "/osmosis.epochs.v1beta1.Query/CurrentEpoch",
      rpc: "/osmosis/epochs/v1beta1/current_epoch");

  static OsmosisEpochsV1beta1Types currentEpochResponse =
      OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryCurrentEpochResponse");
}
