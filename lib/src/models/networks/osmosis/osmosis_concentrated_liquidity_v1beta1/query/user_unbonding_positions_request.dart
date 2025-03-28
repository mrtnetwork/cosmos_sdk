import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'user_unbonding_positions_response.dart';

class OsmosisConcentratedLiquidityUserUnbondingPositionsRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityUserUnbondingPositionsResponse> {
  final String address;

  const OsmosisConcentratedLiquidityUserUnbondingPositionsRequest(
      {required this.address});
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
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  List<String> get pathParameters => [address];
  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.userUnbondingPositionsRequest;

  @override
  List get values => [address];

  @override
  OsmosisConcentratedLiquidityUserUnbondingPositionsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityUserUnbondingPositionsResponse.fromJson(
        json);
  }

  @override
  OsmosisConcentratedLiquidityUserUnbondingPositionsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityUserUnbondingPositionsResponse
        .deserialize(bytes);
  }
}
