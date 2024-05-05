import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'user_position.dart';

/// UserPositionKV is a record in genesis representing acc_address user position of a sale_id sale.
class OsmosisStreamSwapUserPositionKV extends CosmosMessage {
  final String? accAddress;
  final BigInt? saleId;
  final OsmosisStreamSwapUserPosition userPosition;

  const OsmosisStreamSwapUserPositionKV(
      {this.accAddress, this.saleId, required this.userPosition});
  factory OsmosisStreamSwapUserPositionKV.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapUserPositionKV(
        accAddress: decode.getField(1),
        saleId: decode.getField(2),
        userPosition:
            OsmosisStreamSwapUserPosition.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "acc_address": accAddress,
      "sale_id": saleId?.toString(),
      "user_position": userPosition.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.userPositionKV.typeUrl;

  @override
  List get values => [accAddress, saleId, userPosition];
}
