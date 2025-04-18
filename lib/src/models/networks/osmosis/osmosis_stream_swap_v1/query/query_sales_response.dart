import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/messages/sale.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisStreamSwapQuerySalesResponse extends CosmosMessage {
  final List<OsmosisStreamSwapSale> sales;

  final PageResponse? pagination;

  OsmosisStreamSwapQuerySalesResponse(
      {required List<OsmosisStreamSwapSale> sales, this.pagination})
      : sales = sales.immutable;
  factory OsmosisStreamSwapQuerySalesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQuerySalesResponse(
        sales: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisStreamSwapSale.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisStreamSwapQuerySalesResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisStreamSwapQuerySalesResponse(
        sales: (json["sales"] as List?)
                ?.map((e) => OsmosisStreamSwapSale.fromJson(e))
                .toList() ??
            <OsmosisStreamSwapSale>[],
        pagination: PageResponse.fromJson(json["pagination"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pagination": pagination?.toJson(),
      "sales": sales.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.querySalesResponse;

  @override
  List get values => [sales, pagination];
}
