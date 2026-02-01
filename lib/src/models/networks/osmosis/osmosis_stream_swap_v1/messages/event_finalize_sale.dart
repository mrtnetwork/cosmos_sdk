import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapEventFinalizeSale extends CosmosMessage {
  final BigInt? saleId;

  /// amount of earned tokens_in
  final String? income;
  OsmosisStreamSwapEventFinalizeSale({this.saleId, this.income});
  factory OsmosisStreamSwapEventFinalizeSale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapEventFinalizeSale(
      saleId: decode.getField(1),
      income: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"sale_id": saleId?.toString(), "income": income};
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.eventFinalizeSale;

  @override
  List get values => [saleId, income];
}
