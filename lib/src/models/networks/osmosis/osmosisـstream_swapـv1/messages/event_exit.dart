import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapEventExit extends CosmosMessage {
  final String? sender;
  final BigInt? saleId;

  /// amount of purchased token_out sent to the user
  final String? purchased;
  OsmosisStreamSwapEventExit({this.sender, this.saleId, this.purchased});
  factory OsmosisStreamSwapEventExit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapEventExit(
        sender: decode.getField(1),
        saleId: decode.getField(2),
        purchased: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "sale_id": saleId?.toString(),
      "purchased": purchased,
    };
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.eventExit.typeUrl;

  @override
  List get values => [sender, saleId, purchased];
}
