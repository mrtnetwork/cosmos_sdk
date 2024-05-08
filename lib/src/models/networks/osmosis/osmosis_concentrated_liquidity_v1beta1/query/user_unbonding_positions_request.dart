import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'user_unbonding_positions_response.dart';

class OsmosisConcentratedLiquidityUserUnbondingPositionsRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityUserUnbondingPositionsResponse>,
        RPCMessage<OsmosisConcentratedLiquidityUserUnbondingPositionsResponse> {
  final String? address;

  const OsmosisConcentratedLiquidityUserUnbondingPositionsRequest(
      {this.address});
  factory OsmosisConcentratedLiquidityUserUnbondingPositionsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityUserUnbondingPositionsRequest(
        address: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.userUnbondingPositions.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.userUnbondingPositions
          .rpcUrl(pathParameters: [address]);

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .userUnbondingPositionsRequest.typeUrl;

  @override
  List get values => [address];

  @override
  OsmosisConcentratedLiquidityUserUnbondingPositionsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityUserUnbondingPositionsResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityUserUnbondingPositionsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityUserUnbondingPositionsResponse
        .deserialize(bytes);
  }
}
