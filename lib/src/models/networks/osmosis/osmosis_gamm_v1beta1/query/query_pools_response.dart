import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisGammQueryPoolsResponse extends CosmosMessage {
  final List<AnyMessage>? pools;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  OsmosisGammQueryPoolsResponse({this.pagination, List<AnyMessage>? pools})
    : pools = pools?.emptyAsNull?.immutable;
  factory OsmosisGammQueryPoolsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolsResponse(
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
  factory OsmosisGammQueryPoolsResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolsResponse(
      pools:
          (json["pools"] as List?)?.map((e) => AnyMessage.fromJson(e)).toList(),
      pagination: PageResponse.fromJson(json["pagination"]),
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
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolsResponse;

  @override
  List get values => [pools, pagination];
}
