import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapMsgExitSaleResponse extends CosmosMessage {
  /// Purchased amount of "out" tokens withdrawn to the user.
  final String purchased;

  OsmosisStreamSwapMsgExitSaleResponse(this.purchased);
  factory OsmosisStreamSwapMsgExitSaleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgExitSaleResponse(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"purchased": purchased};
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.msgExitSaleResponse.typeUrl;

  @override
  List get values => [purchased];
}
