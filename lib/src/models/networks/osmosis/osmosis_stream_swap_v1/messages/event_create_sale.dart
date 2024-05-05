import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapEventCreateSale extends CosmosMessage {
  final BigInt? id;
  final String? creator;
  final String? tokenIn;
  final Coin tokenOut;
  OsmosisStreamSwapEventCreateSale({
    this.id,
    this.creator,
    this.tokenIn,
    required this.tokenOut,
  });
  factory OsmosisStreamSwapEventCreateSale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapEventCreateSale(
        id: decode.getField(1),
        creator: decode.getField(2),
        tokenIn: decode.getField(3),
        tokenOut: Coin.deserialize(decode.getField(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id?.toString(),
      "creator": creator,
      "token_in": tokenIn,
      "token_out": tokenOut.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.eventCreateSale.typeUrl;

  @override
  List get values => [id, creator, tokenIn, tokenOut];
}
