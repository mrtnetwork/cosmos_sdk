import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/messages/sale.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapQuerySaleResponse extends CosmosMessage {
  final OsmosisStreamSwapSale sale;

  OsmosisStreamSwapQuerySaleResponse({required this.sale});
  factory OsmosisStreamSwapQuerySaleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQuerySaleResponse(
      sale: OsmosisStreamSwapSale.deserialize(decode.getField(1)),
    );
  }
  factory OsmosisStreamSwapQuerySaleResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisStreamSwapQuerySaleResponse(
      sale: OsmosisStreamSwapSale.fromJson(json["sale"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sale": sale.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.querySaleResponse;

  @override
  List get values => [sale];
}
