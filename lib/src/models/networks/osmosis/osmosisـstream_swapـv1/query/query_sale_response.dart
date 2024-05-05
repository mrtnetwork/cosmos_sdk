import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/messages/sale.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapQuerySaleResponse extends CosmosMessage {
  final OsmosisStreamSwapSale sale;

  OsmosisStreamSwapQuerySaleResponse({required this.sale});
  factory OsmosisStreamSwapQuerySaleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQuerySaleResponse(
        sale: OsmosisStreamSwapSale.deserialize(decode.getField(1)));
  }
  factory OsmosisStreamSwapQuerySaleResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisStreamSwapQuerySaleResponse(
        sale: OsmosisStreamSwapSale.fromRpc(json["sale"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sale": sale.toJson()};
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.querySaleResponse.typeUrl;

  @override
  List get values => [sale];
}
