import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerSpotPriceResponse extends CosmosMessage {
  /// String of the Dec. Ex) 10.203uatom
  final String? spotPrice;
  const OsmosisPoolManagerSpotPriceResponse({this.spotPrice});
  factory OsmosisPoolManagerSpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerSpotPriceResponse(spotPrice: decode.getField(1));
  }
  factory OsmosisPoolManagerSpotPriceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerSpotPriceResponse(spotPrice: json["spot_price"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"spot_price": spotPrice};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.spotPriceResponse;

  @override
  List get values => [spotPrice];
}
