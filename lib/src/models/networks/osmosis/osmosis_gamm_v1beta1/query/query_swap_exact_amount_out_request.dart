import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/sawap_ammount_out_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_swap_exact_amount_out_response.dart';

class OsmosisGammQuerySwapExactAmountOutRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQuerySwapExactAmountOutResponse> {
  final String? sender;
  final BigInt poolId;

  final List<OsmosisGammSwapAmountOutRoute> routes;
  final String? tokenOut;

  OsmosisGammQuerySwapExactAmountOutRequest({
    this.sender,
    required this.poolId,
    this.tokenOut,
    required List<OsmosisGammSwapAmountOutRoute> routes,
  }) : routes = routes.immutable;

  factory OsmosisGammQuerySwapExactAmountOutRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQuerySwapExactAmountOutRequest(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      tokenOut: decode.getField(4),
      routes:
          decode
              .getFields<List<int>>(3)
              .map((e) => OsmosisGammSwapAmountOutRoute.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisGammQuerySwapExactAmountOutRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammQuerySwapExactAmountOutRequest(
      sender: json["sender"],
      poolId: BigintUtils.parse(json["pool_id"]),
      tokenOut: json["token_out"],
      routes:
          (json["routes"] as List?)
              ?.map((e) => OsmosisGammSwapAmountOutRoute.fromJson(e))
              .toList() ??
          <OsmosisGammSwapAmountOutRoute>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId.toString(),
      "token_out": tokenOut,
      "routes": routes.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.querySwapExactAmountOutRequest;

  @override
  List<String> get pathParameters => [poolId.toString()];

  @override
  List get values => [sender, poolId, routes, tokenOut];

  @override
  OsmosisGammQuerySwapExactAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammQuerySwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  OsmosisGammQuerySwapExactAmountOutResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammQuerySwapExactAmountOutResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    "sender": sender,
    "token_out": tokenOut,
  };
}
