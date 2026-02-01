import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisCosmWasmPoolPoolsResponse extends CosmosMessage {
  final List<AnyMessage>? pools;
  final PageResponse? pagination;

  OsmosisCosmWasmPoolPoolsResponse({
    List<AnyMessage>? pools,
    required this.pagination,
  }) : pools = pools?.emptyAsNull?.immutable;
  factory OsmosisCosmWasmPoolPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolPoolsResponse(
      pools:
          decode
              .getFields<List<int>>(1)
              .map((e) => AnyMessage.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory OsmosisCosmWasmPoolPoolsResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolPoolsResponse(
      pools:
          (json["pools"] as List?)?.map((e) => AnyMessage.fromJson(e)).toList(),
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
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
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.poolsResponse;

  @override
  List get values => [pools, pagination];
}
