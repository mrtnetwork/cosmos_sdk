import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'weight_map.dart';

/// CosmwasmPoolInfo contains meta data pertaining to a cosmwasm pool type.
class OsmosisProtorevCosmwasmPoolInfo extends CosmosMessage {
  /// he weight of a cosmwasm pool (by contract address)
  final List<OsmosisProtorevWeightMap> weightMaps;

  OsmosisProtorevCosmwasmPoolInfo({
    required List<OsmosisProtorevWeightMap> weightMaps,
  }) : weightMaps = weightMaps.immutable;

  factory OsmosisProtorevCosmwasmPoolInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevCosmwasmPoolInfo(
      weightMaps:
          decode
              .getFields<List<int>>(1)
              .map((e) => OsmosisProtorevWeightMap.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisProtorevCosmwasmPoolInfo.fromJson(Map<String, dynamic> json) {
    return OsmosisProtorevCosmwasmPoolInfo(
      weightMaps:
          (json["weight_maps"] as List?)
              ?.map((e) => OsmosisProtorevWeightMap.fromJson(e))
              .toList() ??
          <OsmosisProtorevWeightMap>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"weight_maps": weightMaps.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.cosmwasmPoolInfo;

  @override
  List get values => [weightMaps];
}
