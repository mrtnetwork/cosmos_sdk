import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_sale_response.dart';

class OsmosisStreamSwapQuerySale extends CosmosMessage
    with
        QueryMessage<OsmosisStreamSwapQuerySaleResponse>,
        RPCMessage<OsmosisStreamSwapQuerySaleResponse> {
  /// pagination defines an pagination for the request
  final BigInt? saleId;

  OsmosisStreamSwapQuerySale({this.saleId});
  factory OsmosisStreamSwapQuerySale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQuerySale(saleId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sale_id": saleId?.toString()};
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.querySaleRequest.typeUrl;

  @override
  List get values => [saleId];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisStreamSwapV1Types.querySale.typeUrl;

  @override
  String get rpcPath => OsmosisStreamSwapV1Types.querySale
      .rpcUrl(pathParameters: [saleId?.toString()]);

  @override
  OsmosisStreamSwapQuerySaleResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisStreamSwapQuerySaleResponse.fromRpc(json);
  }

  @override
  OsmosisStreamSwapQuerySaleResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapQuerySaleResponse.deserialize(bytes);
  }
}
