import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_finalize_sale_response.dart';

class OsmosisStreamSwapMsgFinalizeSale
    extends OsmosisStreamSwapV1<OsmosisStreamSwapMsgFinalizeSaleResponse> {
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
  factory OsmosisStreamSwapMsgFinalizeSale.fromJson(Map<String, dynamic> json) {
    return OsmosisStreamSwapMsgFinalizeSale(
        sender: json.as("sender"), saleId: json.asBigInt("sale_id"));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "sale_id": saleId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.msgFinalizeSale;

  @override
  List get values => [sender, saleId];

  @override
  OsmosisStreamSwapMsgFinalizeSaleResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapMsgFinalizeSaleResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
