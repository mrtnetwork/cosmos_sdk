import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/sawap_ammount_in_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_swap_exact_amount_in_response.dart';

class OsmosisGammQuerySwapExactAmountInRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQuerySwapExactAmountInResponse> {
  final String? sender;
  final BigInt poolId;
  final String? tokenIn;
  final List<OsmosisGammSwapAmountInRoute> routes;

  OsmosisGammQuerySwapExactAmountInRequest(
      {this.sender,
      required this.poolId,
      this.tokenIn,
      required List<OsmosisGammSwapAmountInRoute> routes})
      : routes = routes.immutable;

  factory OsmosisGammQuerySwapExactAmountInRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQuerySwapExactAmountInRequest(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      tokenIn: decode.getField(3),
      routes: decode
          .getFields(4)
          .map((e) => OsmosisGammSwapAmountInRoute.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisGammQuerySwapExactAmountInRequest.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammQuerySwapExactAmountInRequest(
        sender: json["sender"],
        poolId: BigintUtils.parse(json["pool_id"]),
        tokenIn: json["token_in"],
        routes: (json["routes"] as List?)
                ?.map((e) => OsmosisGammSwapAmountInRoute.fromRpc(e))
                .toList() ??
            <OsmosisGammSwapAmountInRoute>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId.toString(),
      "token_in": tokenIn,
      "routes": routes.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.querySwapExactAmountInRequest;

  @override
  List get values => [sender, poolId, tokenIn, routes];

  @override
  OsmosisGammQuerySwapExactAmountInResponse onResponse(List<int> bytes) {
    return OsmosisGammQuerySwapExactAmountInResponse.deserialize(bytes);
  }

  @override
  OsmosisGammQuerySwapExactAmountInResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisGammQuerySwapExactAmountInResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"sender": sender, "token_in": tokenIn};

  @override
  List<String> get pathParameters => [poolId.toString()];
}
