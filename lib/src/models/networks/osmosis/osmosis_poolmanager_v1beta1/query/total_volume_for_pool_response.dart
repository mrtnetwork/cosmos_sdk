import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolManagerTotalVolumeForPoolResponse extends CosmosMessage {
  final List<Coin> volume;
  OsmosisPoolManagerTotalVolumeForPoolResponse(List<Coin> volume)
    : volume = volume.immutable;
  factory OsmosisPoolManagerTotalVolumeForPoolResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalVolumeForPoolResponse(
      decode.getFields<List<int>>(1).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisPoolManagerTotalVolumeForPoolResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerTotalVolumeForPoolResponse(
      (json["volume"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"volume": volume.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.totalVolumeForPoolResponse;

  @override
  List get values => [volume];
}
