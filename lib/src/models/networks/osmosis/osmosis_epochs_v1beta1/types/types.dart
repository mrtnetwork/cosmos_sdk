import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisEpochsV1beta1Types extends TypeUrl {
  const OsmosisEpochsV1beta1Types._(super.typeUrl, {super.query, super.rpc});

  static OsmosisEpochsV1beta1Types epochInfo =
      const OsmosisEpochsV1beta1Types._("/osmosis.epochs.v1beta1.EpochInfo");
  static OsmosisEpochsV1beta1Types genesisState =
      const OsmosisEpochsV1beta1Types._("/osmosis.epochs.v1beta1.GenesisState");

  static OsmosisEpochsV1beta1Types epochsInfoRequest =
      const OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryEpochsInfoRequest",
          query: "/osmosis.epochs.v1beta1.Query/EpochInfos",
          rpc: "/osmosis/epochs/v1beta1/epochs");

  static OsmosisEpochsV1beta1Types epochsInfoResponse =
      const OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryEpochsInfoResponse");

  static OsmosisEpochsV1beta1Types currentEpochRequest =
      const OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryCurrentEpochRequest",
          query: "/osmosis.epochs.v1beta1.Query/CurrentEpoch",
          rpc: "/osmosis/epochs/v1beta1/current_epoch");

  static OsmosisEpochsV1beta1Types currentEpochResponse =
      const OsmosisEpochsV1beta1Types._(
          "/osmosis.epochs.v1beta1.QueryCurrentEpochResponse");
}
