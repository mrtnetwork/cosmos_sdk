import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'position_by_id_response.dart';

class OsmosisConcentratedLiquidityPositionByIdRequest extends CosmosMessage
    with
        QueryMessage<OsmosisConcentratedLiquidityPositionByIdResponse>,
        RPCMessage<OsmosisConcentratedLiquidityPositionByIdResponse> {
  final BigInt? positionId;
  OsmosisConcentratedLiquidityPositionByIdRequest({this.positionId});
  factory OsmosisConcentratedLiquidityPositionByIdRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPositionByIdRequest(
        positionId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.positionById.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.positionById.rpcUrl();

  @override
  Map<String, dynamic> toJson() {
    return {"position_id": positionId?.toString()};
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.positionByIdRequest.typeUrl;

  @override
  List get values => [positionId];

  @override
  OsmosisConcentratedLiquidityPositionByIdResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPositionByIdResponse.fromRpc(json);
  }

  @override
  OsmosisConcentratedLiquidityPositionByIdResponse onResponse(List<int> bytes) {
    return OsmosisConcentratedLiquidityPositionByIdResponse.deserialize(bytes);
  }
}
