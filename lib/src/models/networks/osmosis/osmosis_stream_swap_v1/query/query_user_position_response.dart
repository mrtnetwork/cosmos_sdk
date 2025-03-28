import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/messages/user_position.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapQueryUserPositionResponse extends CosmosMessage {
  final OsmosisStreamSwapUserPosition userPosition;

  OsmosisStreamSwapQueryUserPositionResponse(this.userPosition);
  factory OsmosisStreamSwapQueryUserPositionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapQueryUserPositionResponse(
        OsmosisStreamSwapUserPosition.deserialize(decode.getField(1)));
  }
  factory OsmosisStreamSwapQueryUserPositionResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisStreamSwapQueryUserPositionResponse(
        OsmosisStreamSwapUserPosition.fromJson(json["user_position"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"user_position": userPosition.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.queryUserPositionResponse;

  @override
  List get values => [userPosition];
}
