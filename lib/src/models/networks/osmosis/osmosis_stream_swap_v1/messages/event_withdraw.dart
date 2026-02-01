import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapEventWithdraw extends CosmosMessage {
  final String? sender;
  final BigInt? saleId;

  /// amount of staked token_in withdrawn by user
  final String? amount;
  OsmosisStreamSwapEventWithdraw({this.sender, this.saleId, this.amount});
  factory OsmosisStreamSwapEventWithdraw.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapEventWithdraw(
      sender: decode.getField(1),
      saleId: decode.getField(2),
      amount: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "sale_id": saleId?.toString(), "amount": amount};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.eventWithdraw;

  @override
  List get values => [sender, saleId, amount];
}
