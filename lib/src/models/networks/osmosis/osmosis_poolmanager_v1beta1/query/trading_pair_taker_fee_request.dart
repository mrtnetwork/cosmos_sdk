import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'trading_pair_taker_fee_response.dart';

class OsmosisPoolManagerTradingPairTakerFeeRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerTradingPairTakerFeeResponse> {
  final String? denom0;
  final String? denom1;
  const OsmosisPoolManagerTradingPairTakerFeeRequest(
      {this.denom0, this.denom1});
  factory OsmosisPoolManagerTradingPairTakerFeeRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTradingPairTakerFeeRequest(
        denom0: decode.getField(1), denom1: decode.getField(2));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  OsmosisPoolManagerTradingPairTakerFeeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTradingPairTakerFeeResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerTradingPairTakerFeeResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerTradingPairTakerFeeResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"denom_0": denom0, "denom_1": denom1};

  @override
  Map<String, dynamic> toJson() {
    return {"denom_0": denom0, "denom_1": denom1};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.tradingPairTakerFeeRequest;

  @override
  List get values => [denom0, denom1];
}
