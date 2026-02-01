import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'position_by_id_response.dart';

class OsmosisConcentratedLiquidityPositionByIdRequest extends CosmosMessage
    with QueryMessage<OsmosisConcentratedLiquidityPositionByIdResponse> {
  final BigInt? positionId;
  OsmosisConcentratedLiquidityPositionByIdRequest({this.positionId});
  factory OsmosisConcentratedLiquidityPositionByIdRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPositionByIdRequest(
      positionId: decode.getField(1),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {
    "position_id": positionId?.toString(),
  };

  @override
  Map<String, dynamic> toJson() {
    return {"position_id": positionId?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.positionByIdRequest;

  @override
  List get values => [positionId];

  @override
  OsmosisConcentratedLiquidityPositionByIdResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityPositionByIdResponse.fromJson(json);
  }

  @override
  OsmosisConcentratedLiquidityPositionByIdResponse onResponse(List<int> bytes) {
    return OsmosisConcentratedLiquidityPositionByIdResponse.deserialize(bytes);
  }
}
