import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/sawap_ammount_out_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_swap_exact_amount_out_response.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisGammQuerySwapExactAmountOutRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQuerySwapExactAmountOutResponse>,
        RPCMessage<OsmosisGammQuerySwapExactAmountOutResponse> {
  final String? sender;
  final BigInt? poolId;

  final List<OsmosisGammSwapAmountOutRoute> routes;
  final String? tokenOut;

  OsmosisGammQuerySwapExactAmountOutRequest(
      {this.sender,
      this.poolId,
      this.tokenOut,
      required List<OsmosisGammSwapAmountOutRoute> routes})
      : routes = routes.mutable;

  factory OsmosisGammQuerySwapExactAmountOutRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQuerySwapExactAmountOutRequest(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      tokenOut: decode.getField(4),
      routes: decode
          .getFields(3)
          .map((e) => OsmosisGammSwapAmountOutRoute.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisGammQuerySwapExactAmountOutRequest.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisGammQuerySwapExactAmountOutRequest(
        sender: json["sender"],
        poolId: BigintUtils.tryParse(json["pool_id"]),
        tokenOut: json["token_out"],
        routes: (json["routes"] as List?)
                ?.map((e) => OsmosisGammSwapAmountOutRoute.fromRpc(e))
                .toList() ??
            <OsmosisGammSwapAmountOutRoute>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "token_out": tokenOut,
      "routes": routes.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisGammV1beta1Types.querySwapExactAmountOutRequest.typeUrl;

  @override
  List get values => [sender, poolId, routes, tokenOut];

  @override
  OsmosisGammQuerySwapExactAmountOutResponse onResponse(List<int> bytes) {
    return OsmosisGammQuerySwapExactAmountOutResponse.deserialize(bytes);
  }

  @override
  String get queryPath =>
      OsmosisGammV1beta1Types.estimateSwapExactAmountOut.typeUrl;

  @override
  OsmosisGammQuerySwapExactAmountOutResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisGammQuerySwapExactAmountOutResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"sender": sender, "token_out": tokenOut};

  @override
  String get rpcPath => OsmosisGammV1beta1Types.estimateSwapExactAmountOut
      .rpcUrl(pathParameters: [poolId?.toString()]);
}
