import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_user_position_response.dart';

class OsmosisStreamSwapQueryUserPosition extends CosmosMessage
    with
        QueryMessage<OsmosisStreamSwapQueryUserPositionResponse>,
        RPCMessage<OsmosisStreamSwapQueryUserPositionResponse> {
  /// ID of the Sale
  final BigInt? saleId;

  /// user account address
  final String? user;

  OsmosisStreamSwapQueryUserPosition({this.saleId, this.user});
  factory OsmosisStreamSwapQueryUserPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQueryUserPosition(
        saleId: decode.getField(1), user: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sale_id": saleId?.toString(), "user": user};
  }

  @override
  String get typeUrl =>
      OsmosisStreamSwapV1Types.queryUserPositionRequest.typeUrl;

  @override
  List get values => [saleId, user];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisStreamSwapV1Types.queryUserPosition.typeUrl;

  @override
  String get rpcPath => OsmosisStreamSwapV1Types.queryUserPosition
      .rpcUrl(pathParameters: [saleId?.toString(), user]);

  @override
  OsmosisStreamSwapQueryUserPositionResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisStreamSwapQueryUserPositionResponse.fromRpc(json);
  }

  @override
  OsmosisStreamSwapQueryUserPositionResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapQueryUserPositionResponse.deserialize(bytes);
  }
}
