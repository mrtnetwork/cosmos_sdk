import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'claimable_incentives_response.dart';

class OsmosisConcentratedLiquidityClaimableIncentivesRequest
    extends CosmosMessage
    with QueryMessage<OsmosisConcentratedLiquidityClaimableIncentivesResponse> {
  final BigInt? positionId;

  const OsmosisConcentratedLiquidityClaimableIncentivesRequest({
    this.positionId,
  });
  factory OsmosisConcentratedLiquidityClaimableIncentivesRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityClaimableIncentivesRequest(
        positionId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters =>
      {"position_id": positionId?.toString()};

  @override
  Map<String, dynamic> toJson() {
    return {"position_id": positionId?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.claimableIncentivesRequest;

  @override
  List get values => [positionId];

  @override
  OsmosisConcentratedLiquidityClaimableIncentivesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityClaimableIncentivesResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityClaimableIncentivesResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityClaimableIncentivesResponse.deserialize(
        bytes);
  }
}
