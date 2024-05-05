import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'msg_finalize_sale_response.dart';

class OsmosisStreamSwapMsgFinalizeSale extends CosmosMessage
    with ServiceMessage<OsmosisStreamSwapMsgFinalizeSaleResponse> {
  /// sender is an account signing the message and triggering the finalization
  final String? sender;

  /// ID of an existing sale.
  final BigInt? saleId;

  OsmosisStreamSwapMsgFinalizeSale({this.sender, this.saleId});
  factory OsmosisStreamSwapMsgFinalizeSale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgFinalizeSale(
        sender: decode.getField(1), saleId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "sale_id": saleId?.toString()};
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.msgFinalizeSale.typeUrl;

  @override
  List get values => [sender, saleId];

  @override
  OsmosisStreamSwapMsgFinalizeSaleResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapMsgFinalizeSaleResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisStreamSwapV1Types.finalizeSale.typeUrl;

  @override
  List<String?> get signers => [sender];
}
