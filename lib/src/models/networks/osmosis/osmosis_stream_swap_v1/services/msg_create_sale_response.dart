import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapMsgCreateSaleResponse extends CosmosMessage {
  final BigInt? saleId;
  const OsmosisStreamSwapMsgCreateSaleResponse({this.saleId});
  factory OsmosisStreamSwapMsgCreateSaleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgCreateSaleResponse(saleId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sale_id": saleId?.toString()};
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.msgCreateSaleResponse.typeUrl;

  @override
  List get values => [saleId];
}
