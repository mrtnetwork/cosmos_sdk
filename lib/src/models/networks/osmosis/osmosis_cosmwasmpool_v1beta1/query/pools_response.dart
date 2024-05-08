import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisCosmWasmPoolPoolsResponse extends CosmosMessage {
  final List<Any>? pools;
  final PageResponse? pagination;

  OsmosisCosmWasmPoolPoolsResponse({List<Any>? pools, required this.pagination})
      : pools = pools?.nullOnEmpy;
  factory OsmosisCosmWasmPoolPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolPoolsResponse(
      pools: decode
          .getFields<List<int>>(1)
          .map((e) => Any.deserialize(e))
          .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory OsmosisCosmWasmPoolPoolsResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolPoolsResponse(
      pools: (json["pools"] as List?)?.map((e) => Any.fromRpc(e)).toList(),
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pools": pools?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.poolsResponse.typeUrl;

  @override
  List get values => [pools, pagination];
}
