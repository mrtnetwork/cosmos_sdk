import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

class OsmosisGammQuerySpotPriceResponse extends CosmosMessage {
  final String? spotPrice;

  OsmosisGammQuerySpotPriceResponse({this.spotPrice});
  factory OsmosisGammQuerySpotPriceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQuerySpotPriceResponse(spotPrice: decode.getField(1));
  }
  factory OsmosisGammQuerySpotPriceResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammQuerySpotPriceResponse(spotPrice: json["spot_price"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"spot_price": spotPrice};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.querySpotPriceResponse.typeUrl;

  @override
  List get values => [spotPrice];
}
