import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/query/query_sales_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapQuerySales extends CosmosMessage
    with QueryMessage<OsmosisStreamSwapQuerySalesResponse> {
  /// pagination defines an pagination for the request
  final PageRequest? pagination;

  OsmosisStreamSwapQuerySales({this.pagination});
  factory OsmosisStreamSwapQuerySales.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQuerySales(
      pagination: decode
          .getResult(1)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.querySales;

  @override
  List get values => [pagination];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};

  @override
  OsmosisStreamSwapQuerySalesResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisStreamSwapQuerySalesResponse.fromJson(json);
  }

  @override
  OsmosisStreamSwapQuerySalesResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapQuerySalesResponse.deserialize(bytes);
  }
}
