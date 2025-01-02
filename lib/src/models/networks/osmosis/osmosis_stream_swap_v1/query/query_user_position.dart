import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_user_position_response.dart';

class OsmosisStreamSwapQueryUserPosition extends CosmosMessage
    with QueryMessage<OsmosisStreamSwapQueryUserPositionResponse> {
  /// ID of the Sale
  final BigInt saleId;

  /// user account address
  final String user;

  OsmosisStreamSwapQueryUserPosition(
      {required this.saleId, required this.user});
  factory OsmosisStreamSwapQueryUserPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQueryUserPosition(
        saleId: decode.getField(1), user: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sale_id": saleId.toString(), "user": user};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.queryUserPositionRequest;

  @override
  List get values => [saleId, user];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  OsmosisStreamSwapQueryUserPositionResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisStreamSwapQueryUserPositionResponse.fromRpc(json);
  }

  @override
  OsmosisStreamSwapQueryUserPositionResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapQueryUserPositionResponse.deserialize(bytes);
  }

  @override
  List<String> get pathParameters => [saleId.toString(), user];
}
