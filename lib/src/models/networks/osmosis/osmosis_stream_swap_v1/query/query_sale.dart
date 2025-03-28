import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_sale_response.dart';

class OsmosisStreamSwapQuerySale extends CosmosMessage
    with QueryMessage<OsmosisStreamSwapQuerySaleResponse> {
  /// pagination defines an pagination for the request
  final BigInt saleId;

  OsmosisStreamSwapQuerySale({required this.saleId});
  factory OsmosisStreamSwapQuerySale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQuerySale(saleId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sale_id": saleId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.querySaleRequest;

  @override
  List get values => [saleId];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  OsmosisStreamSwapQuerySaleResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisStreamSwapQuerySaleResponse.fromJson(json);
  }

  @override
  OsmosisStreamSwapQuerySaleResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapQuerySaleResponse.deserialize(bytes);
  }

  @override
  List<String> get pathParameters => [saleId.toString()];
}
