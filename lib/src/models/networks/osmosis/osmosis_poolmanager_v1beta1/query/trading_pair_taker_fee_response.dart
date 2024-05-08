import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerTradingPairTakerFeeResponse extends CosmosMessage {
  final String takerFee;
  OsmosisPoolManagerTradingPairTakerFeeResponse(this.takerFee);
  factory OsmosisPoolManagerTradingPairTakerFeeResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTradingPairTakerFeeResponse(decode.getField(1));
  }
  factory OsmosisPoolManagerTradingPairTakerFeeResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTradingPairTakerFeeResponse(json["taker_fee"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"taker_fee": takerFee};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.tradingPairTakerFeeResponse.typeUrl;

  @override
  List get values => [takerFee];
}
