import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v2/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerV2SpotPriceResponse extends CosmosMessage {
  /// String of the BigDec. Ex) 10.203uatom
  final String spotPrice;
  const OsmosisPoolManagerV2SpotPriceResponse(this.spotPrice);
  factory OsmosisPoolManagerV2SpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerV2SpotPriceResponse(decode.getField(1));
  }
  factory OsmosisPoolManagerV2SpotPriceResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerV2SpotPriceResponse(json["spot_price"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"spot_price": spotPrice};
  }

  @override
  String get typeUrl => OsmosisPoolManagerV2Types.spotPriceResponse.typeUrl;

  @override
  List get values => [spotPrice];
}
