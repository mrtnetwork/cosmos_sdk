import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisPoolManagerTotalVolumeForPoolResponse extends CosmosMessage {
  final List<Coin> volume;
  OsmosisPoolManagerTotalVolumeForPoolResponse(List<Coin> volume)
      : volume = volume.mutable;
  factory OsmosisPoolManagerTotalVolumeForPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalVolumeForPoolResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisPoolManagerTotalVolumeForPoolResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTotalVolumeForPoolResponse(
        (json["volume"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"volume": volume.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.totalVolumeForPoolResponse.typeUrl;

  @override
  List get values => [volume];
}
