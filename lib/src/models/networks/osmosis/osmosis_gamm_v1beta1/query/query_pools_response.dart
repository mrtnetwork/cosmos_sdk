import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisGammQueryPoolsResponse extends CosmosMessage {
  final List<Any>? pools;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  OsmosisGammQueryPoolsResponse({this.pagination, List<Any>? pools})
      : pools = pools?.nullOnEmpy;
  factory OsmosisGammQueryPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolsResponse(
        pools: decode
            .getFields<List<int>>(1)
            .map((e) => Any.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisGammQueryPoolsResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolsResponse(
        pools: (json["pools"] as List?)?.map((e) => Any.fromRpc(e)).toList(),
        pagination: PageResponse.fromRpc(json["pagination"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pools": pools?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolsResponse.typeUrl;

  @override
  List get values => [pools, pagination];
}
